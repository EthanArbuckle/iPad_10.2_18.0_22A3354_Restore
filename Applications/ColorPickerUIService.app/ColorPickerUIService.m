uint64_t sub_100003944(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = &unk_100042F80;
  v4[1] = &unk_100042F98;
  v4[2] = (char *)&value witness table for () + 64;
  v4[3] = (char *)&value witness table for () + 64;
  v4[4] = (char *)&value witness table for () + 64;
  v4[5] = &unk_100042FB0;
  result = type metadata accessor for Binding(319, *(_QWORD *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4[6] = *(_QWORD *)(result - 8) + 64;
    result = swift_initClassMetadata2(a1, 0, 7, v4, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

id sub_1000039E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  uint64_t WitnessTable;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  Class isa;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v28;

  v3 = v2;
  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _CPUITextField()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  WitnessTable = swift_getWitnessTable(&unk_100043268, a2);
  type metadata accessor for UIViewRepresentableContext(0, a2, WitnessTable);
  UIViewRepresentableContext.coordinator.getter(&v28);
  v7 = v28;
  objc_msgSend(v5, "setDelegate:", v28);

  UIViewRepresentableContext.coordinator.getter(&v28);
  v8 = v28;
  objc_msgSend(v5, "addTarget:action:forControlEvents:", v28, "textFieldValueChanged:", 0x20000);

  objc_msgSend(v5, "setAutocapitalizationType:", 3);
  objc_msgSend(v5, "setAutocorrectionType:", 1);
  v9 = *(_QWORD *)(v3 + *(int *)(a2 + 40));
  objc_msgSend(v5, "setKeyboardType:", v9);
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setReturnKeyType:", 9);
  v10 = sub_100005BFC();
  v11 = (void *)objc_opt_self(UIFont);
  v12 = v5;
  v13 = objc_msgSend(v11, "fontWithDescriptor:size:", v10, 0.0);
  objc_msgSend(v12, "setFont:", v13);

  if (v9 == 8)
  {
    v14 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (!v15)
    {
      v16 = objc_msgSend(objc_allocWithZone((Class)UIToolbar), "init");
      v17 = sub_1000060E4(&qword_100065360);
      v18 = swift_allocObject(v17, 48, 7);
      *(_OWORD *)(v18 + 16) = xmmword_100042F40;
      *(_QWORD *)(v18 + 32) = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      *(_QWORD *)(v18 + 40) = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v12, "resignFirstResponder");
      v28 = (void *)v18;
      specialized Array._endMutation()();
      v19 = v28;
      sub_1000075F4(0, &qword_100065368, UIBarButtonItem_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v19);
      objc_msgSend(v16, "setItems:", isa);

      objc_msgSend(v16, "sizeToFit");
      objc_msgSend(v12, "setInputAccessoryView:", v16);

    }
  }
  v21 = sub_1000075F4(0, &qword_100065358, UIScribbleInteraction_ptr);
  UIViewRepresentableContext.coordinator.getter(&v28);
  v22 = v28;
  v23 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v21)), "initWithDelegate:", v28);

  objc_msgSend(v12, "addInteraction:", v23);
  v24 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v25 = objc_msgSend(v24, "userInterfaceIdiom");

  if (v25 == (id)6)
  {
    v26 = v12;
    objc_msgSend(v26, "setBorderStyle:", 3);

  }
  return v12;
}

void sub_100003DE8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  uint64_t (*v23)(char *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  NSString v35;
  uint64_t WitnessTable;
  void *v37;
  uint64_t v38;
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD v44[4];
  unsigned __int8 v45;
  uint64_t v46;

  v4 = v3;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(a1);
  v11 = (char *)&v44[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v9);
  v15 = (char *)&v44[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (char *)(v3 + *(int *)(v16 + 56));
  v18 = *v17;
  v19 = *((_QWORD *)v17 + 1);
  LOBYTE(v44[0]) = v18;
  v44[1] = v19;
  v20 = sub_1000060E4(&qword_100065348);
  State.wrappedValue.getter(&v46, v20);
  v21 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v4, a3);
  if ((v21 & 1) != 0)
  {
    v22 = v15[*(int *)(a3 + 32)];
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a3);
    if (v22 != 1)
      goto LABEL_14;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a3);
  }
  v23 = *(uint64_t (**)(char *))(v4 + *(int *)(a3 + 44));
  v24 = type metadata accessor for Binding(0, v7);
  Binding.wrappedValue.getter(v24);
  v25 = v23(v11);
  v27 = v26;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v28 = objc_msgSend(a1, "text");
  if (!v28)
    goto LABEL_12;
  v29 = v28;
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  v32 = v31;

  if (v25 == v30 && v27 == v32)
  {
    swift_bridgeObjectRelease_n(v27, 2);
    goto LABEL_14;
  }
  v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v27, v30, v32, 0);
  swift_bridgeObjectRelease(v32);
  if ((v34 & 1) != 0)
  {
    swift_bridgeObjectRelease(v27);
  }
  else
  {
LABEL_12:
    v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v27);
    objc_msgSend(a1, "setText:", v35);

    WitnessTable = swift_getWitnessTable(&unk_100043268, a3);
    type metadata accessor for UIViewRepresentableContext(0, a3, WitnessTable);
    UIViewRepresentableContext.coordinator.getter(v44);
    v37 = (void *)v44[0];
    sub_100004774(a1);

  }
LABEL_14:
  v38 = sub_100005B9C();
  KeyPath = swift_getKeyPath(&unk_100043030);
  v40 = swift_getKeyPath(&unk_100043058);
  v41 = swift_retain(v38);
  static Published.subscript.getter(v44, v41, KeyPath, v40);
  swift_release(KeyPath);
  swift_release(v40);
  LODWORD(KeyPath) = v45;
  swift_release(v38);
  v42 = sub_100006128((_DWORD)KeyPath != 2);
  objc_msgSend(a1, "setTextColor:", v42);

}

id sub_1000040D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  _QWORD v36[2];
  unsigned __int8 v37;

  v2 = v1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for Binding(0, v4);
  v33 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v28 - v6;
  v32 = type metadata accessor for CPTextField.Coordinator(0, v4, v8, v9);
  v10 = sub_100005B9C();
  v31 = *(unsigned __int8 *)(v2 + *(int *)(a1 + 36));
  v11 = (char *)(v2 + *(int *)(a1 + 56));
  v12 = *v11;
  v13 = *((_QWORD *)v11 + 1);
  v34 = v12;
  v35 = v13;
  swift_retain(v10);
  v14 = sub_1000060E4(&qword_100065348);
  State.projectedValue.getter(v36, v14);
  v15 = v36[1];
  v30 = v37;
  v16 = (uint64_t *)(v2 + *(int *)(a1 + 44));
  v17 = *v16;
  v18 = v16[1];
  v19 = (uint64_t *)(v2 + *(int *)(a1 + 48));
  v20 = v19[1];
  v28 = *v19;
  v29 = v36[0];
  v21 = (uint64_t *)(v2 + *(int *)(a1 + 52));
  v23 = *v21;
  v22 = v21[1];
  swift_retain(v18);
  swift_retain(v20);
  swift_retain(v22);
  Binding.projectedValue.getter(v5);
  v27 = v23;
  v24 = v29;
  v25 = sub_1000063DC(v10, v31, v29, v15, v30, v17, v18, v28, v20, v27, v22, (uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v5);
  swift_release(v10);
  swift_release(v15);
  swift_release(v18);
  swift_release(v20);
  swift_release(v22);
  swift_release(v24);
  return v25;
}

uint64_t sub_10000429C(char a1)
{
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = (char *)v1 + *(_QWORD *)((swift_isaMask & *v1) + 0x80);
  v3 = *(_QWORD *)v2;
  v4 = *((_QWORD *)v2 + 1);
  LOBYTE(v2) = v2[16];
  v8 = v3;
  v9 = v4;
  v10 = (char)v2;
  v7 = a1;
  v5 = sub_1000060E4(&qword_100065290);
  return Binding.wrappedValue.setter(&v7, v5);
}

id sub_100004308(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = *(_QWORD *)((swift_isaMask & *v2) + 0x50);
  v5 = type metadata accessor for Optional(0, v4);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v18 - v8;
  v10 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v7);
  v12 = (char *)&v18 - v11;
  result = objc_msgSend(a1, "text");
  if (result)
  {
    v14 = result;
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v17 = v16;

    (*(void (**)(uint64_t, uint64_t))((char *)v2 + *(_QWORD *)((swift_isaMask & *v2) + 0x70)))(v15, v17);
    swift_bridgeObjectRelease(v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4) == 1)
    {
      return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v9, v4);
      sub_10000648C((uint64_t)v12);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v4);
    }
  }
  return result;
}

void sub_100004488(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_100004308(v4);

}

uint64_t sub_1000044DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  id v10;
  void *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char v17;

  v10 = objc_msgSend(a1, "text");
  if (!v10)
  {
    v17 = 0;
    return v17 & 1;
  }
  v11 = v10;
  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!__OFADD__(a2, a3))
  {
    v14 = result;
    v15 = v13;
    v16 = objc_msgSend(v11, "length");

    if ((uint64_t)v16 >= a2 + a3)
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v5
                                                                                            + *(_QWORD *)((swift_isaMask & *v5) + 0x78)))(v14, v15, a2, a3, a4, a5);
    else
      v17 = 0;
    swift_bridgeObjectRelease(v15);
    return v17 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000045D4(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v12 = v11;
  v13 = a3;
  v14 = a1;
  LOBYTE(a5) = sub_1000044DC(v13, a4, a5, v10, v12);

  swift_bridgeObjectRelease(v12);
  return a5 & 1;
}

void sub_100004660(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_100006590();

}

void sub_1000046AC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_100006598();

}

uint64_t sub_1000046F8(int a1, int a2, id a3)
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

void sub_100004720(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_10000471C(v4);

}

void sub_100004774(void *a1)
{
  _QWORD *v1;
  id v3;
  id v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;

  if (*((_BYTE *)v1 + *(_QWORD *)((swift_isaMask & *v1) + 0x60)) == 1)
  {
    v3 = objc_msgSend(a1, "selectedTextRange");
    if (v3)
    {
      v26 = v3;
      sub_1000075F4(0, &qword_100065280, NSObject_ptr);
      v4 = objc_msgSend(v26, "start");
      v5 = objc_msgSend(v26, "end");
      v6 = static NSObject.== infix(_:_:)(v4, v5);

      if ((v6 & 1) == 0)
        goto LABEL_14;
      v7 = objc_msgSend(a1, "text");
      if (!v7)
        goto LABEL_14;
      v8 = v7;
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
      v11 = v10;

      v12 = sub_100005E50(v9, v11);
      v14 = v13;
      v16 = v15;
      swift_bridgeObjectRelease(v11);
      if ((v16 & 1) != 0)
        goto LABEL_14;
      v17 = objc_msgSend(a1, "beginningOfDocument");
      v18 = objc_msgSend(v26, "start");
      v19 = objc_msgSend(a1, "offsetFromPosition:toPosition:", v17, v18);

      if ((uint64_t)v19 < v12)
      {
        v20 = objc_msgSend(a1, "beginningOfDocument");
        v21 = objc_msgSend(a1, "positionFromPosition:offset:", v20, v12);

        if (!v21)
        {
          __break(1u);
          return;
        }
        goto LABEL_13;
      }
      v22 = __OFADD__(v12, v14);
      v23 = v12 + v14;
      if (v22)
      {
        __break(1u);
      }
      else
      {
        if (v23 >= (uint64_t)v19)
        {
LABEL_14:

          return;
        }
        v24 = objc_msgSend(a1, "beginningOfDocument");
        v21 = objc_msgSend(a1, "positionFromPosition:offset:", v24, v23);

        if (v21)
        {
LABEL_13:
          v25 = objc_msgSend(a1, "textRangeFromPosition:toPosition:", v21, v21);
          objc_msgSend(a1, "setSelectedTextRange:", v25);

          goto LABEL_14;
        }
      }
      __break(1u);
    }
  }
}

uint64_t sub_100004A14(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v10;

  v2 = type metadata accessor for CharacterSet(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  v7 = a1[1];
  swift_bridgeObjectRetain(v7);
  CharacterSet.init(charactersIn:)(v6, v7);
  swift_bridgeObjectRelease(v7);
  v8 = CharacterSet.isSuperset(of:)(v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8 & 1;
}

void sub_100004AD8()
{
  sub_100006760();
}

id sub_100004AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for CPTextField.Coordinator(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), a3, a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_100004B40(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v2 = swift_isaMask & *a1;
  swift_release(*(_QWORD *)((char *)a1 + *(_QWORD *)(v2 + 0x58) + 8));
  swift_release(*(_QWORD *)((char *)a1 + *(_QWORD *)((swift_isaMask & *a1) + 0x68) + 8));
  swift_release(*(_QWORD *)((char *)a1 + *(_QWORD *)((swift_isaMask & *a1) + 0x70) + 8));
  swift_release(*(_QWORD *)((char *)a1 + *(_QWORD *)((swift_isaMask & *a1) + 0x78) + 8));
  v3 = (_QWORD *)((char *)a1 + *(_QWORD *)((swift_isaMask & *a1) + 0x80));
  v4 = *v3;
  swift_release(v3[1]);
  swift_release(v4);
  v5 = (char *)a1 + *(_QWORD *)((swift_isaMask & *a1) + 0x88);
  v6 = type metadata accessor for Binding(0, *(_QWORD *)(v2 + 80));
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t type metadata accessor for CPTextField.Coordinator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000679C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CPTextField.Coordinator);
}

id sub_100004C4C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = sub_1000040D8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_100004C74(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_100004CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100043268, a3);
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100004D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100043268, a3);
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100004D6C()
{
  return static View._viewListCount(inputs:)();
}

void sub_100004D84(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100043268, a1);
  UIViewRepresentable.body.getter(a1, WitnessTable);
  __break(1u);
}

void sub_100004E70(void *a1)
{
  void *v1;
  id v3;
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for _CPUITextField();
  objc_msgSendSuper2(&v6, "buildMenuWithBuilder:", a1);
  sub_1000075F4(0, &qword_100065280, NSObject_ptr);
  v3 = objc_msgSend(a1, "system");
  v4 = objc_msgSend((id)objc_opt_self(UIMenuSystem), "contextSystem");
  v5 = static NSObject.== infix(_:_:)(v3, v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(a1, "removeMenuForIdentifier:", UIMenuLookup);
    objc_msgSend(a1, "removeMenuForIdentifier:", UIMenuLearn);
    objc_msgSend(a1, "removeMenuForIdentifier:", UIMenuAutoFill);
    objc_msgSend(a1, "removeMenuForIdentifier:", UIMenuShare);
  }
}

id sub_1000050A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _CPUITextField();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for _CPUITextField()
{
  return objc_opt_self(_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField);
}

__n128 initializeWithTake for EyeDropperView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1000076D8(a1, &qword_100065218, (uint64_t)&unk_100059EA0);
}

uint64_t sub_100005120(uint64_t a1, uint64_t a2)
{
  return sub_10000534C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005138(uint64_t a1, id *a2)
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

uint64_t sub_1000051AC(uint64_t a1, id *a2)
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

uint64_t sub_100005228@<X0>(_QWORD *a1@<X8>)
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

NSNumber sub_100005268()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_100005270(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = static CGFloat._forceBridgeFromObjectiveC(_:result:)(a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_1000052C0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_100005314(double *a1@<X8>)
{
  *a1 = static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005338(uint64_t a1, uint64_t a2)
{
  return sub_10000534C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000534C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100005388(uint64_t a1)
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

Swift::Int sub_1000053C8(uint64_t a1)
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

_QWORD *sub_100005438@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100005444(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_1000431B0, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

void sub_100005490(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100005498@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1000054AC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1000054C0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1000054D4(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_100005504@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100005530@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_100005554(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100005568(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_10000557C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_100005590@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1000055A4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1000055B8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1000055CC(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1000055E0()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1000055F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_100005608(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_100005620(_QWORD *a1, uint64_t *a2)
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

void sub_1000056A8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_1000056B4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000056C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_10000799C(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_100005708(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006848(&qword_100065388, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_100043900);
  v3 = sub_100006848(&qword_100065448, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1000435A4);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000578C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000057D0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000057F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006848(&qword_100065438, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_100043718);
  v3 = sub_100006848(&qword_100065440, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_1000436B8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

_QWORD *sub_10000587C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

double sub_10000588C@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

uint64_t sub_100005898(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = sub_100006848(&qword_100065420, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_100043870);
  v3 = sub_100006848(&qword_100065428, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_100043810);
  v4 = sub_100007958();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, v4);
}

uint64_t sub_100005938(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000431B0, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_100005974(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000431B0, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_1000059BC(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, a1);
  WitnessTable = swift_getWitnessTable(&unk_1000431B0, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t sub_100005A14()
{
  double *v0;

  return Double.hashValue.getter(*v0);
}

void sub_100005A1C()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v1 = *v0;
  else
    v1 = 0;
  Hasher._combine(_:)(v1);
}

uint64_t sub_100005A4C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v2 = *v1;
  else
    v2 = 0;
  return static Hasher._hash(seed:_:)(a1, v2);
}

BOOL sub_100005A5C(double *a1, double *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_100005A70(_QWORD *result, Swift::String_optional *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String_optional *v8;
  uint64_t v9;
  Swift::String_optional v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = result;
  v6 = HIBYTE(a5) & 0xF;
  v11 = a4;
  v12 = a5;
  if ((a5 & 0x2000000000000000) == 0)
    v6 = a4 & 0xFFFFFFFFFFFFLL;
  v13 = v6;
  if (!a2)
  {
    v7 = 0;
LABEL_14:
    *v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (_QWORD *)v7;
  }
  v7 = a3;
  if (!a3)
    goto LABEL_14;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = a2;
    v9 = 0;
    while (1)
    {
      v10 = String.Iterator.next()();
      if (!v10.value._object)
        break;
      ++v9;
      *v8++ = v10;
      if (v7 == v9)
      {
        a4 = v11;
        a5 = v12;
        goto LABEL_13;
      }
    }
    a4 = v11;
    a5 = v12;
    v7 = v9;
LABEL_13:
    v6 = v13;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100005B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000060E4(&qword_100065288);
  v5 = (_QWORD *)swift_allocObject(v4, 16 * v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v7 = v6 - 32;
  if (v6 < 32)
    v7 = v6 - 17;
  v5[2] = a1;
  v5[3] = 2 * (v7 >> 4);
  return v5;
}

uint64_t sub_100005B9C()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = *v0;
  if (!*v0)
  {
    v2 = v0[1];
    v3 = type metadata accessor for ColorPickerState(0);
    v4 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v2, v3, v4);
    __break(1u);
  }
  return result;
}

id sub_100005BFC()
{
  id v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t inited;
  UIFontDescriptorAttributeName v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIFontDescriptorTraitKey v10;
  const UIFontWeight *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  unint64_t v16;
  unint64_t v17;
  Class isa;
  id v19;
  _BYTE v21[48];
  _BYTE v22[72];
  _BYTE v23[48];
  _BYTE v24[72];

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = (void *)objc_opt_self(UIFontDescriptor);
  if (v1 == (id)6)
  {
    v3 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
    v4 = sub_1000060E4(&qword_100065370);
    inited = swift_initStackObject(v4, v22);
    *(_OWORD *)(inited + 16) = xmmword_100042F50;
    v6 = UIFontDescriptorTraitsAttribute;
    *(_QWORD *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    v7 = sub_1000060E4(&qword_100065378);
    v8 = swift_initStackObject(v7, v21);
    v9 = v8;
    *(_OWORD *)(v8 + 16) = xmmword_100042F50;
    v10 = UIFontWeightTrait;
    *(_QWORD *)(v8 + 32) = UIFontWeightTrait;
    v11 = &UIFontWeightSemibold;
  }
  else
  {
    v3 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody);
    v12 = sub_1000060E4(&qword_100065370);
    inited = swift_initStackObject(v12, v24);
    *(_OWORD *)(inited + 16) = xmmword_100042F50;
    v6 = UIFontDescriptorTraitsAttribute;
    *(_QWORD *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    v13 = sub_1000060E4(&qword_100065378);
    v8 = swift_initStackObject(v13, v23);
    v9 = v8;
    *(_OWORD *)(v8 + 16) = xmmword_100042F50;
    v10 = UIFontWeightTrait;
    *(_QWORD *)(v8 + 32) = UIFontWeightTrait;
    v11 = &UIFontWeightMedium;
  }
  *(UIFontWeight *)(v8 + 40) = *v11;
  v14 = v6;
  v15 = v10;
  v16 = sub_100022CF4(v9);
  *(_QWORD *)(inited + 64) = sub_1000060E4(&qword_100065380);
  *(_QWORD *)(inited + 40) = v16;
  v17 = sub_100022DFC(inited);
  type metadata accessor for AttributeName(0);
  sub_100006848(&qword_100065388, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_100043900);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  v19 = objc_msgSend(v3, "fontDescriptorByAddingAttributes:", isa);

  return v19;
}

uint64_t sub_100005E50(uint64_t a1, unint64_t a2)
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
  Swift::String_optional *v13;
  _QWORD *v14;
  uint64_t result;
  uint64_t countAndFlagsBits;
  uint64_t v17;
  void **p_object;
  void *v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  _DWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v4 = type metadata accessor for CharacterSet(0);
  v29 = *(_QWORD *)(v4 - 8);
  v30 = v4;
  v5 = __chkstk_darwin(v4);
  v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)v28 - v9;
  static CharacterSet.decimalDigits.getter(v8);
  swift_bridgeObjectRetain(a2);
  v11 = String.count.getter(a1, a2);
  if (v11)
  {
    v12 = v11;
    v13 = (Swift::String_optional *)sub_100005B28(v11, 0);
    swift_bridgeObjectRetain(a2);
    v14 = sub_100005A70(&v31, v13 + 2, v12, a1, a2);
    result = swift_bridgeObjectRelease(v32);
    if (v14 != (_QWORD *)v12)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    result = swift_bridgeObjectRelease(a2);
  }
  else
  {
    result = swift_bridgeObjectRelease(a2);
    v13 = (Swift::String_optional *)&_swiftEmptyArrayStorage;
  }
  countAndFlagsBits = v13[1].value._countAndFlagsBits;
  if (countAndFlagsBits)
  {
    v17 = 0;
    p_object = &v13[2].value._object;
    while (1)
    {
      v19 = *p_object;
      v31 = (uint64_t)*(p_object - 1);
      v32 = v19;
      swift_bridgeObjectRetain(v19);
      v20 = sub_100004A14(&v31);
      result = swift_bridgeObjectRelease(v19);
      if ((v20 & 1) != 0)
        break;
      ++v17;
      p_object += 2;
      if (countAndFlagsBits == v17)
      {
        v17 = 0;
        break;
      }
    }
    v21 = v20 ^ 1;
  }
  else
  {
    v17 = 0;
    v21 = 1;
  }
  if ((v21 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
    swift_release(v13);
    return 0;
  }
  v28[1] = 0;
  v22 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v23 = v13[1].value._countAndFlagsBits;
  if (v22 < v23)
  {
    v24 = &v13[v17 + 3].value._object;
    v25 = v17 + 1;
    while ((v22 & 0x8000000000000000) == 0)
    {
      if (v25 >= v13[1].value._countAndFlagsBits)
        goto LABEL_27;
      v26 = (uint64_t)*(v24 - 1);
      v27 = *v24;
      swift_bridgeObjectRetain(*v24);
      CharacterSet.init(charactersIn:)(v26, v27);
      swift_bridgeObjectRelease(v27);
      LOBYTE(v26) = CharacterSet.isSuperset(of:)(v7);
      result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v7, v30);
      if ((v26 & 1) == 0)
      {
        v22 = v25;
        goto LABEL_23;
      }
      ++v25;
      v24 += 2;
      if (v23 == v25)
      {
        v22 = v23;
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_23:
  result = swift_release(v13);
  if (!__OFSUB__(v22, v17))
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
    return v17;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000060E4(uint64_t *a1)
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

id sub_100006128(char a1)
{
  id v2;
  id v3;
  void *v4;
  SEL *v5;
  char **v6;

  v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (void *)objc_opt_self(UIColor);
  v5 = (SEL *)&selRef_whiteColor;
  v6 = &selRef_labelColor;
  if ((a1 & 1) == 0)
    v6 = &selRef_tertiaryLabelColor;
  if (v3 != (id)6)
    v5 = (SEL *)v6;
  return objc_msgSend(v4, *v5);
}

id sub_1000061C4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v38;
  _BYTE v39[24];

  v16 = swift_isaMask & *v12;
  v17 = (_QWORD *)((char *)v12 + *(_QWORD *)(v16 + 0x58));
  swift_beginAccess(v17, v39, 33, 0);
  v18 = *(_QWORD *)(v16 + 80);
  v19 = type metadata accessor for ColorPickerState(0);
  v20 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v21 = v12;
  v22 = swift_retain(a1);
  *v17 = ObservedObject.init(wrappedValue:)(v22, v19, v20);
  v17[1] = v23;
  swift_endAccess(v39);
  *((_BYTE *)v21 + *(_QWORD *)((swift_isaMask & *v21) + 0x60)) = a2;
  v24 = (char *)v21 + *(_QWORD *)((swift_isaMask & *v21) + 0x80);
  *(_QWORD *)v24 = a3;
  *((_QWORD *)v24 + 1) = a4;
  v24[16] = a5;
  v25 = (_QWORD *)((char *)v21 + *(_QWORD *)((swift_isaMask & *v21) + 0x68));
  *v25 = a6;
  v25[1] = a7;
  v26 = (_QWORD *)((char *)v21 + *(_QWORD *)((swift_isaMask & *v21) + 0x70));
  *v26 = a8;
  v26[1] = a9;
  v27 = (_QWORD *)((char *)v21 + *(_QWORD *)((swift_isaMask & *v21) + 0x78));
  *v27 = a10;
  v27[1] = a11;
  v28 = (char *)v21 + *(_QWORD *)((swift_isaMask & *v21) + 0x88);
  v29 = type metadata accessor for Binding(0, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v28, a12, v29);
  swift_retain(a3);
  swift_retain(a4);
  swift_retain(a7);
  swift_retain(a9);
  swift_retain(a11);

  v38.receiver = v21;
  v38.super_class = (Class)type metadata accessor for CPTextField.Coordinator(0, v18, v30, v31);
  return objc_msgSendSuper2(&v38, "init");
}

id sub_1000063DC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  id v20;

  v20 = objc_allocWithZone((Class)type metadata accessor for CPTextField.Coordinator(0, *(_QWORD *)(v12 + 80), a3, a4));
  return sub_1000061C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_10000648C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v3 = swift_isaMask & *(_QWORD *)v1;
  v4 = *(_QWORD *)(v3 + 0x50);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v13 - v6;
  v8 = type metadata accessor for Binding(0, v4);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v13 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v13 - v10, &v1[*(_QWORD *)(v3 + 136)], v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  Binding.wrappedValue.setter(v7, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100006590()
{
  return sub_10000429C(0);
}

uint64_t sub_100006598()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _BYTE v24[24];
  _BYTE v25[24];
  _BYTE v26[24];

  sub_10000429C(1);
  v1 = (char *)v0 + *(_QWORD *)((swift_isaMask & *v0) + 0x58);
  swift_beginAccess(v1, v24, 0, 0);
  v2 = *((_QWORD *)v1 + 1);
  KeyPath = swift_getKeyPath(&unk_100043030);
  v4 = swift_getKeyPath(&unk_100043058);
  v5 = swift_retain(v2);
  static Published.subscript.getter(&v20, v5, KeyPath, v4);
  swift_release(v2);
  swift_release(KeyPath);
  result = swift_release(v4);
  if (v23 == 2)
  {
    v7 = (char *)v0 + *(_QWORD *)((swift_isaMask & *v0) + 0x58);
    swift_beginAccess(v7, v25, 0, 0);
    v8 = *((_QWORD *)v7 + 1);
    v9 = (char *)v0 + *(_QWORD *)((swift_isaMask & *v0) + 0x58);
    swift_beginAccess(v9, v26, 0, 0);
    v10 = *((_QWORD *)v9 + 1);
    v11 = swift_getKeyPath(&unk_100043078);
    v12 = swift_getKeyPath(&unk_1000430A0);
    swift_retain(v8);
    v13 = swift_retain(v10);
    static Published.subscript.getter(&v20, v13, v11, v12);
    swift_release(v10);
    swift_release(v11);
    swift_release(v12);
    v19 = v20;
    v14 = v21;
    v15 = v22;
    v16 = v23;
    v17 = swift_getKeyPath(&unk_100043030);
    v18 = swift_getKeyPath(&unk_100043058);
    v20 = v19;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    return static Published.subscript.setter(&v20, v8, v17, v18);
  }
  return result;
}

void sub_100006760()
{
  _swift_stdlib_reportUnimplementedInitializer("ColorPickerUIService.Coordinator", 32, "init()", 6, 0);
  __break(1u);
}

uint64_t sub_10000679C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_1000076D8(a1, &qword_100065298, (uint64_t)&unk_100059EC8);
}

void type metadata accessor for UIKeyboardType(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000652A0, (uint64_t)&unk_100059EF8);
}

uint64_t sub_1000067F0()
{
  return sub_100006848(&qword_1000652A8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100043140);
}

uint64_t sub_10000681C()
{
  return sub_100006848(&qword_1000652B0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10004316C);
}

uint64_t sub_100006848(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000652B8, (uint64_t)&unk_100059F70);
}

uint64_t initializeBufferWithCopyOfBuffer for SomeColor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000068CC(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000068D8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000068F8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1000076D8(a1, qword_1000652C0, (uint64_t)&unk_100059FF0);
}

uint64_t sub_100006938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_100006940(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[9];

  v4[0] = &unk_1000431F0;
  result = type metadata accessor for Binding(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_100042F98;
    v4[3] = &unk_100042F98;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = (char *)&value witness table for () + 64;
    v4[6] = (char *)&value witness table for () + 64;
    v4[7] = (char *)&value witness table for () + 64;
    v4[8] = &unk_1000431F0;
    swift_initStructMetadata(a1, 0, 9, v4, a1 + 24);
    return 0;
  }
  return result;
}

uint64_t *sub_1000069E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _BYTE *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void (*v40)(unint64_t, unint64_t, uint64_t);

  v3 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = v5;
  v7 = v5 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v8 = v7 & (v5 + 16);
  v9 = *(_QWORD *)(v4 + 64);
  v10 = v5 & 0x100000;
  v11 = *a2;
  *a1 = *a2;
  v12 = v6 <= 7 && v10 == 0;
  if (v12
    && (v13 = ((v6 + 16) & ~v6) + v9,
        ((((((((((v13 + v8 + 9) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16 <= 0x18))
  {
    v14 = a1;
    v15 = ~v6;
    a1[1] = a2[1];
    v16 = (_QWORD *)(v7 & ((unint64_t)a1 + 23));
    v17 = (_QWORD *)(v7 & ((unint64_t)a2 + 23));
    v18 = *v17;
    *v16 = *v17;
    v19 = (_QWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
    v20 = (uint64_t *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    v21 = *v20;
    *v19 = *v20;
    v22 = v6 + 8;
    v23 = ((unint64_t)v19 + v22) & v15;
    v24 = ((unint64_t)v20 + v22) & v15;
    v40 = *(void (**)(unint64_t, unint64_t, uint64_t))(v4 + 16);
    swift_retain(v11);
    swift_retain(v18);
    swift_retain(v21);
    v40(v23, v24, v3);
    v25 = (char *)v16 + v13;
    *v25 = *((_BYTE *)v17 + v13);
    v25[1] = *((_BYTE *)v17 + v13 + 1);
    v26 = (_QWORD *)(((unint64_t)v16 + v13 + 9) & 0xFFFFFFFFFFFFF8);
    v27 = (_QWORD *)(((unint64_t)v17 + v13 + 9) & 0xFFFFFFFFFFFFF8);
    *v26 = *v27;
    v28 = (_QWORD *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
    v29 = (_QWORD *)(((unint64_t)v27 + 15) & 0xFFFFFFFFFFFFFFF8);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = (_QWORD *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8);
    v32 = (_QWORD *)(((unint64_t)v29 + 23) & 0xFFFFFFFFFFFFFFF8);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    v34 = (_QWORD *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
    v35 = (_QWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = ((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    v38 = ((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v37 = *(_BYTE *)v38;
    v11 = *(_QWORD *)(v38 + 8);
    *(_QWORD *)(v37 + 8) = v11;
    swift_retain(v30);
    swift_retain(v33);
    swift_retain(v36);
  }
  else
  {
    v14 = (uint64_t *)(v11 + v8);
  }
  swift_retain(v11);
  return v14;
}

uint64_t sub_100006BE0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  swift_release(*a1);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (_QWORD *)(((unint64_t)a1 + (v6 | 7) + 16) & ~(v6 | 7));
  swift_release(*v7);
  v8 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_release(*v8);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(((unint64_t)v8 + v6 + 8) & ~v6, v4);
  v9 = ((((unint64_t)v7 + ((v6 + 16) & ~v6) + *(_QWORD *)(v5 + 64) + 9) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v9 + 8));
  v10 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v10 + 8));
  v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v11 + 8));
  return swift_release(*(_QWORD *)(((v11 + 23) & 0xFFFFFFFFFFFFF8) + 8));
}

uint64_t *sub_100006CBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _BYTE *v20;
  _BYTE *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v4 = *a2;
  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 | 7) + 16;
  v10 = (_QWORD *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  v11 = (uint64_t *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  v12 = *v11;
  *v10 = *v11;
  v13 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (uint64_t *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v15 = *v14;
  *v13 = *v14;
  v16 = ((unint64_t)v13 + v8 + 8) & ~v8;
  v17 = ((unint64_t)v14 + v8 + 8) & ~v8;
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  swift_retain(v4);
  swift_retain(v12);
  swift_retain(v15);
  v18(v16, v17, v6);
  v19 = *(_QWORD *)(v7 + 64) + ((v8 + 16) & ~v8);
  v20 = (char *)v10 + v19;
  v21 = (char *)v11 + v19;
  *v20 = *v21;
  v20[1] = v21[1];
  v22 = (_QWORD *)((unint64_t)(v20 + 9) & 0xFFFFFFFFFFFFF8);
  v23 = (_QWORD *)((unint64_t)(v21 + 9) & 0xFFFFFFFFFFFFF8);
  *v22 = *v23;
  v24 = (_QWORD *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
  v25 = (_QWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = (_QWORD *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  v28 = (_QWORD *)(((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (_QWORD *)(((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8);
  v31 = (_QWORD *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = ((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  v34 = ((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v33 = *(_BYTE *)v34;
  v35 = *(_QWORD *)(v34 + 8);
  *(_QWORD *)(v33 + 8) = v35;
  swift_retain(v26);
  swift_retain(v29);
  swift_retain(v32);
  swift_retain(v35);
  return a1;
}

uint64_t *sub_100006E4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  a1[1] = a2[1];
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (v10 | 7) + 16;
  v12 = (uint64_t *)(((unint64_t)a1 + v11) & ~(v10 | 7));
  v13 = (uint64_t *)(((unint64_t)a2 + v11) & ~(v10 | 7));
  v14 = *v12;
  v15 = *v13;
  *v12 = *v13;
  swift_retain(v15);
  swift_release(v14);
  v16 = (uint64_t *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  v17 = (uint64_t *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  v18 = *v17;
  v19 = *v16;
  *v16 = *v17;
  swift_retain(v18);
  swift_release(v19);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 24))(((unint64_t)v16 + v10 + 8) & ~v10, ((unint64_t)v17 + v10 + 8) & ~v10, v8);
  v20 = *(_QWORD *)(v9 + 64) + ((v10 + 16) & ~v10);
  v21 = (char *)v12 + v20;
  v22 = (char *)v13 + v20;
  *v21 = *v22;
  v21[1] = v22[1];
  v23 = (_QWORD *)((unint64_t)(v21 + 9) & 0xFFFFFFFFFFFFF8);
  v24 = (_QWORD *)((unint64_t)(v22 + 9) & 0xFFFFFFFFFFFFF8);
  *v23 = *v24;
  v25 = (_QWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  v26 = (_QWORD *)(((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF8);
  v27 = v26[1];
  v28 = v25[1];
  *v25 = *v26;
  v25[1] = v27;
  swift_retain(v27);
  swift_release(v28);
  v29 = (_QWORD *)(((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8);
  v30 = (_QWORD *)(((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8);
  v31 = v30[1];
  v32 = v29[1];
  *v29 = *v30;
  v29[1] = v31;
  swift_retain(v31);
  swift_release(v32);
  v33 = (_QWORD *)(((unint64_t)v29 + 23) & 0xFFFFFFFFFFFFFFF8);
  v34 = (_QWORD *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8);
  v35 = v34[1];
  v36 = v33[1];
  *v33 = *v34;
  v33[1] = v35;
  swift_retain(v35);
  swift_release(v36);
  v37 = ((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  v38 = ((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v37 = *(_BYTE *)v38;
  v39 = *(_QWORD *)(v37 + 8);
  v40 = *(_QWORD *)(v38 + 8);
  *(_QWORD *)(v37 + 8) = v40;
  swift_retain(v40);
  swift_release(v39);
  return a1;
}

_OWORD *sub_100007018(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  _QWORD *v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *v17;
  _OWORD *v18;
  _OWORD *v19;
  _OWORD *v20;
  _OWORD *v21;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 | 7) + 16;
  v7 = (_QWORD *)(((unint64_t)a1 + v6) & ~(v5 | 7));
  v8 = (_QWORD *)(((unint64_t)a2 + v6) & ~(v5 | 7));
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)v9 + v5 + 8) & ~v5, ((unint64_t)v10 + v5 + 8) & ~v5);
  v11 = *(_QWORD *)(v4 + 64) + ((v5 + 16) & ~v5);
  v12 = (char *)v7 + v11;
  v13 = (char *)v8 + v11;
  *v12 = *v13;
  v12[1] = v13[1];
  v14 = (_QWORD *)((unint64_t)(v12 + 9) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((unint64_t)(v13 + 9) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v16 = (_OWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFF8);
  v17 = (_OWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8);
  *v16 = *v17;
  v18 = (_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFF8);
  v19 = (_OWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFF8);
  *v18 = *v19;
  v20 = (_OWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFF8);
  v21 = (_OWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFF8);
  *v20 = *v21;
  *(_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t *sub_100007130(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  unint64_t v32;
  uint64_t v33;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  a1[1] = a2[1];
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + 16;
  v11 = (uint64_t *)(((unint64_t)a1 + v10) & ~(v9 | 7));
  v12 = (uint64_t *)(((unint64_t)a2 + v10) & ~(v9 | 7));
  v13 = *v11;
  *v11 = *v12;
  swift_release(v13);
  v14 = (uint64_t *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v15 = (uint64_t *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  v16 = *v14;
  *v14 = *v15;
  swift_release(v16);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v14 + v9 + 8) & ~v9, ((unint64_t)v15 + v9 + 8) & ~v9, v7);
  v17 = *(_QWORD *)(v8 + 64) + ((v9 + 16) & ~v9);
  v18 = (char *)v11 + v17;
  v19 = (char *)v12 + v17;
  *v18 = *v19;
  v18[1] = v19[1];
  v20 = (_QWORD *)((unint64_t)(v18 + 9) & 0xFFFFFFFFFFFFF8);
  v21 = (unint64_t)(v19 + 9) & 0xFFFFFFFFFFFFF8;
  v22 = *(_QWORD *)v21;
  v21 += 15;
  *v20 = v22;
  v23 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v24 = *(_QWORD *)(v23 + 8);
  v25 = (v21 & 0xFFFFFFFFFFFFF8) + 23;
  *(_OWORD *)v23 = *(_OWORD *)(v21 & 0xFFFFFFFFFFFFF8);
  swift_release(v24);
  v26 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  v25 &= 0xFFFFFFFFFFFFF8uLL;
  v27 = *(_QWORD *)(v26 + 8);
  *(_OWORD *)v26 = *(_OWORD *)v25;
  swift_release(v27);
  v28 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v25 + 23) & 0xFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)(v28 + 8);
  v31 = *(_OWORD *)v29;
  v29 += 23;
  *(_OWORD *)v28 = v31;
  swift_release(v30);
  v32 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v32 = *(_BYTE *)(v29 & 0xFFFFFFFFFFFFFFF8);
  v33 = *(_QWORD *)(v32 + 8);
  *(_QWORD *)(v32 + 8) = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release(v33);
  return a1;
}

uint64_t sub_1000072B0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t *v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = v7 | 7;
  if (v6 >= a2)
  {
    v13 = (unint64_t *)((((a1 + v8 + 16) & ~v8) + 15) & 0xFFFFFFFFFFFFFFF8);
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v13 + v7 + 8) & ~v7);
    }
    else
    {
      v14 = *v13;
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
  }
  else
  {
    if (((((((((((((*(_QWORD *)(v4 + 64) + ((v7 + 16) & ~v7) + ((v7 + 16) & ~v8) + 9) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
               + 23) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_100007368 + 4 * byte_100042F60[v11]))();
  }
}

void sub_100007400(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((((((((*(_DWORD *)(v5 + 64)
                 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)
                 + (((_DWORD)v7 + 16) & ~(v7 | 7))
                 + 9) & 0xFFFFFFF8)
               + 15) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X15 }
  }
  if (((((((((((*(_DWORD *)(v5 + 64)
               + (((_DWORD)v7 + 16) & ~(_DWORD)v7)
               + (((_DWORD)v7 + 16) & ~(v7 | 7))
               + 9) & 0xFFFFFFF8)
             + 15) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((((((((((*(_QWORD *)(v5 + 64) + ((v7 + 16) & ~v7) + ((v7 + 16) & ~(v7 | 7)) + 9) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_100007538()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x1000075B4);
}

void sub_100007540(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x100007548);
  JUMPOUT(0x1000075B4);
}

void sub_10000756C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x1000075B4);
}

void sub_100007574()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x1000075B4);
}

void sub_10000757C(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((a2 & 0x80000000) == 0)
        JUMPOUT(0x1000075B0);
      JUMPOUT(0x1000075ACLL);
    }
    JUMPOUT(0x100007588);
  }
  JUMPOUT(0x1000075B4);
}

uint64_t type metadata accessor for CPTextField(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000679C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CPTextField);
}

void *sub_1000075D8()
{
  return &protocol witness table for Never;
}

uint64_t sub_1000075E4(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100043218, a1);
}

uint64_t sub_1000075F4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000653A0, (uint64_t)&unk_10005A0C0);
}

void type metadata accessor for Weight(uint64_t a1)
{
  sub_1000076D8(a1, &qword_100065390, (uint64_t)&unk_10005A070);
}

void type metadata accessor for TraitKey(uint64_t a1)
{
  sub_1000076D8(a1, &qword_100065398, (uint64_t)&unk_10005A098);
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000653A8, (uint64_t)&unk_10005A0E8);
}

uint64_t sub_10000767C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000769C(uint64_t result, int a2, int a3)
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
  sub_1000076D8(a1, &qword_1000653B0, (uint64_t)&unk_10005A168);
}

void sub_1000076D8(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10000771C()
{
  return sub_100006848(&qword_1000653B8, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1000433CC);
}

uint64_t sub_100007748()
{
  return sub_100006848(&qword_1000653C0, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_100043398);
}

uint64_t sub_100007774()
{
  return sub_100006848(&qword_1000653C8, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1000433F8);
}

uint64_t sub_1000077A0()
{
  return sub_100006848(&qword_1000653D0, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_100043434);
}

uint64_t sub_1000077CC()
{
  return sub_100006848(&qword_1000653D8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_100043568);
}

uint64_t sub_1000077F8()
{
  return sub_100006848(&qword_1000653E0, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_10004353C);
}

uint64_t sub_100007824()
{
  return sub_100006848(&qword_1000653E8, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_10004367C);
}

uint64_t sub_100007850()
{
  return sub_100006848(&qword_1000653F0, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_100043650);
}

uint64_t sub_10000787C()
{
  return sub_100006848(&qword_1000653F8, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_1000436EC);
}

uint64_t sub_1000078A8()
{
  return sub_100006848(&qword_100065400, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_1000437D4);
}

uint64_t sub_1000078D4()
{
  return sub_100006848(&qword_100065408, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_1000437A8);
}

uint64_t sub_100007900()
{
  return sub_100006848(&qword_100065410, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_100043844);
}

uint64_t sub_10000792C()
{
  return sub_100006848(&qword_100065418, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1000435D8);
}

unint64_t sub_100007958()
{
  unint64_t result;

  result = qword_100065430;
  if (!qword_100065430)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100065430);
  }
  return result;
}

uint64_t sub_10000799C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1000079D4()
{
  return type metadata accessor for _UIColorPickerContentViewController(0);
}

uint64_t *sub_100007A08(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v5);
  }
  else
  {
    a1[1] = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain(v5);
    v9 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
    {
      v10 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
      v11 = v7;
      v12 = v9;
      v13 = 1;
    }
    else
    {
      v14 = *v8;
      *v7 = *v8;
      swift_retain(v14);
      v11 = v7;
      v12 = v9;
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_100007AE4(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*a1);
  v4 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v5 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for DynamicTypeSize(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t *sub_100007B5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *a2;
  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = *(int *)(a3 + 20);
  v7 = (uint64_t *)((char *)a1 + v6);
  v8 = (uint64_t *)((char *)a2 + v6);
  swift_retain(v4);
  v9 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
    v11 = 1;
  }
  else
  {
    v12 = *v8;
    *v7 = *v8;
    swift_retain(v12);
    v11 = 0;
  }
  swift_storeEnumTagMultiPayload(v7, v9, v11);
  return a1;
}

uint64_t *sub_100007C04(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    sub_100009CF0((uint64_t)a1 + v8, &qword_100065570);
    v11 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
  }
  return a1;
}

_OWORD *sub_100007CE0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload(v5, v7, 1);
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t *sub_100007D88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_100009CF0((uint64_t)a1 + v7, &qword_100065570);
    v10 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100007E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007E6C);
}

uint64_t sub_100007E6C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_1000060E4(&qword_100065578);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_100007EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007F04);
}

char *sub_100007F04(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = sub_1000060E4(&qword_100065578);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for RGBAView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000655D8;
  if (!qword_1000655D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RGBAView);
  return result;
}

void sub_100007FB8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_100043950;
  sub_10000802C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

void sub_10000802C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000655E8)
  {
    v2 = type metadata accessor for DynamicTypeSize(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000655E8);
  }
}

uint64_t sub_100008080(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050FD0, 1);
}

id sub_100008090(char a1)
{
  id v2;
  id v3;
  void *v4;
  SEL *v5;
  char **v6;

  v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (void *)objc_opt_self(UIColor);
  v5 = (SEL *)&selRef_clearColor;
  v6 = &selRef_systemBackgroundColor;
  if ((a1 & 1) == 0)
    v6 = &selRef_systemGray5Color;
  if (v3 != (id)6)
    v5 = (SEL *)v6;
  return objc_msgSend(v4, *v5);
}

uint64_t sub_10000812C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_1000060E4(&qword_100065618);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)6)
    v9 = 0x4030000000000000;
  else
    v9 = 0x4039000000000000;
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter(v8);
  *((_QWORD *)v5 + 1) = v9;
  v5[16] = 0;
  v10 = sub_1000060E4(&qword_100065620);
  sub_10000821C(v1, (uint64_t)&v5[*(int *)(v10 + 44)]);
  return sub_100009A88((uint64_t)v5, a1, &qword_100065618);
}

uint64_t sub_10000821C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t *v28;

  v28 = a1;
  v3 = sub_1000060E4(&qword_100065628);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v27 - v7;
  v9 = sub_1000060E4(&qword_100065630);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v27 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v27 - v16;
  v18 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if (v19 == (id)6)
    v21 = 0x4030000000000000;
  else
    v21 = 0x4032000000000000;
  *(_QWORD *)v15 = static HorizontalAlignment.center.getter(v20);
  *((_QWORD *)v15 + 1) = v21;
  v15[16] = 0;
  v22 = sub_1000060E4(&qword_100065638);
  sub_100008454((uint64_t)&v15[*(int *)(v22 + 44)]);
  v23 = sub_100009A88((uint64_t)v15, (uint64_t)v17, &qword_100065630);
  *(_QWORD *)v8 = static HorizontalAlignment.center.getter(v23);
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  v24 = sub_1000060E4(&qword_100065640);
  sub_10000875C(v28, (uint64_t)&v8[*(int *)(v24 + 44)]);
  sub_100009C1C((uint64_t)v17, (uint64_t)v12, &qword_100065630);
  sub_100009C1C((uint64_t)v8, (uint64_t)v6, &qword_100065628);
  sub_100009C1C((uint64_t)v12, a2, &qword_100065630);
  v25 = sub_1000060E4(&qword_100065648);
  sub_100009C1C((uint64_t)v6, a2 + *(int *)(v25 + 48), &qword_100065628);
  sub_100009CF0((uint64_t)v8, &qword_100065628);
  sub_100009CF0((uint64_t)v17, &qword_100065630);
  sub_100009CF0((uint64_t)v6, &qword_100065628);
  return sub_100009CF0((uint64_t)v12, &qword_100065630);
}

uint64_t sub_100008454@<X0>(uint64_t a1@<X8>)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = a1;
  v1 = type metadata accessor for ColorSlider(0);
  v2 = __chkstk_darwin(v1);
  v48 = (uint64_t)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v47 = (uint64_t)&v46 - v5;
  v6 = __chkstk_darwin(v4);
  v46 = (uint64_t)&v46 - v7;
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v46 - v9;
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v46 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v46 - v14;
  v16 = type metadata accessor for ColorPickerState(0);
  v17 = sub_1000098F0();
  v18 = EnvironmentObject.init()(v16, v17);
  v20 = v19;
  KeyPath = swift_getKeyPath(&unk_1000439B8);
  v22 = (uint64_t *)&v15[*(int *)(v1 + 24)];
  *v22 = KeyPath;
  v23 = sub_1000060E4(&qword_100065570);
  v24 = swift_storeEnumTagMultiPayload(v22, v23, 0);
  *v15 = 0;
  *((_QWORD *)v15 + 1) = v18;
  *((_QWORD *)v15 + 2) = v20;
  v25 = *(int *)(v1 + 28);
  *(double *)&v15[v25] = static Font.Weight.semibold.getter(v24);
  v26 = EnvironmentObject.init()(v16, v17);
  v28 = v27;
  v29 = swift_getKeyPath(&unk_1000439B8);
  v30 = (uint64_t *)&v13[*(int *)(v1 + 24)];
  *v30 = v29;
  v31 = swift_storeEnumTagMultiPayload(v30, v23, 0);
  *v13 = 1;
  *((_QWORD *)v13 + 1) = v26;
  *((_QWORD *)v13 + 2) = v28;
  v32 = *(int *)(v1 + 28);
  *(double *)&v13[v32] = static Font.Weight.semibold.getter(v31);
  v33 = EnvironmentObject.init()(v16, v17);
  v35 = v34;
  v36 = swift_getKeyPath(&unk_1000439B8);
  v37 = (uint64_t *)&v10[*(int *)(v1 + 24)];
  *v37 = v36;
  v38 = swift_storeEnumTagMultiPayload(v37, v23, 0);
  *v10 = 2;
  *((_QWORD *)v10 + 1) = v33;
  *((_QWORD *)v10 + 2) = v35;
  v39 = *(int *)(v1 + 28);
  *(double *)&v10[v39] = static Font.Weight.semibold.getter(v38);
  v40 = v46;
  sub_100009E80((uint64_t)v15, v46, type metadata accessor for ColorSlider);
  v41 = v47;
  sub_100009E80((uint64_t)v13, v47, type metadata accessor for ColorSlider);
  v42 = v48;
  sub_100009E80((uint64_t)v10, v48, type metadata accessor for ColorSlider);
  v43 = v49;
  sub_100009E80(v40, v49, type metadata accessor for ColorSlider);
  v44 = sub_1000060E4(&qword_100065690);
  sub_100009E80(v41, v43 + *(int *)(v44 + 48), type metadata accessor for ColorSlider);
  sub_100009E80(v42, v43 + *(int *)(v44 + 64), type metadata accessor for ColorSlider);
  sub_100009EC4((uint64_t)v10, type metadata accessor for ColorSlider);
  sub_100009EC4((uint64_t)v13, type metadata accessor for ColorSlider);
  sub_100009EC4((uint64_t)v15, type metadata accessor for ColorSlider);
  sub_100009EC4(v42, type metadata accessor for ColorSlider);
  sub_100009EC4(v41, type metadata accessor for ColorSlider);
  return sub_100009EC4(v40, type metadata accessor for ColorSlider);
}

uint64_t sub_10000875C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v4 = sub_1000060E4(&qword_100065650);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (uint64_t *)((char *)&v24 - v8);
  v10 = type metadata accessor for DynamicTypeSize(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RGBAView(0);
  v14 = sub_100013E74((uint64_t)v13);
  v15 = DynamicTypeSize.isAccessibilitySize.getter(v14);
  v16 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((v15 & 1) != 0)
  {
    v25 = static HorizontalAlignment.center.getter(v16);
    v26 = 0;
    v27 = 1;
    v17 = sub_1000098AC();
    v18 = &type metadata for VStackLayout;
  }
  else
  {
    v25 = static VerticalAlignment.center.getter(v16);
    v26 = 0x4030000000000000;
    v27 = 0;
    v17 = sub_100009868();
    v18 = &type metadata for HStackLayout;
  }
  v19 = AnyLayout.init<A>(_:)(&v25, v18, v17);
  *v9 = v19;
  v20 = (uint64_t *)((char *)v9 + *(int *)(v4 + 44));
  swift_retain(v19);
  sub_10000893C(a1, v20);
  sub_100009C1C((uint64_t)v9, (uint64_t)v7, &qword_100065650);
  sub_100009C1C((uint64_t)v7, a2, &qword_100065650);
  v21 = *(int *)(sub_1000060E4(&qword_100065660) + 48);
  swift_release(v19);
  v22 = a2 + v21;
  *(_QWORD *)v22 = 0;
  *(_BYTE *)(v22 + 8) = 0;
  sub_100009CF0((uint64_t)v9, &qword_100065650);
  return sub_100009CF0((uint64_t)v7, &qword_100065650);
}

uint64_t sub_10000893C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int128 v22;
  char v23;
  uint64_t KeyPath;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD *v35;
  unsigned __int128 v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  double v57;
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
  id v68;
  uint64_t v69;
  int v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  unsigned __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t result;
  _QWORD *v92;
  uint64_t v93;
  unint64_t v94;
  int v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  unsigned __int128 v109;
  uint64_t v110;
  uint64_t v111;
  unsigned __int8 v112;
  unsigned __int8 v113;
  __int128 v114;
  __int128 v115;
  unsigned __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t (*v121)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unsigned __int128 v131;
  unsigned __int128 v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  __int16 v136;
  uint64_t v137;
  uint64_t (*v138)();
  uint64_t v139;
  void (*v140)(uint64_t@<X8>);
  uint64_t v141;
  uint64_t (*v142)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v143;
  char v144;
  uint64_t v145;
  uint64_t v146;
  char v147;
  uint64_t v148;
  char v149;
  __int128 v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  uint64_t v154;
  unsigned __int8 v155;
  uint64_t v156;
  unsigned __int8 v157;
  __int128 v158;

  v103 = a2;
  v3 = type metadata accessor for RGBAView(0);
  v104 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v105 = v4;
  v106 = (uint64_t)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ColorSpaceButton(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100065670);
  v9 = __chkstk_darwin(v8);
  v110 = (uint64_t)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v95 - v12;
  __chkstk_darwin(v11);
  v111 = (uint64_t)&v95 - v14;
  v102 = a1;
  v15 = (uint64_t *)*a1;
  if (*a1)
  {
    v16 = (_QWORD *)swift_allocObject(&unk_10005A3F8, 40, 7);
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v15;
    v17 = (_QWORD *)swift_allocObject(&unk_10005A420, 40, 7);
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = v15;
    swift_retain_n(v15, 2);
    Binding.init(get:set:)(&v129, sub_10000993C, v16, sub_10000994C, v17, &type metadata for SomeColor);
    v18 = v129;
    v19 = v130;
    v109 = v131;
    v22 = v132;
    v21 = v22 >> 64;
    v20 = v22;
    v23 = v133;
    KeyPath = swift_getKeyPath(&unk_1000439B8);
    v25 = (uint64_t *)&v7[*(int *)(v5 + 24)];
    *v25 = KeyPath;
    v26 = sub_1000060E4(&qword_100065570);
    swift_storeEnumTagMultiPayload(v25, v26, 0);
    *(_QWORD *)v7 = v18;
    *((_QWORD *)v7 + 1) = v19;
    *((_OWORD *)v7 + 1) = v109;
    *((_OWORD *)v7 + 2) = __PAIR128__(v21, v20);
    v7[48] = v23;
    v129 = 0x4049000000000000;
    v27 = sub_100009960();
    ScaledMetric.init(wrappedValue:)(&v129, &type metadata for CGFloat, v27);
    v28 = swift_getKeyPath(&unk_1000439E8);
    v29 = swift_getKeyPath(&unk_100043A10);
    v30 = swift_retain(v15);
    static Published.subscript.getter(&v129, v30, v28, v29);
    swift_release(v28);
    swift_release(v29);
    LODWORD(v28) = v132;
    swift_release(v15);
    LOBYTE(v18) = (_DWORD)v28 == 2;
    v31 = swift_getKeyPath(&unk_100043A30);
    v32 = swift_allocObject(&unk_10005A448, 17, 7);
    *(_BYTE *)(v32 + 16) = v18;
    sub_100009E80((uint64_t)v7, (uint64_t)v13, type metadata accessor for ColorSpaceButton);
    v33 = (uint64_t *)&v13[*(int *)(v8 + 36)];
    *v33 = v31;
    v33[1] = (uint64_t)sub_100009A70;
    v33[2] = v32;
    sub_100009EC4((uint64_t)v7, type metadata accessor for ColorSpaceButton);
    sub_100009A88((uint64_t)v13, v111, &qword_100065670);
    v34 = (_QWORD *)swift_allocObject(&unk_10005A470, 40, 7);
    v34[2] = 0;
    v34[3] = 0;
    v34[4] = v15;
    v35 = (_QWORD *)swift_allocObject(&unk_10005A498, 40, 7);
    v35[2] = 0;
    v35[3] = 0;
    v35[4] = v15;
    swift_retain_n(v15, 2);
    Binding.init(get:set:)(&v129, sub_100009FE0, v34, sub_100009FE4, v35, &type metadata for SomeColor);
    v108 = v130;
    *(_QWORD *)&v109 = v129;
    v36 = v131;
    v39 = v132;
    v38 = v39 >> 64;
    v37 = v39;
    v107 = v133;
    v15 = v102;
    v40 = v106;
    sub_100009E80((uint64_t)v102, v106, type metadata accessor for RGBAView);
    v41 = *(unsigned __int8 *)(v104 + 80);
    v42 = (v41 + 16) & ~v41;
    v101 = swift_allocObject(&unk_10005A4C0, v42 + v105, v41 | 7);
    sub_100009B84(v40, v101 + v42);
    v43 = type metadata accessor for ColorPickerState(0);
    *(_QWORD *)&v99 = sub_1000098F0();
    *((_QWORD *)&v99 + 1) = v43;
    v44 = EnvironmentObject.init()(v43, v99);
    v104 = v45;
    v105 = v44;
    LOBYTE(v114) = 0;
    State.init(wrappedValue:)(&v129, &v114, &type metadata for Bool);
    LODWORD(v106) = v129;
    v100 = v130;
    v46 = (void *)objc_opt_self(UIFontMetrics);
    v47 = objc_msgSend(v46, "defaultMetrics");
    v48 = (void *)objc_opt_self(UIDevice);
    v49 = objc_msgSend(v48, "currentDevice");
    v50 = objc_msgSend(v49, "userInterfaceIdiom");

    v51 = 100.0;
    if (v50 == (id)6)
      v51 = 88.0;
    objc_msgSend(v47, "scaledValueForValue:", v51);
    v53 = v52;

    v54 = objc_msgSend(v46, "defaultMetrics");
    v55 = objc_msgSend(v48, "currentDevice");
    v56 = objc_msgSend(v55, "userInterfaceIdiom");

    v57 = 36.0;
    if (v56 == (id)6)
      v57 = 44.0;
    v58 = v53;
    objc_msgSend(v54, "scaledValueForValue:", v57);
    v60 = v59;

    v62 = static Alignment.center.getter(v61);
    _FrameLayout.init(width:height:alignment:)(&v154, v58, 0, v60, 0, v62, v63);
    v64 = *v15;
    if (*v15)
    {
      v99 = v158;
      v97 = v154;
      v98 = v156;
      v113 = v155;
      v112 = v157;
      v65 = swift_getKeyPath(&unk_1000439E8);
      v66 = swift_getKeyPath(&unk_100043A10);
      v67 = swift_retain(v64);
      static Published.subscript.getter(&v129, v67, v65, v66);
      swift_release(v65);
      swift_release(v66);
      LODWORD(v65) = v132;
      swift_release(v64);
      v68 = sub_100008090((_DWORD)v65 != 2);
      v69 = Color.init(uiColor:)(v68);
      v70 = static Edge.Set.all.getter();
      v71 = v113;
      v95 = v70;
      v96 = v113;
      v72 = v112;
      LODWORD(v102) = v112;
      v73 = v110;
      sub_100009C1C(v111, v110, &qword_100065670);
      v74 = v103;
      *v103 = 0;
      *((_BYTE *)v74 + 8) = 0;
      v75 = sub_1000060E4(&qword_100065680);
      sub_100009C1C(v73, (uint64_t)v74 + *(int *)(v75 + 48), &qword_100065670);
      v76 = (char *)v74 + *(int *)(v75 + 64);
      *(_QWORD *)&v114 = v105;
      *((_QWORD *)&v114 + 1) = v104;
      *(_QWORD *)&v115 = v109;
      *((_QWORD *)&v115 + 1) = v108;
      v116 = v36;
      *(_QWORD *)&v117 = v37;
      *((_QWORD *)&v117 + 1) = v38;
      LOBYTE(v118) = v107;
      *(_WORD *)((char *)&v118 + 1) = 0;
      *((_QWORD *)&v118 + 1) = 1;
      *(_QWORD *)&v119 = sub_1000091E0;
      *((_QWORD *)&v119 + 1) = 0;
      *(_QWORD *)&v120 = sub_100009BC8;
      v78 = v100;
      v77 = v101;
      *((_QWORD *)&v120 + 1) = v101;
      v121 = sub_1000094A4;
      v122 = 0;
      LOBYTE(v123) = v106;
      v80 = v97;
      v79 = v98;
      *((_QWORD *)&v123 + 1) = v100;
      *(_QWORD *)&v124 = v97;
      BYTE8(v124) = v71;
      *(_QWORD *)&v125 = v98;
      BYTE8(v125) = v72;
      v81 = v99;
      v126 = v99;
      *(_QWORD *)&v127 = v69;
      LOBYTE(v74) = v95;
      BYTE8(v127) = v95;
      v128 = 0x4020000000000000;
      v82 = v120;
      v83 = v124;
      *((_OWORD *)v76 + 8) = v123;
      *((_OWORD *)v76 + 9) = v83;
      *((_OWORD *)v76 + 6) = v82;
      *((_OWORD *)v76 + 7) = (unint64_t)sub_1000094A4;
      v84 = v125;
      v85 = v126;
      v86 = v127;
      *((_QWORD *)v76 + 26) = 0x4020000000000000;
      *((_OWORD *)v76 + 11) = v85;
      *((_OWORD *)v76 + 12) = v86;
      *((_OWORD *)v76 + 10) = v84;
      v87 = v115;
      *(_OWORD *)v76 = v114;
      *((_OWORD *)v76 + 1) = v87;
      v88 = v116;
      v89 = v117;
      v90 = v119;
      *((_OWORD *)v76 + 4) = v118;
      *((_OWORD *)v76 + 5) = v90;
      *((_OWORD *)v76 + 2) = v88;
      *((_OWORD *)v76 + 3) = v89;
      sub_100009C60((uint64_t *)&v114);
      sub_100009CF0(v111, &qword_100065670);
      v129 = v105;
      v130 = v104;
      *(_QWORD *)&v131 = v109;
      *((_QWORD *)&v131 + 1) = v108;
      v132 = v36;
      v133 = v37;
      v134 = v38;
      v135 = v107;
      v136 = 0;
      v137 = 1;
      v138 = sub_1000091E0;
      v139 = 0;
      v140 = sub_100009BC8;
      v141 = v77;
      v142 = sub_1000094A4;
      v143 = 0;
      v144 = v106;
      v145 = v78;
      v146 = v80;
      v147 = v96;
      v148 = v79;
      v149 = (char)v102;
      v150 = v81;
      v151 = v69;
      v152 = (char)v74;
      v153 = 0x4020000000000000;
      sub_100009D2C(&v129);
      return sub_100009CF0(v110, &qword_100065670);
    }
  }
  else
  {
    v92 = (_QWORD *)v102[1];
    v93 = type metadata accessor for ColorPickerState(0);
    v94 = sub_1000098F0();
    EnvironmentObject.error()(0, v92, v93, v94);
    __break(1u);
  }
  result = EnvironmentObject.error()(0, v15[1], *((_QWORD *)&v99 + 1), v99);
  __break(1u);
  return result;
}

uint64_t sub_1000091E0()
{
  return sub_1000175A8();
}

void sub_100009218(uint64_t *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t KeyPath;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  NSString v14;
  const CFStringRef *v15;
  CFStringRef v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  char v29;
  __int128 v30;
  char v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  v3 = *a1;
  if (*a1)
  {
    v4 = (_QWORD *)swift_allocObject(&unk_10005A4E8, 40, 7);
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    v5 = (_QWORD *)swift_allocObject(&unk_10005A510, 40, 7);
    v5[2] = 0;
    v5[3] = 0;
    v5[4] = v3;
    swift_retain_n(v3, 2);
    Binding.init(get:set:)(&v32, sub_100009FE0, v4, sub_100009FE4, v5, &type metadata for SomeColor);
    v6 = v32;
    v28 = v33;
    v7 = v34;
    v8 = v35;
    v9 = v36;
    KeyPath = swift_getKeyPath(&unk_100043A60);
    v32 = v6;
    v33 = v28;
    v34 = v7;
    v35 = v8;
    v36 = v9;
    v11 = sub_1000060E4(&qword_100066D40);
    Binding.subscript.getter(&v30, KeyPath, v11);
    swift_release(*((_QWORD *)&v6 + 1));
    swift_release(KeyPath);
    swift_release(v6);
    v12 = v30;
    v32 = v30;
    LOBYTE(v33) = v31;
    v13 = sub_1000060E4(&qword_100065688);
    Binding.wrappedValue.getter(v13);
    swift_release(*((_QWORD *)&v12 + 1));
    swift_release(v12);
    v14 = String._bridgeToObjectiveC()();
    v15 = &kCGColorSpaceDisplayP3;
    if (!v29)
      v15 = &kCGColorSpaceSRGB;
    v16 = *v15;
    v17 = (void *)objc_opt_self(UIColor);
    *(_QWORD *)&v32 = 0;
    v18 = objc_msgSend(v17, "hexValuedColor:colorSpace:error:", v14, v16, &v32);

    v19 = (id)v32;
    if (v18)
    {
      sub_1000183BC(v18, v29, (uint64_t)&v32);
      v20 = v32;
      v21 = v33;
      v22 = v34;
    }
    else
    {
      v23 = v19;
      v24 = _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease(v24);
      v20 = 0uLL;
      v22 = 2;
      v21 = 0uLL;
    }
    *(_OWORD *)a2 = v20;
    *(_OWORD *)(a2 + 16) = v21;
    *(_BYTE *)(a2 + 32) = v22;
  }
  else
  {
    v25 = a1[1];
    v26 = type metadata accessor for ColorPickerState(0);
    v27 = sub_1000098F0();
    EnvironmentObject.error()(0, v25, v26, v27);
    __break(1u);
  }
}

uint64_t sub_1000094A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  Swift::String_optional *v8;
  _QWORD *v9;
  NSString v10;
  NSString v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  Swift::String_optional v17;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String_optional v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  uint64_t result;
  void **p_object;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v6 = String.count.getter(0xD000000000000016, 0x8000000100047C40);
  if (v6)
  {
    v7 = v6;
    v8 = (Swift::String_optional *)sub_100005B28(v6, 0);
    v9 = sub_100005A70(&v35, v8 + 2, v7, 0xD000000000000016, 0x8000000100047C40);
    swift_bridgeObjectRelease(v36);
    if (v9 == (_QWORD *)v7)
      goto LABEL_5;
    __break(1u);
  }
  v8 = (Swift::String_optional *)&_swiftEmptyArrayStorage;
LABEL_5:
  v10 = String._bridgeToObjectiveC()();
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", a3, a4, v11);

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  if (String.count.getter(v13, v15) >= 7)
  {
LABEL_31:
    swift_release(v8);
    swift_bridgeObjectRelease(v15);
    return 0;
  }
  else
  {
    v16 = HIBYTE(v15) & 0xF;
    v35 = v13;
    v36 = v15;
    if ((v15 & 0x2000000000000000) == 0)
      v16 = v13 & 0xFFFFFFFFFFFFLL;
    v37 = 0;
    v38 = v16;
    v17 = String.Iterator.next()();
    if (v17.value._object)
    {
      countAndFlagsBits = v17.value._countAndFlagsBits;
      object = v17.value._object;
      while (1)
      {
        v21 = v8[1].value._countAndFlagsBits;
        if (!v21)
          goto LABEL_30;
        v22 = v8[2].value._countAndFlagsBits;
        v23 = v8[2].value._object;
        v24 = v22 == countAndFlagsBits && object == v23;
        if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, countAndFlagsBits, object, 0) & 1) == 0)
        {
          if (v21 == 1)
            goto LABEL_30;
          v25 = v8[3].value._countAndFlagsBits;
          v26 = v8[3].value._object;
          if (v25 != countAndFlagsBits || object != v26)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, countAndFlagsBits, object, 0);
            if ((result & 1) == 0)
              break;
          }
        }
LABEL_10:
        swift_bridgeObjectRelease(object);
        v20 = String.Iterator.next()();
        countAndFlagsBits = v20.value._countAndFlagsBits;
        object = v20.value._object;
        if (!v20.value._object)
          goto LABEL_32;
      }
      if (v21 == 2)
      {
LABEL_30:
        swift_bridgeObjectRelease(object);
        v15 = v36;
        goto LABEL_31;
      }
      p_object = &v8[4].value._object;
      v29 = 2;
      while (1)
      {
        v30 = v29 + 1;
        if (__OFADD__(v29, 1))
          break;
        v31 = (uint64_t)*(p_object - 1);
        v32 = *p_object;
        if (v31 == countAndFlagsBits && object == v32)
          goto LABEL_10;
        result = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, countAndFlagsBits, object, 0);
        if ((result & 1) != 0)
          goto LABEL_10;
        p_object += 2;
        ++v29;
        if (v30 == v21)
          goto LABEL_30;
      }
      __break(1u);
    }
    else
    {
LABEL_32:
      v34 = v36;
      swift_release(v8);
      swift_bridgeObjectRelease(v34);
      return 1;
    }
  }
  return result;
}

uint64_t sub_100009724()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10000973C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = type metadata accessor for RoundedRectangle(0);
  v6 = __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *v2;
  v10 = (char *)v8 + *(int *)(v6 + 20);
  v11 = enum case for RoundedCornerStyle.continuous(_:);
  v12 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  *v8 = v9;
  v8[1] = v9;
  v13 = a2 + *(int *)(sub_1000060E4(&qword_1000656A0) + 36);
  sub_100009E80((uint64_t)v8, v13, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_1000060E4(&qword_1000656A8) + 36)) = 256;
  v14 = sub_1000060E4(&qword_1000656B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a2, a1, v14);
  return sub_100009EC4((uint64_t)v8, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
}

unint64_t sub_100009868()
{
  unint64_t result;

  result = qword_100065658;
  if (!qword_100065658)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HStackLayout, &type metadata for HStackLayout);
    atomic_store(result, (unint64_t *)&qword_100065658);
  }
  return result;
}

unint64_t sub_1000098AC()
{
  unint64_t result;

  result = qword_100065668;
  if (!qword_100065668)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for VStackLayout, &type metadata for VStackLayout);
    atomic_store(result, (unint64_t *)&qword_100065668);
  }
  return result;
}

unint64_t sub_1000098F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065350;
  if (!qword_100065350)
  {
    v1 = type metadata accessor for ColorPickerState(255);
    result = swift_getWitnessTable(&unk_100045F30, v1);
    atomic_store(result, (unint64_t *)&qword_100065350);
  }
  return result;
}

uint64_t sub_10000993C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100022958(*(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_10000994C(__int128 *a1)
{
  uint64_t *v1;

  return sub_100022A44(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_100009960()
{
  unint64_t result;

  result = qword_100065678;
  if (!qword_100065678)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100065678);
  }
  return result;
}

uint64_t sub_1000099AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000099D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100009A04(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_100009A28(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

_BYTE *sub_100009A4C(_BYTE *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_100009A60()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_100009A70(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_100009A88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000060E4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for RGBAView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + v4));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v7 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100009B84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RGBAView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100009BC8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RGBAView(0) - 8) + 80);
  sub_100009218((uint64_t *)(v1 + ((v3 + 16) & ~v3)), a1);
}

uint64_t sub_100009C1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000060E4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100009C60(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[11];
  v6 = a1[13];
  v7 = a1[15];
  v8 = a1[24];
  swift_retain(a1[17]);
  swift_retain(v8);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t sub_100009CF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000060E4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100009D2C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[11];
  v6 = a1[13];
  v7 = a1[15];
  v8 = a1[17];
  swift_release(a1[24]);
  swift_release(v7);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v2);
  swift_release(v3);
  swift_release(v8);
  return a1;
}

uint64_t sub_100009DC4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

ValueMetadata *type metadata accessor for RGBAView.PlatformBasedShapeModifier()
{
  return &type metadata for RGBAView.PlatformBasedShapeModifier;
}

uint64_t sub_100009E00()
{
  return sub_100009FA0(&qword_100065698, &qword_100065618, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_100009E2C(uint64_t *a1)
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

uint64_t sub_100009E70(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050FF8, 1);
}

uint64_t sub_100009E80(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009EC4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100009F04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000656B8;
  if (!qword_1000656B8)
  {
    v1 = sub_100009E2C(&qword_1000656A0);
    sub_100009FA0(&qword_1000656C0, &qword_1000656B0, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_100009FA0(&qword_1000656C8, &qword_1000656A8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000656B8);
  }
  return result;
}

uint64_t sub_100009FA0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009E2C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  _OWORD v23[3];

  v6 = sub_1000060E4(&qword_100065730);
  __chkstk_darwin(v6);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000060E4(&qword_100065738);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = static VerticalAlignment.center.getter(v10);
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  v13 = sub_1000060E4(&qword_100065740);
  sub_10000A180(a1, a2, (uint64_t)&v8[*(int *)(v13 + 44)]);
  v14 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == (id)6)
    v17 = 0x4057000000000000;
  else
    v17 = 0x404B800000000000;
  v18 = static Alignment.center.getter(v16);
  _FrameLayout.init(width:height:alignment:)(v23, 0, 1, v17, 0, v18, v19);
  sub_100009C1C((uint64_t)v8, (uint64_t)v12, &qword_100065730);
  v20 = &v12[*(int *)(v9 + 36)];
  v21 = v23[1];
  *(_OWORD *)v20 = v23[0];
  *((_OWORD *)v20 + 1) = v21;
  *((_OWORD *)v20 + 2) = v23[2];
  sub_100009CF0((uint64_t)v8, &qword_100065730);
  return sub_10000C8BC((uint64_t)v12, a3);
}

uint64_t sub_10000A180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
  int v42;
  char v43;
  int v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  char *v56;
  char *v57;
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
  unsigned __int8 v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  char v87;
  char v88;
  char v89;
  char v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  unsigned __int8 v98;
  uint64_t v99;
  unsigned __int8 v100;
  uint64_t v101;
  unsigned __int8 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned __int8 v106;
  uint64_t v107;
  unsigned __int8 v108;
  uint64_t v109;
  unsigned __int8 v110;
  uint64_t v111;
  unsigned __int8 v112;
  uint64_t v113;
  unsigned __int8 v114;
  uint64_t v115;
  unsigned __int8 v116;
  uint64_t v117;
  uint64_t v118;

  v76 = a3;
  v5 = sub_1000060E4(&qword_100065748);
  v6 = __chkstk_darwin(v5);
  v75 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v45 - v8;
  v10 = sub_1000060E4(&qword_100065750);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v45 - v14;
  v16 = sub_1000060E4(&qword_100065758);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v21 = (char *)&v45 - v20;
  v66 = (uint64_t)&v45 - v20;
  v22 = sub_10000A6B0(a1, a2, (uint64_t)&v45 - v20);
  v23 = static Alignment.center.getter(v22);
  v43 = 1;
  v41 = 1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(&v91, 0x4024000000000000, 0, 0, 1, 0, 1, 0, 1, 0, v41, 0, v43, v23, v24);
  v73 = v93;
  v74 = v91;
  v72 = v95;
  v71 = v97;
  v69 = v101;
  v70 = v99;
  v67 = v104;
  v68 = v103;
  v90 = 1;
  v89 = v92;
  v88 = v94;
  v87 = v96;
  v86 = v98;
  v85 = v100;
  v84 = v102;
  v57 = v15;
  v25 = sub_10000A93C(a1, a2, (uint64_t)v15);
  v26 = static Alignment.center.getter(v25);
  LOBYTE(v44) = 1;
  LOBYTE(v42) = 1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(&v105, 0x4024000000000000, 0, 0, 1, 0, 1, 0, 1, 0, v42, 0, v44, v26, v27);
  v64 = v107;
  v65 = v105;
  v63 = v109;
  v62 = v111;
  v60 = v115;
  v61 = v113;
  v58 = v118;
  v59 = v117;
  v83 = 1;
  v82 = v106;
  v81 = v108;
  v80 = v110;
  v79 = v112;
  v78 = v114;
  v77 = v116;
  v28 = v9;
  v56 = v9;
  sub_10000ACC0(a1, a2, (uint64_t)v9);
  sub_100009C1C((uint64_t)v21, (uint64_t)v19, &qword_100065758);
  LOBYTE(a1) = v90;
  LOBYTE(v21) = v89;
  v29 = v88;
  LOBYTE(v9) = v87;
  v46 = v86;
  v47 = v85;
  v48 = v84;
  sub_100009C1C((uint64_t)v15, (uint64_t)v13, &qword_100065750);
  v49 = v83;
  v50 = v82;
  v51 = v81;
  v52 = v80;
  v53 = v79;
  v54 = v78;
  v55 = v77;
  v30 = (uint64_t)v28;
  v31 = v75;
  sub_100009C1C(v30, v75, &qword_100065748);
  v32 = (uint64_t)v19;
  v33 = (uint64_t)v19;
  v34 = v76;
  sub_100009C1C(v32, v76, &qword_100065758);
  v35 = (int *)sub_1000060E4(&qword_100065760);
  v36 = v34 + v35[12];
  *(_QWORD *)v36 = 0;
  *(_BYTE *)(v36 + 8) = a1;
  *(_QWORD *)(v36 + 16) = v74;
  *(_BYTE *)(v36 + 24) = (_BYTE)v21;
  *(_QWORD *)(v36 + 32) = v73;
  *(_BYTE *)(v36 + 40) = v29;
  *(_QWORD *)(v36 + 48) = v72;
  *(_BYTE *)(v36 + 56) = (_BYTE)v9;
  *(_QWORD *)(v36 + 64) = v71;
  *(_BYTE *)(v36 + 72) = v46;
  *(_QWORD *)(v36 + 80) = v70;
  *(_BYTE *)(v36 + 88) = v47;
  *(_QWORD *)(v36 + 96) = v69;
  *(_BYTE *)(v36 + 104) = v48;
  v37 = v67;
  *(_QWORD *)(v36 + 112) = v68;
  *(_QWORD *)(v36 + 120) = v37;
  sub_100009C1C((uint64_t)v13, v34 + v35[16], &qword_100065750);
  v38 = v34 + v35[20];
  *(_QWORD *)v38 = 0;
  *(_BYTE *)(v38 + 8) = v49;
  *(_QWORD *)(v38 + 16) = v65;
  *(_BYTE *)(v38 + 24) = v50;
  *(_QWORD *)(v38 + 32) = v64;
  *(_BYTE *)(v38 + 40) = v51;
  *(_QWORD *)(v38 + 48) = v63;
  *(_BYTE *)(v38 + 56) = v52;
  *(_QWORD *)(v38 + 64) = v62;
  *(_BYTE *)(v38 + 72) = v53;
  *(_QWORD *)(v38 + 80) = v61;
  *(_BYTE *)(v38 + 88) = v54;
  *(_QWORD *)(v38 + 96) = v60;
  *(_BYTE *)(v38 + 104) = v55;
  v39 = v58;
  *(_QWORD *)(v38 + 112) = v59;
  *(_QWORD *)(v38 + 120) = v39;
  sub_100009C1C(v31, v34 + v35[24], &qword_100065748);
  sub_100009CF0((uint64_t)v56, &qword_100065748);
  sub_100009CF0((uint64_t)v57, &qword_100065750);
  sub_100009CF0(v66, &qword_100065758);
  sub_100009CF0(v31, &qword_100065748);
  sub_100009CF0((uint64_t)v13, &qword_100065750);
  return sub_100009CF0(v33, &qword_100065758);
}

uint64_t sub_10000A6B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = a3;
  v5 = sub_1000060E4(&qword_100065778);
  __chkstk_darwin(v5);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100065868);
  __chkstk_darwin(v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000060E4(&qword_100065768);
  __chkstk_darwin(v11);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == (id)6)
  {
    sub_10000BBEC(a1, a2, (uint64_t)v13);
    v16 = &qword_100065768;
    sub_100009C1C((uint64_t)v13, (uint64_t)v10, &qword_100065768);
    swift_storeEnumTagMultiPayload(v10, v8, 0);
    v17 = sub_10000CA5C(&qword_1000657E0, &qword_100065768, &qword_1000657E8, sub_10000CB2C);
    v18 = sub_10000CA5C(&qword_100065780, &qword_100065778, &qword_100065788, sub_10000C904);
    _ConditionalContent<>.init(storage:)(v10, v11, v5, v17, v18);
    v19 = (uint64_t)v13;
  }
  else
  {
    sub_10000B1D8(a1, a2, (uint64_t)v7);
    v16 = &qword_100065778;
    sub_100009C1C((uint64_t)v7, (uint64_t)v10, &qword_100065778);
    swift_storeEnumTagMultiPayload(v10, v8, 1);
    v20 = sub_10000CA5C(&qword_1000657E0, &qword_100065768, &qword_1000657E8, sub_10000CB2C);
    v21 = sub_10000CA5C(&qword_100065780, &qword_100065778, &qword_100065788, sub_10000C904);
    _ConditionalContent<>.init(storage:)(v10, v11, v5, v20, v21);
    v19 = (uint64_t)v7;
  }
  return sub_100009CF0(v19, v16);
}

uint64_t sub_10000A93C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;

  v48 = sub_1000060E4(&qword_100065790);
  __chkstk_darwin(v48);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100065840);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v49 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    KeyPath = swift_getKeyPath(&unk_100043DE8);
    v12 = swift_getKeyPath(&unk_100043E10);
    v13 = swift_retain(a1);
    static Published.subscript.getter(&v53, v13, KeyPath, v12);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v12);
    v14 = sub_10000CC44();
    a2 = Text.init<A>(_:)(&v53, &type metadata for String, v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    v51 = v8;
    v52 = a3;
    v50 = v9;
    if (v22 == (id)6)
      v23 = static Font.title2.getter();
    else
      v23 = static Font.headline.getter();
    v24 = v23;
    v25 = v18 & 1;
    v26 = Text.font(_:)(v23, a2, v16, v18 & 1, v20);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    swift_release(v24);
    sub_10000CC88(a2, v16, v25);
    swift_bridgeObjectRelease(v20);
    v33 = swift_getKeyPath(&unk_100043E30);
    v53 = v26;
    v54 = v28;
    v55 = v30 & 1;
    v56 = v32;
    v57 = v33;
    v58 = 1;
    v59 = 0;
    v34 = enum case for DynamicTypeSize.xxxLarge(_:);
    v35 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v7, v34, v35);
    v36 = sub_100006848(&qword_100065830, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
    if ((dispatch thunk of static Equatable.== infix(_:_:)(v7, v7, v35, v36) & 1) != 0)
    {
      v37 = sub_1000060E4(&qword_100065848);
      v38 = sub_10000CD50();
      v39 = sub_100009FA0(&qword_1000657D8, &qword_100065790, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
      v40 = v49;
      View.dynamicTypeSize<A>(_:)(v7, v37, v48, v38, v39);
      sub_100009CF0((uint64_t)v7, &qword_100065790);
      sub_10000CC88(v53, v54, v55);
      swift_bridgeObjectRelease(v56);
      swift_release(v57);
      v42 = v50;
      v41 = v51;
      v43 = v52;
      (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v52, v40, v51);
      *(_QWORD *)(v43 + *(int *)(sub_1000060E4(&qword_100065750) + 36)) = 0x3FF0000000000000;
      return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v40, v41);
    }
    __break(1u);
  }
  v45 = type metadata accessor for ColorPickerState(0);
  v46 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, a2, v45, v46);
  __break(1u);
  return result;
}

uint64_t sub_10000ACC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = a3;
  v5 = sub_1000060E4(&qword_100065768);
  __chkstk_darwin(v5);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100065770);
  __chkstk_darwin(v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000060E4(&qword_100065778);
  __chkstk_darwin(v11);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == (id)6)
  {
    sub_10000B1D8(a1, a2, (uint64_t)v13);
    v16 = &qword_100065778;
    sub_100009C1C((uint64_t)v13, (uint64_t)v10, &qword_100065778);
    swift_storeEnumTagMultiPayload(v10, v8, 0);
    v17 = sub_10000CA5C(&qword_100065780, &qword_100065778, &qword_100065788, sub_10000C904);
    v18 = sub_10000CA5C(&qword_1000657E0, &qword_100065768, &qword_1000657E8, sub_10000CB2C);
    _ConditionalContent<>.init(storage:)(v10, v11, v5, v17, v18);
    v19 = (uint64_t)v13;
  }
  else
  {
    sub_10000BBEC(a1, a2, (uint64_t)v7);
    v16 = &qword_100065768;
    sub_100009C1C((uint64_t)v7, (uint64_t)v10, &qword_100065768);
    swift_storeEnumTagMultiPayload(v10, v8, 1);
    v20 = sub_10000CA5C(&qword_100065780, &qword_100065778, &qword_100065788, sub_10000C904);
    v21 = sub_10000CA5C(&qword_1000657E0, &qword_100065768, &qword_1000657E8, sub_10000CB2C);
    _ConditionalContent<>.init(storage:)(v10, v11, v5, v20, v21);
    v19 = (uint64_t)v7;
  }
  return sub_100009CF0(v19, v16);
}

uint64_t sub_10000AF4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t v20;
  uint64_t v21;
  void (*v23)(char *, uint64_t, uint64_t);
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  _OWORD v27[3];

  v26[1] = a2;
  v3 = sub_1000060E4(&qword_100065880);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4(&qword_100065888);
  __chkstk_darwin(v7);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000060E4(&qword_100065890);
  __chkstk_darwin(v10);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == (id)6)
  {
    v16 = static Alignment.center.getter(v15);
    _FrameLayout.init(width:height:alignment:)(v27, 0x4046000000000000, 0, 0x4046000000000000, 0, v16, v17);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, a1, v3);
    v18 = &v12[*(int *)(v10 + 36)];
    v19 = v27[1];
    *(_OWORD *)v18 = v27[0];
    *((_OWORD *)v18 + 1) = v19;
    *((_OWORD *)v18 + 2) = v27[2];
    sub_100009C1C((uint64_t)v12, (uint64_t)v9, &qword_100065890);
    swift_storeEnumTagMultiPayload(v9, v7, 0);
    v20 = sub_10000CE7C();
    v21 = sub_100009FA0(&qword_1000658A0, &qword_100065880, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    _ConditionalContent<>.init(storage:)(v9, v10, v3, v20, v21);
    return sub_100009CF0((uint64_t)v12, &qword_100065890);
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v23(v6, a1, v3);
    v23(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload(v9, v7, 1);
    v24 = sub_10000CE7C();
    v25 = sub_100009FA0(&qword_1000658A0, &qword_100065880, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    _ConditionalContent<>.init(storage:)(v9, v10, v3, v24, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_10000B1D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjCClassFromMetadata;
  void *v20;
  id v21;
  NSString v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSString v39;
  NSString v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSString v47;
  NSString v48;
  id v49;
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
  double v60;
  double v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  double v64;
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
  double v75;
  double v76;
  uint64_t v77;
  double v78;
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
  char *v91;
  uint64_t v92;
  uint64_t KeyPath;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t result;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  _QWORD v123[2];
  _QWORD v124[3];

  v103 = a2;
  v108 = a1;
  v109 = a3;
  v107 = sub_1000060E4(&qword_100065790);
  __chkstk_darwin(v107);
  v121 = (char *)&v101 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for UIButton.Configuration(0);
  v119 = *(_QWORD *)(v4 - 8);
  v120 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = sub_1000060E4(&qword_1000657C8);
  v7 = __chkstk_darwin(v116);
  v122 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v113 = (char *)&v101 - v9;
  v115 = sub_1000060E4(&qword_1000657B8);
  __chkstk_darwin(v115);
  v114 = (uint64_t)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_1000060E4(&qword_1000657A8);
  __chkstk_darwin(v118);
  v117 = (uint64_t)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_1000060E4(&qword_100065788);
  __chkstk_darwin(v111);
  v112 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_1000060E4(&qword_100065818);
  v105 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin(v106);
  v104 = (char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ColorPickerState(0);
  v15 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v102 = v14;
  v101 = v15;
  v16 = EnvironmentObject.init()(v14, v15);
  v124[0] = v16;
  v124[1] = v17;
  v18 = sub_1000075F4(0, (unint64_t *)&qword_100066F70, UIColorPickerViewController_ptr);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v18);
  v20 = (void *)objc_opt_self(NSBundle);
  v21 = objc_msgSend(v20, "bundleForClass:", ObjCClassFromMetadata);
  v22 = String._bridgeToObjectiveC()();
  v23 = String._bridgeToObjectiveC()();
  v24 = objc_msgSend(v21, "localizedStringForKey:value:table:", v22, 0, v23);

  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v27 = v26;

  v123[0] = v25;
  v123[1] = v27;
  v110 = sub_10000CC44();
  v28 = Text.init<A>(_:)(v123, &type metadata for String, v110);
  v30 = v29;
  v32 = v31;
  v34 = v33 & 1;
  v35 = sub_10000C400();
  View.accessibility(label:)(v28, v30, v34, v32, &type metadata for EyeDropperView, v35);
  sub_10000CC88(v28, v30, v34);
  swift_bridgeObjectRelease(v32);
  swift_release(v16);
  v36 = sub_1000060E4(&qword_100065828);
  v37 = swift_allocObject(v36, 64, 7);
  *(_OWORD *)(v37 + 16) = xmmword_100043AF0;
  v38 = objc_msgSend(v20, "bundleForClass:", ObjCClassFromMetadata);
  v39 = String._bridgeToObjectiveC()();
  v40 = String._bridgeToObjectiveC()();
  v41 = objc_msgSend(v38, "localizedStringForKey:value:table:", v39, 0, v40);

  v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
  v44 = v43;

  v45 = v111;
  *(_QWORD *)(v37 + 32) = v42;
  *(_QWORD *)(v37 + 40) = v44;
  v46 = objc_msgSend(v20, "bundleForClass:", ObjCClassFromMetadata);
  v47 = String._bridgeToObjectiveC()();
  v48 = String._bridgeToObjectiveC()();
  v49 = objc_msgSend(v46, "localizedStringForKey:value:table:", v47, 0, v48);

  v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
  v52 = v51;

  *(_QWORD *)(v37 + 48) = v50;
  *(_QWORD *)(v37 + 56) = v52;
  v53 = (uint64_t)v113;
  v54 = (uint64_t)v122;
  ModifiedContent<>.accessibilityInputLabels<A>(_:)(v37, v116, &type metadata for String, v110);
  v55 = v37;
  v56 = (uint64_t)v112;
  swift_bridgeObjectRelease(v55);
  sub_100009CF0(v54, &qword_1000657C8);
  v57 = v114;
  sub_100009C1C(v53, v114, &qword_1000657C8);
  *(_WORD *)(v57 + *(int *)(v115 + 36)) = 257;
  v58 = sub_100009CF0(v53, &qword_1000657C8);
  LOBYTE(v52) = static Edge.Set.leading.getter(v58);
  v59 = sub_10000BA98();
  UIButton.Configuration.contentInsets.getter(v59);
  v61 = v60;
  v62 = v120;
  v63 = *(void (**)(char *, uint64_t))(v119 + 8);
  v63(v6, v120);
  v64 = EdgeInsets.init(_all:)(-v61);
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v71 = v117;
  sub_100009C1C(v57, v117, &qword_1000657B8);
  v72 = v71 + *(int *)(v118 + 36);
  *(_BYTE *)v72 = v52;
  *(double *)(v72 + 8) = v64;
  *(_QWORD *)(v72 + 16) = v66;
  *(_QWORD *)(v72 + 24) = v68;
  *(_QWORD *)(v72 + 32) = v70;
  *(_BYTE *)(v72 + 40) = 0;
  v73 = sub_100009CF0(v57, &qword_1000657B8);
  LOBYTE(v52) = static Edge.Set.trailing.getter(v73);
  v74 = sub_10000BA98();
  UIButton.Configuration.contentInsets.getter(v74);
  v76 = v75;
  v63(v6, v62);
  v77 = (uint64_t)v121;
  v78 = EdgeInsets.init(_all:)(-v76);
  v80 = v79;
  v82 = v81;
  v84 = v83;
  sub_100009C1C(v71, v56, &qword_1000657A8);
  v85 = v56 + *(int *)(v45 + 36);
  *(_BYTE *)v85 = v52;
  *(double *)(v85 + 8) = v78;
  *(_QWORD *)(v85 + 16) = v80;
  *(_QWORD *)(v85 + 24) = v82;
  *(_QWORD *)(v85 + 32) = v84;
  *(_BYTE *)(v85 + 40) = 0;
  sub_100009CF0(v71, &qword_1000657A8);
  v86 = enum case for DynamicTypeSize.xLarge(_:);
  v87 = type metadata accessor for DynamicTypeSize(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 104))(v77, v86, v87);
  v88 = sub_100006848(&qword_100065830, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
  if ((dispatch thunk of static Equatable.== infix(_:_:)(v77, v77, v87, v88) & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v89 = sub_10000C904();
  v90 = sub_100009FA0(&qword_1000657D8, &qword_100065790, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
  v91 = v104;
  View.dynamicTypeSize<A>(_:)(v77, v45, v107, v89, v90);
  sub_100009CF0(v77, &qword_100065790);
  sub_100009CF0(v56, &qword_100065788);
  v92 = v108;
  if (!v108)
  {
LABEL_8:
    result = EnvironmentObject.error()(0, v103, v102, v101);
    __break(1u);
    return result;
  }
  KeyPath = swift_getKeyPath(&unk_100043D10);
  v94 = swift_getKeyPath(&unk_100043D38);
  v95 = swift_retain(v92);
  static Published.subscript.getter(v124, v95, KeyPath, v94);
  swift_release(v92);
  swift_release(KeyPath);
  swift_release(v94);
  if (LOBYTE(v124[0]))
    v96 = 1.0;
  else
    v96 = 0.0;
  v97 = v105;
  v98 = v109;
  v99 = v106;
  (*(void (**)(uint64_t, char *, uint64_t))(v105 + 16))(v109, v91, v106);
  *(double *)(v98 + *(int *)(sub_1000060E4(&qword_100065778) + 36)) = v96;
  return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v91, v99);
}

uint64_t sub_10000BA98()
{
  NSString v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t (*v7)(_BYTE *, _QWORD);
  _BYTE v9[32];

  static UIButton.Configuration.plain()();
  v0 = String._bridgeToObjectiveC()();
  v1 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v0);

  UIButton.Configuration.image.setter(v1);
  v2 = (void *)objc_opt_self(UIImageSymbolConfiguration);
  v3 = objc_msgSend(v2, "configurationWithTextStyle:", UIFontTextStyleBody);
  v4 = objc_msgSend(v2, "configurationWithWeight:", 6);
  v5 = objc_msgSend(v3, "configurationByApplyingConfiguration:", v4);

  UIButton.Configuration.preferredSymbolConfigurationForImage.setter(v5);
  v6 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  v7 = (uint64_t (*)(_BYTE *, _QWORD))UIButton.Configuration.background.modify(v9);
  UIBackgroundConfiguration.backgroundColor.setter(v6);
  return v7(v9, 0);
}

uint64_t sub_10000BBEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)();
  uint64_t v34;
  __int16 v35;

  v6 = sub_1000060E4(&qword_100065790);
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000060E4(&qword_100065838);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject(&unk_10005A6E8, 32, 7);
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v31 = a2;
  v33 = sub_10000CCC4;
  v34 = v13;
  v35 = 257;
  v14 = enum case for DynamicTypeSize.xLarge(_:);
  v15 = type metadata accessor for DynamicTypeSize(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v8, v14, v15);
  v16 = sub_100006848(&qword_100065830, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
  swift_retain(a1);
  if ((dispatch thunk of static Equatable.== infix(_:_:)(v8, v8, v15, v16) & 1) != 0)
  {
    v32 = a3;
    v17 = sub_1000060E4(&qword_1000657E8);
    v18 = sub_10000CB2C();
    v19 = sub_100009FA0(&qword_1000657D8, &qword_100065790, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    View.dynamicTypeSize<A>(_:)(v8, v17, v6, v18, v19);
    sub_100009CF0((uint64_t)v8, &qword_100065790);
    swift_release(v34);
    if (a1)
    {
      KeyPath = swift_getKeyPath(&unk_100043D58);
      v21 = swift_getKeyPath(&unk_100043D80);
      v22 = swift_retain(a1);
      static Published.subscript.getter(&v33, v22, KeyPath, v21);
      swift_release(KeyPath);
      swift_release(v21);
      if ((v33 & 1) != 0)
      {
        swift_release(a1);
        v23 = v32;
      }
      else
      {
        v24 = swift_getKeyPath(&unk_100043DA0);
        v25 = swift_getKeyPath(&unk_100043DC8);
        static Published.subscript.getter(&v33, a1, v24, v25);
        swift_release(a1);
        swift_release(v24);
        swift_release(v25);
        v26 = 1.0;
        v23 = v32;
        if (v33 != 1)
        {
LABEL_7:
          (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v23, v12, v9);
          *(double *)(v23 + *(int *)(sub_1000060E4(&qword_100065768) + 36)) = v26;
          return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        }
      }
      v26 = 0.0;
      goto LABEL_7;
    }
  }
  else
  {
    __break(1u);
  }
  v28 = type metadata accessor for ColorPickerState(0);
  v29 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v31, v28, v29);
  __break(1u);
  return result;
}

uint64_t sub_10000BF14(uint64_t result, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v2 = *(void (**)(uint64_t))(result + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
    if (v2)
    {
      v3 = *(_QWORD *)(result + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close + 8);
      v4 = swift_retain(v3);
      v2(v4);
      return sub_10000CCDC((uint64_t)v2, v3);
    }
  }
  else
  {
    v6 = type metadata accessor for ColorPickerState(0);
    v7 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, a2, v6, v7);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BFAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100009FE8(*v1, v1[1], a1);
}

uint64_t sub_10000BFB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  v2 = sub_1000060E4(&qword_100065718);
  __chkstk_darwin(v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UIPointerEffect(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = objc_msgSend(objc_allocWithZone((Class)UITargetedPreview), "initWithView:", a1);
  sub_1000075F4(0, &qword_100065720, UIPointerStyle_ptr);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for UIPointerEffect.highlight(_:), v5);
  v10 = type metadata accessor for UIPointerShape(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  return UIPointerStyle.init(effect:shape:)(v8, v4);
}

id sub_10000C23C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EyeDropperView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EyeDropperView.Coordinator()
{
  return objc_opt_self(_TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator);
}

ValueMetadata *type metadata accessor for EyeDropperView()
{
  return &type metadata for EyeDropperView;
}

id sub_10000C2C4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v3 = *v1;
  v4 = v1[1];
  v5 = (objc_class *)type metadata accessor for EyeDropperView.Coordinator();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent];
  *(_QWORD *)v7 = v3;
  *((_QWORD *)v7 + 1) = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain(v3);
  result = objc_msgSendSuper2(&v9, "init");
  *a1 = result;
  return result;
}

uint64_t sub_10000C338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000C5BC();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000C388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000C5BC();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10000C3D8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000C5BC();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_10000C400()
{
  unint64_t result;

  result = qword_100065700;
  if (!qword_100065700)
  {
    result = swift_getWitnessTable(&unk_100043B24, &type metadata for EyeDropperView);
    atomic_store(result, (unint64_t *)&qword_100065700);
  }
  return result;
}

void *sub_10000C444()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;

  v0 = type metadata accessor for UIButton.Configuration(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000075F4(0, &qword_100065708, UIButton_ptr);
  sub_10000BA98();
  v3 = (void *)UIButton.init(configuration:primaryAction:)(v2, 0);
  sub_1000060E4(&qword_100065710);
  UIViewRepresentableContext.coordinator.getter(&v9);
  v4 = v9;
  objc_msgSend(v3, "addTarget:action:forControlEvents:", v9, "buttonPressed:", 1);

  UIViewRepresentableContext.coordinator.getter(&v9);
  v5 = v9;
  objc_msgSend(v3, "addTarget:action:forControlEvents:", v9, "buttonUp:", 64);

  UIViewRepresentableContext.coordinator.getter(&v9);
  v6 = v9;
  objc_msgSend(v3, "addTarget:action:forControlEvents:", v9, "buttonUp:", 128);

  objc_msgSend(v3, "setContentHorizontalAlignment:", 4);
  UIButton.pointerStyleProvider.setter(sub_10000BFB4, 0);
  return v3;
}

unint64_t sub_10000C5BC()
{
  unint64_t result;

  result = qword_100065728;
  if (!qword_100065728)
  {
    result = swift_getWitnessTable(&unk_100043B74, &type metadata for EyeDropperView);
    atomic_store(result, (unint64_t *)&qword_100065728);
  }
  return result;
}

uint64_t sub_10000C600()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent);
  v2 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent);
  if (!v2)
    goto LABEL_6;
  KeyPath = swift_getKeyPath(&unk_100043C08);
  v4 = swift_getKeyPath(&unk_100043C30);
  v5 = swift_retain(v2);
  static Published.subscript.getter(&v14, v5, KeyPath, v4);
  swift_release(v2);
  swift_release(KeyPath);
  result = swift_release(v4);
  if ((v14 & 1) == 0)
    return result;
  v7 = *v1;
  if (!*v1)
  {
LABEL_6:
    v10 = v1[1];
    v11 = type metadata accessor for ColorPickerState(0);
    v12 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v10, v11, v12);
    __break(1u);
    return result;
  }
  v8 = swift_getKeyPath(&unk_100043C50);
  v9 = swift_getKeyPath(&unk_100043C78);
  v13 = 1;
  swift_retain(v7);
  return static Published.subscript.setter(&v13, v7, v8, v9);
}

uint64_t *initializeBufferWithCopyOfBuffer for ColorPickerNavigationBar(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for ColorPickerNavigationBar(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t *assignWithCopy for ColorPickerTabPicker(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t *assignWithTake for ColorPickerNavigationBar(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerTabPicker(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorPickerTabPicker(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerNavigationBar()
{
  return &type metadata for ColorPickerNavigationBar;
}

uint64_t sub_10000C8AC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000510E8, 1);
}

uint64_t sub_10000C8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000060E4(&qword_100065738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C904()
{
  return sub_10000C94C(&qword_100065798, &qword_100065788, (void (*)(void))sub_10000C928);
}

uint64_t sub_10000C928()
{
  return sub_10000C94C(&qword_1000657A0, &qword_1000657A8, (void (*)(void))sub_10000C9B4);
}

uint64_t sub_10000C94C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009E2C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C9B4()
{
  return sub_10000C94C(&qword_1000657B0, &qword_1000657B8, (void (*)(void))sub_10000C9D8);
}

unint64_t sub_10000C9D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000657C0;
  if (!qword_1000657C0)
  {
    v1 = sub_100009E2C(&qword_1000657C8);
    sub_10000C400();
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000657C0);
  }
  return result;
}

uint64_t sub_10000CA5C(unint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[4];

  result = *a1;
  if (!result)
  {
    v8 = sub_100009E2C(a2);
    v9[0] = sub_100009E2C(a3);
    v9[1] = sub_100009E2C(&qword_100065790);
    v9[2] = a4();
    v9[3] = sub_100009FA0(&qword_1000657D8, &qword_100065790, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    swift_getOpaqueTypeConformance2(v9, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CB2C()
{
  return sub_10000C94C(&qword_1000657F0, &qword_1000657E8, (void (*)(void))sub_10000CB50);
}

unint64_t sub_10000CB50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000657F8;
  if (!qword_1000657F8)
  {
    v1 = sub_100009E2C(&qword_100065800);
    sub_10000CBBC();
    sub_10000CC00();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000657F8);
  }
  return result;
}

unint64_t sub_10000CBBC()
{
  unint64_t result;

  result = qword_100065808;
  if (!qword_100065808)
  {
    result = swift_getWitnessTable(&unk_100044FF4, &type metadata for SystemCloseButton);
    atomic_store(result, (unint64_t *)&qword_100065808);
  }
  return result;
}

unint64_t sub_10000CC00()
{
  unint64_t result;

  result = qword_100065810;
  if (!qword_100065810)
  {
    result = swift_getWitnessTable(&unk_100043E7C, &type metadata for ColorPickerNavigationBar.PlatformBasedFrameModifier);
    atomic_store(result, (unint64_t *)&qword_100065810);
  }
  return result;
}

unint64_t sub_10000CC44()
{
  unint64_t result;

  result = qword_100065820;
  if (!qword_100065820)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100065820);
  }
  return result;
}

uint64_t sub_10000CC88(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000CCA0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CCC4()
{
  uint64_t v0;

  return sub_10000BF14(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000CCDC(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000CCF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000CD24(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

unint64_t sub_10000CD50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065850;
  if (!qword_100065850)
  {
    v1 = sub_100009E2C(&qword_100065848);
    sub_100009FA0(&qword_100065858, &qword_100065860, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065850);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerNavigationBar.PlatformBasedFrameModifier()
{
  return &type metadata for ColorPickerNavigationBar.PlatformBasedFrameModifier;
}

unint64_t sub_10000CDE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065870;
  if (!qword_100065870)
  {
    v1 = sub_100009E2C(&qword_100065738);
    sub_100009FA0(&qword_100065878, &qword_100065730, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065870);
  }
  return result;
}

uint64_t sub_10000CE6C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100051110, 1);
}

unint64_t sub_10000CE7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065898;
  if (!qword_100065898)
  {
    v1 = sub_100009E2C(&qword_100065890);
    sub_100009FA0(&qword_1000658A0, &qword_100065880, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065898);
  }
  return result;
}

unint64_t sub_10000CF04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000658A8;
  if (!qword_1000658A8)
  {
    v1 = sub_100009E2C(&qword_1000658B0);
    sub_10000CE7C();
    sub_100009FA0(&qword_1000658A0, &qword_100065880, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000658A8);
  }
  return result;
}

char *sub_10000CF98()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  char *v4;
  id v5;
  uint64_t v6;
  NSString v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  NSString v14;
  objc_super v16;

  v1 = &v0[OBJC_IVAR____TtC20ColorPickerUIService14FavoritesStore__favoriteColorsUserDefaultsKey];
  strcpy(&v0[OBJC_IVAR____TtC20ColorPickerUIService14FavoritesStore__favoriteColorsUserDefaultsKey], "FavoriteColors");
  v1[15] = -18;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for FavoritesStore();
  v2 = objc_msgSendSuper2(&v16, "init");
  v3 = (void *)objc_opt_self(NSUserDefaults);
  v4 = (char *)v2;
  v5 = objc_msgSend(v3, "standardUserDefaults");
  v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC20ColorPickerUIService14FavoritesStore__favoriteColorsUserDefaultsKey + 8];
  swift_bridgeObjectRetain(v6);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v8 = objc_msgSend(v5, "dataForKey:", v7);

  if (v8)
  {
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

    sub_10000E4C0(v9, v11);
  }
  else
  {
    v13 = objc_msgSend(v3, "standardUserDefaults");
    v14 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v13, "arrayForKey:", v14);

    if (v12)
    {

      goto LABEL_6;
    }
    sub_10000E12C();
  }
  v12 = v4;
LABEL_6:

  return v4;
}

char *sub_10000D154(char a1)
{
  char *v2;
  char *v3;
  uint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  __int128 v12;

  v2 = sub_10000D96C();
  v3 = v2;
  if ((a1 & 1) == 0)
  {
    v4 = *((_QWORD *)v2 + 2);
    if (v4)
    {
      v5 = v2 + 64;
      do
      {
        if (*((double *)v5 - 1) == 1.0)
        {
          v12 = *((_OWORD *)v5 - 2);
          v9 = *((_QWORD *)v5 - 2);
          v10 = *v5;
          if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
            sub_1000297EC(0, _swiftEmptyArrayStorage[2] + 1, 1);
          v7 = _swiftEmptyArrayStorage[2];
          v6 = _swiftEmptyArrayStorage[3];
          if (v7 >= v6 >> 1)
            sub_1000297EC((char *)(v6 > 1), v7 + 1, 1);
          _swiftEmptyArrayStorage[2] = v7 + 1;
          v8 = &_swiftEmptyArrayStorage[5 * v7];
          *((_OWORD *)v8 + 2) = v12;
          v8[6] = v9;
          v8[7] = 0x3FF0000000000000;
          *((_BYTE *)v8 + 64) = v10;
        }
        v5 += 40;
        --v4;
      }
      while (v4);
    }
    swift_bridgeObjectRelease(v3);
    return (char *)_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10000D28C(float64x2_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  Class isa;
  NSString v19;
  uint64_t result;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  float64x2_t *v30;
  uint64_t v31;
  unint64_t v32;
  float64x2_t v33;
  uint64_t v34;
  unint64_t v35;
  float64x2_t *v36;
  _QWORD *v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  unint64_t v42;
  float64x2_t *v43;
  float64x2_t v44;
  int v45;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  id v73;
  Class v74;
  NSString v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  float64x2_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  float64x2_t *v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  char *v90;
  _QWORD v91[2];

  v3 = v2;
  v6 = sub_1000060E4(&qword_100065928);
  __chkstk_darwin(v6);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v10 = type metadata accessor for JSONEncoder(0);
    swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
    v11 = JSONEncoder.init()();
    v91[0] = a1;
    v12 = sub_1000060E4(&qword_1000658F0);
    v13 = sub_10000E590(&qword_1000658F8, (void (*)(void))sub_10000E47C, (uint64_t)&protocol conformance descriptor for <A> [A]);
    v14 = dispatch thunk of JSONEncoder.encode<A>(_:)(v91, v12, v13);
    v16 = v15;
    swift_release(v11);
    v17 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
    isa = Data._bridgeToObjectiveC()().super.isa;
    v19 = String._bridgeToObjectiveC()();
    objc_msgSend(v17, "setValue:forKey:", isa, v19);

    return sub_10000E4C0(v14, v16);
  }
  v78 = v7;
  v21 = sub_10000D96C();
  v79 = v3;
  v22 = sub_10000D154(0);
  v90 = v22;
  v91[0] = a1;
  v23 = sub_1000060E4(&qword_1000658F0);
  v24 = sub_10000E68C();
  v25 = sub_10000E6D8();
  v77 = v23;
  BidirectionalCollection<>.difference<A>(from:)(&v90, v23, v23, v24, v24, v25);
  swift_bridgeObjectRelease(v22);
  v80 = v9;
  v26 = CollectionDifference.removals.getter(v6);
  v27 = *(_QWORD *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease(v26);
    goto LABEL_38;
  }
  v76 = v6;
  v28 = 0;
  v29 = v26 + 32;
  v81 = a1 + 4;
  v82 = v26 + 32;
  v30 = a1;
  v84 = v26;
  v85 = a1;
  v83 = v27;
  while (1)
  {
    if (v28 >= *(_QWORD *)(v26 + 16))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    v31 = v29 + (v28 << 6);
    if (*(_BYTE *)(v31 + 57) != 1)
      goto LABEL_7;
    v32 = *(_QWORD *)v31;
    if ((*(_QWORD *)v31 & 0x8000000000000000) != 0)
      goto LABEL_49;
    v33 = *(float64x2_t *)(v31 + 24);
    v86 = *(float64x2_t *)(v31 + 8);
    v87 = v33;
    v34 = *(_QWORD *)(v31 + 40);
    if (v32 && ((v35 = *(_QWORD *)&v30[1].f64[0], v35 >= v32) || (v32 = *(_QWORD *)&v30[1].f64[0], v35)))
    {
      swift_bridgeObjectRetain(v30);
      v36 = v81;
      v37 = _swiftEmptyArrayStorage;
      v39 = v86;
      v38 = v87;
      do
      {
        v44 = v36[-2];
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v44, v39), (int32x4_t)vceqq_f64(v36[-1], v38))), 0xFuLL))) & 1) != 0)
        {
          v45 = LOBYTE(v36->f64[0]);
          if (((v34 & 1) == 0) != v45)
          {
            v88 = v36[-1];
            v89 = v44;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v37);
            v91[0] = v37;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_1000297EC(0, v37[2] + 1, 1);
              v37 = (_QWORD *)v91[0];
            }
            v41 = v88;
            v40 = v89;
            v22 = (char *)v37[2];
            v42 = v37[3];
            v39 = v86;
            v38 = v87;
            if ((unint64_t)v22 >= v42 >> 1)
            {
              sub_1000297EC((char *)(v42 > 1), (int64_t)(v22 + 1), 1);
              v41 = v88;
              v40 = v89;
              v39 = v86;
              v38 = v87;
              v37 = (_QWORD *)v91[0];
            }
            v37[2] = v22 + 1;
            v43 = (float64x2_t *)&v37[5 * (_QWORD)v22];
            v43[2] = v40;
            v43[3] = v41;
            LOBYTE(v43[4].f64[0]) = v45;
          }
        }
        v36 = (float64x2_t *)((char *)v36 + 40);
        --v32;
      }
      while (v32);
      v30 = v85;
      swift_bridgeObjectRelease(v85);
    }
    else
    {
      v37 = _swiftEmptyArrayStorage;
    }
    v47 = v37[2];
    swift_release(v37);
    v48 = *((_QWORD *)v21 + 2);
    if (v48)
      break;
LABEL_6:
    v27 = v83;
    v26 = v84;
    v29 = v82;
LABEL_7:
    if (++v28 == v27)
    {
      swift_bridgeObjectRelease(v26);
      v6 = v76;
LABEL_38:
      v54 = v6;
      v55 = CollectionDifference.insertions.getter(v6);
      v56 = v55;
      v57 = *(_QWORD *)(v55 + 16);
      if (v57)
      {
        v58 = v55 + 48;
        do
        {
          if ((*(_BYTE *)(v58 + 41) & 1) == 0)
          {
            v60 = *(_QWORD *)(v58 + 24);
            v62 = *(_QWORD *)(v58 + 8);
            v61 = *(_QWORD *)(v58 + 16);
            v64 = *(_QWORD *)(v58 - 8);
            v63 = *(_QWORD *)v58;
            if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
              v21 = sub_1000293B4(0, *((_QWORD *)v21 + 2) + 1, 1, v21);
            v66 = *((_QWORD *)v21 + 2);
            v65 = *((_QWORD *)v21 + 3);
            if (v66 >= v65 >> 1)
              v21 = sub_1000293B4((char *)(v65 > 1), v66 + 1, 1, v21);
            *((_QWORD *)v21 + 2) = v66 + 1;
            v59 = &v21[40 * v66];
            *((_QWORD *)v59 + 4) = v64;
            *((_QWORD *)v59 + 5) = v63;
            *((_QWORD *)v59 + 6) = v62;
            *((_QWORD *)v59 + 7) = v61;
            v59[64] = v60 & 1;
          }
          v58 += 64;
          --v57;
        }
        while (v57);
      }
      swift_bridgeObjectRelease(v56);
      v67 = type metadata accessor for JSONEncoder(0);
      swift_allocObject(v67, *(unsigned int *)(v67 + 48), *(unsigned __int16 *)(v67 + 52));
      v68 = JSONEncoder.init()();
      v91[0] = v21;
      v69 = sub_10000E590(&qword_1000658F8, (void (*)(void))sub_10000E47C, (uint64_t)&protocol conformance descriptor for <A> [A]);
      swift_bridgeObjectRetain(v21);
      v70 = dispatch thunk of JSONEncoder.encode<A>(_:)(v91, v77, v69);
      v72 = v71;
      swift_bridgeObjectRelease_n(v21, 2);
      swift_release(v68);
      v73 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
      v74 = Data._bridgeToObjectiveC()().super.isa;
      v75 = String._bridgeToObjectiveC()();
      objc_msgSend(v73, "setValue:forKey:", v74, v75);
      sub_10000E4C0(v70, v72);

      return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v80, v54);
    }
  }
  v49 = 0;
  v50 = 72;
  while (1)
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v21[v50 - 40], v86), (int32x4_t)vceqq_f64(*(float64x2_t *)&v21[v50 - 24], v87))), 0xFuLL))) & 1) == 0|| ((((v34 & 1) == 0) ^ v21[v50 - 8]) & 1) == 0)
    {
      goto LABEL_27;
    }
    if (!v47)
      break;
    --v47;
LABEL_27:
    ++v49;
    v50 += 40;
    if (v48 == v49)
      goto LABEL_5;
  }
  if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
    v21 = sub_100029E2C((uint64_t)v21);
  v51 = *((_QWORD *)v21 + 2);
  v52 = v51 - v49;
  if (v51 > v49)
  {
    v53 = v51 - 1;
    memmove(&v21[v50 - 40], &v21[v50], 40 * v52 - 40);
    *((_QWORD *)v21 + 2) = v53;
LABEL_5:
    v30 = v85;
    goto LABEL_6;
  }
LABEL_50:
  __break(1u);
  swift_unexpectedError(v28, "ColorPickerUIService/FavoritesStore.swift", 41, 1, 38);
  __break(1u);
  swift_release(v22);
  swift_bridgeObjectRelease(v21);
  result = swift_unexpectedError(v28, "ColorPickerUIService/FavoritesStore.swift", 41, 1, 75);
  __break(1u);
  return result;
}

char *sub_10000D96C()
{
  void *v0;
  id v1;
  NSString v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSString v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *result;
  uint64_t v30;
  id v31;
  void *v32;
  CGColor *v33;
  CGColorSpace *v34;
  uint64_t v35;
  uint64_t v36;
  CFStringRef v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  CGFloat Alpha;
  uint64_t v49;
  int v50;
  CGColor *v51;
  CFStringRef v52;
  char *v53;
  char *v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  CGFloat *v58;
  uint64_t v59;
  __CFString *v60;
  unint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD v68[4];
  char v69;

  v0 = (void *)objc_opt_self(NSUserDefaults);
  v1 = objc_msgSend(v0, "standardUserDefaults");
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "dataForKey:", v2);

  if (v3)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = type metadata accessor for JSONDecoder(0);
    swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
    v8 = JSONDecoder.init()();
    v9 = sub_1000060E4(&qword_1000658F0);
    v10 = sub_10000E590(&qword_100065918, (void (*)(void))sub_10000E5F8, (uint64_t)&protocol conformance descriptor for <A> [A]);
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(v68, v9, v4, v6, v9, v10);
    swift_release(v8);
    sub_10000E4C0(v4, v6);
    return (char *)v68[0];
  }
  v11 = objc_msgSend(v0, "standardUserDefaults");
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v11, "arrayForKey:", v12);

  if (!v13)
    return (char *)_swiftEmptyArrayStorage;
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, (char *)&type metadata for Any + 8);

  v15 = sub_10000DFE0(v14);
  swift_bridgeObjectRelease(v14);
  v26 = _swiftEmptyArrayStorage;
  if (!v15)
    return (char *)v26;
  v68[0] = _swiftEmptyArrayStorage;
  v16 = v15[2];
  if (v16)
  {
    sub_1000075F4(0, &qword_100065908, NSKeyedUnarchiver_ptr);
    v17 = sub_1000075F4(0, &qword_100065910, UIColor_ptr);
    swift_bridgeObjectRetain(v15);
    v63 = v15;
    v18 = v15 + 5;
    do
    {
      v19 = *(v18 - 1);
      v20 = *v18;
      sub_10000E504(v19, *v18);
      v21 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v17, v19, v20, v17);
      v22 = sub_10000E4C0(v19, v20);
      if (v21)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v22);
        v24 = *(_QWORD *)((v68[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        v23 = *(_QWORD *)((v68[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v24 >= v23 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
        v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v21);
        specialized Array._endMutation()(v25);
      }
      v18 += 2;
      --v16;
    }
    while (v16);
    v15 = v63;
    swift_bridgeObjectRelease(v63);
    v27 = v68[0];
  }
  else
  {
    v27 = (uint64_t)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v15);
  if ((unint64_t)v27 >> 62)
  {
    if (v27 < 0)
      v59 = v27;
    else
      v59 = v27 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v27);
    v28 = _CocoaArrayWrapper.endIndex.getter(v59);
    swift_bridgeObjectRelease(v27);
    if (v28)
      goto LABEL_16;
    goto LABEL_45;
  }
  v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v28)
  {
LABEL_45:
    swift_bridgeObjectRelease(v27);
    return (char *)_swiftEmptyArrayStorage;
  }
LABEL_16:
  v67 = _swiftEmptyArrayStorage;
  result = sub_1000297EC(0, v28 & ~(v28 >> 63), 0);
  if ((v28 & 0x8000000000000000) == 0)
  {
    v30 = 0;
    v26 = v67;
    v61 = v27 & 0xC000000000000001;
    v60 = (__CFString *)kCGColorSpaceDisplayP3;
    while (1)
    {
      if (v61)
        v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v30, v27);
      else
        v31 = *(id *)(v27 + 8 * v30 + 32);
      v32 = v31;
      v33 = (CGColor *)objc_msgSend(v31, "CGColor", v60);
      v34 = CGColorGetColorSpace(v33);

      if (!v34)
        goto LABEL_28;
      v62 = v26;
      v35 = v28;
      v36 = v27;
      v37 = CGColorSpaceCopyName(v34);
      if (!v37)
        goto LABEL_27;
      v38 = (__CFString *)v37;
      type metadata accessor for CFString(0);
      v40 = v39;
      v41 = sub_10000E548();
      v42 = (id)kCGColorSpaceSRGB;
      v43 = static _CFObject.== infix(_:_:)(v42, v38, v40, v41);

      if ((v43 & 1) != 0)
      {

      }
      else
      {
        v44 = v60;
        v45 = static _CFObject.== infix(_:_:)(v44, v38, v40, v41);

        if ((v45 & 1) == 0)
        {
LABEL_27:

          v27 = v36;
          v28 = v35;
          v26 = v62;
LABEL_28:
          if (qword_100065088 != -1)
            swift_once(&qword_100065088, sub_10002141C);
          v50 = byte_10006B6A0;
          v51 = (CGColor *)objc_msgSend(v32, "CGColor");
          if (v50)
            v52 = v60;
          else
            v52 = kCGColorSpaceSRGB;
          result = (char *)UISCreateCachedColorTransform(v52);
          v65 = 0;
          v66 = 0;
          v64 = 0;
          if (!result)
            goto LABEL_49;
          v53 = result;
          result = CGColorGetColorSpace(v51);
          if (!result)
            goto LABEL_50;
          v54 = result;
          result = (char *)CGColorRef.components.getter();
          if (!result)
            goto LABEL_51;
          v55 = result;
          CGColorTransformConvertColorComponents(v53, v54, 3, result + 32, &v64);

          swift_bridgeObjectRelease(v55);
          v46 = v64;
          v47 = v65;
          v49 = v66;
          Alpha = CGColorGetAlpha(v51);

          goto LABEL_37;
        }
      }
      sub_1000183BC(v32, (v43 & 1) == 0, (uint64_t)v68);
      v46 = v68[0];
      v47 = v68[1];
      v49 = v68[2];
      Alpha = *(double *)&v68[3];
      LOBYTE(v50) = v69;

      v27 = v36;
      v28 = v35;
      v26 = v62;
LABEL_37:
      v67 = v26;
      v57 = v26[2];
      v56 = v26[3];
      if (v57 >= v56 >> 1)
      {
        sub_1000297EC((char *)(v56 > 1), v57 + 1, 1);
        v26 = v67;
      }
      ++v30;
      v26[2] = v57 + 1;
      v58 = (CGFloat *)&v26[5 * v57];
      *((_QWORD *)v58 + 4) = v46;
      *((_QWORD *)v58 + 5) = v47;
      *((_QWORD *)v58 + 6) = v49;
      v58[7] = Alpha;
      *((_BYTE *)v58 + 64) = v50;
      if (v28 == v30)
      {
        swift_bridgeObjectRelease(v27);
        return (char *)v26;
      }
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

_QWORD *sub_10000DFE0(uint64_t a1)
{
  int64_t v2;
  _QWORD *v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  __int128 v9;
  _BYTE v10[32];
  _QWORD *v11;

  v2 = *(_QWORD *)(a1 + 16);
  v11 = _swiftEmptyArrayStorage;
  sub_100029808(0, v2, 0);
  v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_10000E63C(i, (uint64_t)v10);
      if (!swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, &type metadata for Data, 6))
        break;
      v8 = v9;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100029808(0, v3[2] + 1, 1);
        v3 = v11;
      }
      v6 = v3[2];
      v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100029808((char *)(v5 > 1), v6 + 1, 1);
        v3 = v11;
      }
      v3[2] = v6 + 1;
      *(_OWORD *)&v3[2 * v6 + 4] = v8;
      if (!--v2)
        return v3;
    }
    v9 = xmmword_100043ED0;
    swift_release(v3);
    sub_10000E678(v9, *((unint64_t *)&v9 + 1));
    return 0;
  }
  return v3;
}

uint64_t sub_10000E12C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  Class isa;
  NSString v25;
  uint64_t v27;

  if (qword_100065088 != -1)
    swift_once(&qword_100065088, sub_10002141C);
  v0 = byte_10006B6A0;
  v1 = sub_1000060E4(&qword_1000658E8);
  v2 = swift_allocObject(v1, 232, 7);
  v3 = v2;
  *(_OWORD *)(v2 + 16) = xmmword_100043EE0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0x3FF0000000000000;
  v4 = 0.156862745;
  if (!v0)
    v4 = 0.0;
  v5 = 0.380392157;
  if (v0)
    v5 = 0.37254902;
  v6 = 0.992156863;
  if (v0)
    v6 = 0.956862745;
  v7 = 0.2;
  if (v0)
    v7 = 0.392156863;
  v8 = 0.780392157;
  if (v0)
    v8 = 0.768627451;
  v9 = 0.349019608;
  if (v0)
    v9 = 0.4;
  v10 = 0.968627451;
  v11 = 1.0;
  if (!v0)
    v10 = 1.0;
  v12 = 0.8;
  if (v0)
    v12 = 0.807843137;
  v13 = 0.00392156863;
  if (v0)
  {
    v13 = 0.274509804;
    v11 = 0.921568627;
  }
  v14 = 0.22745098;
  if (v0)
    v14 = 0.301960784;
  v15 = 0.184313725;
  if (v0)
    v15 = 0.239215686;
  *(_BYTE *)(v2 + 64) = v0;
  *(double *)(v2 + 72) = v4;
  *(double *)(v2 + 80) = v5;
  *(double *)(v2 + 88) = v6;
  *(_QWORD *)(v2 + 96) = 0x3FF0000000000000;
  *(_BYTE *)(v2 + 104) = v0;
  *(double *)(v2 + 112) = v7;
  *(double *)(v2 + 120) = v8;
  *(double *)(v2 + 128) = v9;
  *(_QWORD *)(v2 + 136) = 0x3FF0000000000000;
  *(_BYTE *)(v2 + 144) = v0;
  *(double *)(v2 + 152) = v10;
  *(double *)(v2 + 160) = v12;
  *(double *)(v2 + 168) = v13;
  *(_QWORD *)(v2 + 176) = 0x3FF0000000000000;
  *(_BYTE *)(v2 + 184) = v0;
  *(double *)(v2 + 192) = v11;
  *(double *)(v2 + 200) = v14;
  *(double *)(v2 + 208) = v15;
  *(_QWORD *)(v2 + 216) = 0x3FF0000000000000;
  *(_BYTE *)(v2 + 224) = v0;
  v16 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  v17 = JSONEncoder.init()();
  v27 = v3;
  v18 = sub_1000060E4(&qword_1000658F0);
  v19 = sub_10000E590(&qword_1000658F8, (void (*)(void))sub_10000E47C, (uint64_t)&protocol conformance descriptor for <A> [A]);
  v20 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v27, v18, v19);
  v22 = v21;
  swift_bridgeObjectRelease(v3);
  swift_release(v17);
  v23 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  isa = Data._bridgeToObjectiveC()().super.isa;
  v25 = String._bridgeToObjectiveC()();
  objc_msgSend(v23, "setValue:forKey:", isa, v25);

  return sub_10000E4C0(v20, v22);
}

id sub_10000E418()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoritesStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FavoritesStore()
{
  return objc_opt_self(_TtC20ColorPickerUIService14FavoritesStore);
}

unint64_t sub_10000E47C()
{
  unint64_t result;

  result = qword_100065900;
  if (!qword_100065900)
  {
    result = swift_getWitnessTable(&unk_100044A00, &type metadata for SomeColor);
    atomic_store(result, (unint64_t *)&qword_100065900);
  }
  return result;
}

uint64_t sub_10000E4C0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000E504(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10000E548()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066F80;
  if (!qword_100066F80)
  {
    type metadata accessor for CFString(255);
    result = swift_getWitnessTable(&unk_1000431B0, v1);
    atomic_store(result, (unint64_t *)&qword_100066F80);
  }
  return result;
}

uint64_t sub_10000E590(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_100009E2C(&qword_1000658F0);
    a2();
    result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000E5F8()
{
  unint64_t result;

  result = qword_100065920;
  if (!qword_100065920)
  {
    result = swift_getWitnessTable(&unk_100044A28, &type metadata for SomeColor);
    atomic_store(result, (unint64_t *)&qword_100065920);
  }
  return result;
}

uint64_t sub_10000E63C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E678(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000E4C0(result, a2);
  return result;
}

unint64_t sub_10000E68C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065930;
  if (!qword_100065930)
  {
    v1 = sub_100009E2C(&qword_1000658F0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100065930);
  }
  return result;
}

unint64_t sub_10000E6D8()
{
  unint64_t result;

  result = qword_100065938;
  if (!qword_100065938)
  {
    result = swift_getWitnessTable(&unk_100044A50, &type metadata for SomeColor);
    atomic_store(result, (unint64_t *)&qword_100065938);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchCrosshairView()
{
  return &type metadata for ColorSwatchCrosshairView;
}

uint64_t sub_10000E72C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000511D4, 1);
}

double sub_10000E73C@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  _QWORD v17[5];

  v3 = *v1;
  v4 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
  v5 = Color.init(uiColor:)(v4);
  v6 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v17, 0, 0, &_swiftEmptyArrayStorage, 2.5, 10.0, 0.0);
  v7 = v17[0];
  v8 = v17[2];
  v9 = v17[3];
  v10 = v17[4];
  v11 = static Alignment.center.getter(v6);
  v13 = v12;
  v14 = static Color.black.getter();
  v15 = Color.opacity(_:)(0.2);
  swift_release(v14);
  *(_OWORD *)a1 = xmmword_100043FB0;
  *(_QWORD *)(a1 + 16) = v3;
  result = *(double *)&v17[1];
  *(_QWORD *)(a1 + 24) = v7;
  *(double *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v5;
  *(_WORD *)(a1 + 72) = 256;
  *(_QWORD *)(a1 + 80) = v11;
  *(_QWORD *)(a1 + 88) = v13;
  *(_QWORD *)(a1 + 96) = v15;
  *(_QWORD *)(a1 + 104) = 0x4010000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for RoundedRectShape(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for RoundedRectShape(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RoundedRectShape(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RoundedRectShape()
{
  return &type metadata for RoundedRectShape;
}

unint64_t sub_10000E8C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065940;
  if (!qword_100065940)
  {
    v1 = sub_100009E2C(&qword_100065948);
    sub_100009FA0(&qword_100065950, &qword_100065958, (uint64_t)&protocol conformance descriptor for StrokeShapeView<A, B, C>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065940);
  }
  return result;
}

uint64_t sub_10000E94C()
{
  return sub_100009FA0(&qword_100065960, &qword_100065968, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
}

double sub_10000E978@<D0>(char a1@<W0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  double v16;
  double MaxY;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  double result;
  __int128 v24;
  double MaxX;
  double MinY;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  _OWORD v32[2];
  char v33;
  _QWORD v34[6];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  Path.init()(v32);
  v35.origin.x = a3;
  v35.origin.y = a4;
  v35.size.width = a5;
  v35.size.height = a6;
  MinX = CGRectGetMinX(v35);
  v36.origin.x = a3;
  v36.origin.y = a4;
  v36.size.width = a5;
  v36.size.height = a6;
  MinY = CGRectGetMinY(v36);
  v37.origin.x = a3;
  v37.origin.y = a4;
  v37.size.width = a5;
  v37.size.height = a6;
  MaxX = CGRectGetMaxX(v37);
  v38.origin.x = a3;
  v38.origin.y = a4;
  v38.size.width = a5;
  v38.size.height = a6;
  v16 = CGRectGetMinY(v38);
  v39.origin.x = a3;
  v39.origin.y = a4;
  v39.size.width = a5;
  v39.size.height = a6;
  v29 = CGRectGetMaxX(v39);
  v40.origin.x = a3;
  v40.origin.y = a4;
  v40.size.width = a5;
  v40.size.height = a6;
  MaxY = CGRectGetMaxY(v40);
  v41.origin.x = a3;
  v41.origin.y = a4;
  v41.size.width = a5;
  v41.size.height = a6;
  v27 = CGRectGetMinX(v41);
  v42.origin.x = a3;
  v42.origin.y = a4;
  v42.size.width = a5;
  v42.size.height = a6;
  v18 = CGRectGetMaxY(v42);
  if ((a1 & 1) != 0)
    v19 = a8;
  else
    v19 = a7;
  v28 = v19;
  if ((a1 & 2) != 0)
    v20 = a8;
  else
    v20 = a7;
  if ((a1 & 8) != 0)
    v21 = a8;
  else
    v21 = a7;
  if ((a1 & 4) != 0)
    a7 = a8;
  v30 = v19 + MinX;
  Path.move(to:)();
  Path.addLine(to:)(MaxX - v20, v16);
  v34[0] = 0x3FF0000000000000;
  v34[1] = 0;
  v34[2] = 0;
  v34[3] = 0x3FF0000000000000;
  v34[4] = 0;
  v34[5] = 0;
  Path.addArc(tangent1End:tangent2End:radius:transform:)(v34, MaxX, v16, MaxX, v20 + v16, v20);
  Path.addLine(to:)(v29, MaxY - v21);
  Path.addArc(tangent1End:tangent2End:radius:transform:)(v34, v29, MaxY, v29 - v21, MaxY, v21);
  Path.addLine(to:)(a7 + v27, v18);
  Path.addArc(tangent1End:tangent2End:radius:transform:)(v34, v27, v18, v27, v18 - a7, a7);
  Path.addLine(to:)(MinX, v28 + MinY);
  Path.addArc(tangent1End:tangent2End:radius:transform:)(v34, MinX, MinY, v30, MinY, v28);
  Path.closeSubpath()();
  v22 = v33;
  result = *(double *)v32;
  v24 = v32[1];
  *(_OWORD *)a2 = v32[0];
  *(_OWORD *)(a2 + 16) = v24;
  *(_BYTE *)(a2 + 32) = v22;
  return result;
}

double sub_10000EBE4@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;
  double result;
  __int128 v8;
  _OWORD v9[2];
  char v10;

  sub_10000E978(*(_QWORD *)(v5 + 16), (uint64_t)v9, a2, a3, a4, a5, *(double *)v5, *(double *)(v5 + 8));
  result = *(double *)v9;
  v8 = v9[1];
  *(_OWORD *)a1 = v9[0];
  *(_OWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 32) = v10;
  return result;
}

uint64_t sub_10000EC34()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_10000EC4C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_10000ECA8;
}

void sub_10000ECA8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_10000ECD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000EE88();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000ED28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000EE88();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000ED78(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EE88();
  return Shape.body.getter(a1, v2);
}

unint64_t sub_10000EDB4()
{
  unint64_t result;

  result = qword_100065970;
  if (!qword_100065970)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyAnimatableData, &type metadata for EmptyAnimatableData);
    atomic_store(result, (unint64_t *)&qword_100065970);
  }
  return result;
}

unint64_t sub_10000EDFC()
{
  unint64_t result;

  result = qword_100065978;
  if (!qword_100065978)
  {
    result = swift_getWitnessTable(&unk_100044094, &type metadata for RoundedRectShape);
    atomic_store(result, (unint64_t *)&qword_100065978);
  }
  return result;
}

unint64_t sub_10000EE44()
{
  unint64_t result;

  result = qword_100065980;
  if (!qword_100065980)
  {
    result = swift_getWitnessTable(&unk_100044044, &type metadata for RoundedRectShape);
    atomic_store(result, (unint64_t *)&qword_100065980);
  }
  return result;
}

unint64_t sub_10000EE88()
{
  unint64_t result;

  result = qword_100065988;
  if (!qword_100065988)
  {
    result = swift_getWitnessTable(&unk_1000440E4, &type metadata for RoundedRectShape);
    atomic_store(result, (unint64_t *)&qword_100065988);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ColorPickerView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for ColorPickerView(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for ColorPickerView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

_QWORD *assignWithTake for ColorPickerView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ColorPickerView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ColorPickerView()
{
  return &type metadata for ColorPickerView;
}

_BYTE *initializeBufferWithCopyOfBuffer for SomeColor.ColorSpace(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Tab(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Tab(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000F0EC + 4 * byte_100044145[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000F120 + 4 * byte_100044140[v4]))();
}

uint64_t sub_10000F120(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F128(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000F130);
  return result;
}

uint64_t sub_10000F13C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000F144);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000F148(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F150(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F15C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000F164(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Tab()
{
  return &type metadata for Tab;
}

uint64_t sub_10000F17C()
{
  return sub_100009FA0(&qword_100065990, &qword_100065998, (uint64_t)&protocol conformance descriptor for [A]);
}

uint64_t sub_10000F1A8(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  char v8;

  v2 = 1684632135;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0x6D75727463657053;
    else
      v4 = 0x73726564696C53;
    if (v3 == 1)
      v5 = 0xE800000000000000;
    else
      v5 = 0xE700000000000000;
    v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1)
        v2 = 0x6D75727463657053;
      else
        v2 = 0x73726564696C53;
      if (v6 == 1)
        v7 = 0xE800000000000000;
      else
        v7 = 0xE700000000000000;
      if (v4 != v2)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v5 = 0xE400000000000000;
    v4 = 1684632135;
    v6 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v4 != 1684632135)
  {
LABEL_21:
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v2, v7, 0);
    goto LABEL_22;
  }
LABEL_19:
  if (v5 != v7)
    goto LABEL_21;
  v8 = 1;
  v7 = v5;
LABEL_22:
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v7);
  return v8 & 1;
}

__n128 sub_10000F2B0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_100009C1C(v16, a9, &qword_1000659B8);
  v35 = a9 + *(int *)(sub_1000060E4(&qword_1000659C0) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

uint64_t sub_10000F46C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  _OWORD *v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
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
  unsigned int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _OWORD v50[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v48 = a5;
    v49 = a7;
    v47 = a3;
    v46 = a1;
    v45 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, _swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v45;
    v19 = a10;
    a1 = v46;
    a3 = v47;
    v18 = a12;
    a5 = v48;
    a7 = v49;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v50, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = v15[5];
  a9[4] = v15[4];
  a9[5] = v34;
  v35 = v15[6];
  v36 = v15[1];
  *a9 = *v15;
  a9[1] = v36;
  v37 = v15[3];
  a9[2] = v15[2];
  a9[3] = v37;
  v38 = v50[0];
  v39 = v50[1];
  a9[6] = v35;
  a9[7] = v38;
  v40 = v50[2];
  v41 = v50[3];
  a9[8] = v39;
  a9[9] = v40;
  v42 = v50[4];
  v43 = v50[6];
  a9[12] = v50[5];
  a9[13] = v43;
  a9[10] = v41;
  a9[11] = v42;
  return sub_1000158C0((uint64_t)v15);
}

uint64_t sub_10000F61C(char a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t ObjCClassFromMetadata;
  id v4;
  NSString v5;
  NSString v6;
  id v7;
  uint64_t v8;

  if (a1)
  {
    if (a1 == 1)
      v1 = 0xE800000000000000;
    else
      v1 = 0xE700000000000000;
  }
  else
  {
    v1 = 0xE400000000000000;
  }
  v2 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v2);
  v4 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v5 = String._bridgeToObjectiveC()();
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v4, "localizedStringForKey:value:table:", v5, 0, v6);

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  swift_bridgeObjectRelease(v1);

  return v8;
}

uint64_t sub_10000F754(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000F1A8(*a1, *a2);
}

Swift::Int sub_10000F760()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[9];

  v1 = *v0;
  Hasher.init(_seed:)(v7, 0);
  v2 = 0xE800000000000000;
  v3 = 0x6D75727463657053;
  if (v1 != 1)
  {
    v3 = 0x73726564696C53;
    v2 = 0xE700000000000000;
  }
  if (v1)
    v4 = v3;
  else
    v4 = 1684632135;
  if (v1)
    v5 = v2;
  else
    v5 = 0xE400000000000000;
  String.hash(into:)(v7, v4, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10000F7F8(uint64_t a1)
{
  _BYTE *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = 0xE800000000000000;
  v3 = 0x6D75727463657053;
  if (*v1 != 1)
  {
    v3 = 0x73726564696C53;
    v2 = 0xE700000000000000;
  }
  if (*v1)
    v4 = v3;
  else
    v4 = 1684632135;
  if (*v1)
    v5 = v2;
  else
    v5 = 0xE400000000000000;
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000F86C(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[9];

  v2 = *v1;
  Hasher.init(_seed:)(v8, a1);
  v3 = 0xE800000000000000;
  v4 = 0x6D75727463657053;
  if (v2 != 1)
  {
    v4 = 0x73726564696C53;
    v3 = 0xE700000000000000;
  }
  if (v2)
    v5 = v4;
  else
    v5 = 1684632135;
  if (v2)
    v6 = v3;
  else
    v6 = 0xE400000000000000;
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

unint64_t sub_10000F900@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001499C(*a1);
  *a2 = result;
  return result;
}

void sub_10000F92C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xE800000000000000;
  v5 = 0x6D75727463657053;
  if (v2 != 1)
  {
    v5 = 0x73726564696C53;
    v4 = 0xE700000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1684632135;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

void sub_10000F984(_QWORD *a1@<X8>)
{
  *a1 = &off_100059AE8;
}

unint64_t sub_10000F998()
{
  unint64_t result;

  result = qword_1000659A0;
  if (!qword_1000659A0)
  {
    result = swift_getWitnessTable(&unk_10004421C, &type metadata for Tab);
    atomic_store(result, (unint64_t *)&qword_1000659A0);
  }
  return result;
}

uint64_t sub_10000F9DC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100051288, 1);
}

uint64_t sub_10000F9EC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
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
  char v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  char v29;
  id v30;
  id v31;
  double v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;

  v4 = sub_1000060E4(&qword_1000659A8);
  __chkstk_darwin(v4);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_1000060E4(&qword_1000659B0);
  __chkstk_darwin(v58);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_1000060E4(&qword_1000659B8);
  __chkstk_darwin(v59);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000060E4(&qword_1000659C0);
  __chkstk_darwin(v11);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000060E4(&qword_1000659C8);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = static HorizontalAlignment.center.getter(v15);
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 0;
  v18 = sub_1000060E4(&qword_1000659D0);
  sub_10000FED8(a1, (double *)&v6[*(int *)(v18 + 44)]);
  swift_retain(a1);
  v19 = sub_1000217AC();
  v20 = swift_release(a1);
  v60 = v14;
  if ((v19 & 1) == 0)
  {
    v29 = static Edge.Set.all.getter(v20);
    goto LABEL_9;
  }
  v57 = a2;
  v21 = static Edge.Set.leading.getter(v20);
  v22 = static Edge.Set.bottom.getter();
  v23 = v22;
  v24 = static Edge.Set.trailing.getter(v22);
  v25 = Edge.Set.init(rawValue:)(0);
  v26 = Edge.Set.init(rawValue:)(v25);
  if (Edge.Set.init(rawValue:)(v26 & v21) != v21)
    v25 = Edge.Set.init(rawValue:)(v25 | v21);
  v27 = Edge.Set.init(rawValue:)(v25);
  if (Edge.Set.init(rawValue:)(v27 & v23) != v23)
    v25 = Edge.Set.init(rawValue:)(v25 | v23);
  a2 = v57;
  v28 = Edge.Set.init(rawValue:)(v25);
  if (Edge.Set.init(rawValue:)(v28 & v24) != v24)
  {
    v29 = Edge.Set.init(rawValue:)(v25 | v24);
LABEL_9:
    LOBYTE(v25) = v29;
  }
  v30 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  v32 = 24.0;
  if (v31 != (id)6)
  {
    KeyPath = swift_getKeyPath(&unk_100044298);
    v34 = swift_getKeyPath(&unk_1000442C0);
    v35 = swift_retain(a1);
    static Published.subscript.getter(&v62, v35, KeyPath, v34);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v34);
    v32 = 16.0;
    if ((_BYTE)v62)
      v32 = 20.0;
  }
  v36 = EdgeInsets.init(_all:)(v32);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  sub_100009C1C((uint64_t)v6, (uint64_t)v8, &qword_1000659A8);
  v43 = &v8[*(int *)(v58 + 36)];
  *v43 = v25;
  *((double *)v43 + 1) = v36;
  *((_QWORD *)v43 + 2) = v38;
  *((_QWORD *)v43 + 3) = v40;
  *((_QWORD *)v43 + 4) = v42;
  v43[40] = 0;
  sub_100009CF0((uint64_t)v6, &qword_1000659A8);
  v44 = type metadata accessor for ColorPickerState(0);
  v45 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  swift_retain(a1);
  v46 = static ObservableObject.environmentStore.getter(v44, v45);
  sub_100009C1C((uint64_t)v8, (uint64_t)v10, &qword_1000659B0);
  v47 = (uint64_t *)&v10[*(int *)(v59 + 36)];
  *v47 = v46;
  v47[1] = a1;
  sub_100009CF0((uint64_t)v8, &qword_1000659B0);
  v48 = swift_getKeyPath(&unk_1000442E0);
  v49 = swift_getKeyPath(&unk_100044308);
  v50 = swift_retain(a1);
  static Published.subscript.getter(&v61, v50, v48, v49);
  swift_release(a1);
  swift_release(v48);
  v51 = swift_release(v49);
  v52 = v61;
  v53 = static Alignment.center.getter(v51);
  sub_10000F2B0(0.0, 1, v52, 0, 0.0, 1, 0.0, 1, (uint64_t)v13, 0.0, 1, 0.0, 1, v53, v54);
  v55 = sub_100009CF0((uint64_t)v10, &qword_1000659B8);
  LOBYTE(v52) = static Edge.Set.all.getter(v55);
  sub_100009C1C((uint64_t)v13, (uint64_t)v17, &qword_1000659C0);
  v17[*(int *)(v60 + 36)] = LOBYTE(v52);
  sub_100009CF0((uint64_t)v13, &qword_1000659C0);
  return sub_100009A88((uint64_t)v17, a2, &qword_1000659C8);
}

uint64_t sub_10000FED8@<X0>(uint64_t a1@<X1>, double *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
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
  unsigned __int8 v25;
  id v26;
  id v27;
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
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  double *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  double v52;
  double *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v53 = a2;
  v3 = type metadata accessor for ColorPickerContent(0);
  v4 = __chkstk_darwin(v3);
  v54 = (uint64_t *)((char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  v7 = (char *)&v48 - v6;
  swift_retain(a1);
  v8 = sub_1000217AC();
  swift_release(a1);
  if ((v8 & 1) != 0)
  {
    v9 = type metadata accessor for ColorPickerState(0);
    v10 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    v11 = EnvironmentObject.init()(v9, v10);
    v55 = v12;
    v56 = v11;
  }
  else
  {
    v55 = 0;
    v56 = 1;
  }
  KeyPath = swift_getKeyPath(&unk_100044328);
  v14 = swift_getKeyPath(&unk_100044350);
  v15 = swift_retain(a1);
  static Published.subscript.getter((uint64_t *)((char *)&v57 + 1), v15, KeyPath, v14);
  swift_release(a1);
  swift_release(KeyPath);
  swift_release(v14);
  if ((v57 & 0x100) != 0)
  {
    v16 = 0;
    v17 = 0;
    v52 = 0.0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 1;
  }
  else
  {
    v22 = type metadata accessor for ColorPickerState(0);
    v23 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    v49 = EnvironmentObject.init()(v22, v23);
    v51 = v24;
    v25 = static Edge.Set.bottom.getter();
    v26 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    v28 = 24.0;
    if (v27 != (id)6)
    {
      v29 = swift_getKeyPath(&unk_100044298);
      v30 = swift_getKeyPath(&unk_1000442C0);
      v31 = swift_retain(a1);
      static Published.subscript.getter(&v57, v31, v29, v30);
      swift_release(a1);
      swift_release(v29);
      swift_release(v30);
      v28 = 16.0;
      if ((_BYTE)v57)
        v28 = 20.0;
    }
    v52 = EdgeInsets.init(_all:)(v28);
    v18 = v32;
    v19 = v33;
    v20 = v34;
    v17 = v25;
    v16 = v51;
    v21 = v49;
  }
  v35 = type metadata accessor for ColorPickerState(0);
  v36 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v37 = EnvironmentObject.init()(v35, v36);
  v38 = (uint64_t)v54;
  *v54 = v37;
  *(_QWORD *)(v38 + 8) = v39;
  v40 = (_QWORD *)(v38 + *(int *)(v3 + 20));
  *v40 = swift_getKeyPath(&unk_100044370);
  v41 = sub_1000060E4(&qword_100065570);
  swift_storeEnumTagMultiPayload(v40, v41, 0);
  v50 = v7;
  sub_1000151B0(v38, (uint64_t)v7, type metadata accessor for ColorPickerContent);
  sub_100009E80((uint64_t)v7, v38, type metadata accessor for ColorPickerContent);
  v43 = v52;
  v42 = v53;
  v44 = v55;
  *(_QWORD *)v53 = v56;
  *((_QWORD *)v42 + 1) = v44;
  *((_QWORD *)v42 + 2) = v21;
  *((_QWORD *)v42 + 3) = v16;
  v51 = v17;
  *((_QWORD *)v42 + 4) = v17;
  v42[5] = v43;
  *((_QWORD *)v42 + 6) = v18;
  *((_QWORD *)v42 + 7) = v19;
  *((_QWORD *)v42 + 8) = v20;
  *((_BYTE *)v42 + 72) = 0;
  v45 = sub_1000060E4(&qword_1000659D8);
  sub_100009E80(v38, (uint64_t)v42 + *(int *)(v45 + 64), type metadata accessor for ColorPickerContent);
  v46 = (char *)v42 + *(int *)(v45 + 80);
  *(_QWORD *)v46 = 0;
  v46[8] = 0;
  sub_100014538(v56);
  sub_100014538(v21);
  sub_100009EC4((uint64_t)v50, type metadata accessor for ColorPickerContent);
  sub_100009EC4(v38, type metadata accessor for ColorPickerContent);
  sub_100014548(v21);
  return sub_100014548(v56);
}

uint64_t sub_1000102E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000F9EC(*(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_1000102EC(uint64_t a1, uint64_t a2)
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
  uint64_t KeyPath;
  unint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD v40[2];
  char v41;
  _QWORD v42[2];
  char v43;

  v4 = type metadata accessor for SegmentedPickerStyle(0);
  v35 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4(&qword_100065BF8);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ColorPickerState(0);
  v12 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v13 = EnvironmentObject.projectedValue.getter(a1, a2, v11, v12);
  KeyPath = swift_getKeyPath(&unk_1000444E8);
  EnvironmentObject.Wrapper.subscript.getter(v42, KeyPath, v13, v12);
  swift_release(KeyPath);
  swift_release(v13);
  v40[0] = v42[0];
  v40[1] = v42[1];
  v41 = v43;
  v15 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v15);
  v17 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v18 = String._bridgeToObjectiveC()();
  v19 = String._bridgeToObjectiveC()();
  v20 = objc_msgSend(v17, "localizedStringForKey:value:table:", v18, 0, v19);

  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v23 = v22;

  v36 = v21;
  v37 = v23;
  v24 = sub_10000CC44();
  v36 = Text.init<A>(_:)(&v36, &type metadata for String, v24);
  v37 = v25;
  v38 = v26 & 1;
  v39 = v27;
  v28 = sub_1000060E4(&qword_100065C00);
  v29 = sub_100015320();
  v30 = sub_100015364();
  v31 = Picker.init(selection:label:content:)(v40, &v36, sub_1000105EC, 0, &type metadata for Text, &type metadata for Tab, v28, &protocol witness table for Text, v29, v30);
  SegmentedPickerStyle.init()(v31);
  v32 = sub_100009FA0(&qword_100065C18, &qword_100065BF8, (uint64_t)&protocol conformance descriptor for Picker<A, B, C>);
  View.pickerStyle<A>(_:)(v6, v7, v4, v32, &protocol witness table for SegmentedPickerStyle);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000105EC()
{
  uint64_t KeyPath;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _UNKNOWN **v5;

  v5 = &off_100059B10;
  KeyPath = swift_getKeyPath(&unk_100044538);
  v1 = sub_1000060E4(&qword_100065998);
  v2 = sub_100009FA0(&qword_100065C20, &qword_100065998, (uint64_t)&protocol conformance descriptor for [A]);
  v3 = sub_100015320();
  return ((uint64_t (*)(_UNKNOWN ***, uint64_t, uint64_t (*)@<X0>(char *@<X0>, uint64_t@<X8>), _QWORD, uint64_t, void *, uint64_t, unint64_t, void *))ForEach<>.init(_:id:content:))(&v5, KeyPath, sub_1000106A4, 0, v1, &type metadata for Text, v2, v3, &protocol witness table for Text);
}

uint64_t sub_1000106A4@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[0] = sub_10000F61C(*a1);
  v9[1] = v3;
  v4 = sub_10000CC44();
  result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_1000106FC()
{
  uint64_t *v0;

  return sub_1000102EC(*v0, v0[1]);
}

uint64_t sub_100010704@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a1;
  v2 = sub_1000060E4(&qword_100065AA8);
  __chkstk_darwin(v2);
  v4 = (uint64_t *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_1000060E4(&qword_100065AB0);
  __chkstk_darwin(v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100065AB8);
  __chkstk_darwin(v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  if (*v1)
  {
    KeyPath = swift_getKeyPath(&unk_100044328);
    v13 = swift_getKeyPath(&unk_100044350);
    v14 = swift_retain(v11);
    static Published.subscript.getter(&v26, v14, KeyPath, v13);
    swift_release(v11);
    swift_release(KeyPath);
    swift_release(v13);
    if ((v26 & 1) != 0)
    {
      sub_100010974((uint64_t)v10);
      v15 = &qword_100065AB8;
      sub_100009C1C((uint64_t)v10, (uint64_t)v7, &qword_100065AB8);
      swift_storeEnumTagMultiPayload(v7, v5, 0);
      v16 = sub_100014D04();
      v17 = sub_100014E50();
      _ConditionalContent<>.init(storage:)(v7, v8, v2, v16, v17);
      v18 = (uint64_t)v10;
    }
    else
    {
      *v4 = sub_100010C58();
      sub_100010DFC(v1, (uint64_t)v4 + *(int *)(v2 + 44));
      v15 = &qword_100065AA8;
      sub_100009C1C((uint64_t)v4, (uint64_t)v7, &qword_100065AA8);
      swift_storeEnumTagMultiPayload(v7, v5, 1);
      v19 = sub_100014D04();
      v20 = sub_100014E50();
      _ConditionalContent<>.init(storage:)(v7, v8, v2, v19, v20);
      v18 = (uint64_t)v4;
    }
    return sub_100009CF0(v18, v15);
  }
  else
  {
    v22 = v1[1];
    v23 = type metadata accessor for ColorPickerState(0);
    v24 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v22, v23, v24);
    __break(1u);
  }
  return result;
}

uint64_t sub_100010974@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
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
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;

  v32 = a1;
  v1 = type metadata accessor for LayoutDirection(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for ColorSwatchPickerView(0);
  v6 = __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  v10 = (char *)&v31 - v9;
  v31 = sub_1000060E4(&qword_100065AD0);
  __chkstk_darwin(v31);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v8 = swift_getKeyPath(&unk_100044488);
  v13 = sub_1000060E4(&qword_100065B20);
  swift_storeEnumTagMultiPayload(v8, v13, 0);
  v14 = (_QWORD *)((char *)v8 + v5[5]);
  v15 = type metadata accessor for ColorPickerState(0);
  v16 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  *v14 = EnvironmentObject.init()(v15, v16);
  v14[1] = v17;
  v18 = v5[6];
  if (qword_100065068 != -1)
    swift_once(&qword_100065068, sub_10001BD88);
  v19 = qword_10006B698;
  *(_QWORD *)((char *)v8 + v18) = qword_10006B698;
  v20 = v5[7];
  v21 = qword_100065070;
  swift_bridgeObjectRetain(v19);
  if (v21 != -1)
    swift_once(&qword_100065070, sub_10001CB94);
  v22 = qword_100065FF0;
  *(_QWORD *)((char *)v8 + v20) = qword_100065FF0;
  sub_1000151B0((uint64_t)v8, (uint64_t)v10, type metadata accessor for ColorSwatchPickerView);
  swift_bridgeObjectRetain(v22);
  sub_100012054();
  v24 = v23;
  sub_100009E80((uint64_t)v10, (uint64_t)v12, type metadata accessor for ColorSwatchPickerView);
  *(_QWORD *)&v12[*(int *)(v31 + 36)] = v24;
  sub_100009EC4((uint64_t)v10, type metadata accessor for ColorSwatchPickerView);
  KeyPath = swift_getKeyPath(&unk_1000444B8);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for LayoutDirection.leftToRight(_:), v1);
  v26 = sub_1000060E4(&qword_100065AB8);
  v27 = v32;
  v28 = (uint64_t *)(v32 + *(int *)(v26 + 36));
  v29 = sub_1000060E4(&qword_100065AF0);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v28 + *(int *)(v29 + 28), v4, v1);
  *v28 = KeyPath;
  sub_100009C1C((uint64_t)v12, v27, &qword_100065AD0);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_100009CF0((uint64_t)v12, &qword_100065AD0);
}

uint64_t sub_100010C58()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v1 = *v0;
  if (*v0)
  {
    KeyPath = swift_getKeyPath(&unk_100044298);
    v3 = swift_getKeyPath(&unk_1000442C0);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v20, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    v5 = swift_release(v3);
    if ((v20 & 1) != 0)
    {
      v6 = static VerticalAlignment.top.getter(v5);
      v7 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v8 = objc_msgSend(v7, "userInterfaceIdiom");

      v9 = 0x4032000000000000;
      if (v8 == (id)6)
        v9 = 0x4030000000000000;
      v20 = v6;
      v21 = v9;
      v22 = 0;
      v10 = sub_100009868();
      v11 = &type metadata for HStackLayout;
    }
    else
    {
      v12 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if (v13 == (id)6)
        v15 = 0x4030000000000000;
      else
        v15 = 0x4032000000000000;
      v20 = static HorizontalAlignment.center.getter(v14);
      v21 = v15;
      v22 = 0;
      v10 = sub_1000098AC();
      v11 = &type metadata for VStackLayout;
    }
    return AnyLayout.init<A>(_:)(&v20, v11, v10);
  }
  else
  {
    v17 = v0[1];
    v18 = type metadata accessor for ColorPickerState(0);
    v19 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v17, v18, v19);
    __break(1u);
  }
  return result;
}

uint64_t sub_100010DFC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v4 = sub_1000060E4(&qword_100065B28);
  __chkstk_darwin(v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4(&qword_100065B30);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v20 - v11;
  sub_100010FE0(a1, (uint64_t)v6);
  sub_100009C1C((uint64_t)v6, (uint64_t)v10, &qword_100065B28);
  *(_WORD *)&v10[*(int *)(v7 + 36)] = 256;
  sub_100009CF0((uint64_t)v6, &qword_100065B28);
  sub_100009A88((uint64_t)v10, (uint64_t)v12, &qword_100065B30);
  v13 = type metadata accessor for ColorPickerState(0);
  v14 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v15 = EnvironmentObject.init()(v13, v14);
  v17 = v16;
  sub_100009C1C((uint64_t)v12, (uint64_t)v10, &qword_100065B30);
  sub_100009C1C((uint64_t)v10, a2, &qword_100065B30);
  v18 = a2 + *(int *)(sub_1000060E4(&qword_100065B38) + 48);
  *(_QWORD *)v18 = v15;
  *(_QWORD *)(v18 + 8) = v17;
  *(_QWORD *)(v18 + 16) = sub_1000128B0;
  *(_QWORD *)(v18 + 24) = 0;
  *(_BYTE *)(v18 + 32) = 0;
  swift_retain(v15);
  sub_100014F74((uint64_t)sub_1000128B0, 0);
  sub_100009CF0((uint64_t)v12, &qword_100065B30);
  swift_release(v15);
  sub_100014F7C((uint64_t)sub_1000128B0, 0);
  return sub_100009CF0((uint64_t)v10, &qword_100065B30);
}

uint64_t sub_100010FE0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t KeyPath;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t result;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  _OWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v92 = a2;
  v91 = sub_1000060E4(&qword_100065B40);
  __chkstk_darwin(v91);
  v4 = (uint64_t *)((char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_1000060E4(&qword_100065B48);
  __chkstk_darwin(v5);
  v7 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = type metadata accessor for RGBAView(0);
  v8 = __chkstk_darwin(v90);
  v78 = (uint64_t *)((char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v80 = (uint64_t)&v76 - v10;
  v84 = sub_1000060E4(&qword_100065B50);
  __chkstk_darwin(v84);
  v79 = (_OWORD *)((char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v86 = sub_1000060E4(&qword_100065B58);
  __chkstk_darwin(v86);
  v88 = (uint64_t)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_1000060E4(&qword_100065B60);
  __chkstk_darwin(v82);
  v83 = (uint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_1000060E4(&qword_100065B68);
  __chkstk_darwin(v87);
  v85 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_1000060E4(&qword_100065AB8);
  __chkstk_darwin(v81);
  v77 = (uint64_t)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000060E4(&qword_100065B70);
  __chkstk_darwin(v16);
  v89 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DynamicTypeSize(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ColorPickerContent(0);
  v22 = sub_100013ED8(&qword_100065570, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize, (char *)0x5463696D616E7944, (char *)0xEF657A6953657079, (uint64_t)v21);
  v23 = DynamicTypeSize.isAccessibilitySize.getter(v22);
  v24 = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if ((v23 & 1) == 0)
  {
    *v4 = static Alignment.top.getter(v24);
    v4[1] = v42;
    v43 = sub_1000060E4(&qword_100065B78);
    sub_100011B6C((uint64_t)v4 + *(int *)(v43 + 44));
    sub_100009C1C((uint64_t)v4, (uint64_t)v7, &qword_100065B40);
    swift_storeEnumTagMultiPayload(v7, v5, 1);
    v44 = sub_100014F84();
    v45 = sub_100009FA0(&qword_100065BB8, &qword_100065B40, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    _ConditionalContent<>.init(storage:)(v7, v16, v91, v44, v45);
    v46 = (uint64_t)v4;
    v47 = &qword_100065B40;
    return sub_100009CF0(v46, v47);
  }
  v76 = v5;
  v25 = v91;
  v26 = *a1;
  if (*a1)
  {
    v27 = v16;
    v28 = v7;
    KeyPath = swift_getKeyPath(&unk_1000444E8);
    v30 = swift_getKeyPath(&unk_100044510);
    v31 = swift_retain(v26);
    static Published.subscript.getter(&v93, v31, KeyPath, v30);
    swift_release(v26);
    swift_release(KeyPath);
    swift_release(v30);
    if ((_BYTE)v93)
    {
      v32 = (uint64_t)v7;
      if (v93 == 1)
      {
        v33 = v79;
        sub_1000117D8(v79);
        v34 = v83;
        sub_100009C1C((uint64_t)v33, v83, &qword_100065B50);
        swift_storeEnumTagMultiPayload(v34, v82, 1);
        v35 = sub_100014D04();
        v36 = sub_100015074();
        v37 = (uint64_t)v85;
        _ConditionalContent<>.init(storage:)(v34, v81, v84, v35, v36);
        v38 = v88;
        sub_100009C1C(v37, v88, &qword_100065B68);
        swift_storeEnumTagMultiPayload(v38, v86, 0);
        v39 = sub_100015008();
        v40 = sub_100006848(&qword_100065BB0, type metadata accessor for RGBAView, (uint64_t)&unk_100043968);
        v41 = (uint64_t)v89;
        _ConditionalContent<>.init(storage:)(v38, v87, v90, v39, v40);
        sub_100009CF0(v37, &qword_100065B68);
        sub_100009CF0((uint64_t)v33, &qword_100065B50);
      }
      else
      {
        v57 = type metadata accessor for ColorPickerState(0);
        v58 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
        v59 = EnvironmentObject.init()(v57, v58);
        v60 = (uint64_t)v78;
        *v78 = v59;
        *(_QWORD *)(v60 + 8) = v61;
        v62 = v90;
        v63 = (_QWORD *)(v60 + *(int *)(v90 + 20));
        *v63 = swift_getKeyPath(&unk_100044370);
        v64 = sub_1000060E4(&qword_100065570);
        swift_storeEnumTagMultiPayload(v63, v64, 0);
        v65 = v80;
        sub_1000151B0(v60, v80, type metadata accessor for RGBAView);
        v66 = v88;
        sub_100009E80(v65, v88, type metadata accessor for RGBAView);
        swift_storeEnumTagMultiPayload(v66, v86, 1);
        v67 = sub_100015008();
        v68 = sub_100006848(&qword_100065BB0, type metadata accessor for RGBAView, (uint64_t)&unk_100043968);
        v41 = (uint64_t)v89;
        _ConditionalContent<>.init(storage:)(v66, v87, v62, v67, v68);
        sub_100009EC4(v65, type metadata accessor for RGBAView);
      }
      v56 = v25;
    }
    else
    {
      v48 = v77;
      sub_100010974(v77);
      v49 = v83;
      sub_100009C1C(v48, v83, &qword_100065AB8);
      swift_storeEnumTagMultiPayload(v49, v82, 0);
      v50 = sub_100014D04();
      v51 = sub_100015074();
      v52 = (uint64_t)v85;
      _ConditionalContent<>.init(storage:)(v49, v81, v84, v50, v51);
      v53 = v88;
      sub_100009C1C(v52, v88, &qword_100065B68);
      swift_storeEnumTagMultiPayload(v53, v86, 0);
      v54 = sub_100015008();
      v55 = sub_100006848(&qword_100065BB0, type metadata accessor for RGBAView, (uint64_t)&unk_100043968);
      v41 = (uint64_t)v89;
      _ConditionalContent<>.init(storage:)(v53, v87, v90, v54, v55);
      sub_100009CF0(v52, &qword_100065B68);
      sub_100009CF0(v48, &qword_100065AB8);
      v56 = v25;
      v32 = (uint64_t)v28;
    }
    v69 = v76;
    sub_100009C1C(v41, v32, &qword_100065B70);
    swift_storeEnumTagMultiPayload(v32, v69, 0);
    v70 = sub_100014F84();
    v71 = sub_100009FA0(&qword_100065BB8, &qword_100065B40, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    _ConditionalContent<>.init(storage:)(v32, v27, v56, v70, v71);
    v46 = v41;
    v47 = &qword_100065B70;
    return sub_100009CF0(v46, v47);
  }
  v73 = a1[1];
  v74 = type metadata accessor for ColorPickerState(0);
  v75 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v73, v74, v75);
  __break(1u);
  return result;
}

_QWORD *sub_1000117D8@<X0>(_OWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD *result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[12];
  int v38;
  __int128 v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v42 = sub_1000060E4(&qword_100065AF0);
  __chkstk_darwin(v42);
  v4 = (uint64_t *)&v37[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for LayoutDirection(0);
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  __chkstk_darwin(v5);
  v43 = &v37[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v41 = v1;
  v7 = *v1;
  if (*v1)
  {
    v8 = (_QWORD *)swift_allocObject(&unk_10005AB38, 40, 7);
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v7;
    v9 = (_QWORD *)swift_allocObject(&unk_10005AB60, 40, 7);
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v7;
    swift_retain_n(v7, 2);
    Binding.init(get:set:)(&v56, sub_10000993C, v8, sub_10000994C, v9, &type metadata for SomeColor);
    v40 = *((_QWORD *)&v56 + 1);
    v10 = v56;
    v39 = v57;
    v11 = v58;
    v38 = v59;
    v12 = type metadata accessor for ColorPickerState(0);
    v13 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    v14 = EnvironmentObject.init()(v12, v13);
    v16 = v15;
    v46 = 0uLL;
    LOBYTE(v47) = 1;
    v17 = sub_1000060E4(&qword_100065BC0);
    State.init(wrappedValue:)(&v56, &v46, v17);
    v18 = v56;
    v19 = v57;
    v20 = *((_QWORD *)&v57 + 1);
    v46 = 0u;
    v47 = 0u;
    LOBYTE(v48) = 2;
    v21 = sub_1000060E4(&qword_100065BC8);
    State.init(wrappedValue:)(&v56, &v46, v21);
    v46 = v18;
    LOBYTE(v47) = v19;
    *((_QWORD *)&v47 + 1) = v20;
    v48 = v56;
    v49 = v57;
    LOBYTE(v50) = v58;
    *((_QWORD *)&v50 + 1) = *((_QWORD *)&v58 + 1);
    *(_QWORD *)&v51 = v10;
    *((_QWORD *)&v51 + 1) = v40;
    v52 = v39;
    v53 = v11;
    LOBYTE(v54) = v38;
    *((_QWORD *)&v54 + 1) = v14;
    v55 = v16;
    sub_100012054();
    v62 = v52;
    v63 = v53;
    v64 = v54;
    *(_QWORD *)&v65 = v55;
    v58 = v48;
    v59 = v49;
    v60 = v50;
    v61 = v51;
    v56 = v46;
    v57 = v47;
    *((_QWORD *)&v65 + 1) = v22;
    KeyPath = swift_getKeyPath(&unk_1000444B8);
    v25 = v43;
    v24 = v44;
    v26 = v45;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v44 + 104))(v43, enum case for LayoutDirection.leftToRight(_:), v45);
    (*(void (**)(char *, _BYTE *, uint64_t))(v24 + 16))((char *)v4 + *(int *)(v42 + 28), v25, v26);
    *v4 = KeyPath;
    v27 = sub_1000060E4(&qword_100065B50);
    sub_100009C1C((uint64_t)v4, (uint64_t)a1 + *(int *)(v27 + 36), &qword_100065AF0);
    v28 = v63;
    a1[6] = v62;
    a1[7] = v28;
    v29 = v65;
    a1[8] = v64;
    a1[9] = v29;
    v30 = v59;
    a1[2] = v58;
    a1[3] = v30;
    v31 = v61;
    a1[4] = v60;
    a1[5] = v31;
    v32 = v57;
    *a1 = v56;
    a1[1] = v32;
    sub_1000151FC(&v56);
    sub_100009CF0((uint64_t)v4, &qword_100065AF0);
    (*(void (**)(_BYTE *, uint64_t))(v24 + 8))(v25, v26);
    return sub_100015260(&v46);
  }
  else
  {
    v34 = v41[1];
    v35 = type metadata accessor for ColorPickerState(0);
    v36 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = (_QWORD *)EnvironmentObject.error()(0, v34, v35, v36);
    __break(1u);
  }
  return result;
}

uint64_t sub_100011B6C@<X0>(uint64_t a1@<X8>)
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
  char *v26;
  _OWORD *v27;
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
  _QWORD *v38;
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
  _OWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v62 = a1;
  v57 = type metadata accessor for RGBAView(0);
  v1 = __chkstk_darwin(v57);
  v56 = (uint64_t *)((char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v1);
  v59 = (uint64_t)&v51 - v3;
  v61 = sub_1000060E4(&qword_100065BD0);
  v4 = __chkstk_darwin(v61);
  v58 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v60 = (uint64_t)&v51 - v6;
  v7 = sub_1000060E4(&qword_100065B50);
  __chkstk_darwin(v7);
  v51 = (_OWORD *)((char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v55 = sub_1000060E4(&qword_100065BD8);
  v9 = __chkstk_darwin(v55);
  v53 = (uint64_t)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v54 = (uint64_t)&v51 - v11;
  v12 = sub_1000060E4(&qword_100065AB8);
  __chkstk_darwin(v12);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000060E4(&qword_100065BE0);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v51 - v19;
  v52 = (uint64_t)&v51 - v19;
  sub_100010974((uint64_t)v14);
  v21 = type metadata accessor for ColorPickerState(0);
  v22 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v23 = EnvironmentObject.init()(v21, v22);
  v25 = v24;
  sub_100009C1C((uint64_t)v14, (uint64_t)v18, &qword_100065AB8);
  v26 = &v18[*(int *)(v15 + 36)];
  *(_QWORD *)v26 = v23;
  *((_QWORD *)v26 + 1) = v25;
  v26[16] = 0;
  sub_100009CF0((uint64_t)v14, &qword_100065AB8);
  sub_100009A88((uint64_t)v18, (uint64_t)v20, &qword_100065BE0);
  v27 = v51;
  sub_1000117D8(v51);
  v28 = EnvironmentObject.init()(v21, v22);
  v30 = v29;
  v31 = v53;
  sub_100009C1C((uint64_t)v27, v53, &qword_100065B50);
  v32 = v31 + *(int *)(v55 + 36);
  *(_QWORD *)v32 = v28;
  *(_QWORD *)(v32 + 8) = v30;
  *(_BYTE *)(v32 + 16) = 1;
  sub_100009CF0((uint64_t)v27, &qword_100065B50);
  v33 = v54;
  sub_100009A88(v31, v54, &qword_100065BD8);
  v34 = EnvironmentObject.init()(v21, v22);
  v36 = (uint64_t)v56;
  v35 = v57;
  *v56 = v34;
  *(_QWORD *)(v36 + 8) = v37;
  v38 = (_QWORD *)(v36 + *(int *)(v35 + 20));
  *v38 = swift_getKeyPath(&unk_100044370);
  v39 = sub_1000060E4(&qword_100065570);
  swift_storeEnumTagMultiPayload(v38, v39, 0);
  v40 = v59;
  sub_1000151B0(v36, v59, type metadata accessor for RGBAView);
  v41 = EnvironmentObject.init()(v21, v22);
  v43 = v42;
  v44 = v58;
  sub_100009E80(v40, v58, type metadata accessor for RGBAView);
  v45 = v44 + *(int *)(v61 + 36);
  *(_QWORD *)v45 = v41;
  *(_QWORD *)(v45 + 8) = v43;
  *(_BYTE *)(v45 + 16) = 2;
  sub_100009EC4(v40, type metadata accessor for RGBAView);
  v46 = v60;
  sub_100009A88(v44, v60, &qword_100065BD0);
  v47 = v52;
  sub_100009C1C(v52, (uint64_t)v18, &qword_100065BE0);
  sub_100009C1C(v33, v31, &qword_100065BD8);
  sub_100009C1C(v46, v44, &qword_100065BD0);
  v48 = v62;
  sub_100009C1C((uint64_t)v18, v62, &qword_100065BE0);
  v49 = sub_1000060E4(&qword_100065BE8);
  sub_100009C1C(v31, v48 + *(int *)(v49 + 48), &qword_100065BD8);
  sub_100009C1C(v44, v48 + *(int *)(v49 + 64), &qword_100065BD0);
  sub_100009CF0(v46, &qword_100065BD0);
  sub_100009CF0(v33, &qword_100065BD8);
  sub_100009CF0(v47, &qword_100065BE0);
  sub_100009CF0(v44, &qword_100065BD0);
  sub_100009CF0(v31, &qword_100065BD8);
  return sub_100009CF0((uint64_t)v18, &qword_100065BE0);
}

uint64_t sub_100012054()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = type metadata accessor for ColorPickerContent(0);
  __chkstk_darwin(v1);
  v3 = (uint64_t *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = *v0;
  if (*v0)
  {
    KeyPath = swift_getKeyPath(&unk_100044328);
    v6 = swift_getKeyPath(&unk_100044350);
    v7 = swift_retain(v4);
    static Published.subscript.getter((uint64_t *)((char *)&v18 + 1), v7, KeyPath, v6);
    swift_release(v4);
    swift_release(KeyPath);
    swift_release(v6);
    v8 = BYTE1(v18);
    sub_100009E80((uint64_t)v0, (uint64_t)v3, type metadata accessor for ColorPickerContent);
    if ((v8 & 1) == 0)
      return sub_100009EC4((uint64_t)v3, type metadata accessor for ColorPickerContent);
    v9 = *v3;
    if (*v3)
    {
      v10 = swift_getKeyPath(&unk_100044298);
      v11 = swift_getKeyPath(&unk_1000442C0);
      v12 = swift_retain(v9);
      static Published.subscript.getter(&v18, v12, v10, v11);
      swift_release(v9);
      swift_release(v10);
      swift_release(v11);
      return sub_100009EC4((uint64_t)v3, type metadata accessor for ColorPickerContent);
    }
    v14 = v3[1];
  }
  else
  {
    v14 = v0[1];
  }
  v15 = type metadata accessor for ColorPickerState(0);
  v16 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v14, v15, v16);
  __break(1u);
  return result;
}

uint64_t sub_10001220C()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_10001222C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001417C(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_100012240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  double v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[12];
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v42 = a4;
  v44 = a1;
  v45 = a5;
  v43 = sub_1000060E4(&qword_100065D38);
  __chkstk_darwin(v43);
  v8 = &v41[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1000060E4(&qword_100065D40);
  __chkstk_darwin(v9);
  v11 = &v41[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_1000060E4(&qword_100065D48);
  __chkstk_darwin(v12);
  v14 = &v41[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_1000060E4(&qword_100065D50);
  __chkstk_darwin(v15);
  v17 = &v41[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    v18 = 1684632135;
    KeyPath = swift_getKeyPath(&unk_1000444E8);
    v20 = swift_getKeyPath(&unk_100044510);
    v21 = swift_retain(a2);
    static Published.subscript.getter(&v46, v21, KeyPath, v20);
    swift_release(a2);
    swift_release(KeyPath);
    swift_release(v20);
    v22 = 0xE800000000000000;
    v23 = 0x6D75727463657053;
    if (v46 != 1)
    {
      v23 = 0x73726564696C53;
      v22 = 0xE700000000000000;
    }
    if ((_BYTE)v46)
      v24 = v23;
    else
      v24 = 1684632135;
    if ((_BYTE)v46)
      v25 = v22;
    else
      v25 = 0xE400000000000000;
    if ((_BYTE)v42)
    {
      if (v42 == 1)
      {
        v26 = 0xE800000000000000;
        v18 = 0x6D75727463657053;
        if (v24 != 0x6D75727463657053)
          goto LABEL_19;
      }
      else
      {
        v26 = 0xE700000000000000;
        v18 = 0x73726564696C53;
        if (v24 != 0x73726564696C53)
          goto LABEL_19;
      }
    }
    else
    {
      v26 = 0xE400000000000000;
      if (v24 != 1684632135)
        goto LABEL_19;
    }
    if (v25 == v26)
    {
      swift_bridgeObjectRelease_n(v25, 2);
      v27 = v45;
      goto LABEL_20;
    }
LABEL_19:
    v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, v18, v26, 0);
    swift_bridgeObjectRelease(v25);
    swift_bridgeObjectRelease(v26);
    v27 = v45;
    if ((v28 & 1) == 0)
    {
      v30 = 0;
      v29 = 0.0;
      goto LABEL_22;
    }
LABEL_20:
    v29 = 1.0;
    v30 = 1;
LABEL_22:
    v31 = v44;
    v32 = sub_1000060E4(&qword_100065D58);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v8, v31, v32);
    *(double *)&v8[*(int *)(v43 + 36)] = v29;
    sub_100009C1C((uint64_t)v8, (uint64_t)v11, &qword_100065D38);
    v11[*(int *)(v9 + 36)] = v30;
    sub_100009CF0((uint64_t)v8, &qword_100065D38);
    v33 = v30 ^ 1u;
    v34 = swift_getKeyPath(&unk_100044758);
    v35 = swift_allocObject(&unk_10005AD00, 17, 7);
    *(_BYTE *)(v35 + 16) = v33;
    sub_100009C1C((uint64_t)v11, (uint64_t)v14, &qword_100065D40);
    v36 = (uint64_t *)&v14[*(int *)(v12 + 36)];
    *v36 = v34;
    v36[1] = (uint64_t)sub_100016290;
    v36[2] = v35;
    sub_100009CF0((uint64_t)v11, &qword_100065D40);
    v37 = sub_100016298();
    View.accessibilityHidden(_:)(v33, v12, v37);
    sub_100009CF0((uint64_t)v14, &qword_100065D48);
    return sub_100009A88((uint64_t)v17, v27, &qword_100065D50);
  }
  v39 = type metadata accessor for ColorPickerState(0);
  v40 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, a3, v39, v40);
  __break(1u);
  return result;
}

uint64_t sub_100012634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100012240(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), a2);
}

uint64_t sub_100012640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
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
  id v15;
  id v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  unint64_t v19;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v24[2];

  v24[1] = a2;
  v5 = sub_1000060E4(&qword_100065C38);
  __chkstk_darwin(v5);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100065C40);
  __chkstk_darwin(v8);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000060E4(&qword_100065C48);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  v17 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  if (v16 == (id)6)
  {
    v17(v14, a1, v11);
    v17(v10, (uint64_t)v14, v11);
    swift_storeEnumTagMultiPayload(v10, v8, 0);
    v18 = sub_100009FA0(&qword_100065C50, &qword_100065C48, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v19 = sub_1000158E8();
    _ConditionalContent<>.init(storage:)(v10, v11, v5, v18, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v17(v7, a1, v11);
    v21 = &v7[*(int *)(v5 + 36)];
    *(double *)v21 = a3;
    *((_WORD *)v21 + 4) = 0;
    sub_100009C1C((uint64_t)v7, (uint64_t)v10, &qword_100065C38);
    swift_storeEnumTagMultiPayload(v10, v8, 1);
    v22 = sub_100009FA0(&qword_100065C50, &qword_100065C48, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v23 = sub_1000158E8();
    _ConditionalContent<>.init(storage:)(v10, v11, v5, v22, v23);
    return sub_100009CF0((uint64_t)v7, &qword_100065C38);
  }
}

uint64_t sub_1000128A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double *v2;

  return sub_100012640(a1, a2, *v2);
}

uint64_t sub_1000128B0()
{
  uint64_t v0;

  v0 = type metadata accessor for FavoriteColorPickerView.Model(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  return sub_100028334();
}

uint64_t sub_1000128E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;

  v59 = a2;
  v3 = sub_1000060E4(&qword_100065C68);
  v4 = __chkstk_darwin(v3);
  v60 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v56 - v6;
  v8 = sub_1000060E4(&qword_100065C70);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v56 - v12;
  v14 = type metadata accessor for ColorSlider(0);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v56 - v18;
  v20 = sub_1000060E4(&qword_100065C78);
  v21 = __chkstk_darwin(v20);
  v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v57 = (uint64_t)&v56 - v24;
  v58 = a1;
  v25 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_100044680);
    v27 = swift_getKeyPath(&unk_1000446A8);
    v28 = swift_retain(v25);
    static Published.subscript.getter(&v61, v28, KeyPath, v27);
    swift_release(v25);
    swift_release(KeyPath);
    swift_release(v27);
    if ((v61 & 1) != 0)
    {
      v29 = type metadata accessor for ColorPickerState(0);
      v30 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
      v31 = EnvironmentObject.init()(v29, v30);
      v33 = v32;
      v34 = swift_getKeyPath(&unk_100044370);
      v35 = (uint64_t *)&v19[*(int *)(v14 + 24)];
      *v35 = v34;
      v36 = sub_1000060E4(&qword_100065570);
      v37 = swift_storeEnumTagMultiPayload(v35, v36, 0);
      *v19 = 3;
      *((_QWORD *)v19 + 1) = v31;
      *((_QWORD *)v19 + 2) = v33;
      v38 = *(int *)(v14 + 28);
      *(double *)&v19[v38] = static Font.Weight.semibold.getter(v37);
      v39 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v40 = objc_msgSend(v39, "userInterfaceIdiom");

      if (v40 == (id)6)
      {
        v41 = type metadata accessor for Divider(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v13, 1, 1, v41);
      }
      else
      {
        Divider.init()();
        v47 = type metadata accessor for Divider(0);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v13, 0, 1, v47);
      }
      v46 = v59;
      v45 = (uint64_t)v60;
      sub_100009E80((uint64_t)v19, (uint64_t)v17, type metadata accessor for ColorSlider);
      sub_100009C1C((uint64_t)v13, (uint64_t)v11, &qword_100065C70);
      sub_100009E80((uint64_t)v17, (uint64_t)v23, type metadata accessor for ColorSlider);
      v48 = sub_1000060E4(&qword_100065C98);
      sub_100009C1C((uint64_t)v11, (uint64_t)&v23[*(int *)(v48 + 48)], &qword_100065C70);
      sub_100009CF0((uint64_t)v13, &qword_100065C70);
      sub_100009EC4((uint64_t)v19, type metadata accessor for ColorSlider);
      sub_100009CF0((uint64_t)v11, &qword_100065C70);
      sub_100009EC4((uint64_t)v17, type metadata accessor for ColorSlider);
      v49 = sub_1000060E4(&qword_100065C80);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v23, 0, 1, v49);
      v43 = v57;
      v44 = sub_100009A88((uint64_t)v23, v57, &qword_100065C78);
    }
    else
    {
      v42 = sub_1000060E4(&qword_100065C80);
      v43 = v57;
      v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v57, 1, 1, v42);
      v46 = v59;
      v45 = (uint64_t)v60;
    }
    *(_QWORD *)v7 = static VerticalAlignment.top.getter(v44);
    *((_QWORD *)v7 + 1) = 0x4030000000000000;
    v7[16] = 0;
    v50 = sub_1000060E4(&qword_100065C88);
    sub_100012E10(v58, &v7[*(int *)(v50 + 44)]);
    sub_100009C1C(v43, (uint64_t)v23, &qword_100065C78);
    sub_100009C1C((uint64_t)v7, v45, &qword_100065C68);
    sub_100009C1C((uint64_t)v23, v46, &qword_100065C78);
    v51 = sub_1000060E4(&qword_100065C90);
    sub_100009C1C(v45, v46 + *(int *)(v51 + 48), &qword_100065C68);
    sub_100009CF0((uint64_t)v7, &qword_100065C68);
    sub_100009CF0(v43, &qword_100065C78);
    sub_100009CF0(v45, &qword_100065C68);
    return sub_100009CF0((uint64_t)v23, &qword_100065C78);
  }
  else
  {
    v53 = v58[1];
    v54 = type metadata accessor for ColorPickerState(0);
    v55 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v53, v54, v55);
    __break(1u);
  }
  return result;
}

uint64_t sub_100012E10@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  _BYTE *v11;
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
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  double v32;
  double v33;
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
  _BYTE *v44;
  uint64_t v45;
  _OWORD *v46;
  __int128 v47;
  unint64_t v48;
  uint64_t ObjCClassFromMetadata;
  id v50;
  NSString v51;
  NSString v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
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
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  double *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  __int128 v85;
  unint64_t v86;
  _BYTE *v87;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v97;
  _BYTE *v98;
  _BYTE *v99;
  uint64_t v100;
  _BYTE *v101;
  _BYTE *v102;
  void (*v103)(_BYTE *, uint64_t);
  _BYTE v105[4];
  int v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  _BYTE *v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t, uint64_t);
  uint64_t v114;
  unsigned int v115;
  id v116;
  _BYTE *v117;
  _BYTE *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  _BYTE *v122;
  __int128 v123;
  double *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _BYTE *v128;
  uint64_t v129;
  _BYTE *v130;
  uint64_t v131;
  _BYTE *v132;
  uint64_t v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  _OWORD v141[3];
  __int128 v142;
  char v143;

  v128 = a2;
  v125 = type metadata accessor for ContentShapeKinds(0);
  v121 = *(_QWORD *)(v125 - 8);
  __chkstk_darwin(v125);
  *(_QWORD *)&v123 = &v105[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v110 = sub_1000060E4(&qword_1000656A8);
  __chkstk_darwin(v110);
  v5 = &v105[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v131 = type metadata accessor for RoundedRectangle(0);
  v6 = __chkstk_darwin(v131);
  v124 = (double *)&v105[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v9 = (double *)&v105[-v8];
  v109 = sub_1000060E4(&qword_100065CA0);
  __chkstk_darwin(v109);
  v11 = &v105[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v112 = sub_1000060E4(&qword_100065CA8);
  __chkstk_darwin(v112);
  v111 = &v105[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1000060E4(&qword_100065CB0);
  __chkstk_darwin(v13);
  v117 = &v105[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v119 = sub_1000060E4(&qword_100065CB8);
  __chkstk_darwin(v119);
  v118 = &v105[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v127 = sub_1000060E4(&qword_100065CC0);
  v126 = *(_QWORD *)(v127 - 8);
  v16 = __chkstk_darwin(v127);
  v132 = &v105[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __chkstk_darwin(v16);
  v122 = &v105[-v19];
  __chkstk_darwin(v18);
  v130 = &v105[-v20];
  v120 = a1;
  v22 = a1[1];
  v129 = *a1;
  v21 = v129;
  v23 = type metadata accessor for ColorPickerState(0);
  v24 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v25 = EnvironmentObject.projectedValue.getter(v21, v22, v23, v24);
  KeyPath = swift_getKeyPath(&unk_1000446C8);
  EnvironmentObject.Wrapper.subscript.getter(&v133, KeyPath, v25, v24);
  swift_release(KeyPath);
  swift_release(v25);
  v27 = v133;
  v28 = v134;
  v108 = v135;
  v29 = v137;
  v107 = v136;
  v106 = v138;
  v116 = (id)objc_opt_self(UIDevice);
  v30 = objc_msgSend(v116, "currentDevice");
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  v32 = 10.0;
  if (v31 == (id)6)
    v33 = 22.0;
  else
    v33 = 10.0;
  v34 = (char *)v9 + *(int *)(v131 + 20);
  v35 = enum case for RoundedCornerStyle.continuous(_:);
  v115 = enum case for RoundedCornerStyle.continuous(_:);
  v114 = type metadata accessor for RoundedCornerStyle(0);
  v113 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v114 - 8) + 104);
  v113(v34, v35, v114);
  *v9 = v33;
  v9[1] = v33;
  sub_100009E80((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  *(_WORD *)&v5[*(int *)(v110 + 36)] = 256;
  sub_100009C1C((uint64_t)v5, (uint64_t)&v11[*(int *)(v109 + 36)], &qword_1000656A8);
  *(_QWORD *)v11 = v27;
  *((_QWORD *)v11 + 1) = v28;
  *((_OWORD *)v11 + 1) = v108;
  *((_QWORD *)v11 + 4) = v107;
  *((_QWORD *)v11 + 5) = v29;
  v11[48] = v106;
  swift_retain(v27);
  swift_retain(v28);
  sub_100009CF0((uint64_t)v5, &qword_1000656A8);
  sub_100009EC4((uint64_t)v9, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  swift_release(v28);
  swift_release(v27);
  v36 = v129;
  sub_10001597C(v129, v22);
  v38 = v37;
  sub_10001597C(v36, v22);
  v40 = v39;
  v42 = static Alignment.center.getter(v41);
  _FrameLayout.init(width:height:alignment:)(v141, v38, 0, v40, 0, v42, v43);
  v44 = v111;
  sub_100009C1C((uint64_t)v11, (uint64_t)v111, &qword_100065CA0);
  v45 = v112;
  v46 = &v44[*(int *)(v112 + 36)];
  v47 = v141[1];
  *v46 = v141[0];
  v46[1] = v47;
  v46[2] = v141[2];
  sub_100009CF0((uint64_t)v11, &qword_100065CA0);
  v48 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v48);
  v50 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v51 = String._bridgeToObjectiveC()();
  v52 = String._bridgeToObjectiveC()();
  v53 = objc_msgSend(v50, "localizedStringForKey:value:table:", v51, 0, v52);

  v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
  v56 = v55;

  v133 = v54;
  v134 = v56;
  v57 = sub_10000CC44();
  v58 = Text.init<A>(_:)(&v133, &type metadata for String, v57);
  v60 = v59;
  v62 = v61;
  v64 = v63 & 1;
  v65 = sub_10000C94C(&qword_100065CC8, &qword_100065CA8, (void (*)(void))sub_100015AF0);
  v66 = (uint64_t)v117;
  View.accessibility(label:)(v58, v60, v64, v62, v45, v65);
  sub_10000CC88(v58, v60, v64);
  swift_bridgeObjectRelease(v62);
  sub_100009CF0((uint64_t)v44, &qword_100065CA8);
  v67 = sub_1000060E4(&qword_100065CE0);
  v68 = v121;
  v69 = swift_allocObject(v67, ((*(unsigned __int8 *)(v121 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80))+ *(_QWORD *)(v121 + 72), *(unsigned __int8 *)(v121 + 80) | 7);
  *(_OWORD *)(v69 + 16) = xmmword_100042F50;
  static ContentShapeKinds.dragPreview.getter();
  v133 = v69;
  v70 = sub_100006848(&qword_100065CE8, (uint64_t (*)(uint64_t))&type metadata accessor for ContentShapeKinds, (uint64_t)&protocol conformance descriptor for ContentShapeKinds);
  v71 = sub_1000060E4(&qword_100065CF0);
  v72 = sub_100009FA0(&qword_100065CF8, &qword_100065CF0, (uint64_t)&protocol conformance descriptor for [A]);
  v73 = v123;
  v74 = v71;
  v75 = v125;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v133, v74, v72, v125, v70);
  v76 = objc_msgSend(v116, "currentDevice");
  v77 = objc_msgSend(v76, "userInterfaceIdiom");

  if (v77 == (id)6)
    v32 = 22.0;
  v78 = v124;
  v113((char *)v124 + *(int *)(v131 + 20), v115, v114);
  *v78 = v32;
  v78[1] = v32;
  v79 = v119;
  v80 = (uint64_t)v118;
  v81 = (uint64_t)&v118[*(int *)(v119 + 36)];
  sub_100009E80((uint64_t)v78, v81, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  v82 = sub_1000060E4(&qword_100065D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16))(v81 + *(int *)(v82 + 40), v73, v75);
  *(_BYTE *)(v81 + *(int *)(v82 + 36)) = 0;
  sub_100009C1C(v66, v80, &qword_100065CB0);
  sub_100009EC4((uint64_t)v78, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v73, v75);
  sub_100009CF0(v66, &qword_100065CB0);
  v83 = v120;
  v142 = *((_OWORD *)v120 + 1);
  v143 = *((_BYTE *)v120 + 32);
  v84 = swift_allocObject(&unk_10005ACB0, 49, 7);
  v85 = *((_OWORD *)v83 + 1);
  *(_OWORD *)(v84 + 16) = *(_OWORD *)v83;
  *(_OWORD *)(v84 + 32) = v85;
  *(_BYTE *)(v84 + 48) = *((_BYTE *)v83 + 32);
  swift_retain(v129);
  sub_100015BC4((uint64_t *)&v142);
  v86 = sub_100015BF4();
  v87 = v122;
  View.onDrag(_:)(sub_100015BBC, v84, v79, v86);
  swift_release(v84);
  sub_100009CF0(v80, &qword_100065CB8);
  v88 = v126;
  v89 = v130;
  v90 = v127;
  v91 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v126 + 32))(v130, v87, v127);
  v131 = static HorizontalAlignment.center.getter(v91);
  sub_100013A48((__int128 *)v83, (uint64_t)&v133);
  v129 = v133;
  v92 = v134;
  v125 = v135;
  LODWORD(v124) = BYTE8(v135);
  v93 = v136;
  LOBYTE(v79) = v137;
  v123 = v138;
  v95 = v139;
  v94 = v140;
  v96 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v88 + 16);
  v97 = v88;
  v98 = v132;
  v99 = v89;
  v100 = v90;
  v96(v132, v99, v90);
  v101 = v128;
  v96(v128, v98, v100);
  v102 = &v101[*(int *)(sub_1000060E4(&qword_100065D20) + 48)];
  *(_QWORD *)v102 = v131;
  *((_QWORD *)v102 + 1) = 0;
  v102[16] = 1;
  *((_QWORD *)v102 + 3) = v129;
  *((_QWORD *)v102 + 4) = v92;
  *((_QWORD *)v102 + 5) = v125;
  v102[48] = (_BYTE)v124;
  *((_QWORD *)v102 + 7) = v93;
  v102[64] = v79;
  *(_OWORD *)(v102 + 72) = v123;
  *((_QWORD *)v102 + 11) = v95;
  *((_QWORD *)v102 + 12) = v94;
  v103 = *(void (**)(_BYTE *, uint64_t))(v97 + 8);
  swift_retain(v92);
  swift_retain(v94);
  v103(v130, v100);
  swift_release(v94);
  swift_release(v92);
  return ((uint64_t (*)(_BYTE *, uint64_t))v103)(v132, v100);
}

uint64_t sub_100013910(uint64_t *a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  char v13;

  v1 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_1000446C8);
    v3 = swift_getKeyPath(&unk_100044738);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v12, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    if (v13 == 2)
    {
      v5 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    }
    else
    {
      v13 &= 1u;
      sub_1000176F4();
    }
    v6 = v5;
    v7 = objc_msgSend(objc_allocWithZone((Class)NSItemProvider), "initWithObject:", v5);

    return (uint64_t)v7;
  }
  else
  {
    v9 = a1[1];
    v10 = type metadata accessor for ColorPickerState(0);
    v11 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v9, v10, v11);
    __break(1u);
  }
  return result;
}

uint64_t sub_100013A48@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;

  v36 = *a1;
  v4 = *((_QWORD *)a1 + 2);
  v5 = *((_QWORD *)a1 + 3);
  v6 = *((unsigned __int8 *)a1 + 32);
  v7 = swift_allocObject(&unk_10005ACD8, 49, 7);
  v8 = a1[1];
  *(_OWORD *)(v7 + 16) = *a1;
  *(_OWORD *)(v7 + 32) = v8;
  *(_BYTE *)(v7 + 48) = *((_BYTE *)a1 + 32);
  v9 = v36;
  sub_100015D58(&v36);
  sub_100014F74(v4, v5);
  sub_10001597C(v9, *((uint64_t *)&v9 + 1));
  v11 = v10;
  v13 = static Alignment.center.getter(v12);
  _FrameLayout.init(width:height:alignment:)(&v30, 0, 1, v11, 0, v13, v14);
  v28 = v30;
  v27 = v31;
  v26 = v32;
  v25 = v33;
  v23 = v35;
  v24 = v34;
  v15 = type metadata accessor for FavoriteColorPickerView.Model(0);
  v16 = sub_100006848(&qword_100065D28, type metadata accessor for FavoriteColorPickerView.Model, (uint64_t)&unk_1000466C8);
  v17 = StateObject.wrappedValue.getter(v4, v5, v6, v15, v16);
  KeyPath = swift_getKeyPath(&unk_1000446F0);
  v19 = swift_getKeyPath(&unk_100044718);
  static Published.subscript.getter(&v29, v17, KeyPath, v19);
  swift_release(v17);
  swift_release(KeyPath);
  swift_release(v19);
  result = 0;
  v21 = 0;
  if (v29 >= 2)
  {
    v22 = StateObject.wrappedValue.getter(v4, v5, v6, v15, v16);
    result = ObservedObject.init(wrappedValue:)(v22, v15, v16);
  }
  *(_QWORD *)a2 = sub_100015D50;
  *(_QWORD *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 16) = v28;
  *(_BYTE *)(a2 + 24) = v27;
  *(_QWORD *)(a2 + 32) = v26;
  *(_BYTE *)(a2 + 40) = v25;
  *(_QWORD *)(a2 + 48) = v24;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = result;
  *(_QWORD *)(a2 + 72) = v21;
  return result;
}

void sub_100013C4C(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
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
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD v33[2];

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(unsigned __int8 *)(a1 + 32);
  v7 = type metadata accessor for FavoriteColorPickerView.Model(0);
  v8 = sub_100006848(&qword_100065D28, type metadata accessor for FavoriteColorPickerView.Model, (uint64_t)&unk_1000466C8);
  v9 = StateObject.wrappedValue.getter(v4, v5, v6, v7, v8);
  v10 = GeometryProxy.size.getter();
  v11 = *(_QWORD *)a1;
  v12 = *(_QWORD *)(a1 + 8);
  v31 = sub_100015D88(*(_QWORD *)a1, v12, v10);
  v13 = type metadata accessor for ColorPickerState(0);
  v14 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v30 = EnvironmentObject.init()(v13, v14);
  v16 = v15;
  v17 = ObservedObject.init(wrappedValue:)(v9, v7, v8);
  v19 = v18;
  v32 = sub_10002B340((uint64_t)&_swiftEmptyArrayStorage);
  v20 = sub_1000060E4(&qword_100065D30);
  v21 = State.init(wrappedValue:)(v33, &v32, v20);
  v22 = v33[0];
  v23 = v33[1];
  LOBYTE(v8) = static Edge.Set.horizontal.getter(v21);
  v24 = GeometryProxy.size.getter();
  sub_100016014(v11, v12, v24);
  v26 = EdgeInsets.init(_all:)(v25);
  *(_QWORD *)a2 = v30;
  *(_QWORD *)(a2 + 8) = v16;
  *(_QWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)(a2 + 32) = v31;
  *(_QWORD *)(a2 + 40) = v22;
  *(_QWORD *)(a2 + 48) = v23;
  *(_BYTE *)(a2 + 56) = v8;
  *(double *)(a2 + 64) = v26;
  *(_QWORD *)(a2 + 72) = v27;
  *(_QWORD *)(a2 + 80) = v28;
  *(_QWORD *)(a2 + 88) = v29;
  *(_BYTE *)(a2 + 96) = 0;
}

uint64_t sub_100013DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;

  v3 = *(_OWORD *)(v1 + 16);
  v10[0] = *(_OWORD *)v1;
  v10[1] = v3;
  LOBYTE(v11) = *(_BYTE *)(v1 + 32);
  v4 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice", v10[0], v3, v11);
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)6)
    v7 = 0x4038000000000000;
  else
    v7 = 0x4036000000000000;
  *(_QWORD *)a1 = static HorizontalAlignment.center.getter(v6);
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = 0;
  v8 = sub_1000060E4(&qword_100065C60);
  return sub_1000128E4((uint64_t *)v10, a1 + *(int *)(v8 + 44));
}

uint64_t sub_100013E74@<X0>(uint64_t a1@<X8>)
{
  return sub_100013ED8(&qword_100065570, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize, (char *)0x5463696D616E7944, (char *)0xEF657A6953657079, a1);
}

uint64_t sub_100013EA8@<X0>(uint64_t a1@<X8>)
{
  return sub_100013ED8(&qword_100065B20, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, (char *)0x686353726F6C6F43, (char *)0xEB00000000656D65, a1);
}

uint64_t sub_100013ED8@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v25 = a4;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000060E4(a1);
  __chkstk_darwin(v15);
  v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100009C1C(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = *v17;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v23 = swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v26 = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)(v23 + 4) = sub_100014558(a3, v25, &v26);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1000140E0@<X0>(uint64_t a1@<X8>)
{
  return sub_100013ED8(&qword_100065DC0, (uint64_t (*)(_QWORD))&type metadata accessor for LayoutDirection, (char *)0x694474756F79614CLL, (char *)0xEF6E6F6974636572, a1);
}

uint64_t sub_100014114()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_100014134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001417C(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100014148()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100014168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001417C(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_10001417C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  __chkstk_darwin();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1000141F8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100044298, (uint64_t)&unk_1000442C0, a2);
}

uint64_t sub_10001420C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100044298, (uint64_t)&unk_1000442C0);
}

double sub_100014220@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  double v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000442E0);
  v5 = swift_getKeyPath(&unk_100044308);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = v7;
  *a2 = v7;
  return result;
}

uint64_t sub_10001429C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000442E0);
  v5 = swift_getKeyPath(&unk_100044308);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_100014314@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100044328, (uint64_t)&unk_100044350, a2);
}

uint64_t sub_100014328@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
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

uint64_t sub_1000143A0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100044328, (uint64_t)&unk_100044350);
}

uint64_t sub_1000143B4(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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

uint64_t sub_100014420@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100044298, (uint64_t)&unk_1000442C0, a2);
}

uint64_t sub_100014444(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100044298, (uint64_t)&unk_1000442C0);
}

uint64_t type metadata accessor for ColorPickerContent(uint64_t a1)
{
  uint64_t result;

  result = qword_100065A38;
  if (!qword_100065A38)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ColorPickerContent);
  return result;
}

uint64_t sub_1000144AC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100044328, (uint64_t)&unk_100044350, a2);
}

uint64_t sub_1000144D0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100044328, (uint64_t)&unk_100044350);
}

uint64_t sub_1000144F4()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_100014514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001417C(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100014538(uint64_t result)
{
  if (result != 1)
    return swift_retain(result);
  return result;
}

uint64_t sub_100014548(uint64_t result)
{
  if (result != 1)
    return swift_release(result);
  return result;
}

char *sub_100014558(char *a1, char *a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12[3];
  void *ObjectType;

  v6 = sub_100014628(v12, 0, 0, 1, (uint64_t)a1, (unint64_t)a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000E63C((uint64_t)v12, *a3);
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
      sub_10000E63C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000152C4(v12);
  return v7;
}

char *sub_100014628(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  char *result;
  uint64_t v10;
  char *v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (char *)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100014724(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (char *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    result = (char *)_StringObject.sharedUTF8.getter(a5, a6);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (char *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

char *sub_100014724(uint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (char *)sub_1000147B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000148B4(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_1000148B4((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

_QWORD *sub_1000147B8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  char v7;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100014850(v4, 0);
      result = (_QWORD *)_StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v7 & 1) != 0)
        break;
      if (result == (_QWORD *)v4)
        return v5;
      __break(1u);
LABEL_9:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100014850(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000060E4(&qword_100065BF0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000148B4(char *result, int64_t a2, char a3, char *a4)
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
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_100065BF0);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

unint64_t sub_10001499C(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100059A80, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

uint64_t sub_1000149E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000149F0);
}

uint64_t sub_1000149F0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_1000060E4(&qword_100065578);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_100014A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014A88);
}

char *sub_100014A88(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = sub_1000060E4(&qword_100065578);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_100014B00(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_1000443B8;
  sub_10000802C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

ValueMetadata *type metadata accessor for ColorPickerTabPicker()
{
  return &type metadata for ColorPickerTabPicker;
}

uint64_t sub_100014B84()
{
  return sub_10000C94C(&qword_100065A70, &qword_1000659C8, (void (*)(void))sub_100014BB8);
}

uint64_t sub_100014BB8()
{
  return sub_10000C94C(&qword_100065A78, &qword_1000659C0, (void (*)(void))sub_100014BDC);
}

unint64_t sub_100014BDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065A80;
  if (!qword_100065A80)
  {
    v1 = sub_100009E2C(&qword_1000659B8);
    sub_100014C60();
    sub_100009FA0(&qword_100065A98, &qword_100065AA0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065A80);
  }
  return result;
}

unint64_t sub_100014C60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065A88;
  if (!qword_100065A88)
  {
    v1 = sub_100009E2C(&qword_1000659B0);
    sub_100009FA0(&qword_100065A90, &qword_1000659A8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065A88);
  }
  return result;
}

uint64_t sub_100014CE4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100051334, 1);
}

uint64_t sub_100014CF4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005130C, 1);
}

unint64_t sub_100014D04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065AC0;
  if (!qword_100065AC0)
  {
    v1 = sub_100009E2C(&qword_100065AB8);
    sub_100014D88();
    sub_100009FA0(&qword_100065AE8, &qword_100065AF0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065AC0);
  }
  return result;
}

unint64_t sub_100014D88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065AC8;
  if (!qword_100065AC8)
  {
    v1 = sub_100009E2C(&qword_100065AD0);
    sub_100006848(&qword_100065AD8, type metadata accessor for ColorSwatchPickerView, (uint64_t)&unk_100045AE0);
    sub_100014E0C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065AC8);
  }
  return result;
}

unint64_t sub_100014E0C()
{
  unint64_t result;

  result = qword_100065AE0;
  if (!qword_100065AE0)
  {
    result = swift_getWitnessTable(&unk_10004462C, &type metadata for ColorPickerContent.PlatformBasedAspectRatio);
    atomic_store(result, (unint64_t *)&qword_100065AE0);
  }
  return result;
}

unint64_t sub_100014E50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065AF8;
  if (!qword_100065AF8)
  {
    v1 = sub_100009E2C(&qword_100065AA8);
    sub_100009FA0(&qword_100065B00, &qword_100065B08, (uint64_t)&protocol conformance descriptor for _LayoutRoot<A>);
    sub_100009FA0(&qword_100065B10, &qword_100065B18, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _VariadicView.Tree<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065AF8);
  }
  return result;
}

uint64_t sub_100014EEC()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100014F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001417C(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100014F30()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100014F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001417C(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_100014F74(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_100014F7C(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

unint64_t sub_100014F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065B80;
  if (!qword_100065B80)
  {
    v1 = sub_100009E2C(&qword_100065B70);
    sub_100015008();
    sub_100006848(&qword_100065BB0, type metadata accessor for RGBAView, (uint64_t)&unk_100043968);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065B80);
  }
  return result;
}

unint64_t sub_100015008()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065B88;
  if (!qword_100065B88)
  {
    v1 = sub_100009E2C(&qword_100065B68);
    sub_100014D04();
    sub_100015074();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065B88);
  }
  return result;
}

unint64_t sub_100015074()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065B90;
  if (!qword_100065B90)
  {
    v1 = sub_100009E2C(&qword_100065B50);
    sub_1000150F8();
    sub_100009FA0(&qword_100065AE8, &qword_100065AF0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065B90);
  }
  return result;
}

unint64_t sub_1000150F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065B98;
  if (!qword_100065B98)
  {
    v1 = sub_100009E2C(&qword_100065BA0);
    sub_100015164();
    sub_100014E0C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065B98);
  }
  return result;
}

unint64_t sub_100015164()
{
  unint64_t result;

  result = qword_100065BA8;
  if (!qword_100065BA8)
  {
    result = swift_getWitnessTable(&unk_100045DD0, &type metadata for Spectrum);
    atomic_store(result, (unint64_t *)&qword_100065BA8);
  }
  return result;
}

uint64_t sub_1000151B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_QWORD *sub_1000151FC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[3];
  v3 = a1[9];
  v4 = a1[10];
  v5 = a1[11];
  swift_retain(a1[17]);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

_QWORD *sub_100015260(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[3];
  v3 = a1[9];
  v4 = a1[10];
  v5 = a1[17];
  swift_release(a1[11]);
  swift_release(v2);
  swift_release(v3);
  swift_release(v4);
  swift_release(v5);
  return a1;
}

uint64_t sub_1000152C4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_1000152E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066F70;
  if (!qword_100066F70)
  {
    v1 = objc_opt_self(UIColorPickerViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100066F70);
  }
  return result;
}

unint64_t sub_100015320()
{
  unint64_t result;

  result = qword_100065C08;
  if (!qword_100065C08)
  {
    result = swift_getWitnessTable(&unk_1000441DC, &type metadata for Tab);
    atomic_store(result, (unint64_t *)&qword_100065C08);
  }
  return result;
}

unint64_t sub_100015364()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065C10;
  if (!qword_100065C10)
  {
    v1 = sub_100009E2C(&qword_100065C00);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_100065C10);
  }
  return result;
}

uint64_t destroy for FooterView(_QWORD *a1)
{
  swift_release(*a1);
  return sub_100014F7C(a1[2], a1[3]);
}

uint64_t initializeWithCopy for FooterView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2[2];
  v6 = a2[3];
  v7 = *((_BYTE *)a2 + 32);
  swift_retain(v3);
  sub_100014F74(v5, v6);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t *assignWithCopy for FooterView(uint64_t *a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = v2[1];
  v6 = v2[2];
  v7 = v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_100014F74(v6, v7);
  v8 = a1[2];
  v9 = a1[3];
  a1[2] = v6;
  a1[3] = v7;
  *((_BYTE *)a1 + 32) = (_BYTE)v2;
  sub_100014F7C(v8, v9);
  return a1;
}

__n128 initializeWithCopy for SomeColor(uint64_t a1, uint64_t a2)
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

uint64_t *assignWithTake for FooterView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  v5 = a2[3];
  v6 = *((_BYTE *)a2 + 32);
  v7 = a1[2];
  v8 = a1[3];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  a1[3] = v5;
  *((_BYTE *)a1 + 32) = v6;
  sub_100014F7C(v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FooterView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FooterView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FooterView()
{
  return &type metadata for FooterView;
}

uint64_t sub_1000155EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for ColorPickerContent.Visibility(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  return a1;
}

__n128 initializeWithTake for ColorPickerContent.Visibility(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for ColorPickerContent.Visibility(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerContent.Visibility(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorPickerContent.Visibility(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerContent.Visibility()
{
  return &type metadata for ColorPickerContent.Visibility;
}

ValueMetadata *type metadata accessor for ColorPickerContent.PlatformBasedAspectRatio()
{
  return &type metadata for ColorPickerContent.PlatformBasedAspectRatio;
}

unint64_t sub_1000157A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065C28;
  if (!qword_100065C28)
  {
    v1 = sub_100009E2C(&qword_100065C30);
    sub_100014D04();
    sub_100014E50();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065C28);
  }
  return result;
}

uint64_t sub_10001580C()
{
  _QWORD v1[4];

  v1[0] = sub_100009E2C(&qword_100065BF8);
  v1[1] = type metadata accessor for SegmentedPickerStyle(255);
  v1[2] = sub_100009FA0(&qword_100065C18, &qword_100065BF8, (uint64_t)&protocol conformance descriptor for Picker<A, B, C>);
  v1[3] = &protocol witness table for SegmentedPickerStyle;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.pickerStyle<A>(_:)>>, 1);
}

uint64_t sub_100015890(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000513AC, 1);
}

uint64_t sub_1000158A0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100051384, 1);
}

uint64_t sub_1000158B0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005135C, 1);
}

uint64_t sub_1000158C0(uint64_t a1)
{
  swift_retain(*(_QWORD *)(a1 + 104));
  return a1;
}

unint64_t sub_1000158E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065C58;
  if (!qword_100065C58)
  {
    v1 = sub_100009E2C(&qword_100065C38);
    sub_100009FA0(&qword_100065C50, &qword_100065C48, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065C58);
  }
  return result;
}

void sub_10001597C(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    KeyPath = swift_getKeyPath(&unk_100044298);
    v4 = swift_getKeyPath(&unk_1000442C0);
    v5 = swift_retain(a1);
    static Published.subscript.getter(&v12, v5, KeyPath, v4);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v4);
    v6 = (void *)objc_opt_self(UIDevice);
    v7 = objc_msgSend(v6, "currentDevice");
    objc_msgSend(v7, "userInterfaceIdiom");

    v8 = objc_msgSend(v6, "currentDevice");
    objc_msgSend(v8, "userInterfaceIdiom");

  }
  else
  {
    v10 = type metadata accessor for ColorPickerState(0);
    v11 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    EnvironmentObject.error()(0, a2, v10, v11);
    __break(1u);
  }
}

unint64_t sub_100015AF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065CD0;
  if (!qword_100065CD0)
  {
    v1 = sub_100009E2C(&qword_100065CA0);
    sub_100015B74();
    sub_100009FA0(&qword_1000656C8, &qword_1000656A8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065CD0);
  }
  return result;
}

unint64_t sub_100015B74()
{
  unint64_t result;

  result = qword_100065CD8;
  if (!qword_100065CD8)
  {
    result = swift_getWitnessTable(&unk_100047090, &type metadata for ColorWell);
    atomic_store(result, (unint64_t *)&qword_100065CD8);
  }
  return result;
}

uint64_t sub_100015BBC()
{
  uint64_t v0;

  return sub_100013910((uint64_t *)(v0 + 16));
}

uint64_t *sub_100015BC4(uint64_t *a1)
{
  sub_100014F74(*a1, a1[1]);
  return a1;
}

unint64_t sub_100015BF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065D08;
  if (!qword_100065D08)
  {
    v1 = sub_100009E2C(&qword_100065CB8);
    sub_100015C78();
    sub_100009FA0(&qword_100065D18, &qword_100065D00, (uint64_t)&protocol conformance descriptor for _ContentShapeKindModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065D08);
  }
  return result;
}

unint64_t sub_100015C78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065D10;
  if (!qword_100065D10)
  {
    v1 = sub_100009E2C(&qword_100065CB0);
    sub_10000C94C(&qword_100065CC8, &qword_100065CA8, (void (*)(void))sub_100015AF0);
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065D10);
  }
  return result;
}

uint64_t sub_100015D20()
{
  _QWORD *v0;

  swift_release(v0[2]);
  sub_100014F7C(v0[4], v0[5]);
  return swift_deallocObject(v0, 49, 7);
}

void sub_100015D50(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_100013C4C(v1 + 16, a1);
}

_QWORD *sub_100015D58(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_100015D88(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!a1)
    goto LABEL_27;
  v3 = a1;
  KeyPath = swift_getKeyPath(&unk_100044298);
  v6 = swift_getKeyPath(&unk_1000442C0);
  v7 = swift_retain(v3);
  static Published.subscript.getter((uint64_t *)((char *)&v27 + 1), v7, KeyPath, v6);
  swift_release(v3);
  swift_release(KeyPath);
  swift_release(v6);
  v8 = BYTE1(v27);
  v9 = (void *)objc_opt_self(UIDevice);
  v10 = objc_msgSend(v9, "currentDevice");
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = 30.0;
  if (v8)
    v12 = 28.0;
  if (v11 == (id)6)
    v13 = 42.0;
  else
    v13 = v12;
  v14 = swift_getKeyPath(&unk_100044298);
  v15 = swift_getKeyPath(&unk_1000442C0);
  v16 = swift_retain(v3);
  static Published.subscript.getter(&v27, v16, v14, v15);
  swift_release(v3);
  swift_release(v14);
  swift_release(v15);
  LODWORD(v15) = v27;
  v17 = objc_msgSend(v9, "currentDevice");
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  v19 = 18.0;
  if ((_DWORD)v15)
    v19 = 16.0;
  if (v18 == (id)6)
    v20 = 20.0;
  else
    v20 = v19;
  if (qword_100065090 != -1)
    a1 = swift_once(&qword_100065090, sub_100027CA0);
  v21 = *(double *)&qword_10006B6B0;
  if (*(double *)&qword_10006B6B0 < a3)
    v21 = a3;
  v22 = (v20 + v21) / (v13 + v20);
  if ((~*(_QWORD *)&v22 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((uint64_t)v22 + 0x4000000000000000 < 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    v24 = a2;
    v25 = type metadata accessor for ColorPickerState(a1);
    v26 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v24, v25, v26);
    __break(1u);
    return result;
  }
  if (2 * (uint64_t)v22 >= 16)
    return 16;
  else
    return 2 * (uint64_t)v22;
}

uint64_t sub_100016014(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a1)
  {
    KeyPath = swift_getKeyPath(&unk_100044298);
    v7 = swift_getKeyPath(&unk_1000442C0);
    v8 = swift_retain(a1);
    static Published.subscript.getter((uint64_t *)((char *)&v18 + 1), v8, KeyPath, v7);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v7);
    v9 = (void *)objc_opt_self(UIDevice);
    v10 = objc_msgSend(v9, "currentDevice");
    objc_msgSend(v10, "userInterfaceIdiom");

    v11 = swift_getKeyPath(&unk_100044298);
    v12 = swift_getKeyPath(&unk_1000442C0);
    v13 = swift_retain(a1);
    static Published.subscript.getter(&v18, v13, v11, v12);
    swift_release(a1);
    swift_release(v11);
    swift_release(v12);
    v14 = objc_msgSend(v9, "currentDevice");
    objc_msgSend(v14, "userInterfaceIdiom");

    result = sub_100015D88(a1, a2, a3);
    if (qword_100065090 != -1)
      return swift_once(&qword_100065090, sub_100027CA0);
  }
  else
  {
    v16 = type metadata accessor for ColorPickerState(0);
    v17 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, a2, v16, v17);
    __break(1u);
  }
  return result;
}

uint64_t sub_100016280()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_100016290(_BYTE *a1)
{
  uint64_t v1;

  return sub_100009A4C(a1, *(_BYTE *)(v1 + 16));
}

unint64_t sub_100016298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065D60;
  if (!qword_100065D60)
  {
    v1 = sub_100009E2C(&qword_100065D48);
    sub_10001631C();
    sub_100009FA0(&qword_100065D88, &qword_100065D90, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065D60);
  }
  return result;
}

unint64_t sub_10001631C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065D68;
  if (!qword_100065D68)
  {
    v1 = sub_100009E2C(&qword_100065D40);
    sub_100016388();
    sub_10001640C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065D68);
  }
  return result;
}

unint64_t sub_100016388()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065D70;
  if (!qword_100065D70)
  {
    v1 = sub_100009E2C(&qword_100065D38);
    sub_100009FA0(&qword_100065D78, &qword_100065D58, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065D70);
  }
  return result;
}

unint64_t sub_10001640C()
{
  unint64_t result;

  result = qword_100065D80;
  if (!qword_100065D80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _AllowsHitTestingModifier, &type metadata for _AllowsHitTestingModifier);
    atomic_store(result, (unint64_t *)&qword_100065D80);
  }
  return result;
}

unint64_t sub_100016454()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065D98;
  if (!qword_100065D98)
  {
    v1 = sub_100009E2C(&qword_100065DA0);
    sub_100009FA0(&qword_100065C50, &qword_100065C48, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_1000158E8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065D98);
  }
  return result;
}

uint64_t sub_1000164D8()
{
  return sub_100009FA0(&qword_100065DA8, &qword_100065DB0, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

unint64_t sub_100016508()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065DB8;
  if (!qword_100065DB8)
  {
    v1 = sub_100009E2C(&qword_100065D50);
    sub_100016298();
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100065DB8);
  }
  return result;
}

id sub_100016594(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  KeyPath = swift_getKeyPath(&unk_100044898);
  v7 = swift_getKeyPath(&unk_1000448C0);
  v8 = swift_retain(a4);
  static Published.subscript.getter(&v16, v8, KeyPath, v7);
  swift_release(a4);
  swift_release(KeyPath);
  result = (id)swift_release(v7);
  if (v17 == 1)
  {
    v10 = swift_getKeyPath(&unk_1000448E0);
    v11 = swift_getKeyPath(&unk_100044908);
    v12 = swift_retain(a4);
    static Published.subscript.getter(&v16, v12, v10, v11);
    swift_release(a4);
    swift_release(v10);
    swift_release(v11);
    objc_msgSend(a1, "setNumberOfPages:", v16);
    v13 = swift_getKeyPath(&unk_100044928);
    v14 = swift_getKeyPath(&unk_100044950);
    v15 = swift_retain(a4);
    static Published.subscript.getter(&v16, v15, v13, v14);
    swift_release(a4);
    swift_release(v13);
    swift_release(v14);
    return objc_msgSend(a1, "setCurrentPage:", v16);
  }
  return result;
}

id sub_1000167C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PageControl.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PageControl.Coordinator()
{
  return objc_opt_self(_TtCV20ColorPickerUIService11PageControl11Coordinator);
}

ValueMetadata *type metadata accessor for PageControl()
{
  return &type metadata for PageControl;
}

id sub_10001683C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_100016594(a1, a2, a3, *(_QWORD *)(v3 + 8));
}

id sub_100016844@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v4 = *v1;
  v3 = v1[1];
  v5 = (objc_class *)type metadata accessor for PageControl.Coordinator();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV20ColorPickerUIService11PageControl11Coordinator_parent];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain(v3);
  result = objc_msgSendSuper2(&v9, "init");
  *a1 = result;
  return result;
}

uint64_t sub_1000168B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100016AE8();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100016904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100016AE8();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100016954(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016AE8();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_10001697C()
{
  unint64_t result;

  result = qword_100065DF8;
  if (!qword_100065DF8)
  {
    result = swift_getWitnessTable(&unk_1000447B4, &type metadata for PageControl);
    atomic_store(result, (unint64_t *)&qword_100065DF8);
  }
  return result;
}

id sub_1000169D8()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v6;

  v0 = objc_msgSend(objc_allocWithZone((Class)UIPageControl), "init");
  v1 = (void *)objc_opt_self(UIColor);
  v2 = objc_msgSend(v1, "secondaryLabelColor");
  objc_msgSend(v0, "setPageIndicatorTintColor:", v2);

  v3 = objc_msgSend(v1, "labelColor");
  objc_msgSend(v0, "setCurrentPageIndicatorTintColor:", v3);

  objc_msgSend(v0, "setHidesForSinglePage:", 1);
  sub_1000060E4(&qword_100065E00);
  UIViewRepresentableContext.coordinator.getter(&v6);
  v4 = v6;
  objc_msgSend(v0, "addTarget:action:forControlEvents:", v6, "valueChanged:", 4096);

  return v0;
}

unint64_t sub_100016AE8()
{
  unint64_t result;

  result = qword_100065E08;
  if (!qword_100065E08)
  {
    result = swift_getWitnessTable(&unk_100044804, &type metadata for PageControl);
    atomic_store(result, (unint64_t *)&qword_100065E08);
  }
  return result;
}

id sub_100016B2C(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v9 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView;
  v10 = objc_allocWithZone((Class)UIImageView);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, "init");
  v12 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView;
  v13 = type metadata accessor for ShapeView();
  *(_QWORD *)&v11[v12] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v13)), "init");

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for AddColorCell();
  v14 = objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  sub_100016D24();

  return v14;
}

id sub_100016C34(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView;
  v4 = objc_allocWithZone((Class)UIImageView);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView;
  v7 = type metadata accessor for ShapeView();
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)), "init");

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for AddColorCell();
  v8 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    sub_100016D24();

  }
  return v9;
}

void sub_100016D24()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSString v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  Class isa;
  id v35;
  id v36;

  v1 = (void *)objc_opt_self(UIDevice);
  v2 = objc_msgSend(v1, "currentDevice");
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = objc_msgSend(v0, "contentView");
  v5 = objc_allocWithZone((Class)UIColor);
  if (v3 == (id)6)
    v6 = 0.58;
  else
    v6 = 0.85;
  v7 = objc_msgSend(v5, "initWithRed:green:blue:alpha:", v6, v6, v6, 1.0);
  objc_msgSend(v4, "setBackgroundColor:", v7);

  v8 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView];
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = objc_msgSend(v0, "contentView");
  objc_msgSend(v9, "addSubview:", v8);

  v10 = objc_msgSend(v0, "contentView");
  v11 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView];
  objc_msgSend(v10, "setMaskView:", v11);

  v12 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithPointSize:weight:scale:", 7, 2, 17.0);
  v35 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.29, 0.29, 0.29, 1.0);
  v13 = objc_msgSend(v1, "currentDevice");
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == (id)6)
  {
    v15 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);

    v35 = v15;
  }
  v16 = v12;
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:withConfiguration:", v17, v16);

  if (v18)
  {
    v19 = objc_msgSend(v18, "imageWithTintColor:renderingMode:", v35, 1);

    objc_msgSend(v8, "setImage:", v19);
    v20 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
    v21 = objc_msgSend(v11, "layer");
    v22 = objc_opt_self(CAShapeLayer);
    v23 = (void *)swift_dynamicCastObjCClassUnconditional(v21, v22, 0, 0, 0);
    if (v20)
      v24 = objc_msgSend(v20, "CGColor");
    else
      v24 = 0;
    objc_msgSend(v23, "setFillColor:", v24, v35);

    v25 = (void *)objc_opt_self(NSLayoutConstraint);
    v26 = sub_1000060E4(&qword_100065360);
    v27 = swift_allocObject(v26, 48, 7);
    *(_OWORD *)(v27 + 16) = xmmword_100042F40;
    v28 = objc_msgSend(v0, "centerXAnchor");
    v29 = objc_msgSend(v8, "centerXAnchor");
    v30 = objc_msgSend(v28, "constraintEqualToAnchor:", v29);

    *(_QWORD *)(v27 + 32) = v30;
    v31 = objc_msgSend(v0, "centerYAnchor");
    v32 = objc_msgSend(v8, "centerYAnchor");
    v33 = objc_msgSend(v31, "constraintEqualToAnchor:", v32);

    *(_QWORD *)(v27 + 40) = v33;
    specialized Array._endMutation()();
    sub_1000075F4(0, &qword_100065E48, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v27);
    objc_msgSend(v25, "activateConstraints:", isa);

  }
  else
  {
    __break(1u);
  }
}

void sub_1000171F4()
{
  char *v0;
  double Width;
  double Height;
  char *v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for AddColorCell();
  objc_msgSendSuper2(&v7, "layoutSubviews");
  objc_msgSend(v0, "bounds");
  Width = CGRectGetWidth(v8);
  objc_msgSend(v0, "bounds");
  Height = CGRectGetHeight(v9);
  if (Height < Width)
    Width = Height;
  v3 = *(char **)&v0[OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, Width, Width);
  v4 = objc_msgSend((id)objc_opt_self(UIBezierPath), "bezierPathWithOvalInRect:", 0.0, 0.0, Width, Width);
  v5 = *(void **)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(_QWORD *)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v4;
  v6 = v4;

  sub_10002FC6C();
}

id sub_100017388()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddColorCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AddColorCell()
{
  return objc_opt_self(_TtC20ColorPickerUIService12AddColorCell);
}

uint64_t sub_100017410()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;

  v0 = sub_1000075F4(0, (unint64_t *)&qword_100066F70, UIColorPickerViewController_ptr);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, v4);

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  return v6;
}

uint64_t getEnumTagSinglePayload for SomeColor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SomeColor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor()
{
  return &type metadata for SomeColor;
}

uint64_t sub_1000175A8()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  float v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = sub_1000060E4(&qword_100065EF8);
  v2 = swift_allocObject(v1, 152, 7);
  *(_OWORD *)(v2 + 16) = xmmword_1000449B0;
  v3 = *v0 * 255.0;
  v4 = lroundf(v3);
  *(_QWORD *)(v2 + 56) = &type metadata for Int;
  *(_QWORD *)(v2 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v2 + 32) = v4;
  v5 = v0[1] * 255.0;
  v6 = lroundf(v5);
  *(_QWORD *)(v2 + 96) = &type metadata for Int;
  *(_QWORD *)(v2 + 104) = &protocol witness table for Int;
  *(_QWORD *)(v2 + 72) = v6;
  v7 = v0[2] * 255.0;
  v8 = lroundf(v7);
  *(_QWORD *)(v2 + 136) = &type metadata for Int;
  *(_QWORD *)(v2 + 144) = &protocol witness table for Int;
  *(_QWORD *)(v2 + 112) = v8;
  v9 = String.init(format:_:)(0x323025586C323025, 0xEF586C323025586CLL, v2);
  v11 = v10;
  v12 = sub_1000060E4(&qword_100065F00);
  v13 = swift_allocObject(v12, 64, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100042F50;
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  *(_QWORD *)(v13 + 32) = v9;
  *(_QWORD *)(v13 + 40) = v11;
  swift_bridgeObjectRetain(v11);
  print(_:separator:terminator:)(v13, 32, 0xE100000000000000, 10, 0xE100000000000000);
  swift_bridgeObjectRelease(v13);
  return v9;
}

void sub_1000176F4()
{
  uint64_t v0;
  CFStringRef *v1;
  CGColorSpace *v2;
  CGColorSpace *v3;
  __int128 v4;
  CGColorRef v5;
  _OWORD v6[2];

  v1 = (CFStringRef *)&kCGColorSpaceDisplayP3;
  if (!*(_BYTE *)(v0 + 32))
    v1 = (CFStringRef *)&kCGColorSpaceSRGB;
  v2 = CGColorSpaceCreateWithName(*v1);
  if (v2)
  {
    v3 = v2;
    v4 = *(_OWORD *)(v0 + 16);
    v6[0] = *(_OWORD *)v0;
    v6[1] = v4;
    v5 = CGColorCreate(v2, (const CGFloat *)v6);

    if (v5)
    {
      objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithCGColor:", v5);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100017798()
{
  unint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;

  v0 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, v4);

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  return v6;
}

uint64_t sub_100017898()
{
  return 1;
}

void sub_1000178A4()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_1000178CC()
{
  return 0x65756C6156776172;
}

uint64_t sub_1000178E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x65756C6156776172 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease(0xE800000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x65756C6156776172, 0xE800000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_100017978()
{
  return 0;
}

void sub_100017984(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100017990(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001915C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000179B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001915C();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1000179E0()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100017A20(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100017A6C(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const CFStringRef *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = sub_1000060E4(&qword_100065ED0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100018BB0(a1, v8);
  v10 = sub_10001915C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SomeColor.ColorSpace.CodingKeys, &type metadata for SomeColor.ColorSpace.CodingKeys, v10, v8, v9);
  v11 = &kCGColorSpaceDisplayP3;
  if ((a2 & 1) == 0)
    v11 = &kCGColorSpaceSRGB;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v11);
  v14 = v13;
  KeyedEncodingContainer.encode(_:forKey:)(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return swift_bridgeObjectRelease(v14);
}

BOOL sub_100017B74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100017B8C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100017BD0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100017BF8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100017C38@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1000185AC(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_100017C64(_QWORD *a1)
{
  char *v1;

  return sub_100017A6C(a1, *v1);
}

void sub_100017C7C(_QWORD *a1@<X8>)
{
  *a1 = &off_100059B38;
}

void sub_100017C8C(uint64_t a1@<X8>)
{
  uint64_t v1;
  double v3;
  double v4;
  double v5;
  CGFloat Alpha;
  void *v7;
  void *v8;
  CGColor *v9;
  void *v10;
  id v11;
  CGColorSpace *v12;
  CGColorSpace *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    v3 = *(double *)v1;
    v4 = *(double *)(v1 + 8);
    v5 = *(double *)(v1 + 16);
    Alpha = *(double *)(v1 + 24);
LABEL_7:
    *(double *)a1 = v3;
    *(double *)(a1 + 8) = v4;
    *(double *)(a1 + 16) = v5;
    *(CGFloat *)(a1 + 24) = Alpha;
    *(_BYTE *)(a1 + 32) = 0;
    return;
  }
  sub_1000176F4();
  v8 = v7;
  v9 = (CGColor *)objc_msgSend(v7, "CGColor");

  v10 = (void *)UISCreateCachedColorTransform(kCGColorSpaceSRGB);
  v20 = 0.0;
  v21 = 0.0;
  v19 = 0.0;
  if (!v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v10;
  v12 = CGColorGetColorSpace(v9);
  if (!v12)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v13 = v12;
  v14 = CGColorRef.components.getter();
  if (v14)
  {
    v15 = v14;
    CGColorTransformConvertColorComponents(v11, v13, 3, v14 + 32, &v19);

    swift_bridgeObjectRelease(v15);
    v16 = v19;
    v17 = v20;
    v18 = v21;
    Alpha = CGColorGetAlpha(v9);

    v3 = sub_100019414(v16);
    v4 = sub_100019414(v17);
    v5 = sub_100019414(v18);
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
}

void sub_100017DD0(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  CGColor *v5;
  void *v6;
  id v7;
  CGColorSpace *v8;
  CGColorSpace *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGFloat Alpha;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if ((*(_BYTE *)(v1 + 32) & 1) != 0)
  {
    v16 = *(double *)v1;
    v17 = *(double *)(v1 + 8);
    v18 = *(double *)(v1 + 16);
    Alpha = *(double *)(v1 + 24);
    goto LABEL_7;
  }
  sub_1000176F4();
  v4 = v3;
  v5 = (CGColor *)objc_msgSend(v3, "CGColor");

  v6 = (void *)UISCreateCachedColorTransform(kCGColorSpaceDisplayP3);
  v20 = 0.0;
  v21 = 0.0;
  v19 = 0.0;
  if (!v6)
  {
    __break(1u);
    goto LABEL_9;
  }
  v7 = v6;
  v8 = CGColorGetColorSpace(v5);
  if (!v8)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v8;
  v10 = CGColorRef.components.getter();
  if (v10)
  {
    v11 = v10;
    CGColorTransformConvertColorComponents(v7, v9, 3, v10 + 32, &v19);

    swift_bridgeObjectRelease(v11);
    v12 = v19;
    v13 = v20;
    v14 = v21;
    Alpha = CGColorGetAlpha(v5);

    v16 = sub_100019414(v12);
    v17 = sub_100019414(v13);
    v18 = sub_100019414(v14);
LABEL_7:
    *(double *)a1 = v16;
    *(double *)(a1 + 8) = v17;
    *(double *)(a1 + 16) = v18;
    *(CGFloat *)(a1 + 24) = Alpha;
    *(_BYTE *)(a1 + 32) = 1;
    return;
  }
LABEL_10:
  __break(1u);
}

void sub_100017F18()
{
  uint64_t v0;
  Swift::UInt64 v1;
  Swift::UInt64 v2;
  Swift::UInt64 v3;
  Swift::UInt64 v4;

  if ((*(_QWORD *)v0 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v1 = *(_QWORD *)v0;
  else
    v1 = 0;
  Hasher._combine(_:)(v1);
  if ((*(_QWORD *)(v0 + 8) & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v2 = *(_QWORD *)(v0 + 8);
  else
    v2 = 0;
  Hasher._combine(_:)(v2);
  if ((*(_QWORD *)(v0 + 16) & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v3 = *(_QWORD *)(v0 + 16);
  else
    v3 = 0;
  Hasher._combine(_:)(v3);
  if ((*(_QWORD *)(v0 + 24) & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v4 = *(_QWORD *)(v0 + 24);
  else
    v4 = 0;
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(*(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_100017F80(_QWORD *a1)
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
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v3 = v1;
  v5 = sub_1000060E4(&qword_100065E70);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100018BB0(a1, v9);
  v11 = sub_100018BD4();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SomeColor.CodingKeys, &type metadata for SomeColor.CodingKeys, v11, v9, v10);
  v16 = *v3;
  HIBYTE(v15) = 0;
  v12 = sub_100018CA0();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, (char *)&v15 + 7, v5, &type metadata for CGFloat, v12);
  if (!v2)
  {
    v16 = v3[1];
    HIBYTE(v15) = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, (char *)&v15 + 7, v5, &type metadata for CGFloat, v12);
    v16 = v3[2];
    HIBYTE(v15) = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, (char *)&v15 + 7, v5, &type metadata for CGFloat, v12);
    v16 = v3[3];
    HIBYTE(v15) = 3;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, (char *)&v15 + 7, v5, &type metadata for CGFloat, v12);
    LOBYTE(v16) = *((_BYTE *)v3 + 32);
    HIBYTE(v15) = 4;
    v13 = sub_100018CE4();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, (char *)&v15 + 7, v5, &type metadata for SomeColor.ColorSpace, v13);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

BOOL sub_10001817C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100018190()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000181B4 + 4 * byte_1000449C0[*v0]))(114, 0xE100000000000000);
}

uint64_t sub_1000181B4()
{
  return 103;
}

uint64_t sub_1000181BC()
{
  return 98;
}

uint64_t sub_1000181C4()
{
  return 97;
}

uint64_t sub_1000181CC()
{
  return 0x617053726F6C6F63;
}

uint64_t sub_1000181E8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000187A0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001820C(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100018218(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018BD4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018240(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018BD4();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_100018268()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  sub_100017F18();
  return Hasher._finalize()();
}

Swift::Int sub_1000182A8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  sub_100017F18();
  return Hasher._finalize()();
}

uint64_t sub_1000182E0(uint64_t a1, uint64_t a2)
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)a1, *(float64x2_t *)a2), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)(a2 + 16)))), 0xFuLL))) & 1) != 0)return (*(unsigned __int8 *)(a2 + 32) ^ *(unsigned __int8 *)(a1 + 32) ^ 1) & 1;
  else
    return 0;
}

double sub_10001832C@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  char v7;

  sub_10001895C(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_100018370(_QWORD *a1)
{
  return sub_100017F80(a1);
}

unint64_t sub_100018388@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000195CC(*a1);
  *a2 = result;
  return result;
}

void sub_1000183B0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_1000183BC(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  CGColor *v6;
  char v7;
  const CFStringRef *v8;
  void *v9;
  id v10;
  CGColorSpace *v11;
  CGColorSpace *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat Alpha;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v6 = (CGColor *)objc_msgSend(a1, "CGColor");
  v7 = a2 & 1;
  v8 = &kCGColorSpaceDisplayP3;
  if ((a2 & 1) == 0)
    v8 = &kCGColorSpaceSRGB;
  v9 = (void *)UISCreateCachedColorTransform(*v8);
  v19 = 0;
  v18 = 0uLL;
  if (!v9)
  {
    __break(1u);
    goto LABEL_8;
  }
  v10 = v9;
  v11 = CGColorGetColorSpace(v6);
  if (!v11)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v12 = v11;
  v13 = CGColorRef.components.getter();
  if (v13)
  {
    v14 = v13;
    CGColorTransformConvertColorComponents(v10, v12, 3, v13 + 32, &v18);

    swift_bridgeObjectRelease(v14);
    v17 = v18;
    v15 = v19;
    Alpha = CGColorGetAlpha(v6);

    *(_OWORD *)a3 = v17;
    *(_QWORD *)(a3 + 16) = v15;
    *(CGFloat *)(a3 + 24) = Alpha;
    *(_BYTE *)(a3 + 32) = v7;
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1000184E4(CGColorSpace *a1)
{
  CFStringRef v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  char v7;
  __CFString *v9;
  char v10;

  v1 = CGColorSpaceCopyName(a1);
  if (!v1)
    return 2;
  v2 = (__CFString *)v1;
  type metadata accessor for CFString(0);
  v4 = v3;
  v5 = sub_10000E548();
  v6 = (id)kCGColorSpaceSRGB;
  v7 = static _CFObject.== infix(_:_:)(v6, v2, v4, v5);

  if ((v7 & 1) != 0)
  {

    return 0;
  }
  else
  {
    v9 = (id)kCGColorSpaceDisplayP3;
    v10 = static _CFObject.== infix(_:_:)(v9, v2, v4, v5);

    if ((v10 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1000185AC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  id v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  id v26;

  v3 = sub_1000060E4(&qword_100065EB8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_100018BB0(a1, v7);
  v9 = sub_10001915C();
  v10 = dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SomeColor.ColorSpace.CodingKeys, &type metadata for SomeColor.ColorSpace.CodingKeys, v9, v7, v8);
  if (v1)
    return sub_1000152C4(a1);
  KeyedDecodingContainer.decode(_:forKey:)(v10, v3);
  v13 = v12;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  type metadata accessor for CFString(0);
  v16 = v15;
  v17 = sub_10000E548();
  v18 = (id)kCGColorSpaceSRGB;
  v26 = v14;
  v19 = static _CFObject.== infix(_:_:)(v18, v14, v16, v17);

  v25 = v19;
  if ((v19 & 1) == 0)
  {
    v20 = (id)kCGColorSpaceDisplayP3;
    v21 = v26;
    v22 = static _CFObject.== infix(_:_:)(v20, v26, v16, v17);

    if ((v22 & 1) != 0)
      goto LABEL_7;
    v23 = sub_1000191A0();
    swift_allocError(&type metadata for SomeColor.ColorSpace.CodingError, v23, 0, 0);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_1000152C4(a1);
  }

LABEL_7:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1000152C4(a1);
  return (v25 & 1) == 0;
}

uint64_t sub_1000187A0(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 114 && a2 == 0xE100000000000000)
  {
    v4 = 0xE100000000000000;
LABEL_6:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(114, 0xE100000000000000, a1, a2, 0) & 1) != 0)
  {
    v4 = a2;
    goto LABEL_6;
  }
  if (a1 == 103 && a2 == 0xE100000000000000)
  {
    v6 = 0xE100000000000000;
LABEL_12:
    swift_bridgeObjectRelease(v6);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(103, 0xE100000000000000, a1, a2, 0) & 1) != 0)
  {
    v6 = a2;
    goto LABEL_12;
  }
  if (a1 == 98 && a2 == 0xE100000000000000)
  {
    v7 = 0xE100000000000000;
LABEL_18:
    swift_bridgeObjectRelease(v7);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(98, 0xE100000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_18;
  }
  if (a1 == 97 && a2 == 0xE100000000000000)
  {
    v8 = 0xE100000000000000;
LABEL_24:
    swift_bridgeObjectRelease(v8);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(97, 0xE100000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_24;
  }
  if (a1 == 0x617053726F6C6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease(0xEA00000000006563);
    return 4;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617053726F6C6F63, 0xEA00000000006563, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_10001895C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v5 = sub_1000060E4(&qword_100065E50);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100018BB0(a1, v9);
  v11 = sub_100018BD4();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SomeColor.CodingKeys, &type metadata for SomeColor.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_1000152C4(a1);
  v21 = 0;
  v12 = sub_100018C18();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v22, &type metadata for CGFloat, &v21, v5, &type metadata for CGFloat, v12);
  v13 = v22;
  v21 = 1;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v22, &type metadata for CGFloat, &v21, v5, &type metadata for CGFloat, v12);
  v14 = v22;
  v21 = 2;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v22, &type metadata for CGFloat, &v21, v5, &type metadata for CGFloat, v12);
  v15 = v22;
  v21 = 3;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v22, &type metadata for CGFloat, &v21, v5, &type metadata for CGFloat, v12);
  v16 = v22;
  v21 = 4;
  v17 = sub_100018C5C();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v22, &type metadata for SomeColor.ColorSpace, &v21, v5, &type metadata for SomeColor.ColorSpace, v17);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v22;
  result = sub_1000152C4(a1);
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = v14;
  *(_QWORD *)(a2 + 16) = v15;
  *(_QWORD *)(a2 + 24) = v16;
  *(_BYTE *)(a2 + 32) = v18;
  return result;
}

_QWORD *sub_100018BB0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100018BD4()
{
  unint64_t result;

  result = qword_100065E58;
  if (!qword_100065E58)
  {
    result = swift_getWitnessTable(&unk_100044C78, &type metadata for SomeColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065E58);
  }
  return result;
}

unint64_t sub_100018C18()
{
  unint64_t result;

  result = qword_100065E60;
  if (!qword_100065E60)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100065E60);
  }
  return result;
}

unint64_t sub_100018C5C()
{
  unint64_t result;

  result = qword_100065E68;
  if (!qword_100065E68)
  {
    result = swift_getWitnessTable(&unk_100044C50, &type metadata for SomeColor.ColorSpace);
    atomic_store(result, (unint64_t *)&qword_100065E68);
  }
  return result;
}

unint64_t sub_100018CA0()
{
  unint64_t result;

  result = qword_100065E78;
  if (!qword_100065E78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100065E78);
  }
  return result;
}

unint64_t sub_100018CE4()
{
  unint64_t result;

  result = qword_100065E80;
  if (!qword_100065E80)
  {
    result = swift_getWitnessTable(&unk_100044C28, &type metadata for SomeColor.ColorSpace);
    atomic_store(result, (unint64_t *)&qword_100065E80);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SomeColor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SomeColor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100018E04 + 4 * byte_1000449CA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100018E38 + 4 * byte_1000449C5[v4]))();
}

uint64_t sub_100018E38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018E40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018E48);
  return result;
}

uint64_t sub_100018E54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018E5CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100018E60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018E68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.CodingKeys()
{
  return &type metadata for SomeColor.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SomeColor.ColorSpace(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SomeColor.ColorSpace(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100018F60 + 4 * byte_1000449D4[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100018F94 + 4 * byte_1000449CF[v4]))();
}

uint64_t sub_100018F94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018F9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018FA4);
  return result;
}

uint64_t sub_100018FB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018FB8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100018FBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018FC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100018FD0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace()
{
  return &type metadata for SomeColor.ColorSpace;
}

unint64_t sub_100018FF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065E88;
  if (!qword_100065E88)
  {
    v1 = sub_100009E2C(&qword_100065E90);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100065E88);
  }
  return result;
}

unint64_t sub_100019040()
{
  unint64_t result;

  result = qword_100065E98;
  if (!qword_100065E98)
  {
    result = swift_getWitnessTable(&unk_100044B48, &type metadata for SomeColor.ColorSpace);
    atomic_store(result, (unint64_t *)&qword_100065E98);
  }
  return result;
}

unint64_t sub_100019088()
{
  unint64_t result;

  result = qword_100065EA0;
  if (!qword_100065EA0)
  {
    result = swift_getWitnessTable(&unk_100044C00, &type metadata for SomeColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065EA0);
  }
  return result;
}

unint64_t sub_1000190D0()
{
  unint64_t result;

  result = qword_100065EA8;
  if (!qword_100065EA8)
  {
    result = swift_getWitnessTable(&unk_100044B70, &type metadata for SomeColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065EA8);
  }
  return result;
}

unint64_t sub_100019118()
{
  unint64_t result;

  result = qword_100065EB0;
  if (!qword_100065EB0)
  {
    result = swift_getWitnessTable(&unk_100044B98, &type metadata for SomeColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065EB0);
  }
  return result;
}

unint64_t sub_10001915C()
{
  unint64_t result;

  result = qword_100065EC0;
  if (!qword_100065EC0)
  {
    result = swift_getWitnessTable(&unk_100044E34, &type metadata for SomeColor.ColorSpace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065EC0);
  }
  return result;
}

unint64_t sub_1000191A0()
{
  unint64_t result;

  result = qword_100065EC8;
  if (!qword_100065EC8)
  {
    result = swift_getWitnessTable(&unk_100044DF4, &type metadata for SomeColor.ColorSpace.CodingError);
    atomic_store(result, (unint64_t *)&qword_100065EC8);
  }
  return result;
}

uint64_t sub_1000191F0()
{
  return 0;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace.CodingError()
{
  return &type metadata for SomeColor.ColorSpace.CodingError;
}

uint64_t _s20ColorPickerUIService9SomeColorV10ColorSpaceO11CodingErrorOwet_0(unsigned int *a1, int a2)
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

uint64_t _s20ColorPickerUIService9SomeColorV10ColorSpaceO11CodingErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100019298 + 4 * byte_1000449D9[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000192B8 + 4 * byte_1000449DE[v4]))();
}

_BYTE *sub_100019298(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000192B8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000192C0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000192C8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000192D0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000192D8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace.CodingKeys()
{
  return &type metadata for SomeColor.ColorSpace.CodingKeys;
}

unint64_t sub_1000192F8()
{
  unint64_t result;

  result = qword_100065ED8;
  if (!qword_100065ED8)
  {
    result = swift_getWitnessTable(&unk_100044D64, &type metadata for SomeColor.ColorSpace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065ED8);
  }
  return result;
}

unint64_t sub_100019340()
{
  unint64_t result;

  result = qword_100065EE0;
  if (!qword_100065EE0)
  {
    result = swift_getWitnessTable(&unk_100044DCC, &type metadata for SomeColor.ColorSpace.CodingError);
    atomic_store(result, (unint64_t *)&qword_100065EE0);
  }
  return result;
}

unint64_t sub_100019388()
{
  unint64_t result;

  result = qword_100065EE8;
  if (!qword_100065EE8)
  {
    result = swift_getWitnessTable(&unk_100044CD4, &type metadata for SomeColor.ColorSpace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065EE8);
  }
  return result;
}

unint64_t sub_1000193D0()
{
  unint64_t result;

  result = qword_100065EF0;
  if (!qword_100065EF0)
  {
    result = swift_getWitnessTable(&unk_100044CFC, &type metadata for SomeColor.ColorSpace.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100065EF0);
  }
  return result;
}

double sub_100019414(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

uint64_t getEnumTagSinglePayload for SomeColor.Component(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SomeColor.Component(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100019504 + 4 * byte_1000449E8[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100019538 + 4 * byte_1000449E3[v4]))();
}

uint64_t sub_100019538(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019540(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100019548);
  return result;
}

uint64_t sub_100019554(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001955CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100019560(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019568(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.Component()
{
  return &type metadata for SomeColor.Component;
}

unint64_t sub_100019588()
{
  unint64_t result;

  result = qword_100065F08;
  if (!qword_100065F08)
  {
    result = swift_getWitnessTable(&unk_100044F08, &type metadata for SomeColor.Component);
    atomic_store(result, (unint64_t *)&qword_100065F08);
  }
  return result;
}

unint64_t sub_1000195CC(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_10001962C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SystemCloseButton.Coordinator()
{
  return objc_opt_self(_TtCV20ColorPickerUIService17SystemCloseButton11Coordinator);
}

_QWORD *assignWithCopy for SystemCloseButton(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for SystemCloseButton(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemCloseButton(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SystemCloseButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SystemCloseButton()
{
  return &type metadata for SystemCloseButton;
}

uint64_t sub_100019774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v1;
  v3 = v1[1];
  v5 = type metadata accessor for SystemCloseButton.Coordinator();
  v6 = swift_allocObject(v5, 32, 7);
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v3;
  *a1 = v6;
  return swift_retain(v3);
}

uint64_t sub_1000197B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10001987C();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100019808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10001987C();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100019858(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001987C();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_10001987C()
{
  unint64_t result;

  result = qword_100065FD0;
  if (!qword_100065FD0)
  {
    result = swift_getWitnessTable(&unk_100044F64, &type metadata for SystemCloseButton);
    atomic_store(result, (unint64_t *)&qword_100065FD0);
  }
  return result;
}

id sub_1000198C0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_1000060E4(&qword_100065FD8);
  __chkstk_darwin(v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 7);
  sub_1000060E4(&qword_100065FE0);
  UIViewRepresentableContext.coordinator.getter(&v12);
  v4 = v12;
  objc_msgSend(v3, "addTarget:action:forControlEvents:", v12, "primaryAction", 0x2000);
  swift_release(v4);
  v5 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)6)
  {
    sub_100019A38();
    v7 = v3;
    static UIShape.circle.getter();
    v8 = type metadata accessor for UIShape(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 0, 1, v8);
    v9 = (void *)UIHoverStyle.init(shape:)(v2);
    objc_msgSend(v7, "setHoverStyle:", v9);

  }
  return v3;
}

unint64_t sub_100019A38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100065FE8;
  if (!qword_100065FE8)
  {
    v1 = objc_opt_self(UIHoverStyle);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100065FE8);
  }
  return result;
}

void sub_100019A74(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
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
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  __int128 v44;
  id v45;
  id v46;
  double v47;
  char *v48;
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
  _QWORD *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _OWORD v122[3];

  v121 = a1;
  v116 = a3;
  v106 = type metadata accessor for GeometryProxy(0);
  v104 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin(v106);
  v102 = v4;
  v103 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = type metadata accessor for LocalCoordinateSpace(0);
  __chkstk_darwin(v98);
  v97 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = type metadata accessor for DragGesture(0);
  v107 = *(_QWORD *)(v108 - 8);
  __chkstk_darwin(v108);
  v105 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4(&qword_1000660A0);
  v110 = *(_QWORD *)(v7 - 8);
  v111 = v7;
  __chkstk_darwin(v7);
  v109 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000060E4(&qword_1000660A8);
  v114 = *(_QWORD *)(v9 - 8);
  v115 = v9;
  __chkstk_darwin(v9);
  v112 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v94);
  v12 = (double *)((char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for ColorSwatchPickerView(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = sub_1000060E4(&qword_1000660B0);
  __chkstk_darwin(v16);
  v18 = (char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_1000060E4(&qword_1000660B8);
  __chkstk_darwin(v91);
  v20 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_1000060E4(&qword_1000660C0);
  __chkstk_darwin(v92);
  v95 = (char *)&v91 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_1000060E4(&qword_1000660C8);
  __chkstk_darwin(v119);
  v120 = (uint64_t)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_1000060E4(&qword_1000660D0);
  v100 = *(_QWORD *)(v101 - 8);
  v23 = __chkstk_darwin(v101);
  v99 = (char *)&v91 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v18 = static HorizontalAlignment.center.getter(v23);
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 0;
  sub_1000060E4(&qword_1000660D8);
  v25 = *(_QWORD *)(*(_QWORD *)(a2 + *(int *)(v13 + 24)) + 16);
  *(_QWORD *)&v122[0] = 0;
  *((_QWORD *)&v122[0] + 1) = v25;
  KeyPath = swift_getKeyPath(&unk_100045B38);
  v113 = a2;
  sub_100009E80(a2, (uint64_t)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ColorSwatchPickerView);
  v27 = *(unsigned __int8 *)(v14 + 80);
  v28 = (v27 + 16) & ~v27;
  v96 = v28 + v15;
  v117 = v27 | 7;
  v29 = swift_allocObject(&unk_10005B580, v28 + v15, v27 | 7);
  v118 = v28;
  v93 = (uint64_t)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D9A4(v93, v29 + v28);
  v30 = sub_1000060E4(&qword_1000660E0);
  v31 = sub_1000060E4(&qword_1000660E8);
  v32 = sub_10001DA84();
  v33 = sub_100009FA0(&qword_100066100, &qword_1000660E8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  v34 = ForEach<>.init(_:id:content:)(v122, KeyPath, sub_10001DA38, v29, v30, v31, v32, &protocol witness table for Int, v33);
  v35 = GeometryProxy.size.getter(v34);
  if (qword_100065068 != -1)
    swift_once(&qword_100065068, sub_10001BD88);
  if (*(_QWORD *)(qword_10006B698 + 16))
  {
    v36 = (double)(*(_QWORD *)(*(_QWORD *)(qword_10006B698 + 32) + 16) >> 1);
    v38 = fmod(v35, v36);
    if (v36 * 0.5 > v38)
      v39 = -v38;
    else
      v39 = v36 - v38;
    v40 = v35 + v39;
    v41 = static Alignment.center.getter(v37);
    _FrameLayout.init(width:height:alignment:)(v122, *(_QWORD *)&v40, 0, 0, 1, v41, v42);
    sub_100009C1C((uint64_t)v18, (uint64_t)v20, &qword_1000660B0);
    v43 = &v20[*(int *)(v91 + 36)];
    v44 = v122[1];
    *(_OWORD *)v43 = v122[0];
    *((_OWORD *)v43 + 1) = v44;
    *((_OWORD *)v43 + 2) = v122[2];
    sub_100009CF0((uint64_t)v18, &qword_1000660B0);
    v45 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v46 = objc_msgSend(v45, "userInterfaceIdiom");

    if (v46 == (id)6)
      v47 = 16.0;
    else
      v47 = 8.0;
    v48 = (char *)v12 + *(int *)(v94 + 20);
    v49 = enum case for RoundedCornerStyle.continuous(_:);
    v50 = type metadata accessor for RoundedCornerStyle(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 104))(v48, v49, v50);
    *v12 = v47;
    v12[1] = v47;
    v51 = (uint64_t)v95;
    v52 = (uint64_t)&v95[*(int *)(v92 + 36)];
    sub_100009E80((uint64_t)v12, v52, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v52 + *(int *)(sub_1000060E4(&qword_1000656A8) + 36)) = 256;
    sub_100009C1C((uint64_t)v20, v51, &qword_1000660B8);
    sub_10001DB34((uint64_t)v12);
    sub_100009CF0((uint64_t)v20, &qword_1000660B8);
    v53 = v113;
    v54 = v93;
    sub_100009E80(v113, v93, type metadata accessor for ColorSwatchPickerView);
    v55 = v96;
    v56 = v117;
    v57 = swift_allocObject(&unk_10005B5A8, v96, v117);
    v58 = sub_10001D9A4(v54, v57 + v118);
    v59 = static Alignment.center.getter(v58);
    v61 = v60;
    v62 = v120;
    sub_100009C1C(v51, v120, &qword_1000660C0);
    v63 = (_QWORD *)(v62 + *(int *)(v119 + 36));
    *v63 = sub_10001DB74;
    v63[1] = v57;
    v63[2] = v59;
    v63[3] = v61;
    v64 = sub_100009CF0(v51, &qword_1000660C0);
    v65 = v97;
    static CoordinateSpaceProtocol<>.local.getter(v64);
    v66 = v105;
    DragGesture.init<A>(minimumDistance:coordinateSpace:)(v65, v98, &protocol witness table for LocalCoordinateSpace, 0.0);
    sub_100009E80(v53, v54, type metadata accessor for ColorSwatchPickerView);
    v67 = v104;
    v68 = v103;
    v69 = v106;
    (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v103, v121, v106);
    v70 = *(unsigned __int8 *)(v67 + 80);
    v71 = (v55 + v70) & ~v70;
    v72 = swift_allocObject(&unk_10005B5D0, v71 + v102, v56 | v70);
    v73 = v118;
    sub_10001D9A4(v54, v72 + v118);
    (*(void (**)(uint64_t, char *, uint64_t))(v67 + 32))(v72 + v71, v68, v69);
    v74 = sub_100006848(&qword_100066108, (uint64_t (*)(uint64_t))&type metadata accessor for DragGesture, (uint64_t)&protocol conformance descriptor for DragGesture);
    v75 = sub_100006848(&qword_100066110, (uint64_t (*)(uint64_t))&type metadata accessor for DragGesture.Value, (uint64_t)&protocol conformance descriptor for DragGesture.Value);
    v76 = v109;
    v77 = v108;
    Gesture<>.onChanged(_:)(sub_10001DCD4, v72, v108, v74, v75);
    swift_release(v72);
    (*(void (**)(char *, uint64_t))(v107 + 8))(v66, v77);
    sub_100009E80(v53, v54, type metadata accessor for ColorSwatchPickerView);
    v78 = swift_allocObject(&unk_10005B5F8, v55, v117);
    sub_10001D9A4(v54, v78 + v73);
    v79 = sub_100009FA0(&qword_100066118, &qword_1000660A0, (uint64_t)&protocol conformance descriptor for _ChangedGesture<A>);
    v81 = v111;
    v80 = v112;
    Gesture.onEnded(_:)(sub_10001DE0C, v78, v111, v79);
    swift_release(v78);
    v82 = (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v76, v81);
    v83 = static GestureMask.all.getter(v82);
    v84 = sub_10001DE48();
    v85 = sub_100009FA0(&qword_100066150, &qword_1000660A8, (uint64_t)&protocol conformance descriptor for _EndedGesture<A>);
    v86 = v99;
    v87 = v83;
    v88 = v115;
    v89 = v84;
    v90 = v120;
    View.gesture<A>(_:including:)(v80, v87, v119, v115, v89, v85);
    (*(void (**)(char *, uint64_t))(v114 + 8))(v80, v88);
    sub_100009CF0(v90, &qword_1000660C8);
    (*(void (**)(uint64_t, char *, uint64_t))(v100 + 32))(v116, v86, v101);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10001A424@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;

  v5 = *a1;
  *(_QWORD *)a3 = static VerticalAlignment.center.getter(a1);
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  sub_1000060E4(&qword_100066160);
  return sub_10001A47C(a2, v5);
}

uint64_t sub_10001A47C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];

  v4 = type metadata accessor for ColorSwatchPickerView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  result = __chkstk_darwin(v4);
  v8 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + *(int *)(result + 24));
    if (*(_QWORD *)(v9 + 16) > a2)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v9 + 8 * a2 + 32) + 16);
      v19[0] = 0;
      v19[1] = v10;
      KeyPath = swift_getKeyPath(&unk_100045B38);
      sub_100009E80(a1, (uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ColorSwatchPickerView);
      v12 = *(unsigned __int8 *)(v5 + 80);
      v13 = (v12 + 16) & ~v12;
      v14 = (v6 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
      v15 = swift_allocObject(&unk_10005B6C0, v14 + 8, v12 | 7);
      sub_10001D9A4((uint64_t)v8, v15 + v13);
      *(_QWORD *)(v15 + v14) = a2;
      v16 = sub_1000060E4(&qword_1000660E0);
      v17 = sub_10001DA84();
      v18 = sub_10001E2D8();
      return ForEach<>.init(_:id:content:)(v19, KeyPath, sub_10001E278, v15, v16, &type metadata for ColorSwatchPickerView.ColorCell, v17, &protocol witness table for Int, v18);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A5E0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;

  v7 = *a1;
  v8 = sub_10001B108();
  result = type metadata accessor for ColorSwatchPickerView(0);
  if ((v8 & 1) == 0)
    goto LABEL_7;
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = *(_QWORD *)(a2 + *(int *)(result + 28));
  if (*(_QWORD *)(v10 + 16) <= a3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(v10 + 8 * a3 + 32);
  if (v7 < *(_QWORD *)(v11 + 16))
  {
LABEL_11:
    v13 = v11 + 40 * v7;
    v14 = *(_BYTE *)(v13 + 64);
    v15 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)a4 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(a4 + 16) = v15;
    *(_BYTE *)(a4 + 32) = v14;
    *(_QWORD *)(a4 + 40) = a3;
    *(_QWORD *)(a4 + 48) = v7;
    return result;
  }
  __break(1u);
LABEL_7:
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v12 = *(_QWORD *)(a2 + *(int *)(result + 24));
  if (*(_QWORD *)(v12 + 16) <= a3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v11 = *(_QWORD *)(v12 + 8 * a3 + 32);
  if (v7 < *(_QWORD *)(v11 + 16))
    goto LABEL_11;
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001A6C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v6 = type metadata accessor for ColorSwatchPickerView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  sub_100009E80(a2, (uint64_t)v9, v11);
  v12 = *(unsigned __int8 *)(v7 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject(&unk_10005B670, v14 + 8, v12 | 7);
  sub_10001D9A4((uint64_t)v9, v15 + v13);
  *(_QWORD *)(v15 + v14) = v10;
  *a3 = sub_10001E0DC;
  a3[1] = v15;
  return swift_bridgeObjectRetain(v10);
}

double sub_10001A7A0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double result;
  __int128 v16;
  _OWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  static Alignment.center.getter(a1);
  v5 = sub_10001A8DC(a2, (uint64_t)v17);
  v6 = *((_QWORD *)&v18 + 1);
  v7 = static Alignment.topLeading.getter(v5);
  sub_10000F46C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v17, 0.0, 1, INFINITY, 0, v7, v8);
  swift_release(v6);
  v9 = v24;
  a3[10] = v23;
  a3[11] = v9;
  v10 = v26;
  a3[12] = v25;
  a3[13] = v10;
  v11 = v20;
  a3[6] = v19;
  a3[7] = v11;
  v12 = v22;
  a3[8] = v21;
  a3[9] = v12;
  v13 = v17[3];
  a3[2] = v17[2];
  a3[3] = v13;
  v14 = v18;
  a3[4] = v17[4];
  a3[5] = v14;
  result = *(double *)v17;
  v16 = v17[1];
  *a3 = v17[0];
  a3[1] = v16;
  return result;
}

uint64_t sub_10001A8DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat Width;
  CGFloat Height;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat MinX;
  CGFloat MinY;
  uint64_t result;
  uint64_t v38;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48[4];
  char v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  char v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v3 = v2;
  v6 = type metadata accessor for ColorSwatchPickerView(0);
  v7 = v2 + *(int *)(v6 + 20);
  v8 = *(double *)v7;
  if (*(_QWORD *)v7)
  {
    v9 = v6;
    KeyPath = swift_getKeyPath(&unk_100045B98);
    v11 = swift_getKeyPath(&unk_100045BC0);
    v12 = swift_retain(*(_QWORD *)&v8);
    static Published.subscript.getter(&v50, v12, KeyPath, v11);
    swift_release(*(_QWORD *)&v8);
    swift_release(KeyPath);
    swift_release(v11);
    v13 = 0.0;
    if (v52 == 2
      || (v54 = v50, v55 = v51, v56 = v52 & 1, sub_100017C8C((uint64_t)v48), (v14 = *(_QWORD *)(a1 + 16)) == 0))
    {
LABEL_13:
      v20 = 0;
      v21 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      v24 = 0.0;
LABEL_14:
      v57.origin.x = v23;
      v57.origin.y = v24;
      v57.size.width = v21;
      v57.size.height = v22;
      Width = CGRectGetWidth(v57);
      v58.origin.x = v23;
      v58.origin.y = v24;
      v58.size.width = v21;
      v58.size.height = v22;
      Height = CGRectGetHeight(v58);
      v28 = static Alignment.center.getter(v27);
      _FrameLayout.init(width:height:alignment:)(&v50, *(_QWORD *)&Width, 0, *(_QWORD *)&Height, 0, v28, v29);
      v30 = v50;
      LOBYTE(Height) = BYTE8(v50);
      v31 = v51;
      v32 = BYTE8(v51);
      v33 = v52;
      v34 = v53;
      v59.origin.x = v23;
      v59.origin.y = v24;
      v59.size.width = v21;
      v59.size.height = v22;
      MinX = CGRectGetMinX(v59);
      v60.origin.x = v23;
      v60.origin.y = v24;
      v60.size.width = v21;
      v60.size.height = v22;
      MinY = CGRectGetMinY(v60);
      result = swift_allocObject(&unk_10005B698, 24, 7);
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)a2 = v20;
      *(_QWORD *)(a2 + 8) = v30;
      *(_BYTE *)(a2 + 16) = LOBYTE(Height);
      *(_QWORD *)(a2 + 24) = v31;
      *(_BYTE *)(a2 + 32) = v32;
      *(_QWORD *)(a2 + 40) = v33;
      *(_QWORD *)(a2 + 48) = v34;
      *(CGFloat *)(a2 + 56) = MinX;
      *(CGFloat *)(a2 + 64) = MinY;
      *(double *)(a2 + 72) = v13;
      *(_QWORD *)(a2 + 80) = sub_10001E198;
      *(_QWORD *)(a2 + 88) = result;
      return result;
    }
    v7 = a1 + 48;
    while (v49 != *(_BYTE *)(v7 + 16)
         || vabdd_f64(*(double *)(v7 - 16), v48[0]) >= 0.001
         || vabdd_f64(*(double *)(v7 - 8), v48[1]) >= 0.001
         || vabdd_f64(*(double *)v7, v48[2]) >= 0.001)
    {
      v7 += 64;
      if (!--v14)
        goto LABEL_13;
    }
    v15 = *(_QWORD *)(v3 + *(int *)(v9 + 24));
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v18 = *(_QWORD *)(v7 + 24);
      v17 = *(_QWORD *)(v7 + 32);
      v19 = *(_QWORD *)(v7 + 40);
      if (v17 | v19)
      {
        v38 = v16 - 1;
        if (v38 == v17 && v19 == 0)
        {
          v20 = 4;
        }
        else
        {
          v40 = *(_QWORD *)(*(_QWORD *)(v15 + 32) + 16) - 1;
          if (v17 || v40 != v19)
          {
            if (v40 == v19 && v38 == v17)
              v20 = 8;
            else
              v20 = 0;
          }
          else
          {
            v20 = 2;
          }
        }
      }
      else
      {
        v20 = 1;
      }
      type metadata accessor for CGRect(0);
      v43 = v42;
      v44 = swift_retain(v18);
      GeometryProxy.subscript.getter(&v50, v44, v43);
      swift_release(v18);
      v24 = *((double *)&v50 + 1);
      v23 = *(double *)&v50;
      v13 = 1.0;
      v22 = *((double *)&v51 + 1);
      v21 = *(double *)&v51;
      goto LABEL_14;
    }
    __break(1u);
  }
  v45 = *(_QWORD *)(v7 + 8);
  v46 = type metadata accessor for ColorPickerState(0);
  v47 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v45, v46, v47);
  __break(1u);
  return result;
}

uint64_t sub_10001AC28(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  char v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[24];
  uint64_t v38;
  char v39;

  v2 = (_QWORD *)(a2 + *(int *)(type metadata accessor for ColorSwatchPickerView(0) + 20));
  v3 = *v2;
  if (!*v2)
    goto LABEL_8;
  v4 = (_QWORD *)swift_allocObject(&unk_10005B620, 40, 7);
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v3;
  v5 = (_QWORD *)swift_allocObject(&unk_10005B648, 40, 7);
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v3;
  swift_retain_n(v3, 2);
  Binding.init(get:set:)(&v33, sub_10000993C, v4, sub_10000994C, v5, &type metadata for SomeColor);
  v6 = v33;
  v7 = v34;
  v8 = sub_1000060E4(&qword_100066D40);
  Binding.wrappedValue.getter(v8);
  swift_release(v7);
  v9 = swift_release(v6);
  v10 = v38;
  v11 = v39;
  v12 = DragGesture.Value.location.getter(v9);
  v14 = v13;
  v15 = GeometryProxy.size.getter();
  sub_10001AE84((uint64_t)v37, v12, v14, v15, v16);
  v17 = *v2;
  if (!*v2)
    goto LABEL_8;
  KeyPath = swift_getKeyPath(&unk_100045B50);
  v19 = swift_getKeyPath(&unk_100045B78);
  LOBYTE(v33) = 1;
  swift_retain(v17);
  static Published.subscript.setter(&v33, v17, KeyPath, v19);
  v20 = *v2;
  if (*v2)
  {
    swift_retain(*v2);
    if ((v11 & 1) != 0)
      sub_100017DD0((uint64_t)&v33);
    else
      sub_100017C8C((uint64_t)&v33);
    v21 = v34;
    v22 = v35;
    v23 = v36;
    v24 = v33;
    v25 = swift_getKeyPath(&unk_100045B98);
    v26 = swift_getKeyPath(&unk_100045BC0);
    v31[0] = v24;
    v31[1] = v21;
    v31[2] = v22;
    v31[3] = v10;
    v32 = v23;
    return static Published.subscript.setter(v31, v20, v25, v26);
  }
  else
  {
LABEL_8:
    v28 = v2[1];
    v29 = type metadata accessor for ColorPickerState(0);
    v30 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v28, v29, v30);
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AE84@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;

  result = type metadata accessor for ColorSwatchPickerView(0);
  v12 = *(_QWORD *)(v5 + *(int *)(result + 24));
  v13 = *(_QWORD *)(v12 + 16);
  if (!v13)
  {
    __break(1u);
    goto LABEL_20;
  }
  v14 = floor(a3 / (a5 / (double)v13));
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(v12 + 32) + 16);
  v16 = v13 - 1;
  if (v16 >= (uint64_t)v14)
    v16 = (uint64_t)v14;
  v17 = floor(a2 / (a4 / (double)v15));
  if ((~*(_QWORD *)&v17 & 0x7FF0000000000000) == 0)
    goto LABEL_23;
  if (v17 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v18 = result;
  v19 = v16 & ~(v16 >> 63);
  v20 = v15 - 1;
  if (v15 - 1 >= (uint64_t)v17)
    v20 = (uint64_t)v17;
  v21 = v20 & ~(v20 >> 63);
  result = sub_10001B108();
  if ((result & 1) == 0)
    goto LABEL_16;
  v22 = *(_QWORD *)(v5 + *(int *)(v18 + 28));
  if (v19 >= *(_QWORD *)(v22 + 16))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v23 = *(_QWORD *)(v22 + 8 * v19 + 32);
  if (v21 < *(_QWORD *)(v23 + 16))
  {
LABEL_18:
    v24 = v23 + 40 * v21;
    v25 = *(_BYTE *)(v24 + 64);
    v26 = *(_OWORD *)(v24 + 48);
    *(_OWORD *)a1 = *(_OWORD *)(v24 + 32);
    *(_OWORD *)(a1 + 16) = v26;
    *(_BYTE *)(a1 + 32) = v25;
    return result;
  }
  __break(1u);
LABEL_16:
  if (v19 >= *(_QWORD *)(v12 + 16))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v12 + 32 + 8 * v19);
  if (v21 < *(_QWORD *)(v23 + 16))
    goto LABEL_18;
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10001B040(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ColorSwatchPickerView(0) + 20));
  v3 = *v2;
  if (*v2)
  {
    KeyPath = swift_getKeyPath(&unk_100045B50);
    v5 = swift_getKeyPath(&unk_100045B78);
    v10 = 0;
    swift_retain(v3);
    return static Published.subscript.setter(&v10, v3, KeyPath, v5);
  }
  else
  {
    v7 = v2[1];
    v8 = type metadata accessor for ColorPickerState(0);
    v9 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v7, v8, v9);
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void (*v23)(_BYTE *, uint64_t);
  void (*v24)(_BYTE *, uint64_t);
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[15];
  uint64_t v30;

  v1 = sub_1000060E4(&qword_100066158);
  __chkstk_darwin(v1);
  v3 = &v29[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for ColorScheme(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v6);
  v11 = &v29[-v10];
  __chkstk_darwin(v9);
  v13 = &v29[-v12];
  v14 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ColorSwatchPickerView(0) + 20));
  v15 = *v14;
  if (*v14)
  {
    KeyPath = swift_getKeyPath(&unk_100045BE0);
    v17 = swift_getKeyPath(&unk_100045C08);
    v18 = swift_retain(v15);
    static Published.subscript.getter(&v30, v18, KeyPath, v17);
    swift_release(v15);
    swift_release(KeyPath);
    swift_release(v17);
    if ((v30 & 1) != 0)
    {
      v19 = swift_getKeyPath(&unk_100045C28);
      v20 = swift_getKeyPath(&unk_100045C50);
      v21 = swift_retain(v15);
      static Published.subscript.getter(v3, v21, v19, v20);
      swift_release(v15);
      swift_release(v19);
      swift_release(v20);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
      {
        sub_100009CF0((uint64_t)v3, &qword_100066158);
        sub_100013EA8((uint64_t)v11);
        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v4);
        v22 = static ColorScheme.== infix(_:_:)(v11, v8);
        v23 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
        v23(v8, v4);
        v23(v11, v4);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v5 + 32))(v13, v3, v4);
        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v11, enum case for ColorScheme.dark(_:), v4);
        v22 = static ColorScheme.== infix(_:_:)(v13, v11);
        v24 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
        v24(v11, v4);
        v24(v13, v4);
      }
    }
    else
    {
      v22 = 0;
    }
    return v22 & 1;
  }
  else
  {
    v26 = v14[1];
    v27 = type metadata accessor for ColorPickerState(0);
    v28 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v26, v27, v28);
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B3DC@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v42;
  char *v43;
  __int128 v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[6];
  __int128 v49;
  __int128 v50;
  char v51;

  v47 = a1;
  v2 = type metadata accessor for Color.RGBColorSpace(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000060E4(&qword_100066180);
  __chkstk_darwin(v6);
  v43 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1000060E4(&qword_100066188);
  __chkstk_darwin(v46);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = *((unsigned __int8 *)v1 + 32);
  v51 = v45;
  v10 = v1[1];
  v44 = *v1;
  v49 = v44;
  v50 = v10;
  v11 = *((_QWORD *)v1 + 2);
  v12 = *((_QWORD *)v1 + 3);
  if ((_BYTE)v45)
    v13 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
  else
    v13 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *v13, v2);
  v14 = Color.init(_:red:green:blue:opacity:)(v5, *(double *)&v49, *((double *)&v49 + 1), *(double *)&v50, *((double *)&v50 + 1));
  v42 = v14;
  v15 = static Anchor.Source<A>.bounds.getter();
  v16 = swift_allocObject(&unk_10005B788, 72, 7);
  v17 = v1[1];
  *(_OWORD *)(v16 + 16) = *v1;
  *(_OWORD *)(v16 + 32) = v17;
  *(_OWORD *)(v16 + 48) = v1[2];
  *(_QWORD *)(v16 + 64) = *((_QWORD *)v1 + 6);
  v48[2] = v14;
  v48[3] = v15;
  v48[4] = sub_10001E438;
  v48[5] = v16;
  sub_1000176F4();
  v19 = v18;
  v20 = objc_msgSend(v18, "_accessibilityNameWithLuma");

  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v23 = v22;

  v48[0] = v21;
  v48[1] = v23;
  v24 = sub_10000CC44();
  v25 = Text.init<A>(_:)(v48, &type metadata for String, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30 & 1;
  v32 = sub_1000060E4(&qword_100066190);
  v33 = sub_10001E440();
  v34 = (uint64_t)v43;
  View.accessibility(label:)(v25, v27, v31, v29, v32, v33);
  sub_10000CC88(v25, v27, v31);
  swift_release(v16);
  swift_release(v15);
  swift_release(v42);
  swift_bridgeObjectRelease(v29);
  v35 = type metadata accessor for ColorPickerState(0);
  v36 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v37 = EnvironmentObject.init()(v35, v36);
  v39 = v38;
  sub_100009C1C(v34, (uint64_t)v9, &qword_100066180);
  v40 = &v9[*(int *)(v46 + 36)];
  *(_QWORD *)v40 = v37;
  *((_QWORD *)v40 + 1) = v39;
  *((_OWORD *)v40 + 1) = v44;
  *((_QWORD *)v40 + 4) = v11;
  *((_QWORD *)v40 + 5) = v12;
  v40[48] = v45;
  sub_100009CF0(v34, &qword_100066180);
  return sub_100009A88((uint64_t)v9, v47, &qword_100066188);
}

uint64_t sub_10001B6F4@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  char v10;

  v6 = sub_1000060E4(&qword_100066D60);
  v7 = swift_allocObject(v6, 96, 7);
  v8 = *a2;
  v9 = a2[1];
  *(_OWORD *)(v7 + 16) = xmmword_100042F50;
  *(_OWORD *)(v7 + 32) = v8;
  v10 = *((_BYTE *)a2 + 32);
  *(_OWORD *)(v7 + 48) = v9;
  *(_BYTE *)(v7 + 64) = v10;
  *(_QWORD *)(v7 + 72) = a1;
  *(_OWORD *)(v7 + 80) = *(__int128 *)((char *)a2 + 40);
  *a3 = v7;
  return swift_retain(a1);
}

uint64_t sub_10001B76C@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v15;
  double v16;
  uint64_t KeyPath;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  unint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  double v43[4];
  unsigned __int8 v44;
  __int128 v45;
  char v46;

  v39 = a2;
  v41 = a3;
  v4 = type metadata accessor for AccessibilityTraits(0);
  v36 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_1000060E4(&qword_1000661C8);
  v7 = __chkstk_darwin(v40);
  v35 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v37 = (char *)&v34 - v9;
  v38 = sub_1000060E4(&qword_1000661D0);
  __chkstk_darwin(v38);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000060E4(&qword_1000661D8);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a1;
  if (*(_QWORD *)a1)
  {
    KeyPath = swift_getKeyPath(&unk_100045B98);
    v18 = swift_getKeyPath(&unk_100045BC0);
    sub_100015D58(a1);
    static Published.subscript.getter(&v45, *(_QWORD *)&v16, KeyPath, v18);
    swift_release(KeyPath);
    swift_release(v18);
    sub_10001E9C4(a1);
    if (v46 == 2)
    {
      v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      v19(v15, v39, v12);
      v19(v11, (uint64_t)v15, v12);
      swift_storeEnumTagMultiPayload(v11, v38, 1);
      v20 = sub_10001E9EC();
      v21 = sub_100009FA0(&qword_1000661E8, &qword_1000661D8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
      _ConditionalContent<>.init(storage:)(v11, v40, v12, v20, v21);
      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
    else
    {
      v46 &= 1u;
      sub_100017C8C((uint64_t)v43);
      if (((v44 ^ *((unsigned __int8 *)a1 + 48)) & 1) != 0
        || vabdd_f64(v43[0], a1[2]) >= 0.001
        || vabdd_f64(v43[1], a1[3]) >= 0.001
        || vabdd_f64(v43[2], a1[4]) >= 0.001
        || vabdd_f64(v43[3], a1[5]) >= 0.001)
      {
        v42 = _swiftEmptyArrayStorage;
        v23 = sub_100006848(&qword_1000661F0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityTraits, (uint64_t)&protocol conformance descriptor for AccessibilityTraits);
        v24 = sub_1000060E4(&qword_1000661F8);
        v25 = sub_100009FA0(&qword_100066200, &qword_1000661F8, (uint64_t)&protocol conformance descriptor for [A]);
        dispatch thunk of SetAlgebra.init<A>(_:)(&v42, v24, v25, v4, v23);
      }
      else
      {
        static AccessibilityTraits.isSelected.getter();
      }
      v27 = v36;
      v26 = (uint64_t)v37;
      v28 = sub_100009FA0(&qword_1000661E8, &qword_1000661D8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
      v29 = (uint64_t)v35;
      View.accessibility(addTraits:)(v6, v12, v28);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
      sub_100009A88(v29, v26, &qword_1000661C8);
      sub_100009C1C(v26, (uint64_t)v11, &qword_1000661C8);
      swift_storeEnumTagMultiPayload(v11, v38, 0);
      v30 = sub_10001E9EC();
      _ConditionalContent<>.init(storage:)(v11, v40, v12, v30, v28);
      return sub_100009CF0(v26, &qword_1000661C8);
    }
  }
  else
  {
    v31 = *((_QWORD *)a1 + 1);
    v32 = type metadata accessor for ColorPickerState(0);
    v33 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v31, v32, v33);
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BBBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;
  _OWORD v5[3];
  char v6;

  v3 = *(_OWORD *)(v2 + 16);
  v5[0] = *(_OWORD *)v2;
  v5[1] = v3;
  v5[2] = *(_OWORD *)(v2 + 32);
  v6 = *(_BYTE *)(v2 + 48);
  return sub_10001B76C((double *)v5, a1, a2);
}

void sub_10001BBF8()
{
  qword_10006B690 = (uint64_t)&_swiftEmptyArrayStorage;
}

char *sub_10001BC0C(char *result)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *((_QWORD *)result + 2);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*((_QWORD *)v6 + 2))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_1000295D8(result, v11, 1, v3);
  v3 = result;
  if (!*((_QWORD *)v6 + 2))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (char *)swift_arrayInitWithCopy(&v3[64 * v7 + 32], v6 + 32, v2, &type metadata for ColorSwatchPickerView.ColorPreferenceData);
  if (!v2)
  {
LABEL_14:
    result = (char *)swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v8 = *((_QWORD *)v3 + 2);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *((_QWORD *)v3 + 2) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001BCF4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_100065060 != -1)
    swift_once(&qword_100065060, sub_10001BBF8);
  v2 = qword_10006B690;
  *a1 = qword_10006B690;
  return swift_bridgeObjectRetain(v2);
}

char *sub_10001BD44(uint64_t a1, void (*a2)(char **__return_ptr))
{
  char *v3;

  a2(&v3);
  return sub_10001BC0C(v3);
}

double sub_10001BD88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double result;
  __int128 v19;

  v0 = sub_1000060E4((uint64_t *)&unk_100066D50);
  v1 = swift_allocObject(v0, 112, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100045050;
  v2 = sub_1000060E4(&qword_1000658E8);
  v3 = swift_allocObject(v2, 512, 7);
  __asm { FMOV            V0.2D, #1.0 }
  v19 = _Q0;
  *(_OWORD *)(v3 + 16) = xmmword_100045060;
  *(_OWORD *)(v3 + 32) = _Q0;
  *(_OWORD *)(v3 + 48) = _Q0;
  *(_BYTE *)(v3 + 64) = 0;
  *(int64x2_t *)(v3 + 72) = vdupq_n_s64(0x3FED7D7D7D7D7D7DuLL);
  *(_OWORD *)(v3 + 88) = xmmword_100045070;
  *(_BYTE *)(v3 + 104) = 0;
  *(int64x2_t *)(v3 + 112) = vdupq_n_s64(0x3FEADADADADADADBuLL);
  *(_OWORD *)(v3 + 128) = xmmword_100045080;
  *(_BYTE *)(v3 + 144) = 0;
  *(int64x2_t *)(v3 + 152) = vdupq_n_s64(0x3FE8585858585858uLL);
  *(_OWORD *)(v3 + 168) = xmmword_100045090;
  *(_BYTE *)(v3 + 184) = 0;
  *(int64x2_t *)(v3 + 192) = vdupq_n_s64(0x3FE5B5B5B5B5B5B6uLL);
  *(_OWORD *)(v3 + 208) = xmmword_1000450A0;
  *(_BYTE *)(v3 + 224) = 0;
  *(int64x2_t *)(v3 + 232) = vdupq_n_s64(0x3FE3333333333333uLL);
  *(_OWORD *)(v3 + 248) = xmmword_1000450B0;
  *(_BYTE *)(v3 + 264) = 0;
  *(int64x2_t *)(v3 + 272) = vdupq_n_s64(0x3FE0B0B0B0B0B0B1uLL);
  *(_OWORD *)(v3 + 288) = xmmword_1000450C0;
  *(_BYTE *)(v3 + 304) = 0;
  *(_QWORD *)(v3 + 312) = 0x3FDC1C1C1C1C1C1CLL;
  *(int64x2_t *)(v3 + 320) = vdupq_n_s64(0x3FDC1C1C1C1C1C1CuLL);
  *(_QWORD *)(v3 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v3 + 344) = 0;
  *(int64x2_t *)(v3 + 352) = vdupq_n_s64(0x3FD7171717171717uLL);
  *(_OWORD *)(v3 + 368) = xmmword_1000450D0;
  *(_BYTE *)(v3 + 384) = 0;
  *(_QWORD *)(v3 + 392) = 0x3FD1D1D1D1D1D1D2;
  *(int64x2_t *)(v3 + 400) = vdupq_n_s64(0x3FD1D1D1D1D1D1D2uLL);
  *(_QWORD *)(v3 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v3 + 424) = 0;
  *(int64x2_t *)(v3 + 432) = vdupq_n_s64(0x3FC999999999999AuLL);
  *(_OWORD *)(v3 + 448) = xmmword_1000450E0;
  *(_BYTE *)(v3 + 464) = 0;
  *(_QWORD *)(v3 + 472) = 0;
  *(_QWORD *)(v3 + 480) = 0;
  *(_QWORD *)(v3 + 488) = 0;
  *(_QWORD *)(v3 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v3 + 504) = 0;
  *(_QWORD *)(v1 + 32) = v3;
  v9 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100045060;
  *(_OWORD *)(v9 + 32) = xmmword_1000450F0;
  *(_OWORD *)(v9 + 48) = xmmword_100045100;
  *(_BYTE *)(v9 + 64) = 0;
  *(_OWORD *)(v9 + 72) = xmmword_100045110;
  *(_OWORD *)(v9 + 88) = xmmword_100045120;
  *(_BYTE *)(v9 + 104) = 0;
  *(_OWORD *)(v9 + 112) = xmmword_100045130;
  *(_OWORD *)(v9 + 128) = xmmword_100045140;
  *(_BYTE *)(v9 + 144) = 0;
  *(_OWORD *)(v9 + 152) = xmmword_100045150;
  *(_OWORD *)(v9 + 168) = xmmword_100045160;
  *(_BYTE *)(v9 + 184) = 0;
  *(_OWORD *)(v9 + 192) = xmmword_100045170;
  *(_OWORD *)(v9 + 208) = xmmword_100045180;
  *(_BYTE *)(v9 + 224) = 0;
  *(_OWORD *)(v9 + 232) = xmmword_100045190;
  *(_OWORD *)(v9 + 248) = xmmword_1000451A0;
  *(_BYTE *)(v9 + 264) = 0;
  *(_OWORD *)(v9 + 272) = xmmword_1000451B0;
  *(_OWORD *)(v9 + 288) = xmmword_1000451C0;
  *(_BYTE *)(v9 + 304) = 0;
  *(_QWORD *)(v9 + 312) = 0x3FD6161616161616;
  *(_OWORD *)(v9 + 320) = xmmword_1000451D0;
  *(_QWORD *)(v9 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v9 + 344) = 0;
  *(_OWORD *)(v9 + 352) = xmmword_1000451E0;
  *(_OWORD *)(v9 + 368) = xmmword_1000451C0;
  *(_BYTE *)(v9 + 384) = 0;
  *(_QWORD *)(v9 + 392) = 0x3FD999999999999ALL;
  *(_OWORD *)(v9 + 400) = xmmword_1000451F0;
  *(_QWORD *)(v9 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v9 + 424) = 0;
  *(_OWORD *)(v9 + 432) = xmmword_100045200;
  *(_OWORD *)(v9 + 448) = xmmword_100045210;
  *(_BYTE *)(v9 + 464) = 0;
  *(_QWORD *)(v9 + 472) = 0x3FC3131313131313;
  *(_OWORD *)(v9 + 480) = xmmword_100045220;
  *(_QWORD *)(v9 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v9 + 504) = 0;
  *(_QWORD *)(v1 + 40) = v9;
  v10 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100045060;
  *(_OWORD *)(v10 + 32) = xmmword_100045230;
  *(_OWORD *)(v10 + 48) = xmmword_100045240;
  *(_BYTE *)(v10 + 64) = 0;
  *(_OWORD *)(v10 + 72) = xmmword_100045250;
  *(_OWORD *)(v10 + 88) = xmmword_100045260;
  *(_BYTE *)(v10 + 104) = 0;
  *(_OWORD *)(v10 + 112) = xmmword_100045270;
  *(_OWORD *)(v10 + 128) = xmmword_100045280;
  *(_BYTE *)(v10 + 144) = 0;
  *(_OWORD *)(v10 + 152) = xmmword_100045290;
  *(_OWORD *)(v10 + 168) = xmmword_1000452A0;
  *(_BYTE *)(v10 + 184) = 0;
  *(_OWORD *)(v10 + 192) = xmmword_1000452B0;
  *(_OWORD *)(v10 + 208) = xmmword_1000452C0;
  *(_BYTE *)(v10 + 224) = 0;
  *(_OWORD *)(v10 + 232) = xmmword_1000452D0;
  *(_OWORD *)(v10 + 248) = xmmword_1000451C0;
  *(_BYTE *)(v10 + 264) = 0;
  *(_OWORD *)(v10 + 272) = xmmword_1000452E0;
  *(_OWORD *)(v10 + 288) = xmmword_1000451C0;
  *(_BYTE *)(v10 + 304) = 0;
  *(_QWORD *)(v10 + 312) = 0x3FDE9E9E9E9E9E9FLL;
  *(_OWORD *)(v10 + 320) = xmmword_1000452F0;
  *(_QWORD *)(v10 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v10 + 344) = 0;
  *(_OWORD *)(v10 + 352) = xmmword_100045300;
  *(_OWORD *)(v10 + 368) = xmmword_1000451C0;
  *(_BYTE *)(v10 + 384) = 0;
  *(_QWORD *)(v10 + 392) = 0x3FE1B1B1B1B1B1B2;
  *(_OWORD *)(v10 + 400) = xmmword_100045310;
  *(_QWORD *)(v10 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v10 + 424) = 0;
  *(_OWORD *)(v10 + 432) = xmmword_100045320;
  *(_OWORD *)(v10 + 448) = xmmword_100045330;
  *(_BYTE *)(v10 + 464) = 0;
  *(_QWORD *)(v10 + 472) = 0x3FCC1C1C1C1C1C1CLL;
  *(_OWORD *)(v10 + 480) = xmmword_100045340;
  *(_QWORD *)(v10 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v10 + 504) = 0;
  *(_QWORD *)(v1 + 48) = v10;
  v11 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100045060;
  *(_OWORD *)(v11 + 32) = xmmword_100045350;
  *(_OWORD *)(v11 + 48) = xmmword_100045360;
  *(_BYTE *)(v11 + 64) = 0;
  *(_OWORD *)(v11 + 72) = xmmword_100045370;
  *(_OWORD *)(v11 + 88) = xmmword_100045380;
  *(_BYTE *)(v11 + 104) = 0;
  *(_OWORD *)(v11 + 112) = xmmword_100045390;
  *(_OWORD *)(v11 + 128) = xmmword_1000453A0;
  *(_BYTE *)(v11 + 144) = 0;
  *(_OWORD *)(v11 + 152) = xmmword_1000453B0;
  *(_OWORD *)(v11 + 168) = xmmword_1000453C0;
  *(_BYTE *)(v11 + 184) = 0;
  *(_OWORD *)(v11 + 192) = xmmword_1000453D0;
  *(_OWORD *)(v11 + 208) = xmmword_100045160;
  *(_BYTE *)(v11 + 224) = 0;
  *(_OWORD *)(v11 + 232) = xmmword_1000453E0;
  *(_OWORD *)(v11 + 248) = xmmword_1000451C0;
  *(_BYTE *)(v11 + 264) = 0;
  *(_OWORD *)(v11 + 272) = xmmword_1000453F0;
  *(_OWORD *)(v11 + 288) = xmmword_1000451C0;
  *(_BYTE *)(v11 + 304) = 0;
  *(_QWORD *)(v11 + 312) = 0x3FE5353535353535;
  *(_OWORD *)(v11 + 320) = xmmword_100045400;
  *(_QWORD *)(v11 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v11 + 344) = 0;
  *(_OWORD *)(v11 + 352) = xmmword_100045410;
  *(_OWORD *)(v11 + 368) = xmmword_1000451A0;
  *(_BYTE *)(v11 + 384) = 0;
  *(_QWORD *)(v11 + 392) = 0x3FE8989898989899;
  *(_OWORD *)(v11 + 400) = xmmword_100045420;
  *(_QWORD *)(v11 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v11 + 424) = 0;
  *(_OWORD *)(v11 + 432) = xmmword_100045430;
  *(_OWORD *)(v11 + 448) = xmmword_100045440;
  *(_BYTE *)(v11 + 464) = 0;
  *(_QWORD *)(v11 + 472) = 0x3FD3939393939394;
  *(_OWORD *)(v11 + 480) = xmmword_100045450;
  *(_QWORD *)(v11 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v11 + 504) = 0;
  *(_QWORD *)(v1 + 56) = v11;
  v12 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100045060;
  *(_OWORD *)(v12 + 32) = xmmword_100045460;
  *(_OWORD *)(v12 + 48) = xmmword_100045470;
  *(_BYTE *)(v12 + 64) = 0;
  *(_OWORD *)(v12 + 72) = xmmword_100045480;
  *(_OWORD *)(v12 + 88) = xmmword_100045080;
  *(_BYTE *)(v12 + 104) = 0;
  *(_OWORD *)(v12 + 112) = xmmword_100045490;
  *(_OWORD *)(v12 + 128) = xmmword_1000454A0;
  *(_BYTE *)(v12 + 144) = 0;
  *(_OWORD *)(v12 + 152) = xmmword_1000454B0;
  *(_OWORD *)(v12 + 168) = xmmword_1000454C0;
  *(_BYTE *)(v12 + 184) = 0;
  *(_OWORD *)(v12 + 192) = xmmword_1000454D0;
  *(_OWORD *)(v12 + 208) = xmmword_1000454E0;
  *(_BYTE *)(v12 + 224) = 0;
  *(_OWORD *)(v12 + 232) = xmmword_1000454F0;
  *(_OWORD *)(v12 + 248) = xmmword_1000451C0;
  *(_BYTE *)(v12 + 264) = 0;
  *(_OWORD *)(v12 + 272) = xmmword_100045500;
  *(_OWORD *)(v12 + 288) = xmmword_1000451C0;
  *(_BYTE *)(v12 + 304) = 0;
  *(_QWORD *)(v12 + 312) = 0x3FEA7A7A7A7A7A7ALL;
  *(_OWORD *)(v12 + 320) = xmmword_100045510;
  *(_QWORD *)(v12 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v12 + 344) = 0;
  *(_OWORD *)(v12 + 352) = xmmword_100045520;
  *(_OWORD *)(v12 + 368) = xmmword_1000451A0;
  *(_BYTE *)(v12 + 384) = 0;
  *(_QWORD *)(v12 + 392) = 0x3FEEBEBEBEBEBEBFLL;
  *(_OWORD *)(v12 + 400) = xmmword_100045530;
  *(_QWORD *)(v12 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v12 + 424) = 0;
  *(_OWORD *)(v12 + 432) = xmmword_100045540;
  *(_OWORD *)(v12 + 448) = xmmword_100045550;
  *(_BYTE *)(v12 + 464) = 0;
  *(_QWORD *)(v12 + 472) = 0x3FD999999999999ALL;
  *(_OWORD *)(v12 + 480) = xmmword_100045560;
  *(_QWORD *)(v12 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v12 + 504) = 0;
  *(_QWORD *)(v1 + 64) = v12;
  v13 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100045060;
  *(_OWORD *)(v13 + 32) = xmmword_100045570;
  *(_OWORD *)(v13 + 48) = xmmword_100045580;
  *(_BYTE *)(v13 + 64) = 0;
  *(_OWORD *)(v13 + 72) = xmmword_100045590;
  *(_OWORD *)(v13 + 88) = xmmword_1000455A0;
  *(_BYTE *)(v13 + 104) = 0;
  *(_OWORD *)(v13 + 112) = xmmword_1000455B0;
  *(_OWORD *)(v13 + 128) = xmmword_1000455C0;
  *(_BYTE *)(v13 + 144) = 0;
  *(_OWORD *)(v13 + 152) = xmmword_1000455D0;
  *(_OWORD *)(v13 + 168) = xmmword_1000455E0;
  *(_BYTE *)(v13 + 184) = 0;
  *(_OWORD *)(v13 + 192) = xmmword_1000455F0;
  *(_OWORD *)(v13 + 208) = xmmword_100045600;
  *(_BYTE *)(v13 + 224) = 0;
  *(_OWORD *)(v13 + 232) = xmmword_100045610;
  *(_OWORD *)(v13 + 248) = xmmword_100045620;
  *(_BYTE *)(v13 + 264) = 0;
  *(_OWORD *)(v13 + 272) = xmmword_100045630;
  *(_OWORD *)(v13 + 288) = xmmword_1000451C0;
  *(_BYTE *)(v13 + 304) = 0;
  *(_QWORD *)(v13 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v13 + 320) = xmmword_100045640;
  *(_QWORD *)(v13 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v13 + 344) = 0;
  *(_OWORD *)(v13 + 352) = xmmword_100045650;
  *(_OWORD *)(v13 + 368) = xmmword_1000451C0;
  *(_BYTE *)(v13 + 384) = 0;
  *(_QWORD *)(v13 + 392) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v13 + 400) = xmmword_100045660;
  *(_QWORD *)(v13 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v13 + 424) = 0;
  *(_OWORD *)(v13 + 432) = xmmword_100045670;
  *(_OWORD *)(v13 + 448) = xmmword_100045680;
  *(_BYTE *)(v13 + 464) = 0;
  *(_QWORD *)(v13 + 472) = 0x3FDD9D9D9D9D9D9ELL;
  *(_OWORD *)(v13 + 480) = xmmword_100045690;
  *(_QWORD *)(v13 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v13 + 504) = 0;
  *(_QWORD *)(v1 + 72) = v13;
  v14 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v14 + 16) = xmmword_100045060;
  *(_OWORD *)(v14 + 32) = xmmword_1000456A0;
  *(_OWORD *)(v14 + 48) = xmmword_1000456B0;
  *(_BYTE *)(v14 + 64) = 0;
  *(_OWORD *)(v14 + 72) = xmmword_1000456C0;
  *(_OWORD *)(v14 + 88) = xmmword_1000455A0;
  *(_BYTE *)(v14 + 104) = 0;
  *(_OWORD *)(v14 + 112) = xmmword_1000456D0;
  *(_OWORD *)(v14 + 128) = xmmword_100045070;
  *(_BYTE *)(v14 + 144) = 0;
  *(_OWORD *)(v14 + 152) = xmmword_1000456E0;
  *(_OWORD *)(v14 + 168) = xmmword_1000456F0;
  *(_BYTE *)(v14 + 184) = 0;
  *(_OWORD *)(v14 + 192) = xmmword_100045700;
  *(_OWORD *)(v14 + 208) = xmmword_100045710;
  *(_BYTE *)(v14 + 224) = 0;
  *(_OWORD *)(v14 + 232) = xmmword_100045720;
  *(_OWORD *)(v14 + 248) = xmmword_100045730;
  *(_BYTE *)(v14 + 264) = 0;
  *(_OWORD *)(v14 + 272) = xmmword_100045740;
  *(_OWORD *)(v14 + 288) = xmmword_100045750;
  *(_BYTE *)(v14 + 304) = 0;
  *(_QWORD *)(v14 + 312) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v14 + 320) = xmmword_100045760;
  *(_QWORD *)(v14 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v14 + 344) = 0;
  *(_OWORD *)(v14 + 352) = xmmword_100045770;
  *(_OWORD *)(v14 + 368) = xmmword_100045780;
  *(_BYTE *)(v14 + 384) = 0;
  *(_QWORD *)(v14 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v14 + 400) = xmmword_100045790;
  *(_QWORD *)(v14 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v14 + 424) = 0;
  *(_OWORD *)(v14 + 432) = xmmword_1000457A0;
  *(_OWORD *)(v14 + 448) = xmmword_100045240;
  *(_BYTE *)(v14 + 464) = 0;
  *(_QWORD *)(v14 + 472) = 0x3FE2D2D2D2D2D2D3;
  *(_OWORD *)(v14 + 480) = xmmword_1000457B0;
  *(_QWORD *)(v14 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v14 + 504) = 0;
  *(_QWORD *)(v1 + 80) = v14;
  v15 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v15 + 16) = xmmword_100045060;
  *(_OWORD *)(v15 + 32) = xmmword_1000457C0;
  *(_OWORD *)(v15 + 48) = xmmword_1000456B0;
  *(_BYTE *)(v15 + 64) = 0;
  *(_OWORD *)(v15 + 72) = xmmword_1000457D0;
  *(_OWORD *)(v15 + 88) = v19;
  *(_BYTE *)(v15 + 104) = 0;
  *(_OWORD *)(v15 + 112) = xmmword_1000457E0;
  *(_OWORD *)(v15 + 128) = xmmword_1000455A0;
  *(_BYTE *)(v15 + 144) = 0;
  *(_OWORD *)(v15 + 152) = xmmword_1000457F0;
  *(_OWORD *)(v15 + 168) = xmmword_1000455A0;
  *(_BYTE *)(v15 + 184) = 0;
  *(_OWORD *)(v15 + 192) = xmmword_100045800;
  *(_OWORD *)(v15 + 208) = xmmword_1000454C0;
  *(_BYTE *)(v15 + 224) = 0;
  *(_OWORD *)(v15 + 232) = xmmword_100045810;
  *(_OWORD *)(v15 + 248) = xmmword_100045820;
  *(_BYTE *)(v15 + 264) = 0;
  *(_OWORD *)(v15 + 272) = xmmword_100045830;
  *(_OWORD *)(v15 + 288) = xmmword_100045840;
  *(_BYTE *)(v15 + 304) = 0;
  *(_QWORD *)(v15 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v15 + 320) = xmmword_100045850;
  *(_QWORD *)(v15 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v15 + 344) = 0;
  *(_OWORD *)(v15 + 352) = xmmword_100045860;
  *(_OWORD *)(v15 + 368) = xmmword_1000453A0;
  *(_BYTE *)(v15 + 384) = 0;
  *(_QWORD *)(v15 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v15 + 400) = xmmword_100045870;
  *(_QWORD *)(v15 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v15 + 424) = 0;
  *(_OWORD *)(v15 + 432) = xmmword_100045880;
  *(_OWORD *)(v15 + 448) = xmmword_100045360;
  *(_BYTE *)(v15 + 464) = 0;
  *(_QWORD *)(v15 + 472) = 0x3FE6363636363636;
  *(_OWORD *)(v15 + 480) = xmmword_100045890;
  *(_QWORD *)(v15 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v15 + 504) = 0;
  *(_QWORD *)(v1 + 88) = v15;
  v16 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v16 + 16) = xmmword_100045060;
  *(_OWORD *)(v16 + 32) = xmmword_1000458A0;
  *(_OWORD *)(v16 + 48) = xmmword_1000458B0;
  *(_BYTE *)(v16 + 64) = 0;
  *(_OWORD *)(v16 + 72) = xmmword_1000458C0;
  *(_OWORD *)(v16 + 88) = v19;
  *(_BYTE *)(v16 + 104) = 0;
  *(_OWORD *)(v16 + 112) = xmmword_1000458D0;
  *(_OWORD *)(v16 + 128) = xmmword_1000455A0;
  *(_BYTE *)(v16 + 144) = 0;
  *(_OWORD *)(v16 + 152) = xmmword_1000458E0;
  *(_OWORD *)(v16 + 168) = xmmword_1000455A0;
  *(_BYTE *)(v16 + 184) = 0;
  *(_OWORD *)(v16 + 192) = xmmword_1000458F0;
  *(_OWORD *)(v16 + 208) = xmmword_100045900;
  *(_BYTE *)(v16 + 224) = 0;
  *(_OWORD *)(v16 + 232) = xmmword_100045910;
  *(_OWORD *)(v16 + 248) = xmmword_100045920;
  *(_BYTE *)(v16 + 264) = 0;
  *(_OWORD *)(v16 + 272) = xmmword_100045930;
  *(_OWORD *)(v16 + 288) = xmmword_100045940;
  *(_BYTE *)(v16 + 304) = 0;
  *(_QWORD *)(v16 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v16 + 320) = xmmword_100045950;
  *(_QWORD *)(v16 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v16 + 344) = 0;
  *(_OWORD *)(v16 + 352) = xmmword_100045960;
  *(_OWORD *)(v16 + 368) = xmmword_100045970;
  *(_BYTE *)(v16 + 384) = 0;
  *(_QWORD *)(v16 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v16 + 400) = xmmword_100045980;
  *(_QWORD *)(v16 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v16 + 424) = 0;
  *(_OWORD *)(v16 + 432) = xmmword_100045990;
  *(_OWORD *)(v16 + 448) = xmmword_1000459A0;
  *(_BYTE *)(v16 + 464) = 0;
  *(_QWORD *)(v16 + 472) = 0x3FE9B9B9B9B9B9BALL;
  *(_OWORD *)(v16 + 480) = xmmword_1000459B0;
  *(_QWORD *)(v16 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v16 + 504) = 0;
  *(_QWORD *)(v1 + 96) = v16;
  v17 = swift_allocObject(v2, 512, 7);
  *(_OWORD *)(v17 + 16) = xmmword_100045060;
  *(_OWORD *)(v17 + 32) = xmmword_1000459C0;
  *(_OWORD *)(v17 + 48) = v19;
  *(_BYTE *)(v17 + 64) = 0;
  *(_OWORD *)(v17 + 72) = xmmword_1000459D0;
  *(_OWORD *)(v17 + 88) = v19;
  *(_BYTE *)(v17 + 104) = 0;
  *(_OWORD *)(v17 + 112) = xmmword_1000459E0;
  *(_OWORD *)(v17 + 128) = xmmword_1000455A0;
  *(_BYTE *)(v17 + 144) = 0;
  *(_OWORD *)(v17 + 152) = xmmword_1000459F0;
  *(_OWORD *)(v17 + 168) = v19;
  *(_BYTE *)(v17 + 184) = 0;
  *(_OWORD *)(v17 + 192) = xmmword_100045A00;
  *(_OWORD *)(v17 + 208) = xmmword_100045A10;
  *(_BYTE *)(v17 + 224) = 0;
  *(_OWORD *)(v17 + 232) = xmmword_100045A20;
  *(_OWORD *)(v17 + 248) = xmmword_100045580;
  *(_BYTE *)(v17 + 264) = 0;
  *(_OWORD *)(v17 + 272) = xmmword_100045A30;
  *(_OWORD *)(v17 + 288) = xmmword_100045080;
  *(_BYTE *)(v17 + 304) = 0;
  *(_QWORD *)(v17 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v17 + 320) = xmmword_100045A40;
  *(_QWORD *)(v17 + 336) = 0x3FF0000000000000;
  *(_BYTE *)(v17 + 344) = 0;
  *(_OWORD *)(v17 + 352) = xmmword_100045A50;
  *(_OWORD *)(v17 + 368) = xmmword_100045A60;
  *(_BYTE *)(v17 + 384) = 0;
  *(_QWORD *)(v17 + 392) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v17 + 400) = xmmword_100045A70;
  *(_QWORD *)(v17 + 416) = 0x3FF0000000000000;
  *(_BYTE *)(v17 + 424) = 0;
  *(_OWORD *)(v17 + 432) = xmmword_100045A80;
  *(_OWORD *)(v17 + 448) = xmmword_100045A90;
  *(_BYTE *)(v17 + 464) = 0;
  *(_QWORD *)(v17 + 472) = 0x3FEBFBFBFBFBFBFCLL;
  result = 0.933333333;
  *(_OWORD *)(v17 + 480) = xmmword_100045AA0;
  *(_QWORD *)(v17 + 496) = 0x3FF0000000000000;
  *(_BYTE *)(v17 + 504) = 0;
  *(_QWORD *)(v1 + 104) = v17;
  qword_10006B698 = v1;
  return result;
}

void sub_10001CB94()
{
  uint64_t v0;

  sub_10001CBB0();
  qword_100065FF0 = v0;
}

void sub_10001CBB0()
{
  char *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  double *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  const __CFString *v20;
  CGColorSpace *v21;
  CGColorSpace *v22;
  CGColorRef v23;
  id v24;
  id v25;
  CGColor *v26;
  void *v27;
  id v28;
  CGColorSpace *v29;
  CGColorSpace *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CGFloat Alpha;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGFloat v50[4];
  _QWORD *v51;
  _QWORD *v52;

  if (qword_100065068 != -1)
    goto LABEL_40;
  while (1)
  {
    v1 = (_QWORD *)qword_10006B698;
    v2 = *(_QWORD *)(qword_10006B698 + 16);
    if (v2)
    {
      v3 = *(_QWORD *)(qword_10006B698 + 32);
      swift_bridgeObjectRetain(qword_10006B698);
      v4 = (char *)swift_bridgeObjectRetain(v3);
      v0 = sub_10001D050(v4);
      if ((swift_isUniquelyReferenced_nonNull_native(v1) & 1) != 0)
      {
        if (!v1[2])
          goto LABEL_43;
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    v1 = sub_100029E40(v1);
    if (!v1[2])
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
LABEL_5:
    v5 = v1[4];
    v1[4] = v0;
    swift_bridgeObjectRelease(v5);
    if (v2 == 1)
      break;
    v0 = (char *)(v2 + 3);
    v6 = 5;
    while (v0 != (char *)3)
    {
      if ((unint64_t)(v0 - 4) >= *(_QWORD *)(qword_10006B698 + 16))
        goto LABEL_38;
      v7 = v1[2];
      v8 = swift_bridgeObjectRetain(*(_QWORD *)(qword_10006B698 + 8 * (_QWORD)v0));
      if (v6 - 4 >= v7)
        goto LABEL_39;
      v9 = v1[v6];
      v1[v6] = v8;
      swift_bridgeObjectRelease(v9);
      --v0;
      ++v6;
      if (v0 == (char *)4)
        goto LABEL_11;
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once(&qword_100065068, sub_10001BD88);
  }
LABEL_11:
  v10 = v1[2];
  if (!v10)
  {
    swift_bridgeObjectRelease(v1);
    return;
  }
  v52 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v1);
  sub_100029824(0, v10, 0);
  v11 = 0;
  v44 = v10;
  while (1)
  {
    v46 = v11;
    v12 = v1[v11 + 4];
    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
      break;
    v37 = &_swiftEmptyArrayStorage;
LABEL_30:
    v41 = v52;
    if ((swift_isUniquelyReferenced_nonNull_native(v52) & 1) == 0)
    {
      sub_100029824(0, v41[2] + 1, 1);
      v41 = v52;
    }
    v43 = v41[2];
    v42 = v41[3];
    if (v43 >= v42 >> 1)
    {
      sub_100029824((_QWORD *)(v42 > 1), v43 + 1, 1);
      v41 = v52;
    }
    v11 = v46 + 1;
    v41[2] = v43 + 1;
    v41[v43 + 4] = v37;
    if (v46 + 1 == v10)
    {
      swift_bridgeObjectRelease_n(v1, 2);
      return;
    }
  }
  v51 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v12);
  sub_1000297EC(0, v13, 0);
  v14 = (void *)objc_opt_self(UIColor);
  v45 = v12;
  v15 = (double *)(v12 + 64);
  while (1)
  {
    v16 = *(v15 - 4);
    v17 = *(v15 - 3);
    v18 = *(v15 - 2);
    v19 = *(v15 - 1);
    v20 = *(_BYTE *)v15 ? kCGColorSpaceDisplayP3 : kCGColorSpaceSRGB;
    v21 = CGColorSpaceCreateWithName(v20);
    if (!v21)
      break;
    v22 = v21;
    v50[0] = v16;
    v50[1] = v17;
    v50[2] = v18;
    v50[3] = v19;
    v23 = CGColorCreate(v21, v50);

    if (!v23)
      goto LABEL_45;
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithCGColor:", v23);

    v25 = objc_msgSend(v14, "_convertColorPickerColor:fromUserInterfaceStyle:to:", v24, 1, 2);
    v26 = (CGColor *)objc_msgSend(v25, "CGColor");
    v27 = (void *)UISCreateCachedColorTransform(kCGColorSpaceSRGB);
    v48 = 0;
    v49 = 0;
    v47 = 0;
    if (!v27)
      goto LABEL_46;
    v28 = v27;
    v29 = CGColorGetColorSpace(v26);
    if (!v29)
      goto LABEL_47;
    v30 = v29;
    v31 = CGColorRef.components.getter();
    if (!v31)
      goto LABEL_48;
    v32 = v31;
    CGColorTransformConvertColorComponents(v28, v30, 3, v31 + 32, &v47);

    swift_bridgeObjectRelease(v32);
    v33 = v47;
    v34 = v48;
    v35 = v49;
    Alpha = CGColorGetAlpha(v26);

    v37 = v51;
    if ((swift_isUniquelyReferenced_nonNull_native(v51) & 1) == 0)
    {
      sub_1000297EC(0, v37[2] + 1, 1);
      v37 = v51;
    }
    v39 = v37[2];
    v38 = v37[3];
    if (v39 >= v38 >> 1)
    {
      sub_1000297EC((char *)(v38 > 1), v39 + 1, 1);
      v37 = v51;
    }
    v37[2] = v39 + 1;
    v40 = (char *)&v37[5 * v39];
    *((_QWORD *)v40 + 4) = v33;
    *((_QWORD *)v40 + 5) = v34;
    *((_QWORD *)v40 + 6) = v35;
    *((CGFloat *)v40 + 7) = Alpha;
    v40[64] = 0;
    v15 += 5;
    if (!--v13)
    {
      swift_bridgeObjectRelease(v45);
      v10 = v44;
      goto LABEL_30;
    }
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
}

char *sub_10001D050(char *result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;

  v1 = (uint64_t)result;
  v2 = *((_QWORD *)result + 2);
  if (v2 < 2)
    return (char *)v1;
  v3 = 0;
  v4 = v2 >> 1;
  v5 = v2 - 1;
  v6 = 40 * v2 - 8;
  for (i = 32; ; i += 40)
  {
    if (v3 == v5)
      goto LABEL_5;
    v10 = *(_QWORD *)(v1 + 16);
    if (v3 >= v10)
      break;
    if (v5 >= v10)
      goto LABEL_12;
    v17 = *(_OWORD *)(v1 + i + 16);
    v18 = *(_OWORD *)(v1 + i);
    v11 = *(_BYTE *)(v1 + i + 32);
    v12 = *(_QWORD *)(v1 + v6);
    v13 = *(_QWORD *)(v1 + v6 + 8);
    v14 = *(_QWORD *)(v1 + v6 + 16);
    v15 = *(_QWORD *)(v1 + v6 + 24);
    v16 = *(_BYTE *)(v1 + v6 + 32);
    result = (char *)swift_isUniquelyReferenced_nonNull_native(v1);
    if ((result & 1) == 0)
    {
      result = sub_100029E2C(v1);
      v1 = (uint64_t)result;
    }
    v8 = v1 + i;
    *(_QWORD *)v8 = v12;
    *(_QWORD *)(v8 + 8) = v13;
    *(_QWORD *)(v8 + 16) = v14;
    *(_QWORD *)(v8 + 24) = v15;
    *(_BYTE *)(v8 + 32) = v16;
    v9 = v1 + v6;
    *(_OWORD *)v9 = v18;
    *(_OWORD *)(v9 + 16) = v17;
    *(_BYTE *)(v9 + 32) = v11;
LABEL_5:
    ++v3;
    --v5;
    v6 -= 40;
    if (v4 == v3)
      return (char *)v1;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10001D16C@<X0>(uint64_t a1@<X0>, void (**a2)(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_100009E80(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ColorSwatchPickerView);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10005B558, v7 + v5, v6 | 7);
  result = sub_10001D9A4((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = sub_10001D9E8;
  a2[1] = (void (*)(uint64_t@<X0>, uint64_t@<X8>))v8;
  return result;
}

uint64_t *sub_10001D218(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000060E4(&qword_100065B20);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = *v17;
    v19 = v17[1];
    *v16 = v18;
    v16[1] = v19;
    v20 = *(uint64_t *)((char *)a2 + v15);
    *(uint64_t *)((char *)a1 + v15) = v20;
    v21 = a3[7];
    v22 = *(uint64_t *)((char *)a2 + v21);
    *(uint64_t *)((char *)a1 + v21) = v22;
    swift_retain(v18);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v22);
  }
  return a1;
}

uint64_t sub_10001D320(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  swift_release(*(_QWORD *)((char *)a1 + a2[5]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[6]));
  return swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[7]));
}

uint64_t *sub_10001D3A8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = (uint64_t *)((char *)a1 + v12);
  v15 = (uint64_t *)((char *)a2 + v12);
  v16 = *v15;
  v17 = v15[1];
  *v14 = v16;
  v14[1] = v17;
  v18 = *(uint64_t *)((char *)a2 + v13);
  *(uint64_t *)((char *)a1 + v13) = v18;
  v19 = a3[7];
  v20 = *(uint64_t *)((char *)a2 + v19);
  *(uint64_t *)((char *)a1 + v19) = v20;
  swift_retain(v16);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v20);
  return a1;
}

uint64_t *sub_10001D484(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a1 != a2)
  {
    sub_100009CF0((uint64_t)a1, &qword_100065B20);
    v6 = sub_1000060E4(&qword_100065B20);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(uint64_t *)((char *)a1 + v12);
  v16 = *(uint64_t *)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = v16;
  swift_retain(v16);
  swift_release(v15);
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  v17 = a3[6];
  v18 = *(uint64_t *)((char *)a2 + v17);
  v19 = *(uint64_t *)((char *)a1 + v17);
  *(uint64_t *)((char *)a1 + v17) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  v20 = a3[7];
  v21 = *(uint64_t *)((char *)a2 + v20);
  v22 = *(uint64_t *)((char *)a1 + v20);
  *(uint64_t *)((char *)a1 + v20) = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v22);
  return a1;
}

char *sub_10001D5A8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  return a1;
}

char *sub_10001D664(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_100009CF0((uint64_t)a1, &qword_100065B20);
    v6 = sub_1000060E4(&qword_100065B20);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *(_QWORD *)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  swift_release(v11);
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  v12 = a3[6];
  v13 = *(_QWORD *)&a1[v12];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];
  swift_bridgeObjectRelease(v13);
  v14 = a3[7];
  v15 = *(_QWORD *)&a1[v14];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  swift_bridgeObjectRelease(v15);
  return a1;
}

uint64_t sub_10001D76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001D778);
}

uint64_t sub_10001D778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1000060E4(&qword_100065FF8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10001D7F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001D804);
}

uint64_t sub_10001D804(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000060E4(&qword_100065FF8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for ColorSwatchPickerView(uint64_t a1)
{
  uint64_t result;

  result = qword_100066058;
  if (!qword_100066058)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ColorSwatchPickerView);
  return result;
}

void sub_10001D8BC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_10001D93C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100045AC8;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

void sub_10001D93C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100066068)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100066068);
  }
}

uint64_t sub_10001D990(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005163C, 1);
}

uint64_t sub_10001D9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ColorSwatchPickerView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10001D9E8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSwatchPickerView(0) - 8) + 80);
  sub_100019A74(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_10001DA38@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSwatchPickerView(0) - 8) + 80);
  return sub_10001A424(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_10001DA84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000660F0;
  if (!qword_1000660F0)
  {
    v1 = sub_100009E2C(&qword_1000660E0);
    sub_10001DAF0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Range<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000660F0);
  }
  return result;
}

unint64_t sub_10001DAF0()
{
  unint64_t result;

  result = qword_1000660F8;
  if (!qword_1000660F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1000660F8);
  }
  return result;
}

uint64_t sub_10001DB34(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001DB74@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSwatchPickerView(0) - 8) + 80);
  return sub_10001A6C8(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_10001DBC0()
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
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (int *)type metadata accessor for ColorSwatchPickerView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = (_QWORD *)(v0 + v4);
  v11 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v11) == 1)
  {
    v12 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v0 + v4, v12);
  }
  else
  {
    swift_release(*v10);
  }
  v13 = (v4 + v5 + v8) & ~v8;
  swift_release(*(_QWORD *)((char *)v10 + v1[5]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v10 + v1[6]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v10 + v1[7]));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v13, v6);
  return swift_deallocObject(v0, v13 + v9, v3 | v8 | 7);
}

uint64_t sub_10001DCD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = type metadata accessor for ColorSwatchPickerView(0);
  v4 = (*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  type metadata accessor for GeometryProxy(0);
  return sub_10001AC28(a1, v1 + v4);
}

uint64_t sub_10001DD40()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (int *)type metadata accessor for ColorSwatchPickerView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + v1[5]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + v1[6]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + v1[7]));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10001DE0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSwatchPickerView(0) - 8) + 80);
  return sub_10001B040(a1, v1 + ((v3 + 16) & ~v3));
}

unint64_t sub_10001DE48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066120;
  if (!qword_100066120)
  {
    v1 = sub_100009E2C(&qword_1000660C8);
    sub_10001DECC();
    sub_100009FA0(&qword_100066140, &qword_100066148, (uint64_t)&protocol conformance descriptor for _OverlayPreferenceModifier<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066120);
  }
  return result;
}

unint64_t sub_10001DECC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066128;
  if (!qword_100066128)
  {
    v1 = sub_100009E2C(&qword_1000660C0);
    sub_10001DF50();
    sub_100009FA0(&qword_1000656C8, &qword_1000656A8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066128);
  }
  return result;
}

unint64_t sub_10001DF50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066130;
  if (!qword_100066130)
  {
    v1 = sub_100009E2C(&qword_1000660B8);
    sub_100009FA0(&qword_100066138, &qword_1000660B0, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066130);
  }
  return result;
}

uint64_t sub_10001DFFC()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1 = (int *)type metadata accessor for ColorSwatchPickerView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)((char *)v6 + v1[5]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + v1[6]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + v1[7]));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v9));
  return swift_deallocObject(v0, v9 + 8, v3 | 7);
}

double sub_10001E0DC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = type metadata accessor for ColorSwatchPickerView(0);
  return sub_10001A7A0(a1, *(_QWORD *)(v2+ ((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64)+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))+ 7) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_10001E13C(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = Transaction.disablesAnimations.getter(*a1);
  if ((result & 1) == 0)
  {
    v4 = swift_retain(a2);
    return Transaction.animation.setter(v4);
  }
  return result;
}

uint64_t sub_10001E174()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001E198(_QWORD *a1)
{
  uint64_t v1;

  return sub_10001E13C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10001E1A0()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (int *)type metadata accessor for ColorSwatchPickerView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + v1[5]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + v1[6]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + v1[7]));
  return swift_deallocObject(v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_10001E278@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for ColorSwatchPickerView(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_10001A5E0(a1, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), a2);
}

unint64_t sub_10001E2D8()
{
  unint64_t result;

  result = qword_100066168;
  if (!qword_100066168)
  {
    result = swift_getWitnessTable(&unk_100045CEC, &type metadata for ColorSwatchPickerView.ColorCell);
    atomic_store(result, (unint64_t *)&qword_100066168);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorPreferenceKey()
{
  return &type metadata for ColorSwatchPickerView.ColorPreferenceKey;
}

__n128 initializeWithTake for FavoriteColorPickerView(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.ColorCell(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.ColorCell(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorCell()
{
  return &type metadata for ColorSwatchPickerView.ColorCell;
}

uint64_t sub_10001E3EC()
{
  return sub_100009FA0(&qword_100066170, &qword_100066178, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10001E418(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100051688, 1);
}

uint64_t sub_10001E428()
{
  uint64_t v0;

  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001E438@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_10001B6F4(a1, (__int128 *)(v2 + 16), a2);
}

unint64_t sub_10001E440()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066198;
  if (!qword_100066198)
  {
    v1 = sub_100009E2C(&qword_100066190);
    sub_100009FA0(&qword_1000661A0, &qword_1000661A8, (uint64_t)&protocol conformance descriptor for _AnchorWritingModifier<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066198);
  }
  return result;
}

uint64_t initializeWithCopy for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  return a1;
}

__n128 initializeWithTake for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
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

uint64_t *assignWithTake for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  v5 = *((_OWORD *)a2 + 2);
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)a1 + 2) = v5;
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 49))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.AccessibilitySelectionState()
{
  return &type metadata for ColorSwatchPickerView.AccessibilitySelectionState;
}

uint64_t destroy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_retain(v4);
  return a1;
}

uint64_t assignWithCopy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain(v4);
  swift_release(v5);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.ColorPreferenceData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorPreferenceData()
{
  return &type metadata for ColorSwatchPickerView.ColorPreferenceData;
}

unint64_t sub_10001E880()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000661B0;
  if (!qword_1000661B0)
  {
    v1 = sub_100009E2C(&qword_100066188);
    sub_10001E8EC();
    sub_10001E970();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000661B0);
  }
  return result;
}

unint64_t sub_10001E8EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000661B8;
  if (!qword_1000661B8)
  {
    v1 = sub_100009E2C(&qword_100066180);
    sub_10001E440();
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000661B8);
  }
  return result;
}

unint64_t sub_10001E970()
{
  unint64_t result;

  result = qword_1000661C0;
  if (!qword_1000661C0)
  {
    result = swift_getWitnessTable(&unk_100045D5C, &type metadata for ColorSwatchPickerView.AccessibilitySelectionState);
    atomic_store(result, (unint64_t *)&qword_1000661C0);
  }
  return result;
}

uint64_t sub_10001E9B4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000516B0, 1);
}

_QWORD *sub_10001E9C4(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

unint64_t sub_10001E9EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000661E0;
  if (!qword_1000661E0)
  {
    v1 = sub_100009E2C(&qword_1000661C8);
    sub_100009FA0(&qword_1000661E8, &qword_1000661D8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000661E0);
  }
  return result;
}

unint64_t sub_10001EA8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066208;
  if (!qword_100066208)
  {
    v1 = sub_100009E2C(&qword_100066210);
    sub_10001EAF0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100066208);
  }
  return result;
}

unint64_t sub_10001EAF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066218;
  if (!qword_100066218)
  {
    v1 = sub_100009E2C(&qword_100066220);
    sub_10001E9EC();
    sub_100009FA0(&qword_1000661E8, &qword_1000661D8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066218);
  }
  return result;
}

uint64_t destroy for Spectrum(_QWORD *a1)
{
  swift_release(a1[3]);
  swift_release(a1[9]);
  swift_release(a1[10]);
  swift_release(a1[11]);
  return swift_release(a1[17]);
}

uint64_t initializeWithCopy for Spectrum(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v5 = *(_QWORD *)(a2 + 72);
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v7;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  v10 = *(_QWORD *)(a2 + 136);
  v9 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = v10;
  *(_QWORD *)(a1 + 144) = v9;
  swift_retain(v3);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v10);
  return a1;
}

uint64_t assignWithCopy for Spectrum(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v4;
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 24) = v6;
  swift_retain(v6);
  swift_release(v5);
  v7 = a2[2];
  v8 = a2[3];
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *((_QWORD *)a2 + 9);
  *(_QWORD *)(a1 + 72) = v10;
  swift_retain(v10);
  swift_release(v9);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(a1 + 80) = v12;
  swift_retain(v12);
  swift_release(v11);
  v13 = *((_QWORD *)a2 + 11);
  v14 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v13;
  swift_retain(v13);
  swift_release(v14);
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_QWORD *)(a1 + 104) = *((_QWORD *)a2 + 13);
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_QWORD *)(a1 + 120) = *((_QWORD *)a2 + 15);
  *(_BYTE *)(a1 + 128) = *((_BYTE *)a2 + 128);
  v15 = *(_QWORD *)(a1 + 136);
  v16 = *((_QWORD *)a2 + 17);
  *(_QWORD *)(a1 + 136) = v16;
  swift_retain(v16);
  swift_release(v15);
  *(_QWORD *)(a1 + 144) = *((_QWORD *)a2 + 18);
  return a1;
}

__n128 initializeWithTake for Spectrum(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

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
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for Spectrum(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release(v4);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_release(*(_QWORD *)(a1 + 72));
  v6 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release(v7);
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v9 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release(v9);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for Spectrum(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 152))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Spectrum(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
      *(_BYTE *)(result + 152) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 152) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Spectrum()
{
  return &type metadata for Spectrum;
}

uint64_t sub_10001EEE4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000516F4, 1);
}

uint64_t sub_10001EEF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
  unint64_t v25;
  uint64_t ObjCClassFromMetadata;
  id v27;
  NSString v28;
  NSString v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _OWORD v70[3];
  char v71;

  v2 = v1;
  v69 = a1;
  v3 = type metadata accessor for AccessibilityTraits(0);
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = type metadata accessor for AccessibilityChildBehavior(0);
  v6 = *(_QWORD *)(v62 - 8);
  __chkstk_darwin(v62);
  v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000060E4(&qword_100066278);
  v64 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1000060E4(&qword_100066280);
  v12 = __chkstk_darwin(v68);
  v63 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v67 = (char *)&v61 - v14;
  v15 = swift_allocObject(&unk_10005BA08, 168, 7);
  v16 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v15 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v15 + 128) = v16;
  *(_OWORD *)(v15 + 144) = *(_OWORD *)(v1 + 128);
  *(_QWORD *)(v15 + 160) = *(_QWORD *)(v1 + 144);
  v17 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v15 + 64) = v17;
  v18 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v15 + 96) = v18;
  v19 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v15 + 32) = v19;
  *(_QWORD *)&v70[0] = sub_1000209AC;
  *((_QWORD *)&v70[0] + 1) = v15;
  v20 = sub_1000151FC((_QWORD *)v1);
  static AccessibilityChildBehavior.ignore.getter(v20);
  v21 = sub_1000060E4(&qword_100066288);
  v22 = sub_100009FA0(&qword_100066290, &qword_100066288, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
  View.accessibilityElement(children:)(v8, v21, v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v62);
  v23 = swift_release(*((_QWORD *)&v70[0] + 1));
  static AccessibilityTraits.allowsDirectInteraction.getter(v23);
  *(_QWORD *)&v70[0] = v21;
  *((_QWORD *)&v70[0] + 1) = v22;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v70, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  View.accessibility(addTraits:)(v5, v9, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v5, v66);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v11, v9);
  v25 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v25);
  v27 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v28 = String._bridgeToObjectiveC()();
  v29 = String._bridgeToObjectiveC()();
  v30 = objc_msgSend(v27, "localizedStringForKey:value:table:", v28, 0, v29);

  v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  v33 = v32;

  *(_QWORD *)&v70[0] = v31;
  *((_QWORD *)&v70[0] + 1) = v33;
  v34 = sub_10000CC44();
  v35 = Text.init<A>(_:)(v70, &type metadata for String, v34);
  v37 = v36;
  v39 = v38;
  LOBYTE(v5) = v40 & 1;
  v41 = (uint64_t)v67;
  v42 = v68;
  v43 = (uint64_t)v63;
  ModifiedContent<>.accessibility(label:)();
  sub_10000CC88(v35, v37, (char)v5);
  swift_bridgeObjectRelease(v39);
  sub_100009CF0(v43, &qword_100066280);
  v44 = *(_OWORD *)(v2 + 96);
  v70[0] = *(_OWORD *)(v2 + 80);
  v70[1] = v44;
  v70[2] = *(_OWORD *)(v2 + 112);
  v71 = *(_BYTE *)(v2 + 128);
  v45 = sub_1000060E4(&qword_100066D40);
  Binding.wrappedValue.getter(v45);
  sub_1000176F4();
  v47 = v46;
  v48 = objc_msgSend(v46, "_accessibilityNameWithLuma");

  v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
  v51 = v50;

  *(_QWORD *)&v70[0] = v49;
  *((_QWORD *)&v70[0] + 1) = v51;
  v52 = Text.init<A>(_:)(v70, &type metadata for String, v34);
  v54 = v53;
  v56 = v55;
  v58 = v57 & 1;
  v59 = sub_1000209B4();
  View.accessibility(value:)(v52, v54, v58, v56, v42, v59);
  sub_10000CC88(v52, v54, v58);
  swift_bridgeObjectRelease(v56);
  return sub_100009CF0(v41, &qword_100066280);
}

uint64_t sub_10001F390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = static Alignment.topLeading.getter(a1);
  a3[1] = v6;
  v7 = sub_1000060E4(&qword_1000662A0);
  return sub_10001F3E4(a2, a1, (uint64_t)a3 + *(int *)(v7 + 44));
}

uint64_t sub_10001F3E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  _BYTE *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  id v27;
  id v28;
  double v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_BYTE *, uint64_t);
  void (*v42)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  char v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v101;
  _BYTE *v102;
  _BYTE *v103;
  uint64_t v104;
  void (*v105)(_BYTE *, uint64_t);
  uint64_t result;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _BYTE v110[4];
  int v111;
  id v112;
  _BYTE *v113;
  _BYTE *v114;
  uint64_t v115;
  _BYTE *v116;
  uint64_t v117;
  _BYTE *v118;
  _BYTE *v119;
  _BYTE *v120;
  uint64_t v121;
  _BYTE *v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  char v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;

  v127 = a2;
  v117 = a1;
  *(_QWORD *)&v123 = a3;
  v121 = sub_1000060E4(&qword_1000662A8);
  v126 = *(_QWORD *)(v121 - 8);
  v3 = __chkstk_darwin(v121);
  v114 = &v110[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  v113 = &v110[-v5];
  v6 = sub_1000060E4(&qword_1000662B0);
  v7 = __chkstk_darwin(v6);
  v122 = &v110[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v120 = &v110[-v9];
  v124 = sub_1000060E4(&qword_1000660A8);
  v118 = *(_BYTE **)(v124 - 8);
  __chkstk_darwin(v124);
  v11 = &v110[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v115 = sub_1000060E4(&qword_1000656A8);
  __chkstk_darwin(v115);
  v13 = &v110[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v14);
  v16 = (double *)&v110[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v116 = (_BYTE *)sub_1000060E4(&qword_1000662B8);
  __chkstk_darwin(v116);
  v18 = &v110[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v125 = sub_1000060E4(&qword_1000662C0);
  v19 = *(_QWORD **)(v125 - 8);
  v20 = __chkstk_darwin(v125);
  v119 = &v110[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = __chkstk_darwin(v20);
  v24 = &v110[-v23];
  __chkstk_darwin(v22);
  v26 = &v110[-v25];
  v112 = (id)objc_opt_self(UIDevice);
  v27 = objc_msgSend(v112, "currentDevice");
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  if (v28 == (id)6)
    v29 = 16.0;
  else
    v29 = 8.0;
  v30 = (char *)v16 + *(int *)(v14 + 20);
  v31 = enum case for RoundedCornerStyle.continuous(_:);
  v32 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v30, v31, v32);
  *v16 = v29;
  v16[1] = v29;
  sub_100020BDC((uint64_t)v16, (uint64_t)v13);
  v33 = v117;
  *(_WORD *)&v13[*(int *)(v115 + 36)] = 256;
  sub_100009C1C((uint64_t)v13, (uint64_t)v18, &qword_1000656A8);
  v34 = (uint64_t)v13;
  v35 = v125;
  sub_100009CF0(v34, &qword_1000656A8);
  sub_10001DB34((uint64_t)v16);
  v36 = sub_10001FCC8(v127, (uint64_t)v11);
  v37 = static GestureMask.all.getter(v36);
  v38 = sub_100020C20();
  v39 = sub_100009FA0(&qword_100066150, &qword_1000660A8, (uint64_t)&protocol conformance descriptor for _EndedGesture<A>);
  v40 = v124;
  v115 = v39;
  View.gesture<A>(_:including:)(v11, v37, v116, v124, v38, v39);
  v41 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v118 + 1);
  v116 = v11;
  v41(v11, v40);
  sub_100009CF0((uint64_t)v18, &qword_1000662B8);
  v42 = (void (*)(_BYTE *, _BYTE *, uint64_t))v19[4];
  v118 = v26;
  v42(v26, v24, v35);
  v43 = *(_QWORD *)(v33 + 136);
  if (v43)
  {
    KeyPath = swift_getKeyPath(&unk_100045E20);
    v45 = swift_getKeyPath(&unk_100045E48);
    v46 = swift_retain(v43);
    static Published.subscript.getter(&v128, v46, KeyPath, v45);
    swift_release(v43);
    swift_release(KeyPath);
    swift_release(v45);
    if ((_BYTE)v128)
    {
      v47 = (_BYTE *)v123;
      if (v128 == 1)
      {
        v48 = swift_bridgeObjectRelease(0xE800000000000000);
LABEL_11:
        v52 = GeometryProxy.size.getter(v48);
        *(double *)&v54 = COERCE_DOUBLE(sub_10001FFC8(v52, v53));
        if ((v56 & 1) == 0)
        {
          v57 = *(double *)&v54;
          v58 = v55;
          v59 = *(_OWORD *)(v33 + 96);
          v128 = *(_OWORD *)(v33 + 80);
          v60 = *(_OWORD *)(v33 + 112);
          v129 = v59;
          v130 = v60;
          v131 = *(_BYTE *)(v33 + 128);
          v61 = sub_1000060E4(&qword_100066D40);
          Binding.wrappedValue.getter(v61);
          v123 = v138;
          v62 = v139;
          v63 = v140;
          v111 = v141;
          v64 = v112;
          v65 = objc_msgSend(v112, "currentDevice");
          v66 = objc_msgSend(v65, "userInterfaceIdiom");

          v67 = objc_msgSend(v64, "currentDevice");
          v68 = objc_msgSend(v67, "userInterfaceIdiom");

          if (v66 == (id)6)
            v70 = 0x4046000000000000;
          else
            v70 = 0x4040800000000000;
          if (v68 == (id)6)
            v71 = 0x4046000000000000;
          else
            v71 = 0x4040800000000000;
          v72 = static Alignment.center.getter(v69);
          v74 = _FrameLayout.init(width:height:alignment:)(&v138, v70, 0, v71, 0, v72, v73);
          v75 = v138;
          v76 = BYTE8(v138);
          v77 = v139;
          v78 = v127;
          v79 = v140;
          v112 = v41;
          v80 = v19;
          v81 = v141;
          v82 = v142;
          v83 = GeometryProxy.size.getter(v74);
          v84 = sub_100020CF0(v57, v58, v83);
          v128 = v123;
          *(_QWORD *)&v129 = v62;
          *((_QWORD *)&v129 + 1) = v63;
          LOBYTE(v130) = v111;
          *((_QWORD *)&v130 + 1) = v75;
          v131 = v76;
          v132 = v77;
          v133 = v79;
          v134 = v81;
          v135 = v82;
          v19 = v80;
          v136 = v84;
          v137 = v85;
          v86 = (uint64_t)v116;
          v87 = sub_10001FCC8(v78, (uint64_t)v116);
          v88 = static GestureMask.all.getter(v87);
          v89 = sub_1000060E4(&qword_1000662E0);
          v90 = sub_10000C94C(&qword_1000662E8, &qword_1000662E0, (void (*)(void))sub_100020DEC);
          v91 = v114;
          v92 = v88;
          v93 = v124;
          View.gesture<A>(_:including:)(v86, v92, v89, v124, v90, v115);
          ((void (*)(uint64_t, uint64_t))v112)(v86, v93);
          v94 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v126 + 32);
          v95 = v113;
          v96 = v91;
          v35 = v125;
          v97 = v121;
          v94(v113, v96, v121);
          v98 = (uint64_t)v120;
          v94(v120, v95, v97);
          v99 = 0;
          goto LABEL_20;
        }
LABEL_19:
        v99 = 1;
        v97 = v121;
        v98 = (uint64_t)v120;
LABEL_20:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v126 + 56))(v98, v99, 1, v97);
        v100 = (void (*)(_BYTE *, _BYTE *, uint64_t))v19[2];
        v101 = v119;
        v102 = v118;
        v100(v119, v118, v35);
        v103 = v122;
        sub_100009C1C(v98, (uint64_t)v122, &qword_1000662B0);
        v100(v47, v101, v35);
        v104 = sub_1000060E4(&qword_1000662D8);
        sub_100009C1C((uint64_t)v103, (uint64_t)&v47[*(int *)(v104 + 48)], &qword_1000662B0);
        sub_100009CF0(v98, &qword_1000662B0);
        v105 = (void (*)(_BYTE *, uint64_t))v19[1];
        v105(v102, v35);
        sub_100009CF0((uint64_t)v103, &qword_1000662B0);
        return ((uint64_t (*)(_BYTE *, uint64_t))v105)(v101, v35);
      }
      v49 = 0xE700000000000000;
      v50 = 0x73726564696C53;
    }
    else
    {
      v49 = 0xE400000000000000;
      v50 = 1684632135;
      v47 = (_BYTE *)v123;
    }
    v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v49, 0x6D75727463657053, 0xE800000000000000, 0);
    v48 = swift_bridgeObjectRelease(v49);
    if ((v51 & 1) == 0)
      goto LABEL_19;
    goto LABEL_11;
  }
  v107 = *(_QWORD *)(v33 + 144);
  v108 = type metadata accessor for ColorPickerState(0);
  v109 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v107, v108, v109);
  __break(1u);
  return result;
}

uint64_t sub_10001FCC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = v2;
  v36 = a1;
  v40 = a2;
  v4 = type metadata accessor for GeometryProxy(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v4);
  v7 = type metadata accessor for LocalCoordinateSpace(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DragGesture(0);
  v37 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000060E4(&qword_1000660A0);
  v14 = *(_QWORD *)(v13 - 8);
  v38 = v13;
  v39 = v14;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CoordinateSpaceProtocol<>.local.getter(v15);
  DragGesture.init<A>(minimumDistance:coordinateSpace:)(v9, v7, &protocol witness table for LocalCoordinateSpace, 0.0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v36, v4);
  v18 = *(unsigned __int8 *)(v5 + 80);
  v19 = (v18 + 168) & ~v18;
  v20 = swift_allocObject(&unk_10005BA30, v19 + v6, v18 | 7);
  v21 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(v20 + 112) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(v20 + 128) = v21;
  *(_OWORD *)(v20 + 144) = *(_OWORD *)(v3 + 128);
  *(_QWORD *)(v20 + 160) = *(_QWORD *)(v3 + 144);
  v22 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v20 + 64) = v22;
  v23 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v20 + 80) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v20 + 96) = v23;
  v24 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v20 + 32) = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_1000151FC((_QWORD *)v3);
  v25 = sub_100006848(&qword_100066108, (uint64_t (*)(uint64_t))&type metadata accessor for DragGesture, (uint64_t)&protocol conformance descriptor for DragGesture);
  v26 = sub_100006848(&qword_100066110, (uint64_t (*)(uint64_t))&type metadata accessor for DragGesture.Value, (uint64_t)&protocol conformance descriptor for DragGesture.Value);
  Gesture<>.onChanged(_:)(sub_100020EF0, v20, v10, v25, v26);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v10);
  v27 = swift_allocObject(&unk_10005BA58, 168, 7);
  v28 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(v27 + 112) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(v27 + 128) = v28;
  *(_OWORD *)(v27 + 144) = *(_OWORD *)(v3 + 128);
  *(_QWORD *)(v27 + 160) = *(_QWORD *)(v3 + 144);
  v29 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v27 + 48) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v27 + 64) = v29;
  v30 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v27 + 80) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v27 + 96) = v30;
  v31 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v27 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v27 + 32) = v31;
  sub_1000151FC((_QWORD *)v3);
  v32 = sub_100009FA0(&qword_100066118, &qword_1000660A0, (uint64_t)&protocol conformance descriptor for _ChangedGesture<A>);
  v33 = v38;
  Gesture.onEnded(_:)(sub_100020F78, v27, v38, v32);
  swift_release(v27);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v17, v33);
}

uint64_t sub_10001FFC8(double a1, double a2)
{
  __int128 *v2;
  __int128 *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  double v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  uint64_t v21;
  __int128 *v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGColor *v30;
  CGColorSpace *v31;
  char v32;
  double v33;
  __int128 v34;
  float64x2_t v35;
  uint64_t result;
  __int128 v37;
  float64x2_t v38;
  double v39;
  int v40;
  __int128 v41;
  float64x2_t v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float64x2_t v52;
  float64x2_t v53;
  double v54;
  unsigned __int8 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  float64x2_t v60[2];
  float64x2_t v61;
  double v62;
  __int128 v63;
  __int128 v64;
  double v65;
  double v66;
  double v67;
  char v68;

  v3 = v2;
  v4 = *((_QWORD *)v2 + 17);
  if (v4)
  {
    KeyPath = swift_getKeyPath(&unk_100045E68);
    v8 = swift_getKeyPath(&unk_100045E90);
    v9 = swift_retain(v4);
    static Published.subscript.getter(&v56, v9, KeyPath, v8);
    swift_release(v4);
    swift_release(KeyPath);
    swift_release(v8);
    if (v58 == 2)
      goto LABEL_3;
    v11 = v3[1];
    v63 = *v3;
    v64 = v11;
    v12 = v3[1];
    v56 = *v3;
    v57 = v12;
    v13 = sub_1000060E4(&qword_100066308);
    State.wrappedValue.getter(&v65, v13);
    if ((LOBYTE(v67) & 1) == 0)
    {
      v10 = v65;
      v14 = v3[3];
      v56 = v3[2];
      v57 = v14;
      v58 = v3[4];
      v15 = sub_1000060E4(&qword_100066310);
      State.wrappedValue.getter(&v65, v15);
      v16 = v68;
      if (v68 != 2)
      {
        v18 = v65;
        v17 = v66;
        v19 = v67;
        v20 = v3[6];
        v56 = v3[5];
        v57 = v20;
        v58 = v3[7];
        v59 = *((_BYTE *)v3 + 128);
        v21 = sub_1000060E4(&qword_100066D40);
        Binding.wrappedValue.getter(v21);
        if (((v16 & 1) == 0) != v68
          && vabdd_f64(v65, v18) < 0.001
          && vabdd_f64(v66, v17) < 0.001
          && vabdd_f64(v67, v19) < 0.001)
        {
          return *(_QWORD *)&v10;
        }
      }
    }
    v22 = v3 + 5;
    v23 = v3[6];
    v56 = v3[5];
    v57 = v23;
    v58 = v3[7];
    v59 = *((_BYTE *)v3 + 128);
    v24 = sub_1000060E4(&qword_100066D40);
    Binding.wrappedValue.getter(v24);
    sub_100017C8C((uint64_t)v60);
    v25 = (void *)objc_opt_self(SpectrumRenderer);
    objc_msgSend(v25, "positionForColor:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v60[0]), v60[1]).i64);
    v27 = (v26 + 1.0) * 0.5 * a1;
    v29 = objc_msgSend(v25, "colorAtLocation:", fmax(fmin(v27 / a1 + v27 / a1 + -1.0, 1.0), -1.0), fmax(fmin(-((a2 - (v28 + 1.0) * 0.5 * a2) / a2 + (a2 - (v28 + 1.0) * 0.5 * a2) / a2 + -1.0), 1.0), -1.0));
    v30 = (CGColor *)objc_msgSend(v29, "CGColor");
    v31 = CGColorGetColorSpace(v30);

    if (v31)
    {
      v32 = sub_1000184E4(v31);
      if (v32 != 2)
      {
        sub_1000183BC(v29, v32 & 1, (uint64_t)&v61);
        v52 = v61;
        v33 = v62;

LABEL_17:
        v34 = v22[1];
        v56 = *v22;
        v57 = v34;
        v58 = v22[2];
        v59 = *((_BYTE *)v22 + 48);
        Binding.wrappedValue.getter(v24);
        v35 = vsubq_f64(v53, v52);
        if (sqrt(vaddvq_f64(vmulq_f64(v35, v35)) + (v54 - v33) * (v54 - v33)) < 0.55)
        {

          v10 = v27;
          return *(_QWORD *)&v10;
        }
        v56 = v63;
        v57 = v64;
        State.wrappedValue.getter(&v53, v13);
        v37 = v22[1];
        v56 = *v22;
        v57 = v37;
        v58 = v22[2];
        v59 = *((_BYTE *)v22 + 48);
        Binding.wrappedValue.getter(v24);
        v38 = v53;
        v39 = v54;
        v40 = v55;
        if (qword_100065078 != -1)
          swift_once(&qword_100065078, sub_100020A80);
        if (v40 == byte_100066248
          && vabdd_f64(v38.f64[0], *(double *)&qword_100066228) < 0.001
          && vabdd_f64(v38.f64[1], *(double *)&qword_100066230) < 0.001
          && vabdd_f64(v39, *(double *)&qword_100066238) < 0.001)
        {

          v10 = 0.0;
          return *(_QWORD *)&v10;
        }
        v41 = v22[1];
        v56 = *v22;
        v57 = v41;
        v58 = v22[2];
        v59 = *((_BYTE *)v22 + 48);
        Binding.wrappedValue.getter(v24);
        v42 = v53;
        v43 = v54;
        v44 = v55;
        if (qword_100065080 != -1)
          swift_once(&qword_100065080, sub_100020A9C);
        v46 = *(double *)&qword_100066250;
        v45 = *(double *)algn_100066258;
        v47 = *(double *)&qword_100066260;
        v48 = byte_100066270;

        if (v44 == v48
          && vabdd_f64(v42.f64[0], v46) < 0.001
          && vabdd_f64(v42.f64[1], v45) < 0.001
          && vabdd_f64(v43, v47) < 0.001)
        {
          v10 = 1.79769313e308;
          return *(_QWORD *)&v10;
        }
LABEL_3:
        v10 = 0.0;
        return *(_QWORD *)&v10;
      }

    }
    if (qword_100065088 != -1)
      swift_once(&qword_100065088, sub_10002141C);
    sub_1000183BC(v29, byte_10006B6A0, (uint64_t)&v61);
    v52 = v61;
    v33 = v62;
    goto LABEL_17;
  }
  v49 = *((_QWORD *)v2 + 18);
  v50 = type metadata accessor for ColorPickerState(0);
  v51 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v49, v50, v51);
  __break(1u);
  return result;
}

void sub_100020578(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  double v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  id v24;
  unsigned __int8 v25;
  __int128 v26;
  double v27;
  UIAccessibilityNotifications v28;
  void *v29;
  void *v30;
  NSString v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  unsigned __int8 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  __int128 v46;
  double v47;
  unsigned __int8 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  __int128 v53;
  __int128 v54;
  unsigned __int8 v55;

  v3 = *((_QWORD *)a2 + 17);
  if (v3)
  {
    KeyPath = swift_getKeyPath(&unk_100045EB0);
    v5 = swift_getKeyPath(&unk_100045ED8);
    LOBYTE(v49) = 1;
    swift_retain(v3);
    v6 = static Published.subscript.setter(&v49, v3, KeyPath, v5);
    v7 = DragGesture.Value.location.getter(v6);
    v8 = a2[1];
    v49 = *a2;
    v50 = v8;
    *(double *)&v42 = v7;
    *((_QWORD *)&v42 + 1) = v9;
    LOBYTE(v43) = 0;
    v10 = sub_1000060E4(&qword_100066308);
    State.wrappedValue.setter(&v42, v10);
    v11 = a2[6];
    v49 = a2[5];
    v50 = v11;
    v13 = a2[5];
    v12 = a2[6];
    v51 = a2[7];
    v52 = *((_BYTE *)a2 + 128);
    v42 = v13;
    v43 = v12;
    v44 = a2[7];
    v45 = *((_BYTE *)a2 + 128);
    v14 = sub_1000060E4(&qword_100066D40);
    v15 = Binding.wrappedValue.getter(v14);
    v16 = v53;
    v17 = v54;
    LODWORD(v5) = v55;
    v18 = DragGesture.Value.location.getter(v15);
    v20 = v19;
    v22 = GeometryProxy.size.getter(v21);
    v24 = objc_msgSend((id)objc_opt_self(SpectrumRenderer), "colorAtLocation:", fmax(fmin(v18 / v22 + v18 / v22 + -1.0, 1.0), -1.0), fmax(fmin(-(v20 / v23 + v20 / v23 + -1.0), 1.0), -1.0));
    sub_1000183BC(v24, v5, (uint64_t)&v46);
    v25 = v48;
    v26 = v46;
    v27 = v47;
    v53 = v46;
    *(double *)&v54 = v47;
    *((_QWORD *)&v54 + 1) = *((_QWORD *)&v17 + 1);
    v55 = v48;
    if ((_DWORD)v5 != v48
      || vabdd_f64(*(double *)&v46, *(double *)&v16) >= 0.001
      || vabdd_f64(*((double *)&v46 + 1), *((double *)&v16 + 1)) >= 0.001
      || vabdd_f64(v47, *(double *)&v17) >= 0.001)
    {
      v28 = UIAccessibilityAnnouncementNotification;
      sub_1000176F4();
      v30 = v29;
      v31 = objc_msgSend(v29, "_accessibilityNameWithLuma");

      if (!v31)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v33 = v32;
        v31 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v33);
      }
      UIAccessibilityPostNotification(v28, v31);

      v34 = a2[3];
      v42 = a2[2];
      v43 = v34;
      v44 = a2[4];
      v39 = v26;
      *(double *)&v40 = v27;
      *((_QWORD *)&v40 + 1) = *((_QWORD *)&v17 + 1);
      v41 = v25;
      v35 = sub_1000060E4(&qword_100066310);
      State.wrappedValue.setter(&v39, v35);
      v42 = v49;
      v43 = v50;
      v44 = v51;
      v45 = v52;
      v39 = v53;
      v40 = v54;
      v41 = v55;
      Binding.wrappedValue.setter(&v39, v14);
    }
  }
  else
  {
    v36 = *((_QWORD *)a2 + 18);
    v37 = type metadata accessor for ColorPickerState(0);
    v38 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    EnvironmentObject.error()(0, v36, v37, v38);
    __break(1u);
  }
}

uint64_t sub_10002089C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a2 + 136);
  if (v2)
  {
    KeyPath = swift_getKeyPath(&unk_100045EB0);
    v4 = swift_getKeyPath(&unk_100045ED8);
    v9 = 0;
    swift_retain(v2);
    return static Published.subscript.setter(&v9, v2, KeyPath, v4);
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 144);
    v7 = type metadata accessor for ColorPickerState(0);
    v8 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v6, v7, v8);
    __break(1u);
  }
  return result;
}

uint64_t sub_100020950@<X0>(uint64_t a1@<X8>)
{
  return sub_10001EEF4(a1);
}

uint64_t sub_1000209AC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_10001F390(a1, v2 + 16, a2);
}

unint64_t sub_1000209B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100066298;
  if (!qword_100066298)
  {
    v1 = sub_100009E2C(&qword_100066280);
    v2[0] = sub_100009E2C(&qword_100066288);
    v2[1] = sub_100009FA0(&qword_100066290, &qword_100066288, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066298);
  }
  return result;
}

void sub_100020A80(uint64_t a1)
{
  sub_100020AB8(a1, (SEL *)&selRef_whiteColor, &qword_100066228, &qword_100066238, &byte_100066248);
}

void sub_100020A9C(uint64_t a1)
{
  sub_100020AB8(a1, (SEL *)&selRef_blackColor, &qword_100066250, &qword_100066260, &byte_100066270);
}

void sub_100020AB8(uint64_t a1, SEL *a2, _OWORD *a3, _OWORD *a4, _BYTE *a5)
{
  id v8;
  CGColor *v9;
  CGColorSpace *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;

  v8 = objc_msgSend((id)objc_opt_self(UIColor), *a2);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");
  v10 = CGColorGetColorSpace(v9);

  if (v10)
  {
    v11 = sub_1000184E4(v10);
    if (v11 != 2)
    {
      sub_1000183BC(v8, v11 & 1, (uint64_t)&v17);
      v15 = v18;
      v16 = v17;
      v14 = v19;

      v13 = v15;
      v12 = v16;
      goto LABEL_8;
    }

  }
  if (qword_100065088 != -1)
    swift_once(&qword_100065088, sub_10002141C);
  sub_1000183BC(v8, byte_10006B6A0, (uint64_t)&v17);
  v12 = v17;
  v13 = v18;
  v14 = v19;
LABEL_8:
  *a3 = v12;
  *a4 = v13;
  *a5 = v14;
}

uint64_t sub_100020BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100020C20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000662C8;
  if (!qword_1000662C8)
  {
    v1 = sub_100009E2C(&qword_1000662B8);
    sub_100020CA4();
    sub_100009FA0(&qword_1000656C8, &qword_1000656A8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000662C8);
  }
  return result;
}

unint64_t sub_100020CA4()
{
  unint64_t result;

  result = qword_1000662D0;
  if (!qword_1000662D0)
  {
    result = swift_getWitnessTable(&unk_1000472F4, &type metadata for SpectrumView);
    atomic_store(result, (unint64_t *)&qword_1000662D0);
  }
  return result;
}

double sub_100020CF0(double a1, double a2, double a3)
{
  double v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;

  if (a1 < 0.0)
    a1 = 0.0;
  if (a1 <= a3)
    v3 = a1;
  else
    v3 = a3;
  v4 = (void *)objc_opt_self(UIDevice);
  v5 = objc_msgSend(v4, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)6)
    v7 = 22.0;
  else
    v7 = 16.5;
  v8 = v3 - v7;
  v9 = objc_msgSend(v4, "currentDevice");
  objc_msgSend(v9, "userInterfaceIdiom");

  return v8;
}

uint64_t sub_100020DEC()
{
  return sub_10000C94C(&qword_1000662F0, &qword_1000662F8, (void (*)(void))sub_100020E10);
}

unint64_t sub_100020E10()
{
  unint64_t result;

  result = qword_100066300;
  if (!qword_100066300)
  {
    result = swift_getWitnessTable(&unk_100047000, &type metadata for ColorLens);
    atomic_store(result, (unint64_t *)&qword_100066300);
  }
  return result;
}

uint64_t sub_100020E5C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 168) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*((_QWORD *)v0 + 5));
  swift_release(*((_QWORD *)v0 + 11));
  swift_release(*((_QWORD *)v0 + 12));
  swift_release(*((_QWORD *)v0 + 13));
  swift_release(*((_QWORD *)v0 + 19));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v4], v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100020EF0(uint64_t a1)
{
  uint64_t v1;

  type metadata accessor for GeometryProxy(0);
  sub_100020578(a1, (__int128 *)(v1 + 16));
}

uint64_t sub_100020F34()
{
  _QWORD *v0;

  swift_release(v0[5]);
  swift_release(v0[11]);
  swift_release(v0[12]);
  swift_release(v0[13]);
  swift_release(v0[19]);
  return swift_deallocObject(v0, 168, 7);
}

uint64_t sub_100020F78(uint64_t a1)
{
  uint64_t v1;

  return sub_10002089C(a1, v1 + 16);
}

unint64_t sub_100020F8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066318;
  if (!qword_100066318)
  {
    v1 = sub_100009E2C(&qword_100066320);
    sub_1000209B4();
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100066318);
  }
  return result;
}

double sub_100021010@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  char v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  char v9;

  KeyPath = swift_getKeyPath(&unk_100045F68);
  v4 = swift_getKeyPath(&unk_100045F90);
  static Published.subscript.getter(v8, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v5 = v9;
  result = *(double *)v8;
  v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

double sub_100021090@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  char v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  char v9;

  KeyPath = swift_getKeyPath(&unk_100045FB0);
  v4 = swift_getKeyPath(&unk_100045FD8);
  static Published.subscript.getter(v8, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v5 = v9;
  result = *(double *)v8;
  v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_100021110()
{
  return sub_100021454((uint64_t)&unk_1000464C0, (uint64_t)&unk_1000464E8);
}

uint64_t sub_100021124()
{
  return sub_100021454((uint64_t)&unk_100046478, (uint64_t)&unk_1000464A0);
}

uint64_t sub_100021138()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100046430);
  v2 = swift_getKeyPath(&unk_100046458);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_1000211A8()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_1000463E8);
  v2 = swift_getKeyPath(&unk_100046410);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100021218()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_1000463A0);
  v2 = swift_getKeyPath(&unk_1000463C8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100021288()
{
  return sub_100021454((uint64_t)&unk_100046358, (uint64_t)&unk_100046380);
}

uint64_t sub_10002129C()
{
  return sub_100021454((uint64_t)&unk_1000460D0, (uint64_t)&unk_1000460F8);
}

uint64_t sub_1000212B0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100046310);
  v2 = swift_getKeyPath(&unk_100046338);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100021320()
{
  return sub_100021454((uint64_t)&unk_1000462C8, (uint64_t)&unk_1000462F0);
}

uint64_t sub_100021334()
{
  return sub_100021454((uint64_t)&unk_100046280, (uint64_t)&unk_1000462A8);
}

uint64_t sub_100021348()
{
  return sub_100021454((uint64_t)&unk_100046238, (uint64_t)&unk_100046260);
}

uint64_t sub_10002135C()
{
  return sub_100021454((uint64_t)&unk_100046040, (uint64_t)&unk_100046068);
}

uint64_t sub_100021370()
{
  return sub_100021454((uint64_t)&unk_100045FF8, (uint64_t)&unk_100046020);
}

uint64_t sub_100021384()
{
  return sub_100021454((uint64_t)&unk_1000461F0, (uint64_t)&unk_100046218);
}

double sub_100021398()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  double v4;

  KeyPath = swift_getKeyPath(&unk_1000461A8);
  v2 = swift_getKeyPath(&unk_1000461D0);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100021408()
{
  return sub_100021454((uint64_t)&unk_100046088, (uint64_t)&unk_1000460B0);
}

uint64_t sub_10002141C()
{
  uint64_t result;

  result = CUIGetDeviceArtworkDisplayGamut();
  byte_10006B6A0 = result != 0;
  return result;
}

uint64_t sub_100021440()
{
  return sub_100021454((uint64_t)&unk_100046160, (uint64_t)&unk_100046188);
}

uint64_t sub_100021454(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

uint64_t sub_1000214BC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100046118);
  v4 = swift_getKeyPath(&unk_100046140);
  static Published.subscript.getter(a1, v1, KeyPath, v4);
  swift_release(KeyPath);
  return swift_release(v4);
}

uint64_t sub_100021520@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE v20[24];
  _BYTE v21[24];

  v3 = sub_1000060E4(&qword_1000669C8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1000060E4(&qword_1000669D0);
  v8 = __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v12 = &v20[-v11];
  v13 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor;
  swift_beginAccess(v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor, v21, 0, 0);
  sub_100009C1C(v13, (uint64_t)v12, &qword_1000669D0);
  v14 = sub_1000060E4((uint64_t *)&unk_100066460);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v15 + 32))(a1, v12, v14);
  sub_100009CF0((uint64_t)v12, &qword_1000669D0);
  swift_beginAccess(v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedColor, v20, 33, 0);
  v16 = sub_1000060E4(&qword_1000669C0);
  Published.projectedValue.getter(v16);
  swift_endAccess(v20);
  v17 = sub_1000060E4(&qword_1000669D8);
  v18 = sub_100022BF0();
  Publisher.map<A>(_:)(sub_100021758, 0, v3, v17, v18);
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v10, a1, v14);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  swift_beginAccess(v13, v20, 33, 0);
  sub_100022C3C((uint64_t)v10, v13);
  return swift_endAccess(v20);
}

void sub_100021758(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  if (*(_BYTE *)(a1 + 32) == 2)
    v3 = 0;
  else
    sub_1000176F4();
  *a2 = v3;
}

uint64_t sub_1000217AC()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id v12;
  uint64_t v13;

  KeyPath = swift_getKeyPath(&unk_100045FF8);
  v2 = swift_getKeyPath(&unk_100046020);
  static Published.subscript.getter((uint64_t *)((char *)&v13 + 3), v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  if ((v13 & 0x1000000) != 0
    || (v3 = swift_getKeyPath(&unk_100046040),
        v4 = swift_getKeyPath(&unk_100046068),
        static Published.subscript.getter((uint64_t *)((char *)&v13 + 2), v0, v3, v4),
        swift_release(v3),
        swift_release(v4),
        BYTE2(v13) == 1))
  {
    v5 = swift_getKeyPath(&unk_1000460D0);
    v6 = swift_getKeyPath(&unk_1000460F8);
    static Published.subscript.getter(&v13, v0, v5, v6);
    swift_release(v5);
    swift_release(v6);
    v7 = v13;
  }
  else
  {
    v7 = 1;
  }
  v8 = swift_getKeyPath(&unk_100046088);
  v9 = swift_getKeyPath(&unk_1000460B0);
  static Published.subscript.getter((uint64_t *)((char *)&v13 + 1), v0, v8, v9);
  swift_release(v8);
  swift_release(v9);
  if ((v13 & 0x100) != 0)
    return v7 != 0;
  v11 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v7 & 1) != 0)
    return 1;
  return v12 != (id)6;
}

uint64_t sub_100021964(uint64_t a1)
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  CGColor *v26;
  CGColorSpace *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t ObjCClassFromMetadata;
  id v41;
  NSString v42;
  NSString v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _OWORD v97[2];
  char v98;
  __int128 v99;
  __int128 v100;
  char v101;

  v95 = a1;
  v2 = sub_1000060E4(&qword_100066990);
  v93 = *(_QWORD *)(v2 - 8);
  v94 = v2;
  __chkstk_darwin(v2);
  v92 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_1000060E4(&qword_100066158);
  v4 = __chkstk_darwin(v91);
  v90 = (uint64_t)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v89 = (char *)&v74 - v6;
  v7 = sub_1000060E4(&qword_100066998);
  v87 = *(_QWORD *)(v7 - 8);
  v88 = v7;
  __chkstk_darwin(v7);
  v86 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_1000060E4(&qword_1000669A0);
  v84 = *(_QWORD *)(v85 - 8);
  __chkstk_darwin(v85);
  v83 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_1000060E4(&qword_1000669A8);
  v81 = *(_QWORD *)(v82 - 8);
  __chkstk_darwin(v82);
  v80 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_1000060E4(&qword_1000669B0);
  v78 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v77 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000060E4(&qword_100066F20);
  v76 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000060E4(&qword_1000669B8);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1000060E4(&qword_1000669C0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedColor;
  v99 = 0u;
  v100 = 0u;
  v101 = 2;
  v24 = sub_1000060E4(&qword_100065BC8);
  Published.init(initialValue:)(&v99, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v22, v19);
  v25 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v26 = (CGColor *)objc_msgSend(v25, "CGColor");
  v27 = CGColorGetColorSpace(v26);

  if (v27)
  {
    v28 = sub_1000184E4(v27);
    if (v28 != 2)
    {
      sub_1000183BC(v25, v28 & 1, (uint64_t)&v99);
      v75 = v99;
      v74 = v100;
      v31 = v101;

      v30 = v74;
      v29 = v75;
      goto LABEL_8;
    }

  }
  if (qword_100065088 != -1)
    swift_once(&qword_100065088, sub_10002141C);
  sub_1000183BC(v25, byte_10006B6A0, (uint64_t)&v99);
  v29 = v99;
  v30 = v100;
  v31 = v101;
LABEL_8:
  v32 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__fallbackColor;
  v97[0] = v29;
  v97[1] = v30;
  v98 = v31;
  Published.init(initialValue:)(v97, &type metadata for SomeColor);
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v32, v18, v15);
  v33 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__allowsNoColor;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34 = *(void (**)(uint64_t, char *, uint64_t))(v76 + 32);
  v34(v33, v14, v12);
  v35 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isVolatile;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v35, v14, v12);
  v36 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedTab;
  LOBYTE(v97[0]) = 0;
  v37 = v77;
  Published.init(initialValue:)(v97, &type metadata for Tab);
  (*(void (**)(uint64_t, char *, uint64_t))(v78 + 32))(v36, v37, v79);
  v38 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__title;
  v39 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v39);
  v41 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v42 = String._bridgeToObjectiveC()();
  v43 = String._bridgeToObjectiveC()();
  v44 = objc_msgSend(v41, "localizedStringForKey:value:table:", v42, 0, v43);

  v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
  v47 = v46;

  *(_QWORD *)&v97[0] = v45;
  *((_QWORD *)&v97[0] + 1) = v47;
  v48 = v80;
  Published.init(initialValue:)(v97, &type metadata for String);
  (*(void (**)(uint64_t, char *, uint64_t))(v81 + 32))(v38, v48, v82);
  v49 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsAlpha;
  LOBYTE(v97[0]) = 1;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v49, v14, v12);
  v50 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsEyedropper;
  LOBYTE(v97[0]) = 1;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v50, v14, v12);
  v51 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__suggestedColors;
  *(_QWORD *)&v97[0] = 0;
  v52 = sub_1000060E4(&qword_100066440);
  v53 = v83;
  Published.init(initialValue:)(v97, v52);
  (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v51, v53, v85);
  v54 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperShowing;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v54, v14, v12);
  v55 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperIsFloating;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v55, v14, v12);
  v56 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__useLandscapeLayout;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v56, v14, v12);
  v57 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isEmbedded;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v57, v14, v12);
  v58 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isPopover;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v58, v14, v12);
  v59 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isSheet;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v59, v14, v12);
  v60 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__width;
  *(_QWORD *)&v97[0] = 0;
  v61 = v86;
  Published.init(initialValue:)(v97, &type metadata for CGFloat);
  (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v60, v61, v88);
  v62 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsGridOnly;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v62, v14, v12);
  v63 = (_QWORD *)(v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
  *v63 = 0;
  v63[1] = 0;
  v64 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__enableDarkGrid;
  LOBYTE(v97[0]) = 0;
  Published.init(initialValue:)(v97, &type metadata for Bool);
  v34(v64, v14, v12);
  v65 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__overrideColorScheme;
  v66 = type metadata accessor for ColorScheme(0);
  v67 = (uint64_t)v89;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v89, 1, 1, v66);
  v68 = v90;
  sub_100009C1C(v67, v90, &qword_100066158);
  v69 = v92;
  Published.init(initialValue:)(v68, v91);
  sub_100009CF0(v67, &qword_100066158);
  (*(void (**)(uint64_t, char *, uint64_t))(v93 + 32))(v65, v69, v94);
  v70 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor;
  v71 = sub_1000060E4((uint64_t *)&unk_100066460);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v70, 1, 1, v71);
  swift_beginAccess(v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__favoriteColors, v97, 33, 0);
  v96 = v95;
  v72 = sub_1000060E4(&qword_1000658F0);
  Published.init(initialValue:)(&v96, v72);
  swift_endAccess(v97);
  return v1;
}

uint64_t sub_100022308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
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

  v1 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedColor;
  v2 = sub_1000060E4(&qword_1000669C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__fallbackColor;
  v4 = sub_1000060E4(&qword_1000669B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__allowsNoColor;
  v6 = sub_1000060E4(&qword_100066F20);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isVolatile, v6);
  v8 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedTab;
  v9 = sub_1000060E4(&qword_1000669B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__favoriteColors;
  v11 = sub_1000060E4(&qword_1000669E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__title;
  v13 = sub_1000060E4(&qword_1000669A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsAlpha, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsEyedropper, v6);
  v14 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__suggestedColors;
  v15 = sub_1000060E4(&qword_1000669A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperShowing, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperIsFloating, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__useLandscapeLayout, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isEmbedded, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isPopover, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isSheet, v6);
  v16 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__width;
  v17 = sub_1000060E4(&qword_100066998);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsGridOnly, v6);
  sub_10000CCDC(*(_QWORD *)(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close), *(_QWORD *)(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close + 8));
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__enableDarkGrid, v6);
  v18 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__overrideColorScheme;
  v19 = sub_1000060E4(&qword_100066990);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  sub_100009CF0(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor, &qword_1000669D0);
  return v0;
}

uint64_t sub_1000225C4()
{
  uint64_t v0;

  sub_100022308();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000225E8()
{
  return type metadata accessor for ColorPickerState(0);
}

uint64_t type metadata accessor for ColorPickerState(uint64_t a1)
{
  uint64_t result;

  result = qword_1000663F8;
  if (!qword_1000663F8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ColorPickerState);
  return result;
}

void sub_10002262C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[22];

  sub_1000228B8(319, &qword_100066408, &qword_100065BC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v3 <= 0x3F)
  {
    v23[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100022874(319, &qword_100066410, (uint64_t)&type metadata for SomeColor);
    if (v5 <= 0x3F)
    {
      v23[1] = *(_QWORD *)(v4 - 8) + 64;
      sub_100022874(319, &qword_100066418, (uint64_t)&type metadata for Bool);
      if (v7 <= 0x3F)
      {
        v8 = *(_QWORD *)(v6 - 8) + 64;
        v23[2] = v8;
        v23[3] = v8;
        sub_100022874(319, &qword_100066420, (uint64_t)&type metadata for Tab);
        if (v10 <= 0x3F)
        {
          v23[4] = *(_QWORD *)(v9 - 8) + 64;
          sub_1000228B8(319, &qword_100066428, &qword_1000658F0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
          if (v12 <= 0x3F)
          {
            v23[5] = *(_QWORD *)(v11 - 8) + 64;
            sub_100022874(319, &qword_100066430, (uint64_t)&type metadata for String);
            if (v14 <= 0x3F)
            {
              v23[6] = *(_QWORD *)(v13 - 8) + 64;
              v23[7] = v8;
              v23[8] = v8;
              sub_1000228B8(319, &qword_100066438, &qword_100066440, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
              if (v16 <= 0x3F)
              {
                v23[9] = *(_QWORD *)(v15 - 8) + 64;
                v23[10] = v8;
                v23[11] = v8;
                v23[12] = v8;
                v23[13] = v8;
                v23[14] = v8;
                v23[15] = v8;
                sub_100022874(319, &qword_100066448, (uint64_t)&type metadata for CGFloat);
                if (v18 <= 0x3F)
                {
                  v23[16] = *(_QWORD *)(v17 - 8) + 64;
                  v23[17] = v8;
                  v23[18] = &unk_100045F18;
                  v23[19] = v8;
                  sub_1000228B8(319, &qword_100066450, &qword_100066158, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
                  if (v20 <= 0x3F)
                  {
                    v23[20] = *(_QWORD *)(v19 - 8) + 64;
                    sub_1000228B8(319, &qword_100066458, (uint64_t *)&unk_100066460, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
                    if (v22 <= 0x3F)
                    {
                      v23[21] = *(_QWORD *)(v21 - 8) + 64;
                      swift_updateClassMetadata2(a1, 256, 22, v23, a1 + 80);
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

void sub_100022874(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = type metadata accessor for Published(0, a3);
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1000228B8(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = sub_100009E2C(a3);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void *sub_100022910()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10002291C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ColorPickerState(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100022958@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
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
  char v18;

  KeyPath = swift_getKeyPath(&unk_100045F68);
  v5 = swift_getKeyPath(&unk_100045F90);
  static Published.subscript.getter(&v14, a1, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  if (v18 == 2)
  {
    v7 = swift_getKeyPath(&unk_100045FB0);
    v8 = swift_getKeyPath(&unk_100045FD8);
    static Published.subscript.getter(&v14, a1, v7, v8);
    swift_release(v7);
    result = swift_release(v8);
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v17;
    v13 = v18;
  }
  else
  {
    v9 = v14;
    v10 = v15;
    v13 = v18 & 1;
    v11 = v16;
    v12 = v17;
  }
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 24) = v12;
  *(_BYTE *)(a2 + 32) = v13;
  return result;
}

uint64_t sub_100022A44(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t KeyPath;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v11 = *a1;
  v5 = *((_QWORD *)a1 + 2);
  v6 = *((_QWORD *)a1 + 3);
  v7 = *((_BYTE *)a1 + 32);
  KeyPath = swift_getKeyPath(&unk_100045F68);
  v9 = swift_getKeyPath(&unk_100045F90);
  v12 = v11;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  swift_retain(a4);
  return static Published.subscript.setter(&v12, a4, KeyPath, v9);
}

uint64_t sub_100022AD4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046280);
  v5 = swift_getKeyPath(&unk_1000462A8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100022B50(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046280);
  v5 = swift_getKeyPath(&unk_1000462A8);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

unint64_t sub_100022BF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000669E0;
  if (!qword_1000669E0)
  {
    v1 = sub_100009E2C(&qword_1000669C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for Published<A>.Publisher, v1);
    atomic_store(result, (unint64_t *)&qword_1000669E0);
  }
  return result;
}

uint64_t sub_100022C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000060E4(&qword_1000669D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100022CF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060E4(&qword_100066D78);
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
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    result = sub_1000290A0((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 2;
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

unint64_t sub_100022DFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060E4(&qword_100066D68);
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
    sub_100009C1C(v7, (uint64_t)&v14, &qword_100066D70);
    v8 = v14;
    result = sub_1000290A0(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_10002C23C(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
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

uint64_t sub_100022F28@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  _OWORD *v9;
  __int128 v10;
  char v11;
  __int128 v12;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_native(*v2);
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_100029E2C(v5);
    v5 = result;
  }
  v7 = *(_QWORD *)(v5 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    v8 = v7 - 1;
    v9 = (_OWORD *)(v5 + 40 * a1);
    v10 = v9[2];
    v9 += 2;
    v11 = *((_BYTE *)v9 + 32);
    v12 = v9[1];
    result = (uint64_t)memmove(v9, (char *)v9 + 40, 40 * (v7 - 1 - a1));
    *(_QWORD *)(v5 + 16) = v8;
    *v2 = v5;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v12;
    *(_BYTE *)(a2 + 32) = v11;
  }
  return result;
}

_QWORD *sub_100022FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  _QWORD *v11;
  _OWORD *i;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD v17[2];
  _OWORD v18[3];
  _QWORD *v19;

  v4 = v3;
  v17[0] = a1;
  v17[1] = a2;
  v6 = sub_1000060E4(&qword_100066C98);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    v19 = _swiftEmptyArrayStorage;
    sub_10002985C(0, v10, 0);
    v11 = v19;
    for (i = (_OWORD *)(a3 + 64); ; i += 3)
    {
      v13 = *(i - 1);
      v18[0] = *(i - 2);
      v18[1] = v13;
      v18[2] = *i;
      ((void (*)(_OWORD *))v17[0])(v18);
      if (v4)
        break;
      v4 = 0;
      v19 = v11;
      v15 = v11[2];
      v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_10002985C(v14 > 1, v15 + 1, 1);
        v11 = v19;
      }
      v11[2] = v15 + 1;
      sub_100009A88((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v15, &qword_100066C98);
      if (!--v10)
        return v11;
    }
    swift_release(v11);
  }
  return v11;
}

double sub_10002313C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v6;
  double result;
  __int128 v8;
  _OWORD v9[2];
  char v10;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046700);
  v5 = swift_getKeyPath(&unk_100046728);
  static Published.subscript.getter(v9, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  v6 = v10;
  result = *(double *)v9;
  v8 = v9[1];
  *(_OWORD *)a2 = v9[0];
  *(_OWORD *)(a2 + 16) = v8;
  *(_BYTE *)(a2 + 32) = v6;
  return result;
}

uint64_t sub_1000231C0(__int128 *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v9 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  v4 = *((_BYTE *)a1 + 32);
  v5 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046700);
  v7 = swift_getKeyPath(&unk_100046728);
  v10 = v9;
  v11 = v2;
  v12 = v3;
  v13 = v4;
  swift_retain(v5);
  return static Published.subscript.setter(&v10, v5, KeyPath, v7);
}

void *sub_10002337C(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *result;
  __int128 v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  _OWORD *v19;
  __int128 v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  void (*v29)(_BYTE *, _QWORD);
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[32];
  _BYTE v34[24];
  _QWORD v35[5];
  __int128 v36;
  unint64_t v37;
  _OWORD v38[3];
  uint64_t v39;

  v2 = v1;
  v4 = sub_1000060E4(&qword_100066C68);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_100028790(a1, &v36);
  if (v37 >> 62 == 2)
  {
    v37 &= 0x3FFFFFFFFFFFFFFFuLL;
    v9 = *(_OWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent + 16);
    v38[0] = *(_OWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent);
    v38[1] = v9;
    v38[2] = *(_OWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent + 32);
    v39 = *(_QWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent + 48);
    sub_10002B76C((uint64_t *)v38);
    sub_100023668(a1);
    result = sub_10002B934((uint64_t *)v38);
    v10 = *(void **)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
    if (v10)
    {
      v11 = v10;
      dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

      v35[0] = 0;
      v12 = NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)(v35, v4);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v13 = *(_QWORD *)(v12 + 16);
      if (v13)
      {
        v14 = (__int128 *)(v12 + 64);
        v15 = _swiftEmptyArrayStorage;
        do
        {
          if (*(_QWORD *)v14 >> 62 == 2)
          {
            v32 = *v14;
            v31 = *(v14 - 2);
            v30 = *(v14 - 1);
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
            v35[0] = v15;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_100029840(0, v15[2] + 1, 1);
              v15 = (_QWORD *)v35[0];
            }
            v17 = v15[2];
            v16 = v15[3];
            v18 = v32;
            if (v17 >= v16 >> 1)
            {
              sub_100029840((char *)(v16 > 1), v17 + 1, 1);
              v18 = v32;
              v15 = (_QWORD *)v35[0];
            }
            v15[2] = v17 + 1;
            v19 = &v15[6 * v17];
            v20 = v30;
            v19[2] = v31;
            v19[3] = v20;
            v19[4] = v18;
          }
          v14 += 3;
          --v13;
        }
        while (v13);
      }
      else
      {
        v15 = _swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease(v12);
      v22 = sub_1000237F4((uint64_t)a1, (uint64_t)v15);
      v24 = v23;
      result = (void *)swift_release(v15);
      if ((v24 & 1) == 0)
      {
        v25 = v2 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator__colorPickerState;
        swift_beginAccess(v25, v34, 0, 0);
        v26 = *(_QWORD *)(v25 + 8);
        KeyPath = swift_getKeyPath(&unk_100046748);
        v28 = swift_getKeyPath(&unk_100046770);
        swift_retain(v26);
        v29 = (void (*)(_BYTE *, _QWORD))static Published.subscript.modify(v33, v26, KeyPath, v28);
        sub_100022F28(v22, (uint64_t)v35);
        v29(v33, 0);
        swift_release(v26);
        swift_release(KeyPath);
        return (void *)swift_release(v28);
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

_QWORD *sub_100023668(__int128 *a1)
{
  uint64_t v1;
  _QWORD *result;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[2];
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[2];
  char v25;

  result = sub_100028790(a1, v18);
  v3 = v19;
  if (v19 >> 62 == 2)
  {
    v19 &= 0x3FFFFFFFFFFFFFFFuLL;
    v4 = v20;
    v24[0] = v18[0];
    v24[1] = v18[1];
    v25 = v3 & 1;
    v21 = *(_OWORD *)(v1 + 40);
    v16 = *(_OWORD *)(v1 + 40);
    v5 = sub_1000060E4(&qword_100066CE0);
    State.wrappedValue.getter(&v23, v5);
    v6 = v23;
    if (*(_QWORD *)(v23 + 16) && (v7 = sub_10002912C((uint64_t)v24), (v8 & 1) != 0))
    {
      v9 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_bridgeObjectRetain(v9);
    }
    else
    {
      v9 = &_swiftEmptySetSingleton;
    }
    swift_bridgeObjectRelease(v6);
    v17 = (uint64_t)v9;
    v23 = v21;
    sub_100009A88((uint64_t)&v21 + 8, (uint64_t)&v22, &qword_100066D28);
    sub_100029E54((uint64_t *)&v16, v4);
    v10 = v17;
    v16 = v21;
    sub_10002BD44(&v23);
    sub_100015D58(&v22);
    State.wrappedValue.getter(&v15, v5);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
    v12 = v15;
    v15 = 0x8000000000000000;
    *(_QWORD *)&v16 = v12;
    sub_10002A5CC(v10, (uint64_t)v24, isUniquelyReferenced_nonNull_native);
    v13 = v15;
    v15 = v16;
    swift_bridgeObjectRelease(v13);
    v16 = v21;
    v14 = v15;
    State.wrappedValue.setter(&v14, v5);
    sub_10002BD6C(&v23);
    return sub_10001E9C4(&v22);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000237F4(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
    __asm { BR              X9 }
  return 0;
}

void sub_100023A78(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void (*v20)(char *, char *, uint64_t);
  void *v21;
  id v22;
  Class isa;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  unint64_t v33;

  v2 = v1;
  v4 = sub_1000060E4(&qword_100066C98);
  __chkstk_darwin(v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IndexPath(0, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v32 - v14;
  if (objc_msgSend(a1, "state") == (id)1)
  {
    v16 = OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView;
    objc_msgSend(a1, "locationInView:", *(_QWORD *)(v2 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView));
    v17 = *(void **)(v2 + v16);
    if (v17)
    {
      v18 = objc_msgSend(v17, "indexPathForItemAtPoint:");
      if (v18)
      {
        v19 = v18;
        static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v18);

        v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v20(v6, v13, v9);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
        {
          v20(v15, v6, v9);
          v21 = *(void **)(v2 + v16);
          if (v21)
          {
            v22 = v21;
            isa = IndexPath._bridgeToObjectiveC()().super.isa;
            v24 = objc_msgSend(v22, "cellForItemAtIndexPath:", isa);

            if (v24)
            {
              v25 = type metadata accessor for FavoriteColorWellCell();
              v26 = swift_dynamicCastClass(v24, v25);
              if (v26)
              {
                v27 = *(void **)(v2
                               + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
                if (v27)
                {
                  v28 = (void *)v26;
                  v29 = v27;
                  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)(&v32, v15);

                  if (v33 >> 1 == 0xFFFFFFFF || v33 >> 62 != 2)
                  {
                    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);

                    return;
                  }
                  sub_1000075F4(0, &qword_100066D20, UIEditMenuConfiguration_ptr);
                  objc_msgSend(v28, "center", 0, 0, 0, 0, 0);
                  v30 = (void *)UIEditMenuConfiguration.init(identifier:sourcePoint:)(&v32);
                  v31 = sub_10003277C();
                  objc_msgSend(v31, "presentEditMenuWithConfiguration:", v30);

                  goto LABEL_16;
                }
LABEL_20:
                __break(1u);
                return;
              }

            }
LABEL_16:
            (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
            return;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
      }
      sub_100009CF0((uint64_t)v6, &qword_100066C98);
      return;
    }
    __break(1u);
    goto LABEL_19;
  }
}

id sub_100023DFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteColorPickerView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FavoriteColorPickerView.Coordinator()
{
  return objc_opt_self(_TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator);
}

uint64_t sub_100023EF4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  NSString v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  NSString v28;
  NSString v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSString v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t KeyPath;
  uint64_t v47;
  uint64_t v48;
  char v49;
  __int128 v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t result;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  _OWORD v81[2];
  char v82;
  char *v83;

  v1 = v0;
  v2 = sub_1000060E4(&qword_100066C68);
  v79 = *(_QWORD *)(v2 - 8);
  v80 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)sub_1000246D8();
  v6 = objc_msgSend(objc_allocWithZone((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v5, 0.0, 0.0, 0.0, 0.0);

  sub_1000060E4(&qword_100066C70);
  UIViewRepresentableContext.coordinator.getter(v81);
  v7 = *(void **)&v81[0];
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)&v81[0]);

  v8 = (void *)objc_opt_self(UIColor);
  v9 = v6;
  v10 = objc_msgSend(v8, "clearColor");
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v9, "setAllowsSelection:", 1);
  objc_msgSend(v9, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v9, "setPrefetchingEnabled:", 0);
  v11 = type metadata accessor for AddColorCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
  v13 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", ObjCClassFromMetadata, v13);

  v14 = type metadata accessor for FavoriteColorWellCell();
  v15 = swift_getObjCClassFromMetadata(v14);
  v16 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", v15, v16);

  v17 = sub_1000075F4(0, (unint64_t *)&unk_100066CF0, UICollectionViewCell_ptr);
  v18 = swift_getObjCClassFromMetadata(v17);
  v19 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", v18, v19);

  v20 = type metadata accessor for RemoveColorCell();
  v21 = swift_getObjCClassFromMetadata(v20);
  v22 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", v21, v22);

  v23 = sub_1000075F4(0, (unint64_t *)&qword_100066F70, UIColorPickerViewController_ptr);
  v24 = swift_getObjCClassFromMetadata(v23);
  v25 = (void *)objc_opt_self(NSBundle);
  v26 = v9;
  v27 = objc_msgSend(v25, "bundleForClass:", v24);
  v28 = String._bridgeToObjectiveC()();
  v29 = String._bridgeToObjectiveC()();
  v30 = objc_msgSend(v27, "localizedStringForKey:value:table:", v28, 0, v29);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  v32 = v31;

  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  objc_msgSend(v26, "setAccessibilityLabel:", v33);

  UIViewRepresentableContext.coordinator.getter(v81);
  v34 = objc_allocWithZone((Class)UILongPressGestureRecognizer);
  v35 = *(void **)&v81[0];
  v36 = objc_msgSend(v34, "initWithTarget:action:", *(_QWORD *)&v81[0], "showDeleteCallout:");

  objc_msgSend(v26, "addGestureRecognizer:", v36);
  v37 = swift_allocObject(&unk_10005BCF8, 24, 7);
  v38 = v26;
  UIViewRepresentableContext.coordinator.getter(v81);
  v39 = *(void **)&v81[0];
  swift_unknownObjectWeakInit(v37 + 16, *(_QWORD *)&v81[0]);

  v40 = objc_allocWithZone((Class)sub_1000060E4(&qword_100066D00));
  v41 = UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)(v38, sub_10002BC9C, v37);
  v42 = *v1;
  if (*v1)
  {
    v43 = (void *)v41;
    v44 = swift_retain(*v1);
    sub_1000252B0(v44, (uint64_t)v4);
    swift_release(v42);
    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)(v4, 0, 0, 0);
    UIViewRepresentableContext.coordinator.getter(&v83);
    v78 = v4;
    v45 = v83;
    KeyPath = swift_getKeyPath(&unk_100046700);
    v47 = swift_getKeyPath(&unk_100046728);
    v48 = swift_retain(v42);
    static Published.subscript.getter(v81, v48, KeyPath, v47);
    swift_release(v42);
    swift_release(KeyPath);
    swift_release(v47);
    v49 = v82;
    v50 = v81[1];
    v51 = &v45[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor];
    *(_OWORD *)v51 = v81[0];
    *((_OWORD *)v51 + 1) = v50;
    v51[32] = v49;

    UIViewRepresentableContext.coordinator.getter(v81);
    v52 = *(char **)&v81[0];
    v53 = swift_getKeyPath(&unk_100046748);
    v54 = swift_getKeyPath(&unk_100046770);
    v55 = swift_retain(v42);
    static Published.subscript.getter(&v83, v55, v53, v54);
    swift_release(v42);
    swift_release(v53);
    swift_release(v54);
    v56 = *(_QWORD *)&v52[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors];
    *(_QWORD *)&v52[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors] = v83;

    swift_bridgeObjectRelease(v56);
    UIViewRepresentableContext.coordinator.getter(v81);
    v57 = *(void **)&v81[0];
    *(_QWORD *)(*(_QWORD *)&v81[0]
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage) = v1[4];

    UIViewRepresentableContext.coordinator.getter(v81);
    v58 = *(char **)&v81[0];
    v59 = swift_getKeyPath(&unk_100046790);
    v60 = swift_getKeyPath(&unk_1000467B8);
    v61 = swift_retain(v42);
    static Published.subscript.getter(&v83, v61, v59, v60);
    swift_release(v42);
    swift_release(v59);
    swift_release(v60);
    v62 = *(_QWORD *)&v58[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors];
    *(_QWORD *)&v58[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors] = v83;

    swift_bridgeObjectRelease(v62);
    UIViewRepresentableContext.coordinator.getter(v81);
    v63 = *(void **)&v81[0];
    v64 = *(void **)(*(_QWORD *)&v81[0]
                   + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
    *(_QWORD *)(*(_QWORD *)&v81[0]
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource) = v43;
    v65 = v43;

    UIViewRepresentableContext.coordinator.getter(v81);
    v66 = *(void **)&v81[0];
    v67 = *(void **)(*(_QWORD *)&v81[0]
                   + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView);
    *(_QWORD *)(*(_QWORD *)&v81[0]
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView) = v38;
    v68 = v38;

    UIViewRepresentableContext.coordinator.getter(v81);
    v69 = *(_BYTE **)&v81[0];
    v70 = swift_getKeyPath(&unk_100046820);
    v71 = swift_getKeyPath(&unk_100046848);
    v72 = swift_retain(v42);
    static Published.subscript.getter(&v83, v72, v70, v71);

    swift_release(v42);
    swift_release(v70);
    swift_release(v71);
    LOBYTE(v70) = (_BYTE)v83;
    (*(void (**)(char *, uint64_t))(v79 + 8))(v78, v80);
    v69[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout] = v70;

    return (uint64_t)v68;
  }
  else
  {
    v74 = v1[1];
    v75 = type metadata accessor for ColorPickerState(0);
    v76 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v74, v75, v76);
    __break(1u);
  }
  return result;
}

uint64_t sub_1000246D8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Class isa;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  Class v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  Class v53;
  id v54;
  id v55;
  uint64_t v56;
  __int128 v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t result;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  _QWORD aBlock[5];
  uint64_t v69;

  v1 = *v0;
  if (v1)
  {
    KeyPath = swift_getKeyPath(&unk_100046820);
    v3 = swift_getKeyPath(&unk_100046848);
    v4 = swift_retain(v1);
    static Published.subscript.getter(aBlock, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    v5 = LOBYTE(aBlock[0]);
    v6 = (void *)objc_opt_self(UIDevice);
    v7 = objc_msgSend(v6, "currentDevice");
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = 30.0;
    if (v5)
      v9 = 28.0;
    if (v8 == (id)6)
      v10 = 42.0;
    else
      v10 = v9;
    v11 = swift_getKeyPath(&unk_100046820);
    v12 = swift_getKeyPath(&unk_100046848);
    v13 = swift_retain(v1);
    static Published.subscript.getter(aBlock, v13, v11, v12);
    swift_release(v1);
    swift_release(v11);
    swift_release(v12);
    LODWORD(v12) = LOBYTE(aBlock[0]);
    v14 = objc_msgSend(v6, "currentDevice");
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    v16 = 18.0;
    if ((_DWORD)v12)
      v17 = 16.0;
    else
      v17 = 18.0;
    if (v15 == (id)6)
      v18 = 20.0;
    else
      v18 = v17;
    v19 = swift_getKeyPath(&unk_100046820);
    v20 = swift_getKeyPath(&unk_100046848);
    v21 = swift_retain(v1);
    static Published.subscript.getter(aBlock, v21, v19, v20);
    swift_release(v1);
    swift_release(v19);
    swift_release(v20);
    if (LOBYTE(aBlock[0]))
      v16 = 16.0;
    v22 = (void *)objc_opt_self(NSCollectionLayoutDimension);
    v23 = objc_msgSend(v22, "absoluteDimension:", v10);
    v24 = objc_msgSend(v22, "absoluteDimension:", v10);
    v25 = (void *)objc_opt_self(NSCollectionLayoutSize);
    v26 = objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v23, v24);

    v27 = objc_msgSend((id)objc_opt_self(NSCollectionLayoutItem), "itemWithLayoutSize:", v26);
    v28 = (void *)objc_opt_self(NSCollectionLayoutGroup);
    v29 = objc_msgSend(v22, "fractionalWidthDimension:", 1.0);
    v30 = objc_msgSend(v22, "absoluteDimension:", v10);
    v31 = objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v29, v30);

    v32 = sub_1000060E4(&qword_100065360);
    v33 = swift_allocObject(v32, 40, 7);
    *(_OWORD *)(v33 + 16) = xmmword_100046990;
    *(_QWORD *)(v33 + 32) = v27;
    aBlock[0] = v33;
    specialized Array._endMutation()();
    v34 = aBlock[0];
    sub_1000075F4(0, &qword_100066CC8, NSCollectionLayoutItem_ptr);
    v66 = v27;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v34);
    v36 = objc_msgSend(v28, "horizontalGroupWithLayoutSize:subitems:", v31, isa);

    v37 = (void *)objc_opt_self(NSCollectionLayoutSpacing);
    v38 = objc_msgSend(v37, "fixedSpacing:", v18);
    objc_msgSend(v36, "setInterItemSpacing:", v38);

    v39 = objc_msgSend(v22, "fractionalWidthDimension:", 1.0);
    v40 = objc_msgSend(v22, "fractionalHeightDimension:", 1.0);
    v41 = objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v39, v40);

    v42 = swift_allocObject(v32, 40, 7);
    *(_OWORD *)(v42 + 16) = xmmword_100046990;
    *(_QWORD *)(v42 + 32) = v36;
    aBlock[0] = v42;
    specialized Array._endMutation()();
    v43 = aBlock[0];
    v65 = v36;
    v44 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v43);
    v45 = objc_msgSend(v28, "verticalGroupWithLayoutSize:subitems:", v41, v44);

    v46 = objc_msgSend(v37, "fixedSpacing:", v16);
    objc_msgSend(v45, "setInterItemSpacing:", v46);

    v47 = objc_msgSend(v22, "fractionalWidthDimension:", 1.0);
    v48 = objc_msgSend(v22, "fractionalHeightDimension:", 1.0);
    v49 = objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v47, v48);

    v50 = swift_allocObject(v32, 40, 7);
    *(_OWORD *)(v50 + 16) = xmmword_100046990;
    *(_QWORD *)(v50 + 32) = v45;
    aBlock[0] = v50;
    specialized Array._endMutation()();
    v51 = aBlock[0];
    v52 = v45;
    v53 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v51);
    v54 = objc_msgSend(v28, "horizontalGroupWithLayoutSize:subitems:", v49, v53);

    v55 = objc_msgSend((id)objc_opt_self(NSCollectionLayoutSection), "sectionWithGroup:", v54);
    objc_msgSend(v55, "setInterGroupSpacing:", v18);
    objc_msgSend(v55, "setOrthogonalScrollingBehavior:", 4);
    v56 = swift_allocObject(&unk_10005BC58, 72, 7);
    v57 = *(_OWORD *)(v67 + 16);
    *(_OWORD *)(v56 + 16) = *(_OWORD *)v67;
    *(_OWORD *)(v56 + 32) = v57;
    *(_OWORD *)(v56 + 48) = *(_OWORD *)(v67 + 32);
    *(_QWORD *)(v56 + 64) = *(_QWORD *)(v67 + 48);
    aBlock[4] = sub_10002BB88;
    v69 = v56;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000276C8;
    aBlock[3] = &unk_10005BC70;
    v58 = _Block_copy(aBlock);
    v59 = v69;
    sub_10002B76C((uint64_t *)v67);
    swift_release(v59);
    objc_msgSend(v55, "setVisibleItemsInvalidationHandler:", v58);
    _Block_release(v58);
    v60 = objc_msgSend(objc_allocWithZone((Class)UICollectionViewCompositionalLayout), "initWithSection:", v55);

    return (uint64_t)v60;
  }
  else
  {
    v62 = *(_QWORD *)(v67 + 8);
    v63 = type metadata accessor for ColorPickerState(0);
    v64 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v62, v63, v64);
    __break(1u);
  }
  return result;
}

uint64_t sub_100024E58(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v6;
  __int128 v7[3];
  __int128 v8;

  sub_100028790(a3, v7);
  a4 += 16;
  swift_beginAccess(a4, &v6, 0, 0);
  if (swift_unknownObjectWeakLoadStrong(a4))
  {
    sub_100028790(v7, &v8);
    __asm { BR              X13 }
  }
  return 0;
}

uint64_t sub_1000252B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  __int128 v58;
  char isUniquelyReferenced_nonNull_native;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  _OWORD v80[2];
  char v81;
  uint64_t v82;
  __int128 v83;
  _OWORD v84[2];
  char v85;

  v3 = v2;
  v6 = sub_1000060E4(&qword_100066C68);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10002B474((uint64_t)_swiftEmptyArrayStorage);
  v11 = sub_10002BC34();
  NSDiffableDataSourceSnapshot.init()(&type metadata for Int, &type metadata for FavoriteColorPickerView.ColorItem, &protocol witness table for Int, v11);
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_100059B60);
  v12 = *(_QWORD *)v3;
  if (!*(_QWORD *)v3)
    goto LABEL_56;
  KeyPath = swift_getKeyPath(&unk_1000467D8);
  v14 = swift_getKeyPath(&unk_100046800);
  v15 = swift_retain(v12);
  static Published.subscript.getter(v84, v15, KeyPath, v14);
  swift_release(v12);
  swift_release(KeyPath);
  swift_release(v14);
  if ((v84[0] & 1) != 0)
  {
    *(_QWORD *)&v84[0] = 0;
    BYTE8(v84[0]) = 1;
    NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(&off_100059B88, v84, v6);
  }
  v16 = swift_getKeyPath(&unk_100046790);
  v17 = swift_getKeyPath(&unk_1000467B8);
  v18 = swift_retain(v12);
  static Published.subscript.getter(v84, v18, v16, v17);
  swift_release(v12);
  swift_release(v16);
  swift_release(v17);
  v19 = *(_QWORD *)&v84[0];
  v74 = v7;
  v75 = v9;
  v73 = v12;
  if (!*(_QWORD *)&v84[0])
    goto LABEL_16;
  if (!*(_QWORD *)(*(_QWORD *)&v84[0] + 16))
  {
    swift_bridgeObjectRelease(*(_QWORD *)&v84[0]);
LABEL_16:
    v70 = 0;
    goto LABEL_19;
  }
  *(_QWORD *)&v79 = a1;
  v20 = sub_100027764(*(uint64_t *)&v84[0]);
  v70 = 0;
  swift_bridgeObjectRelease(v19);
  *(_QWORD *)&v84[0] = 0;
  BYTE8(v84[0]) = 1;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(v20, v84, v6);
  v21 = v20[2];
  swift_bridgeObjectRelease(v20);
  v22 = *((_QWORD *)v3 + 4);
  if (!v22)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v23 = v22 - v21 % v22;
  if (__OFSUB__(v22, v21 % v22))
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  if (v23 < 0)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    v67 = *((_QWORD *)v3 + 1);
    v68 = type metadata accessor for ColorPickerState(0);
    v69 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v67, v68, v69);
    __break(1u);
    return result;
  }
  v24 = v6;
  if (v23)
  {
    v25 = sub_1000296D8(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    v26 = 0;
    v27 = *((_QWORD *)v25 + 2);
    v28 = 48 * v27;
    v29 = xmmword_1000469A0;
    do
    {
      v30 = *((_QWORD *)v25 + 3);
      if (v27 + v26 >= v30 >> 1)
      {
        v78 = v29;
        v32 = sub_1000296D8((char *)(v30 > 1), v27 + v26 + 1, 1, v25);
        v29 = v78;
        v25 = v32;
      }
      *((_QWORD *)v25 + 2) = v27 + v26 + 1;
      v31 = &v25[v28];
      *((_QWORD *)v31 + 4) = v26;
      *((_QWORD *)v31 + 5) = 0;
      *((_QWORD *)v31 + 6) = 0;
      *((_QWORD *)v31 + 7) = 0;
      *((_OWORD *)v31 + 4) = v29;
      v28 += 48;
      ++v26;
    }
    while (v23 != v26);
  }
  else
  {
    v25 = (char *)_swiftEmptyArrayStorage;
  }
  *(_QWORD *)&v84[0] = 0;
  BYTE8(v84[0]) = 1;
  v6 = v24;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(v25, v84, v24);
  swift_bridgeObjectRelease(v25);
  a1 = v79;
LABEL_19:
  v33 = swift_getKeyPath(&unk_100046748);
  v34 = swift_getKeyPath(&unk_100046770);
  static Published.subscript.getter(v84, a1, v33, v34);
  swift_release(v33);
  swift_release(v34);
  v35 = *(_QWORD *)&v84[0];
  v77 = *(_QWORD *)(*(_QWORD *)&v84[0] + 16);
  if (v77)
  {
    v71 = v6;
    v72 = a2;
    v36 = 0;
    v83 = *(_OWORD *)(v3 + 40);
    v3 = (char *)_swiftEmptyArrayStorage;
    v76 = *(_QWORD *)&v84[0] + 32;
    while (v36 < *(_QWORD *)(v35 + 16))
    {
      v37 = v76 + 40 * v36;
      v84[0] = *(_OWORD *)v37;
      v84[1] = *(_OWORD *)(v37 + 16);
      v38 = *(unsigned __int8 *)(v37 + 32);
      v85 = *(_BYTE *)(v37 + 32);
      v39 = *(_OWORD *)v37;
      v78 = *(_OWORD *)(v37 + 16);
      v79 = v39;
      if (*(_QWORD *)(v10 + 16) && (v40 = sub_10002912C((uint64_t)v84), (v41 & 1) != 0))
      {
        v42 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v40);
        v43 = v42 + 1;
        if (__OFADD__(v42, 1))
          goto LABEL_52;
      }
      else
      {
        v43 = 0;
        if (__OFADD__(-1, 1))
          goto LABEL_52;
      }
      ++v36;
      while (1)
      {
        v80[0] = v83;
        v45 = sub_1000060E4(&qword_100066CE0);
        State.wrappedValue.getter(&v82, v45);
        v46 = v82;
        if (!*(_QWORD *)(v82 + 16))
          break;
        v47 = sub_10002912C((uint64_t)v84);
        if ((v48 & 1) == 0)
          break;
        v49 = *(_QWORD *)(*(_QWORD *)(v46 + 56) + 8 * v47);
        swift_bridgeObjectRetain(v49);
        swift_bridgeObjectRelease(v46);
        if (!*(_QWORD *)(v49 + 16))
          goto LABEL_39;
        v50 = static Hasher._hash(seed:_:)(*(_QWORD *)(v49 + 40), v43);
        v51 = -1 << *(_BYTE *)(v49 + 32);
        v52 = v50 & ~v51;
        if (((*(_QWORD *)(v49 + 56 + ((v52 >> 3) & 0xFFFFFFFFFFFFF8)) >> v52) & 1) == 0)
          goto LABEL_39;
        v53 = *(_QWORD *)(v49 + 48);
        if (*(_QWORD *)(v53 + 8 * v52) != v43)
        {
          v54 = ~v51;
          while (1)
          {
            v52 = (v52 + 1) & v54;
            if (((*(_QWORD *)(v49 + 56 + ((v52 >> 3) & 0xFFFFFFFFFFFFF8)) >> v52) & 1) == 0)
              break;
            if (*(_QWORD *)(v53 + 8 * v52) == v43)
              goto LABEL_29;
          }
LABEL_39:
          v46 = v49;
          break;
        }
LABEL_29:
        swift_bridgeObjectRelease(v49);
        if (__OFADD__(v43++, 1))
        {
          __break(1u);
          goto LABEL_51;
        }
      }
      swift_bridgeObjectRelease(v46);
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        v3 = sub_1000296D8(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v56 = *((_QWORD *)v3 + 2);
      v55 = *((_QWORD *)v3 + 3);
      if (v56 >= v55 >> 1)
        v3 = sub_1000296D8((char *)(v55 > 1), v56 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v56 + 1;
      v57 = &v3[48 * v56];
      v58 = v78;
      *((_OWORD *)v57 + 2) = v79;
      *((_OWORD *)v57 + 3) = v58;
      *((_QWORD *)v57 + 8) = v38 | 0x8000000000000000;
      *((_QWORD *)v57 + 9) = v43;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
      *(_QWORD *)&v80[0] = v10;
      sub_10002A714(v43, (uint64_t)v84, isUniquelyReferenced_nonNull_native);
      v10 = *(_QWORD *)&v80[0];
      swift_bridgeObjectRelease(0x8000000000000000);
      if (v36 == v77)
      {
        swift_bridgeObjectRelease(v35);
        a2 = v72;
        v6 = v71;
        goto LABEL_47;
      }
    }
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  swift_bridgeObjectRelease(*(_QWORD *)&v84[0]);
  v3 = (char *)_swiftEmptyArrayStorage;
LABEL_47:
  *(_QWORD *)&v80[0] = 0;
  BYTE8(v80[0]) = 1;
  v60 = v75;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(v3, v80, v6);
  swift_bridgeObjectRelease(v3);
  v61 = swift_getKeyPath(&unk_100046700);
  v62 = swift_getKeyPath(&unk_100046728);
  v63 = v73;
  v64 = swift_retain(v73);
  static Published.subscript.getter(v80, v64, v61, v62);
  swift_release(v63);
  swift_release(v61);
  swift_release(v62);
  v65 = v74;
  if (v81 != 2)
  {
    *(_QWORD *)&v80[0] = 0;
    BYTE8(v80[0]) = 1;
    NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(&off_100059BD8, v80, v6);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v65 + 32))(a2, v60, v6);
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_1000259D0(void *a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int v27;
  uint64_t v28;
  uint64_t KeyPath;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  float64_t v34;
  BOOL v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  float64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t (**v54)();
  float64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  float64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  float64x2_t v75;
  float64x2_t *v76;
  float64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  float64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  float64_t v86;
  float64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  float64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  float64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  float64_t v107;
  char *v108;
  Class isa;
  void *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  __int128 v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t result;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  float64x2_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  char *v148;
  float64x2_t v149;
  uint64_t v150;
  float64x2_t aBlock;
  float64x2_t v152;
  void (*v153)();
  uint64_t v154;
  id v155[4];

  v3 = v2;
  v147 = a1;
  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v145 = *(_QWORD *)(v5 - 8);
  v146 = v5;
  __chkstk_darwin(v5);
  v144 = (char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v142 = *(_QWORD *)(v7 - 8);
  v143 = v7;
  __chkstk_darwin(v7);
  v141 = (char *)&v132 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = type metadata accessor for IndexPath(0, v9, v10);
  v134 = *(_QWORD *)(v135 - 8);
  __chkstk_darwin(v135);
  v133 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = sub_1000060E4(&qword_100066C68);
  v136 = *(_QWORD *)(v137 - 8);
  __chkstk_darwin(v137);
  v138 = (uint64_t)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000060E4(&qword_100066C70);
  v150 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v140 = (char *)&v132 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v148 = (char *)&v132 - v17;
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v132 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v132 - v22;
  v139 = v24;
  __chkstk_darwin(v21);
  v26 = (char *)&v132 - v25;
  UIViewRepresentableContext.coordinator.getter(v155);
  v149 = *(float64x2_t *)((char *)v155[0]
                        + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor
                        + 16);
  v132 = *(float64x2_t *)((char *)v155[0]
                        + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor);
  v27 = *((unsigned __int8 *)v155[0]
        + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor
        + 32);

  v28 = *v2;
  if (!*v2)
    goto LABEL_36;
  KeyPath = swift_getKeyPath(&unk_100046700);
  v30 = swift_getKeyPath(&unk_100046728);
  v31 = swift_retain(v28);
  static Published.subscript.getter(&aBlock, v31, KeyPath, v30);
  swift_release(v28);
  swift_release(KeyPath);
  swift_release(v30);
  v32 = v153;
  if (v27 != 2)
  {
    if (v153 == 2
      || (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v132, aBlock), (int32x4_t)vceqq_f64(v149, v152))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) != 0)
    {
      v36 = v150;
      v34 = *(double *)(v150 + 16);
      (*(void (**)(char *, char *, uint64_t))&v34)(v26, a2, v13);
    }
    else
    {
      v37 = v153 ^ v27;
      v36 = v150;
      v34 = *(double *)(v150 + 16);
      (*(void (**)(char *, char *, uint64_t))&v34)(v26, a2, v13);
      if ((v37 & 1) == 0)
        goto LABEL_8;
    }
LABEL_16:
    v43 = *(void (**)(char *, uint64_t))(v36 + 8);
    v43(v26, v13);
    (*(void (**)(char *, char *, uint64_t))&v34)(v23, a2, v13);
    goto LABEL_17;
  }
  v33 = v150;
  v34 = *(double *)(v150 + 16);
  (*(void (**)(char *, char *, uint64_t))&v34)(v26, a2, v13);
  v35 = v32 == 2;
  v36 = v33;
  if (!v35)
    goto LABEL_16;
LABEL_8:
  v149.f64[0] = v34;
  v38 = v36;
  UIViewRepresentableContext.coordinator.getter(&aBlock);
  LODWORD(v132.f64[0]) = *(unsigned __int8 *)(*(_QWORD *)&aBlock.f64[0]
                                            + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_allowsNoColor);

  v39 = swift_getKeyPath(&unk_1000467D8);
  v40 = swift_getKeyPath(&unk_100046800);
  v41 = swift_retain(v28);
  static Published.subscript.getter(v155, v41, v39, v40);
  swift_release(v28);
  swift_release(v39);
  v42 = v40;
  v34 = v149.f64[0];
  swift_release(v42);
  LODWORD(v39) = LOBYTE(v155[0]);
  v43 = *(void (**)(char *, uint64_t))(v38 + 8);
  v43(v26, v13);
  (*(void (**)(char *, char *, uint64_t))&v34)(v23, a2, v13);
  if (LODWORD(v132.f64[0]) != (_DWORD)v39)
  {
LABEL_17:
    v61 = v147;
    v43(v23, v13);
    (*(void (**)(char *, char *, uint64_t))&v34)(v20, a2, v13);
LABEL_18:
    v54 = off_100066000;
    v63 = v148;
    v43(v20, v13);
    v149.f64[0] = v34;
    (*(void (**)(char *, char *, uint64_t))&v34)(v63, a2, v13);
LABEL_19:
    v43(v63, v13);
    goto LABEL_20;
  }
  UIViewRepresentableContext.coordinator.getter(&aBlock);
  v44 = aBlock.f64[0];
  v45 = *(_QWORD *)(*(_QWORD *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors);
  swift_bridgeObjectRetain(v45);

  v46 = swift_getKeyPath(&unk_100046748);
  v47 = swift_getKeyPath(&unk_100046770);
  v48 = swift_retain(v28);
  static Published.subscript.getter(v155, v48, v46, v47);
  swift_release(v28);
  swift_release(v46);
  swift_release(v47);
  v49 = v155[0];
  LOBYTE(v47) = sub_100028FB8(v45, (uint64_t)v155[0]);
  swift_bridgeObjectRelease(v45);
  v50 = v49;
  v34 = v149.f64[0];
  swift_bridgeObjectRelease(v50);
  v43(v23, v13);
  (*(void (**)(char *, char *, uint64_t))&v34)(v20, a2, v13);
  if ((v47 & 1) == 0)
  {
    v61 = v147;
    goto LABEL_18;
  }
  UIViewRepresentableContext.coordinator.getter(&aBlock);
  v43(v20, v13);
  v51 = *(_QWORD *)(*(_QWORD *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage);

  v52 = v3[4];
  v53 = v148;
  (*(void (**)(char *, char *, uint64_t))&v34)(v148, a2, v13);
  v54 = off_100066000;
  if (v51 != v52)
  {
    v63 = v53;
    v61 = v147;
    goto LABEL_19;
  }
  UIViewRepresentableContext.coordinator.getter(&aBlock);
  v55 = aBlock.f64[0];
  v56 = *(_QWORD *)(*(_QWORD *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors);
  swift_bridgeObjectRetain(v56);

  v57 = swift_getKeyPath(&unk_100046790);
  v58 = swift_getKeyPath(&unk_1000467B8);
  v59 = swift_retain(v28);
  static Published.subscript.getter(v155, v59, v57, v58);
  swift_release(v28);
  swift_release(v57);
  swift_release(v58);
  v60 = (uint64_t)v155[0];
  v61 = v147;
  if (!v56)
  {
    v43(v148, v13);
    if (!v60)
      goto LABEL_22;
    goto LABEL_33;
  }
  if (!v155[0])
  {
    v43(v148, v13);
    v60 = v56;
LABEL_33:
    swift_bridgeObjectRelease(v60);
    goto LABEL_20;
  }
  v62 = sub_100028FB8(v56, (uint64_t)v155[0]);
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRelease(v60);
  v43(v148, v13);
  swift_bridgeObjectRelease_n(v56, 2);
  if ((v62 & 1) != 0)
    goto LABEL_22;
LABEL_20:
  v64 = swift_retain(v28);
  v65 = v138;
  sub_1000252B0(v64, v138);
  swift_release(v28);
  UIViewRepresentableContext.coordinator.getter(&aBlock);
  v66 = aBlock.f64[0];
  v67 = *(void **)(*(_QWORD *)&aBlock.f64[0]
                 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
  v68 = v67;

  if (v67)
  {
    UIViewRepresentableContext.coordinator.getter(v155);
    v69 = *((unsigned __int8 *)v155[0] + (unint64_t)v54[328]);

    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)(v65, v69, 0, 0);
    UIViewRepresentableContext.coordinator.getter(v155);
    v70 = (char *)v155[0];
    v71 = swift_getKeyPath(&unk_100046700);
    v72 = swift_getKeyPath(&unk_100046728);
    v73 = swift_retain(v28);
    static Published.subscript.getter(&aBlock, v73, v71, v72);
    swift_release(v28);
    swift_release(v71);
    swift_release(v72);
    v74 = (char)v153;
    v75 = v152;
    v76 = (float64x2_t *)&v70[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor];
    *v76 = aBlock;
    v76[1] = v75;
    LOBYTE(v76[2].f64[0]) = v74;

    UIViewRepresentableContext.coordinator.getter(&aBlock);
    v77 = aBlock.f64[0];
    v78 = swift_getKeyPath(&unk_1000467D8);
    v79 = swift_getKeyPath(&unk_100046800);
    v80 = swift_retain(v28);
    static Published.subscript.getter(v155, v80, v78, v79);
    swift_release(v28);
    swift_release(v78);
    swift_release(v79);
    *(_BYTE *)(*(_QWORD *)&v77
             + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_allowsNoColor) = v155[0];

    UIViewRepresentableContext.coordinator.getter(&aBlock);
    v81 = aBlock.f64[0];
    v82 = swift_getKeyPath(&unk_100046748);
    v83 = swift_getKeyPath(&unk_100046770);
    v84 = swift_retain(v28);
    static Published.subscript.getter(v155, v84, v82, v83);
    swift_release(v28);
    swift_release(v82);
    swift_release(v83);
    v85 = *(_QWORD *)(*(_QWORD *)&v81
                    + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors);
    *(id *)(*(_QWORD *)&v81
          + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors) = v155[0];

    swift_bridgeObjectRelease(v85);
    UIViewRepresentableContext.coordinator.getter(&aBlock);
    v86 = aBlock.f64[0];
    *(_QWORD *)(*(_QWORD *)&aBlock.f64[0]
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage) = v3[4];

    UIViewRepresentableContext.coordinator.getter(&aBlock);
    v87 = aBlock.f64[0];
    v88 = swift_getKeyPath(&unk_100046790);
    v89 = swift_getKeyPath(&unk_1000467B8);
    v90 = swift_retain(v28);
    static Published.subscript.getter(v155, v90, v88, v89);
    swift_release(v28);
    swift_release(v88);
    swift_release(v89);
    v91 = *(_QWORD *)(*(_QWORD *)&v87
                    + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors);
    *(id *)(*(_QWORD *)&v87
          + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors) = v155[0];

    swift_bridgeObjectRelease(v91);
    (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v65, v137);
LABEL_22:
    UIViewRepresentableContext.coordinator.getter(&aBlock);
    v92 = *(unsigned __int8 *)(*(_QWORD *)&aBlock.f64[0]
                             + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout);

    v93 = swift_getKeyPath(&unk_100046820);
    v94 = swift_getKeyPath(&unk_100046848);
    v95 = swift_retain(v28);
    static Published.subscript.getter(v155, v95, v93, v94);
    swift_release(v28);
    swift_release(v93);
    swift_release(v94);
    if (v92 != LOBYTE(v155[0]))
    {
      v97 = (void *)sub_1000246D8();
      objc_msgSend(v61, "setCollectionViewLayout:", v97);

      UIViewRepresentableContext.coordinator.getter(&aBlock);
      v98 = aBlock.f64[0];
      v99 = swift_getKeyPath(&unk_100046820);
      v100 = swift_getKeyPath(&unk_100046848);
      v101 = swift_retain(v28);
      static Published.subscript.getter(v155, v101, v99, v100);
      swift_release(v28);
      swift_release(v99);
      swift_release(v100);
      *(_BYTE *)(*(_QWORD *)&v98
               + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout) = v155[0];

    }
    sub_100026798(v61, a2, v96);
    UIViewRepresentableContext.coordinator.getter(&aBlock);
    v102 = aBlock.f64[0];
    *((_BYTE *)v54[328] + *(_QWORD *)&aBlock.f64[0]) = 0;

    *(_OWORD *)v155 = *((_OWORD *)v3 + 1);
    v103 = v155[1];
    v104 = swift_getKeyPath(&unk_100046868);
    v105 = swift_getKeyPath(&unk_100046890);
    v106 = swift_retain(v103);
    static Published.subscript.getter(&aBlock, v106, v104, v105);
    swift_release(v104);
    swift_release(v105);
    sub_10002B9B8((uint64_t)v155);
    v107 = v149.f64[0];
    if ((LOBYTE(aBlock.f64[1]) & 1) != 0)
      goto LABEL_27;
    if ((unsigned __int128)(*(uint64_t *)&aBlock.f64[0] * (__int128)(uint64_t)v3[4]) >> 64 == (uint64_t)(*(_QWORD *)&aBlock.f64[0] * v3[4]) >> 63)
    {
      v108 = v133;
      IndexPath.init(item:section:)();
      isa = IndexPath._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v134 + 8))(v108, v135);
      objc_msgSend(v61, "scrollToItemAtIndexPath:atScrollPosition:animated:", isa, 16, 0);

LABEL_27:
      sub_1000075F4(0, &qword_100066C78, OS_dispatch_queue_ptr);
      v110 = (void *)static OS_dispatch_queue.main.getter();
      v111 = v140;
      (*(void (**)(char *, char *, uint64_t))&v107)(v140, a2, v13);
      v112 = v150;
      v113 = *(unsigned __int8 *)(v150 + 80);
      v114 = (v113 + 16) & ~v113;
      v115 = (v139 + v114 + 7) & 0xFFFFFFFFFFFFFFF8;
      v116 = swift_allocObject(&unk_10005BC08, v115 + 56, v113 | 7);
      (*(void (**)(uint64_t, char *, uint64_t))(v112 + 32))(v116 + v114, v111, v13);
      v117 = v116 + v115;
      v118 = *((_OWORD *)v3 + 1);
      *(_OWORD *)v117 = *(_OWORD *)v3;
      *(_OWORD *)(v117 + 16) = v118;
      *(_OWORD *)(v117 + 32) = *((_OWORD *)v3 + 2);
      *(_QWORD *)(v117 + 48) = v3[6];
      v153 = sub_10002BA74;
      v154 = v116;
      *(_QWORD *)&aBlock.f64[0] = _NSConcreteStackBlock;
      *(_QWORD *)&aBlock.f64[1] = 1107296256;
      *(_QWORD *)&v152.f64[0] = sub_1000270B8;
      *(_QWORD *)&v152.f64[1] = &unk_10005BC20;
      v119 = _Block_copy(&aBlock);
      v120 = v154;
      sub_10002B76C(v3);
      v121 = swift_release(v120);
      v122 = v141;
      static DispatchQoS.unspecified.getter(v121);
      *(_QWORD *)&aBlock.f64[0] = _swiftEmptyArrayStorage;
      v123 = sub_100006848(&qword_100066C80, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v124 = sub_1000060E4(&qword_100066C88);
      v125 = sub_10002BAD0();
      v126 = v144;
      v127 = v146;
      dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v124, v125, v146, v123);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v122, v126, v119);
      _Block_release(v119);

      (*(void (**)(char *, uint64_t))(v145 + 8))(v126, v127);
      return (*(uint64_t (**)(char *, uint64_t))(v142 + 8))(v122, v143);
    }
    __break(1u);
  }
  __break(1u);
LABEL_36:
  v129 = v3[1];
  v130 = type metadata accessor for ColorPickerState(0);
  v131 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v129, v130, v131);
  __break(1u);
  return result;
}

uint64_t sub_100026798(void *a1, char *a2, uint64_t a3)
{
  uint64_t *v3;
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
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  char *v33;
  uint64_t v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  __int128 v42;
  char *v43;
  unint64_t v44;
  char *v45;
  id v46;
  void *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  void (*v63)(char *, uint64_t, uint64_t, uint64_t);
  Class isa;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  NSIndexPath v69;
  uint64_t result;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  id v82;
  _QWORD v83[4];
  char v84;

  v82 = a1;
  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v80 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000060E4(&qword_100066C98);
  v78 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v81 = (char *)&v74 - v12;
  v13 = sub_1000060E4(&qword_100066C68);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *v3;
  if (*v3)
  {
    KeyPath = swift_getKeyPath(&unk_100046700);
    v19 = swift_getKeyPath(&unk_100046728);
    v20 = swift_retain(v17);
    static Published.subscript.getter(v83, v20, KeyPath, v19);
    swift_release(v17);
    swift_release(KeyPath);
    swift_release(v19);
    v21 = v84;
    v79 = a2;
    if (v84 == 2)
    {
      v22 = (char *)&off_100059C28;
      goto LABEL_21;
    }
    v77 = v14;
    v23 = v13;
    v24 = *(double *)v83;
    v25 = *(double *)&v83[1];
    v26 = *(double *)&v83[2];
    v27 = *(double *)&v83[3];
    sub_1000060E4(&qword_100066C70);
    UIViewRepresentableContext.coordinator.getter(v83);
    v28 = (void *)v83[0];
    v29 = *(void **)(v83[0] + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
    v3 = v29;

    if (v29)
    {
      dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

      v30 = NSDiffableDataSourceSnapshot.itemIdentifiers.getter(v23);
      (*(void (**)(char *, uint64_t))(v77 + 8))(v16, v23);
      v77 = v30;
      v31 = *(_QWORD *)(v30 + 16);
      if (v31)
      {
        v32 = (double *)(v77 + 64);
        v22 = (char *)_swiftEmptyArrayStorage;
        do
        {
          v35 = *(_OWORD *)v32;
          if (((*(_QWORD *)v32 >> 62) | 2) == 2 && ((v21 & 1) == 0) != (*(_QWORD *)v32 & 1))
          {
            v36 = *(v32 - 4);
            if (vabdd_f64(v24, v36) < 0.001)
            {
              v37 = *(v32 - 3);
              if (vabdd_f64(v25, v37) < 0.001)
              {
                v38 = *(v32 - 2);
                if (vabdd_f64(v26, v38) < 0.001 && vabdd_f64(v27, *(v32 - 1)) < 0.001)
                {
                  v75 = *((_QWORD *)v32 - 1);
                  v76 = v35;
                  if ((swift_isUniquelyReferenced_nonNull_native(v22) & 1) == 0)
                    v22 = sub_1000296D8(0, *((_QWORD *)v22 + 2) + 1, 1, v22);
                  v40 = *((_QWORD *)v22 + 2);
                  v39 = *((_QWORD *)v22 + 3);
                  v41 = v40 + 1;
                  v42 = v76;
                  if (v40 >= v39 >> 1)
                  {
                    v74 = v40 + 1;
                    v43 = v22;
                    v44 = v40;
                    v45 = sub_1000296D8((char *)(v39 > 1), v40 + 1, 1, v43);
                    v41 = v74;
                    v40 = v44;
                    v42 = v76;
                    v22 = v45;
                  }
                  *((_QWORD *)v22 + 2) = v41;
                  v33 = &v22[48 * v40];
                  *((double *)v33 + 4) = v36;
                  *((double *)v33 + 5) = v37;
                  v34 = v75;
                  *((double *)v33 + 6) = v38;
                  *((_QWORD *)v33 + 7) = v34;
                  *((_OWORD *)v33 + 4) = v42;
                }
              }
            }
          }
          v32 += 6;
          --v31;
        }
        while (v31);
      }
      else
      {
        v22 = (char *)_swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease(v77);
LABEL_21:
      v46 = objc_msgSend(v82, "indexPathsForSelectedItems");
      if (v46)
      {
        v47 = v46;
        v48 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v46, v5);

      }
      else
      {
        v48 = (char *)_swiftEmptyArrayStorage;
      }
      __chkstk_darwin(v46);
      *(&v74 - 2) = (unint64_t)v79;
      swift_bridgeObjectRetain(v22);
      v49 = (char *)sub_100022FD8((uint64_t)sub_10002BB64, (uint64_t)(&v74 - 4), (uint64_t)v22);
      swift_bridgeObjectRelease(v22);
      v52 = sub_100027190((uint64_t)v48, v50, v51);
      v54 = sub_100028CB4((uint64_t)v52, (uint64_t)v49, v53);
      swift_bridgeObjectRelease(v52);
      if ((v54 & 1) != 0)
      {
        swift_bridgeObjectRelease(v49);
        v55 = v48;
      }
      else
      {
        v79 = v49;
        v56 = *((_QWORD *)v48 + 2);
        v77 = (uint64_t)v22;
        *(_QWORD *)&v76 = v48;
        if (v56)
        {
          v57 = &v48[(*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)];
          v58 = v48;
          v59 = *(_QWORD *)(v6 + 72);
          v60 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
          swift_bridgeObjectRetain(v58);
          v62 = v80;
          v61 = v81;
          while (1)
          {
            v60(v61, v57, v5);
            v63 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
            v63(v61, 0, 1, v5);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v61, 1, v5) == 1)
              break;
            (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v62, v61, v5);
            isa = IndexPath._bridgeToObjectiveC()().super.isa;
            objc_msgSend(v82, "deselectItemAtIndexPath:animated:", isa, 0);

            v61 = v81;
            (*(void (**)(char *, uint64_t))(v6 + 8))(v62, v5);
            v57 += v59;
            if (!--v56)
              goto LABEL_32;
          }
        }
        else
        {
          v63 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
          swift_bridgeObjectRetain(v48);
          v61 = v81;
LABEL_32:
          v63(v61, 1, 1, v5);
        }
        swift_bridgeObjectRelease_n(v76, 2);
        v65 = *((_QWORD *)v79 + 2);
        if (!v65)
        {
          swift_bridgeObjectRelease(v79);
          v22 = (char *)v77;
          return swift_bridgeObjectRelease(v22);
        }
        v66 = (uint64_t)&v79[(*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80)];
        v67 = *(_QWORD *)(v78 + 72);
        swift_bridgeObjectRetain(v79);
        v68 = v82;
        do
        {
          sub_100009C1C(v66, (uint64_t)v11, &qword_100066C98);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
          {
            v69.super.isa = 0;
          }
          else
          {
            v69.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
            (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
          }
          objc_msgSend(v68, "selectItemAtIndexPath:animated:scrollPosition:", v69.super.isa, 0, 0);

          v66 += v67;
          --v65;
        }
        while (v65);
        swift_bridgeObjectRelease(v77);
        v22 = v79;
        v55 = v79;
      }
      swift_bridgeObjectRelease(v55);
      return swift_bridgeObjectRelease(v22);
    }
    __break(1u);
  }
  v71 = v3[1];
  v72 = type metadata accessor for ColorPickerState(0);
  v73 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v71, v72, v73);
  __break(1u);
  return result;
}

void sub_100026E24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
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
  char v26;
  __int128 v27;

  v3 = sub_1000060E4(&qword_100066C68);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000060E4(&qword_100066C70);
  UIViewRepresentableContext.coordinator.getter(&v27);
  v7 = (void *)v27;
  v8 = *(void **)(v27 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
  v9 = v8;

  if (!v8)
    goto LABEL_13;
  dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

  v10 = NSDiffableDataSourceSnapshot.itemIdentifiers.getter(v3);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = *(_QWORD *)(v10 + 16);
  swift_bridgeObjectRelease(v10);
  v12 = ceil((double)v11 / (double)*(uint64_t *)(a2 + 32));
  if ((~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }
  v13 = (uint64_t)v12;
  v27 = *(_OWORD *)(a2 + 16);
  v14 = *((_QWORD *)&v27 + 1);
  KeyPath = swift_getKeyPath(&unk_1000468B0);
  v16 = swift_getKeyPath(&unk_1000468D8);
  v17 = swift_retain(v14);
  static Published.subscript.getter(&v25, v17, KeyPath, v16);
  swift_release(KeyPath);
  swift_release(v16);
  sub_10002B9B8((uint64_t)&v27);
  if (v25 != v13)
  {
    v18 = swift_getKeyPath(&unk_1000468B0);
    v19 = swift_getKeyPath(&unk_1000468D8);
    v25 = v13;
    swift_retain(v14);
    static Published.subscript.setter(&v25, v14, v18, v19);
  }
  v20 = swift_getKeyPath(&unk_100046868);
  v21 = swift_getKeyPath(&unk_100046890);
  v22 = swift_retain(v14);
  static Published.subscript.getter(&v25, v22, v20, v21);
  swift_release(v20);
  swift_release(v21);
  sub_10002B9B8((uint64_t)&v27);
  if ((v26 & 1) == 0)
  {
    v23 = swift_getKeyPath(&unk_100046868);
    v24 = swift_getKeyPath(&unk_100046890);
    v25 = 0;
    v26 = 1;
    swift_retain(v14);
    static Published.subscript.setter(&v25, v14, v23, v24);
  }
}

uint64_t sub_1000270B8(uint64_t a1)
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

void sub_1000270E4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  char *v11;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  sub_1000060E4(&qword_100066C70);
  UIViewRepresentableContext.coordinator.getter(&v11);
  v7 = v11;
  v8 = *(void **)&v11[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource];
  v9 = v8;

  if (v8)
  {
    v10[0] = v1;
    v10[1] = v2;
    v10[2] = v3;
    v10[3] = v4;
    v10[4] = v5;
    v10[5] = v6;
    dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)(v10);

  }
  else
  {
    __break(1u);
  }
}

_QWORD *sub_100027190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v4 = type metadata accessor for IndexPath(0, a2, a3);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1000060E4(&qword_100066C98);
  v8 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = _swiftEmptyArrayStorage;
  if (v11)
  {
    v21 = _swiftEmptyArrayStorage;
    sub_10002985C(0, v11, 0);
    v13 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v19 = *(_QWORD *)(v5 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    do
    {
      v14(v7, v13, v4);
      swift_dynamicCast(v10, v7, v4, v20, 7);
      v12 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
      {
        sub_10002985C(0, v12[2] + 1, 1);
        v12 = v21;
      }
      v16 = v12[2];
      v15 = v12[3];
      if (v16 >= v15 >> 1)
      {
        sub_10002985C(v15 > 1, v16 + 1, 1);
        v12 = v21;
      }
      v12[2] = v16 + 1;
      sub_100009A88((uint64_t)v10, (uint64_t)v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v16, &qword_100066C98);
      v13 += v19;
      --v11;
    }
    while (v11);
  }
  return v12;
}

uint64_t sub_100027354(double a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  double v16;
  double v17;
  uint64_t result;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint64_t v37;
  __int128 v38;

  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(a3, "container");
  objc_msgSend(v15, "contentSize");
  v17 = v16;
  result = swift_unknownObjectRelease(v15);
  v19 = a1 / v17;
  if ((~COERCE__INT64(a1 / v17) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v35 = v8;
  v20 = (uint64_t)v19;
  v38 = *(_OWORD *)(a4 + 16);
  v21 = *((_QWORD *)&v38 + 1);
  KeyPath = swift_getKeyPath(&unk_100046900);
  v23 = swift_getKeyPath(&unk_100046928);
  v24 = swift_retain(v21);
  static Published.subscript.getter(aBlock, v24, KeyPath, v23);
  swift_release(KeyPath);
  swift_release(v23);
  result = sub_10002B9B8((uint64_t)&v38);
  if (aBlock[0] != v20)
  {
    sub_1000075F4(0, &qword_100066C78, OS_dispatch_queue_ptr);
    v25 = (void *)static OS_dispatch_queue.main.getter();
    v26 = swift_allocObject(&unk_10005BCA8, 80, 7);
    v27 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)(v26 + 16) = *(_OWORD *)a4;
    *(_OWORD *)(v26 + 32) = v27;
    *(_OWORD *)(v26 + 48) = *(_OWORD *)(a4 + 32);
    *(_QWORD *)(v26 + 64) = *(_QWORD *)(a4 + 48);
    *(_QWORD *)(v26 + 72) = v20;
    aBlock[4] = sub_10002BC28;
    v37 = v26;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000270B8;
    aBlock[3] = &unk_10005BCC0;
    v28 = _Block_copy(aBlock);
    v29 = v37;
    sub_10002B76C((uint64_t *)a4);
    v30 = swift_release(v29);
    static DispatchQoS.unspecified.getter(v30);
    aBlock[0] = _swiftEmptyArrayStorage;
    v31 = sub_100006848(&qword_100066C80, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v32 = sub_1000060E4(&qword_100066C88);
    v33 = sub_10002BAD0();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v32, v33, v7, v31);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v10, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return result;
}

uint64_t sub_100027658(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 24);
  KeyPath = swift_getKeyPath(&unk_100046900);
  v5 = swift_getKeyPath(&unk_100046928);
  v7 = a2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_1000276C8(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, double, double);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = *(void (**)(uint64_t, uint64_t, double, double))(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = sub_1000060E4(&qword_100066CD0);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
  swift_retain(v9);
  swift_unknownObjectRetain(a3, v13);
  v10(v12, a3, a4, a5);
  swift_release(v9);
  swift_bridgeObjectRelease(v12);
  return swift_unknownObjectRelease(a3);
}

_QWORD *sub_100027764(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  __int128 v13;
  __int128 v14;

  sub_100029840(0, 0, 0);
  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  if (v2)
  {
    v3 = 0;
    v4 = _swiftEmptyArrayStorage[2];
    v5 = 48 * v4 + 72;
    v6 = (unsigned __int8 *)(a1 + 64);
    do
    {
      v7 = *((_OWORD *)v6 - 2);
      v8 = *((_OWORD *)v6 - 1);
      v9 = *v6;
      v10 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v10 >> 1)
      {
        v13 = *((_OWORD *)v6 - 1);
        v14 = *((_OWORD *)v6 - 2);
        sub_100029840((char *)(v10 > 1), v4 + v3 + 1, 1);
        v8 = v13;
        v7 = v14;
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      v11 = (_QWORD *)((char *)_swiftEmptyArrayStorage + v5);
      *(v11 - 1) = v9;
      *v11 = v3;
      *(_OWORD *)(v11 - 5) = v7;
      *(_OWORD *)(v11 - 3) = v8;
      v5 += 48;
      v6 += 40;
      ++v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

void sub_100027878()
{
  __int128 *v0;
  __int128 v1;

  sub_100028790(v0, &v1);
  __asm { BR              X10 }
}

uint64_t sub_1000278D4()
{
  uint64_t v0;
  Swift::String v1;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = v0 & 0x3FFFFFFFFFFFFFFFLL;
  _StringGuts.grow(_:)(17);
  v7[0] = 0;
  v7[1] = 0xE000000000000000;
  v1._countAndFlagsBits = 0x6574736567677553;
  v1._object = (void *)0xEF20726F6C6F4364;
  String.append(_:)(v1);
  v3 = v8;
  v4 = v9;
  v5 = v10;
  v6 = v0 & 1;
  ((void (*)(__int128 *, _QWORD *, ValueMetadata *, void *, void *))_print_unlocked<A, B>(_:_:))(&v3, v7, &type metadata for SomeColor, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  return v7[0];
}

void sub_100027A0C()
{
  __int128 *v0;
  __int128 v1;

  sub_100028790(v0, &v1);
  __asm { BR              X11 }
}

void sub_100027A60(char a1@<W8>)
{
  Swift::UInt v1;
  Swift::UInt64 v2;
  Swift::UInt v3;
  Swift::UInt64 v4;
  Swift::UInt64 v5;
  Swift::UInt64 v6;
  Swift::UInt64 v7;
  Swift::UInt64 v8;
  Swift::UInt64 v9;
  Swift::UInt64 v10;

  v3 = a1 & 1;
  Hasher._combine(_:)(0);
  if ((v2 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v4 = v2;
  else
    v4 = 0;
  Hasher._combine(_:)(v4);
  if ((v8 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v5 = v8;
  else
    v5 = 0;
  Hasher._combine(_:)(v5);
  if ((v9 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v6 = v9;
  else
    v6 = 0;
  Hasher._combine(_:)(v6);
  if ((v10 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v7 = v10;
  else
    v7 = 0;
  Hasher._combine(_:)(v7);
  Hasher._combine(_:)(v3);
  Hasher._combine(_:)(v1);
}

uint64_t sub_100027B38()
{
  return sub_100027CC4((uint64_t)&unk_1000468B0, (uint64_t)&unk_1000468D8);
}

Swift::Int sub_100027B4C()
{
  __int128 *v0;
  _QWORD v2[9];
  _OWORD v3[3];

  sub_100028790(v0, v3);
  Hasher.init(_seed:)(v2, 0);
  sub_100027A0C();
  return Hasher._finalize()();
}

void sub_100027B98()
{
  __int128 *v0;
  _OWORD v1[3];

  sub_100028790(v0, v1);
  sub_100027A0C();
}

Swift::Int sub_100027BD4(uint64_t a1)
{
  __int128 *v1;
  _QWORD v4[9];
  _OWORD v5[3];

  sub_100028790(v1, v5);
  Hasher.init(_seed:)(v4, a1);
  sub_100027A0C();
  return Hasher._finalize()();
}

void sub_100027C24()
{
  __int128 *v0;
  _OWORD v1[3];

  sub_100028790(v0, v1);
  sub_100027878();
}

uint64_t sub_100027C58(__int128 *a1, __int128 *a2)
{
  char v3;
  __int128 v5[3];
  _OWORD v6[3];

  sub_100028790(a1, v5);
  sub_100028790(a2, v6);
  sub_10002B574(v5);
  return v3 & 1;
}

void sub_100027CA0()
{
  qword_10006B6B0 = 0x4049000000000000;
}

uint64_t sub_100027CB0()
{
  return sub_100027CC4((uint64_t)&unk_100046900, (uint64_t)&unk_100046928);
}

uint64_t sub_100027CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

uint64_t sub_100027D2C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100046868);
  v2 = swift_getKeyPath(&unk_100046890);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100027DA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__numberOfPages;
  v2 = sub_1000060E4(&qword_100066D10);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__currentPage, v2);
  v4 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__pageControlPendingPage;
  v5 = sub_1000060E4(&qword_100066D18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100027E40()
{
  return type metadata accessor for FavoriteColorPickerView.Model(0);
}

uint64_t type metadata accessor for FavoriteColorPickerView.Model(uint64_t a1)
{
  uint64_t result;

  result = qword_100066B10;
  if (!qword_100066B10)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FavoriteColorPickerView.Model);
  return result;
}

void sub_100027E84(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  sub_100027F0C();
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = v6[0];
    sub_100027F60(319);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 3, v6, a1 + 80);
    }
  }
}

void sub_100027F0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100066B20)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Int);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100066B20);
  }
}

void sub_100027F60(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100066B28)
  {
    v2 = sub_100009E2C((uint64_t *)&unk_100066B30);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100066B28);
  }
}

__n128 initializeWithCopy for FavoriteColorPickerView.ColorItem(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for FavoriteColorPickerView.ColorItem(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for FavoriteColorPickerView.ColorItem(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 40) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_QWORD *)(a1 + 32) = 2 * -a2;
      *(_QWORD *)(a1 + 40) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_100028074(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32) >> 62;
  if ((_DWORD)v1 == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return v1;
}

uint64_t sub_100028090(uint64_t result)
{
  *(_QWORD *)(result + 32) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

_QWORD *sub_1000280A0(_QWORD *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[4] = result[4] & 1 | (a2 << 62);
  }
  else
  {
    *result = (a2 - 3);
    result[1] = 0;
    result[2] = 0;
    result[3] = 0;
    *((_OWORD *)result + 2) = xmmword_1000469B0;
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoriteColorPickerView.ColorItem()
{
  return &type metadata for FavoriteColorPickerView.ColorItem;
}

uint64_t destroy for FavoriteColorPickerView(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_release(a1[6]);
}

uint64_t initializeWithCopy for FavoriteColorPickerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  v5 = a2[3];
  v4 = a2[4];
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v4;
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain(v3);
  swift_retain(v5);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t *assignWithCopy for FavoriteColorPickerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_retain(v6);
  swift_release(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a1[6];
  v11 = a2[6];
  a1[6] = v11;
  swift_retain(v11);
  swift_release(v10);
  return a1;
}

uint64_t *assignWithTake for FavoriteColorPickerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  v5 = a1[3];
  a1[3] = a2[3];
  swift_release(v5);
  a1[4] = a2[4];
  swift_bridgeObjectRelease(a1[5]);
  v6 = a1[6];
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FavoriteColorPickerView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FavoriteColorPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoriteColorPickerView()
{
  return &type metadata for FavoriteColorPickerView;
}

uint64_t sub_100028334()
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
  void (*v10)(uint64_t, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  char v16;

  v1 = sub_1000060E4(&qword_100066D18);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000060E4(&qword_100066D10);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__numberOfPages;
  v15 = 2;
  Published.init(initialValue:)(&v15, &type metadata for Int);
  v10 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v10(v9, v8, v5);
  v11 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__currentPage;
  v15 = 0;
  Published.init(initialValue:)(&v15, &type metadata for Int);
  v10(v11, v8, v5);
  v12 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__pageControlPendingPage;
  v15 = 0;
  v16 = 1;
  v13 = sub_1000060E4((uint64_t *)&unk_100066B30);
  Published.init(initialValue:)(&v15, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v12, v4, v1);
  return v0;
}

uint64_t sub_1000284A8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for FavoriteColorPickerView.Model(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000284E4()
{
  return sub_100023EF4();
}

uint64_t sub_100028524(void *a1, char *a2)
{
  return sub_1000259D0(a1, a2);
}

uint64_t *sub_100028564@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[3];
  uint64_t v12;

  v3 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v3;
  v11[2] = *(_OWORD *)(v1 + 32);
  v12 = *(_QWORD *)(v1 + 48);
  v4 = *(_QWORD *)&v11[0];
  if (*(_QWORD *)&v11[0])
  {
    v5 = objc_allocWithZone((Class)type metadata accessor for FavoriteColorPickerView.Coordinator());
    sub_10002B76C((uint64_t *)v11);
    swift_retain(v4);
    v6 = sub_10002B7BC((uint64_t)v11, v4);
    swift_release(v4);
    result = sub_10002B934((uint64_t *)v11);
    *a1 = v6;
  }
  else
  {
    v8 = *((_QWORD *)&v11[0] + 1);
    sub_10002B76C((uint64_t *)v11);
    v9 = type metadata accessor for ColorPickerState(0);
    v10 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = (uint64_t *)EnvironmentObject.error()(0, v8, v9, v10);
    __break(1u);
  }
  return result;
}

uint64_t sub_10002863C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10002BD00();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10002868C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10002BD00();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000286DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002BD00();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_100028704()
{
  unint64_t result;

  result = qword_100066C50;
  if (!qword_100066C50)
  {
    result = swift_getWitnessTable(&unk_100046558, &type metadata for FavoriteColorPickerView);
    atomic_store(result, (unint64_t *)&qword_100066C50);
  }
  return result;
}

unint64_t sub_10002874C()
{
  unint64_t result;

  result = qword_100066C58;
  if (!qword_100066C58)
  {
    result = swift_getWitnessTable(&unk_100046638, &type metadata for FavoriteColorPickerView.ColorItem);
    atomic_store(result, (unint64_t *)&qword_100066C58);
  }
  return result;
}

_OWORD *sub_100028790(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_1000287A8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046748);
  v5 = swift_getKeyPath(&unk_100046770);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100028824(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046748);
  v5 = swift_getKeyPath(&unk_100046770);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10002889C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000467D8);
  v5 = swift_getKeyPath(&unk_100046800);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100028918(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000467D8);
  v5 = swift_getKeyPath(&unk_100046800);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_100028988@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046790);
  v5 = swift_getKeyPath(&unk_1000467B8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100028A04(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046790);
  v5 = swift_getKeyPath(&unk_1000467B8);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_100028A7C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100028AB8(a1, (uint64_t)&unk_1000468B0, (uint64_t)&unk_1000468D8, a2);
}

uint64_t sub_100028A90(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100028B44(a1, a2, a3, a4, (uint64_t)&unk_1000468B0, (uint64_t)&unk_1000468D8);
}

uint64_t sub_100028AA4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100028AB8(a1, (uint64_t)&unk_100046900, (uint64_t)&unk_100046928, a2);
}

uint64_t sub_100028AB8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
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

uint64_t sub_100028B30(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100028B44(a1, a2, a3, a4, (uint64_t)&unk_100046900, (uint64_t)&unk_100046928);
}

uint64_t sub_100028B44(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v12;

  v7 = *a1;
  v8 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v10 = swift_getKeyPath(a6);
  v12 = v7;
  swift_retain(v8);
  return static Published.subscript.setter(&v12, v8, KeyPath, v10);
}

uint64_t sub_100028BB0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  char v9;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046868);
  v5 = swift_getKeyPath(&unk_100046890);
  static Published.subscript.getter(&v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v9;
  *(_QWORD *)a2 = v8;
  *(_BYTE *)(a2 + 8) = v7;
  return result;
}

uint64_t sub_100028C34(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v8;
  char v9;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046868);
  v6 = swift_getKeyPath(&unk_100046890);
  v8 = v2;
  v9 = v3;
  swift_retain(v4);
  return static Published.subscript.setter(&v8, v4, KeyPath, v6);
}

uint64_t sub_100028CB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v36 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_1000060E4(&qword_100066CA8);
  __chkstk_darwin(v33);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000060E4(&qword_100066C98);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v15 = (char *)&v29 - v14;
  v34 = a1;
  v35 = a2;
  v16 = *(_QWORD *)(a1 + 16);
  if (v16 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v16 || v34 == v35)
    return 1;
  v17 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v31 = *(_QWORD *)(v13 + 72);
  v32 = v5;
  while (1)
  {
    v18 = v34 + v17;
    sub_100009C1C(v35 + v17, (uint64_t)v15, &qword_100066C98);
    v19 = (uint64_t)&v8[*(int *)(v33 + 48)];
    sub_100009C1C(v18, (uint64_t)v8, &qword_100066C98);
    sub_100009C1C((uint64_t)v15, v19, &qword_100066C98);
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    if (v20(v8, 1, v5) != 1)
      break;
    if (v20((char *)v19, 1, v5) != 1)
      goto LABEL_15;
    sub_100009CF0((uint64_t)v8, &qword_100066C98);
    sub_100009CF0((uint64_t)v15, &qword_100066C98);
LABEL_7:
    v17 += v31;
    if (!--v16)
      return 1;
  }
  sub_100009C1C((uint64_t)v8, (uint64_t)v12, &qword_100066C98);
  if (v20((char *)v19, 1, v5) != 1)
  {
    v21 = v36;
    v22 = v12;
    v23 = v30;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v30, v19, v5);
    v24 = sub_100006848(&qword_100066CB0, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t)&protocol conformance descriptor for IndexPath);
    v25 = dispatch thunk of static Equatable.== infix(_:_:)(v22, v23, v5, v24);
    v26 = *(void (**)(char *, uint64_t))(v21 + 8);
    v27 = v23;
    v12 = v22;
    v26(v27, v5);
    v26(v22, v5);
    sub_100009CF0((uint64_t)v8, &qword_100066C98);
    sub_100009CF0((uint64_t)v15, &qword_100066C98);
    if ((v25 & 1) == 0)
      return 0;
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v5);
LABEL_15:
  sub_100009CF0((uint64_t)v8, &qword_100066CA8);
  sub_100009CF0((uint64_t)v15, &qword_100066C98);
  return 0;
}

uint64_t sub_100028FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v5;
  float64x2_t *v6;
  float64x2_t *v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = 0;
  if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a2 + 32)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48))))), 0xFuLL))) & 1) == 0&& ((*(unsigned __int8 *)(a1 + 64) ^ *(unsigned __int8 *)(a2 + 64)) & 1) == 0)
  {
    if (v2 == 1)
      return 1;
    v5 = v2 - 2;
    v6 = (float64x2_t *)(a2 + 104);
    v7 = (float64x2_t *)(a1 + 104);
    do
    {
      v8 = v5;
      v9 = vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v7[-2], v6[-2]), (int32x4_t)vceqq_f64(v7[-1], v6[-1])))), 0xFuLL))) | LOBYTE(v7->f64[0]) ^ LOBYTE(v6->f64[0]);
      if ((v9 & 1) != 0)
        break;
      --v5;
      v6 = (float64x2_t *)((char *)v6 + 40);
      v7 = (float64x2_t *)((char *)v7 + 40);
    }
    while (v8);
    v3 = v9 ^ 1;
  }
  return v3 & 1;
}

unint64_t sub_1000290A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100029184(a1, v7);
}

unint64_t sub_10002912C(uint64_t a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  sub_100017F18();
  v3 = Hasher._finalize()();
  return sub_1000292F8(a1, v3);
}

unint64_t sub_100029184(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1000292F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    do
    {
      v7 = *(_QWORD *)(v2 + 48) + 40 * result;
      if (*(double *)v7 == *(double *)a1
        && *(double *)(v7 + 8) == *(double *)(a1 + 8)
        && *(double *)(v7 + 16) == *(double *)(a1 + 16)
        && *(double *)(v7 + 24) == *(double *)(a1 + 24)
        && *(unsigned __int8 *)(v7 + 32) == *(unsigned __int8 *)(a1 + 32))
      {
        break;
      }
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

char *sub_1000293B4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_1000658E8);
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
  v14 = a4 + 32;
  v15 = 40 * v8;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

_QWORD *sub_1000294B8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4((uint64_t *)&unk_100066D50);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4])
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    v15 = sub_1000060E4(&qword_1000658F0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_1000295D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_100066D60);
    v11 = (char *)swift_allocObject(v10, (v9 << 6) | 0x20, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 + 31;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 6);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[64 * v8])
      memmove(v14, v15, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for ColorSwatchPickerView.ColorPreferenceData);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_1000296D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
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
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_100066CA0);
    v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[48 * v8])
      memmove(v13, v14, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 48 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_1000297EC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100029878(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100029808(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10002997C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_100029824(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_100029A7C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100029840(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100029B9C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_10002985C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_100029CB0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

char *sub_100029878(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_1000658E8);
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
  v14 = a4 + 32;
  v15 = 40 * v8;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release(a4);
  return v11;
}

char *sub_10002997C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_100066D48);
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
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for Data);
  }
  swift_release(a4);
  return v11;
}

_QWORD *sub_100029A7C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4((uint64_t *)&unk_100066D50);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4])
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    v15 = sub_1000060E4(&qword_1000658F0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }
  swift_release(a4);
  return v11;
}

char *sub_100029B9C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
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
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000060E4(&qword_100066CA0);
    v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[48 * v8])
      memmove(v13, v14, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 48 * v8);
  }
  swift_release(a4);
  return v11;
}

size_t sub_100029CB0(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000060E4((uint64_t *)&unk_100066CB8);
  v11 = *(_QWORD *)(sub_1000060E4(&qword_100066C98) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_29;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = sub_1000060E4(&qword_100066C98);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((v5 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21, v8, v17);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v20, v21, v8, v17);
  }
  swift_release(a4);
  return (size_t)v15;
}

char *sub_100029E2C(uint64_t a1)
{
  return sub_1000293B4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_100029E40(_QWORD *a1)
{
  return sub_1000294B8(0, a1[2], 0, a1);
}

uint64_t sub_100029E54(uint64_t *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v6 = *v2;
  v7 = static Hasher._hash(seed:_:)(*(_QWORD *)(v6 + 40), a2);
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_10002AE2C(a2, v9, isUniquelyReferenced_nonNull_native);
    v14 = *v3;
    *v3 = v15;
    swift_bridgeObjectRelease(v14);
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

Swift::Int sub_100029F4C(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  Swift::UInt64 v14;
  Swift::UInt64 v15;
  Swift::UInt64 v16;
  Swift::UInt64 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::UInt64 v35;
  Swift::UInt64 v36;
  Swift::UInt64 v37;
  Swift::UInt64 v38;
  Swift::UInt v39;
  uint64_t v40;
  uint64_t v41;
  Swift::Int *v42;
  int64_t v43;
  _QWORD *v44;
  Swift::Int v45;
  char v46;
  int64_t v47;
  uint64_t v48[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000060E4(&qword_100066D30);
  v46 = a2;
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v44 = (_QWORD *)(v5 + 64);
    v45 = v5;
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v42 = v3;
    v43 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v23 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v47 = v9;
        v24 = v23 | (v9 << 6);
      }
      else
      {
        v25 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          return result;
        }
        result = (Swift::Int)v44;
        if (v25 >= v43)
          goto LABEL_48;
        v26 = v44[v25];
        v27 = v9 + 1;
        if (!v26)
        {
          v27 = v25 + 1;
          if (v25 + 1 >= v43)
            goto LABEL_48;
          v26 = v44[v27];
          if (!v26)
          {
            v28 = v25 + 2;
            if (v28 >= v43)
            {
LABEL_48:
              if ((v46 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v42;
                goto LABEL_55;
              }
              v41 = 1 << *(_BYTE *)(v5 + 32);
              if (v41 >= 64)
                bzero(v44, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v44 = -1 << v41;
              v3 = v42;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v26 = v44[v28];
            if (!v26)
            {
              while (1)
              {
                v27 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_57;
                if (v27 >= v43)
                  goto LABEL_48;
                v26 = v44[v27];
                ++v28;
                if (v26)
                  goto LABEL_45;
              }
            }
            v27 = v28;
          }
        }
LABEL_45:
        v12 = (v26 - 1) & v26;
        v47 = v27;
        v24 = __clz(__rbit64(v26)) + (v27 << 6);
      }
      v33 = *(_QWORD *)(v5 + 56);
      v34 = *(_QWORD *)(v5 + 48) + 40 * v24;
      v35 = *(_QWORD *)v34;
      v36 = *(_QWORD *)(v34 + 8);
      v37 = *(_QWORD *)(v34 + 16);
      v38 = *(_QWORD *)(v34 + 24);
      v39 = *(unsigned __int8 *)(v34 + 32);
      v40 = *(_QWORD *)(v33 + 8 * v24);
      if ((v46 & 1) == 0)
        swift_bridgeObjectRetain(v40);
      Hasher.init(_seed:)(v48, *(_QWORD *)(v8 + 40));
      if ((v35 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v14 = v35;
      else
        v14 = 0;
      Hasher._combine(_:)(v14);
      if ((v36 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v15 = v36;
      else
        v15 = 0;
      Hasher._combine(_:)(v15);
      if ((v37 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v16 = v37;
      else
        v16 = 0;
      Hasher._combine(_:)(v16);
      if ((v38 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v17 = v38;
      else
        v17 = 0;
      Hasher._combine(_:)(v17);
      Hasher._combine(_:)(v39);
      result = Hasher._finalize()();
      v18 = -1 << *(_BYTE *)(v8 + 32);
      v19 = result & ~v18;
      v20 = v19 >> 6;
      if (((-1 << v19) & ~*(_QWORD *)(v13 + 8 * (v19 >> 6))) != 0)
      {
        v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v13 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v18) >> 6;
        do
        {
          if (++v20 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_56;
          }
          v31 = v20 == v30;
          if (v20 == v30)
            v20 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v13 + 8 * v20);
        }
        while (v32 == -1);
        v21 = __clz(__rbit64(~v32)) + (v20 << 6);
      }
      *(_QWORD *)(v13 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      v22 = *(_QWORD *)(v8 + 48) + 40 * v21;
      *(_QWORD *)v22 = v35;
      *(_QWORD *)(v22 + 8) = v36;
      *(_QWORD *)(v22 + 16) = v37;
      *(_QWORD *)(v22 + 24) = v38;
      *(_BYTE *)(v22 + 32) = v39;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v21) = v40;
      ++*(_QWORD *)(v8 + 16);
      v5 = v45;
      v9 = v47;
    }
  }
  result = swift_release(v5);
LABEL_55:
  *v3 = v8;
  return result;
}

Swift::Int sub_10002A298(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::UInt v23;
  Swift::UInt64 v24;
  Swift::UInt64 v25;
  Swift::UInt64 v26;
  Swift::UInt64 v27;
  Swift::UInt64 v28;
  Swift::UInt64 v29;
  Swift::UInt64 v30;
  Swift::UInt64 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  Swift::Int *v40;
  char v41;
  int64_t v42;
  _QWORD *v43;
  Swift::Int v44;
  uint64_t v45;
  uint64_t v46[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000060E4(&qword_100066CE8);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v41 = a2;
    v40 = v3;
    v9 = 0;
    v43 = (_QWORD *)(v5 + 64);
    v44 = v5;
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v42 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v9 << 6);
      }
      else
      {
        v18 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
          return result;
        }
        result = (Swift::Int)v43;
        if (v18 >= v42)
          goto LABEL_46;
        v19 = v43[v18];
        ++v9;
        if (!v19)
        {
          v9 = v18 + 1;
          if (v18 + 1 >= v42)
            goto LABEL_46;
          v19 = v43[v9];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v42)
            {
LABEL_46:
              if ((v41 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v40;
                goto LABEL_53;
              }
              v39 = 1 << *(_BYTE *)(v5 + 32);
              if (v39 >= 64)
                bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v43 = -1 << v39;
              v3 = v40;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v43[v20];
            if (!v19)
            {
              while (1)
              {
                v9 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_55;
                if (v9 >= v42)
                  goto LABEL_46;
                v19 = v43[v9];
                ++v20;
                if (v19)
                  goto LABEL_24;
              }
            }
            v9 = v20;
          }
        }
LABEL_24:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v9 << 6);
      }
      v21 = *(_QWORD *)(v5 + 56);
      v22 = *(_QWORD *)(v5 + 48) + 40 * v17;
      v23 = *(unsigned __int8 *)(v22 + 32);
      v24 = *(_QWORD *)(v22 + 16);
      v25 = *(_QWORD *)(v22 + 24);
      v27 = *(_QWORD *)v22;
      v26 = *(_QWORD *)(v22 + 8);
      v45 = *(_QWORD *)(v21 + 8 * v17);
      Hasher.init(_seed:)(v46, *(_QWORD *)(v8 + 40));
      if ((v27 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v28 = v27;
      else
        v28 = 0;
      Hasher._combine(_:)(v28);
      if ((v26 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v29 = v26;
      else
        v29 = 0;
      Hasher._combine(_:)(v29);
      if ((v24 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v30 = v24;
      else
        v30 = 0;
      Hasher._combine(_:)(v30);
      if ((v25 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v31 = v25;
      else
        v31 = 0;
      Hasher._combine(_:)(v31);
      Hasher._combine(_:)(v23);
      result = Hasher._finalize()();
      v32 = -1 << *(_BYTE *)(v8 + 32);
      v33 = result & ~v32;
      v34 = v33 >> 6;
      if (((-1 << v33) & ~*(_QWORD *)(v13 + 8 * (v33 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v13 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v35 = 0;
        v36 = (unint64_t)(63 - v32) >> 6;
        do
        {
          if (++v34 == v36 && (v35 & 1) != 0)
          {
            __break(1u);
            goto LABEL_54;
          }
          v37 = v34 == v36;
          if (v34 == v36)
            v34 = 0;
          v35 |= v37;
          v38 = *(_QWORD *)(v13 + 8 * v34);
        }
        while (v38 == -1);
        v14 = __clz(__rbit64(~v38)) + (v34 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = *(_QWORD *)(v8 + 48) + 40 * v14;
      *(_QWORD *)v15 = v27;
      *(_QWORD *)(v15 + 8) = v26;
      *(_QWORD *)(v15 + 16) = v24;
      *(_QWORD *)(v15 + 24) = v25;
      *(_BYTE *)(v15 + 32) = v23;
      v5 = v44;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v14) = v45;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_53:
  *v3 = v8;
  return result;
}

uint64_t sub_10002A5CC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v8 = *v3;
  v10 = sub_10002912C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_10002A850();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease(*(_QWORD *)(v17 + 8 * v10));
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = v16[6] + 40 * v10;
    v20 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v19 = *(_OWORD *)a2;
    *(_OWORD *)(v19 + 16) = v20;
    *(_BYTE *)(v19 + 32) = *(_BYTE *)(a2 + 32);
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v21 = v16[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return result;
    }
    goto LABEL_14;
  }
  sub_100029F4C(result, a3 & 1);
  result = sub_10002912C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for SomeColor);
  __break(1u);
  return result;
}

uint64_t sub_10002A714(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_10002912C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_10002AA08();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v18 = v16[6] + 40 * v10;
    v19 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v18 = *(_OWORD *)a2;
    *(_OWORD *)(v18 + 16) = v19;
    *(_BYTE *)(v18 + 32) = *(_BYTE *)(a2 + 32);
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_10002A298(result, a3 & 1);
  result = sub_10002912C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for SomeColor);
  __break(1u);
  return result;
}

void *sub_10002A850()
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_1000060E4(&qword_100066D30);
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 40 * v15;
    v18 = *(_BYTE *)(v17 + 32);
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = *(_QWORD *)(v4 + 48) + v16;
    v22 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)v21 = *(_OWORD *)v17;
    *(_OWORD *)(v21 + 16) = v22;
    *(_BYTE *)(v21 + 32) = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002AA08()
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;

  v1 = v0;
  sub_1000060E4(&qword_100066CE8);
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v26 = __clz(__rbit64(v24));
    v12 = (v24 - 1) & v24;
    v15 = v26 + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 40 * v15;
    v18 = *(_BYTE *)(v17 + 32);
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = *(_QWORD *)(v4 + 48) + v16;
    v22 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)v21 = *(_OWORD *)v17;
    *(_OWORD *)(v21 + 16) = v22;
    *(_BYTE *)(v21 + 32) = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002ABAC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000060E4(&qword_100066D38);
  result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = result;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 0;
    v8 = (uint64_t *)(v3 + 56);
    v9 = 1 << *(_BYTE *)(v3 + 32);
    v28 = -1 << v9;
    v29 = v2;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v3 + 56);
    v30 = 1 << *(_BYTE *)(v3 + 32);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v7 << 6);
      }
      else
      {
        v17 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v17 >= v12)
          goto LABEL_36;
        v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          v7 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_36;
          v18 = v8[v7];
          if (!v18)
          {
            v7 = v17 + 2;
            if (v17 + 2 >= v12)
              goto LABEL_36;
            v18 = v8[v7];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_36:
                if (v30 >= 64)
                  bzero((void *)(v3 + 56), 8 * v12);
                else
                  *v8 = v28;
                v2 = v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  v7 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v7 >= v12)
                    goto LABEL_36;
                  v18 = v8[v7];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v7 = v19;
            }
          }
        }
LABEL_26:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v7 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v6 + 40), v20);
      v21 = -1 << *(_BYTE *)(v6 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v23);
        }
        while (v27 == -1);
        v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v20;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10002AE2C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10002ABAC(v8);
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_10002AF4C();
      goto LABEL_14;
    }
    sub_10002B0E0(v8);
  }
  v9 = *v3;
  result = static Hasher._hash(seed:_:)(*(_QWORD *)(*v3 + 40), v5);
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = *(_QWORD *)(v9 + 48);
    if (*(_QWORD *)(v11 + 8 * a2) == v5)
    {
LABEL_13:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
      __break(1u);
    }
    else
    {
      v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v11 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v13 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * a2) = v5;
  v14 = *(_QWORD *)(v13 + 16);
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    *(_QWORD *)(v13 + 16) = v16;
  return result;
}

void *sub_10002AF4C()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_1000060E4(&qword_100066D38);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002B0E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000060E4(&qword_100066D38);
  result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = result;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v28 = v2;
  v7 = 0;
  v8 = v3 + 56;
  v9 = 1 << *(_BYTE *)(v3 + 32);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v3 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v7 << 6);
      goto LABEL_27;
    }
    v17 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v12)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      v7 = v17 + 1;
      if (v17 + 1 >= v12)
        goto LABEL_36;
      v18 = *(_QWORD *)(v8 + 8 * v7);
      if (!v18)
      {
        v7 = v17 + 2;
        if (v17 + 2 >= v12)
          goto LABEL_36;
        v18 = *(_QWORD *)(v8 + 8 * v7);
        if (!v18)
          break;
      }
    }
LABEL_26:
    v11 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_27:
    v20 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    result = static Hasher._hash(seed:_:)(*(_QWORD *)(v6 + 40), v20);
    v21 = -1 << *(_BYTE *)(v6 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v23);
      }
      while (v27 == -1);
      v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v20;
    ++*(_QWORD *)(v6 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_36:
    result = swift_release(v3);
    v2 = v28;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v8 + 8 * v19);
  if (v18)
  {
    v7 = v19;
    goto LABEL_26;
  }
  while (1)
  {
    v7 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v7 >= v12)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v7);
    ++v19;
    if (v18)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_10002B340(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  __int128 v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  __int128 *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  char v20;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  sub_1000060E4(&qword_100066D30);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v4 = *(_OWORD *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 32);
  v19 = v4;
  v20 = *(_BYTE *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  result = sub_10002912C((uint64_t)&v18);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain(v5);
    return (unint64_t)v3;
  }
  v8 = (__int128 *)(a1 + 80);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v19;
    *(_OWORD *)v9 = v18;
    *(_OWORD *)(v9 + 16) = v10;
    *(_BYTE *)(v9 + 32) = v20;
    *(_QWORD *)(v3[7] + 8 * result) = v5;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v8 + 3;
    v15 = v8[1];
    v18 = *v8;
    v19 = v15;
    v20 = *((_BYTE *)v8 + 32);
    v16 = *((_QWORD *)v8 + 5);
    swift_bridgeObjectRetain(v5);
    result = sub_10002912C((uint64_t)&v18);
    v8 = v14;
    v5 = v16;
    if ((v17 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_10002B474(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  __int128 v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  char v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_1000060E4(&qword_100066CE8);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (i = (_QWORD *)(a1 + 72); ; i += 6)
    {
      v5 = *(_OWORD *)(i - 3);
      v14 = *(_OWORD *)(i - 5);
      v15 = v5;
      v16 = *((_BYTE *)i - 8);
      v6 = *i;
      result = sub_10002912C((uint64_t)&v14);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = v3[6] + 40 * result;
      v10 = v15;
      *(_OWORD *)v9 = v14;
      *(_OWORD *)(v9 + 16) = v10;
      *(_BYTE *)(v9 + 32) = v16;
      *(_QWORD *)(v3[7] + 8 * result) = v6;
      v11 = v3[2];
      v12 = __OFADD__(v11, 1);
      v13 = v11 + 1;
      if (v12)
        goto LABEL_10;
      v3[2] = v13;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

void sub_10002B574(__int128 *a1)
{
  __int128 v1;

  sub_100028790(a1, &v1);
  __asm { BR              X10 }
}

BOOL sub_10002B5C4()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 result;
  __int128 v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
  v4 = v16;
  v5 = v17;
  v6 = v18;
  sub_100028790(v0, &v11);
  if (v14 >> 62)
    return 0;
  result = 0;
  if (*(double *)&v11 == v3
    && v4 == *((double *)&v11 + 1)
    && v5 == v12
    && v6 == v13
    && ((v2 ^ v14) & 1) == 0)
  {
    return v1 == v15;
  }
  return result;
}

uint64_t *sub_10002B76C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = a1[3];
  v4 = a1[5];
  swift_retain(a1[6]);
  swift_retain(v2);
  swift_retain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

id sub_10002B7BC(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  char *v5;
  char *v6;
  __int128 v7;
  _QWORD *v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;
  _BYTE v16[24];

  *(_QWORD *)&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView] = 0;
  v5 = &v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 2;
  v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_allowsNoColor] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors] = 0;
  v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout] = 0;
  v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_isEditing] = 0;
  v6 = &v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent];
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v6 = *(_OWORD *)a1;
  *((_OWORD *)v6 + 1) = v7;
  *((_OWORD *)v6 + 2) = *(_OWORD *)(a1 + 32);
  *((_QWORD *)v6 + 6) = *(_QWORD *)(a1 + 48);
  v8 = &v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator__colorPickerState];
  swift_beginAccess(&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator__colorPickerState], v16, 33, 0);
  v9 = v2;
  sub_10002B76C((uint64_t *)a1);
  v10 = type metadata accessor for ColorPickerState(0);
  v11 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v12 = swift_retain(a2);
  *v8 = ObservedObject.init(wrappedValue:)(v12, v10, v11);
  v8[1] = v13;
  swift_endAccess(v16);

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for FavoriteColorPickerView.Coordinator();
  return objc_msgSendSuper2(&v15, "init");
}

uint64_t *sub_10002B934(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = a1[3];
  v4 = a1[6];
  swift_bridgeObjectRelease(a1[5]);
  swift_release(v3);
  swift_release(v2);
  swift_release(v4);
  return a1;
}

uint64_t sub_10002B9B8(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10002B9E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v1 = sub_1000060E4(&qword_100066C70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = v6 + 56;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  v8 = (_QWORD *)(v0 + v6);
  swift_release(*v8);
  swift_release(v8[3]);
  swift_bridgeObjectRelease(v8[5]);
  swift_release(v8[6]);
  return swift_deallocObject(v0, v7, v5);
}

void sub_10002BA74()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_1000060E4(&qword_100066C70) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_100026E24(v0 + v2, v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t sub_10002BAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002BAC8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10002BAD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100066C90;
  if (!qword_100066C90)
  {
    v1 = sub_100009E2C(&qword_100066C88);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100066C90);
  }
  return result;
}

uint64_t sub_10002BB1C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100028AB8(a1, (uint64_t)&unk_1000468B0, (uint64_t)&unk_1000468D8, a2);
}

uint64_t sub_10002BB40(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100028B44(a1, a2, a3, a4, (uint64_t)&unk_1000468B0, (uint64_t)&unk_1000468D8);
}

void sub_10002BB64(uint64_t *a1)
{
  sub_1000270E4(a1);
}

uint64_t sub_10002BB80()
{
  return sub_10002BBE0(72);
}

uint64_t sub_10002BB88(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;

  return sub_100027354(a3, a1, a2, v3 + 16);
}

uint64_t sub_10002BB90@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100028AB8(a1, (uint64_t)&unk_100046900, (uint64_t)&unk_100046928, a2);
}

uint64_t sub_10002BBB4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100028B44(a1, a2, a3, a4, (uint64_t)&unk_100046900, (uint64_t)&unk_100046928);
}

uint64_t sub_10002BBD8()
{
  return sub_10002BBE0(80);
}

uint64_t sub_10002BBE0(uint64_t a1)
{
  _QWORD *v1;

  swift_release(v1[2]);
  swift_release(v1[5]);
  swift_bridgeObjectRelease(v1[7]);
  swift_release(v1[8]);
  return swift_deallocObject(v1, a1, 7);
}

uint64_t sub_10002BC28()
{
  uint64_t v0;

  return sub_100027658(v0 + 16, *(_QWORD *)(v0 + 72));
}

unint64_t sub_10002BC34()
{
  unint64_t result;

  result = qword_100066CD8;
  if (!qword_100066CD8)
  {
    result = swift_getWitnessTable(&unk_100046688, &type metadata for FavoriteColorPickerView.ColorItem);
    atomic_store(result, (unint64_t *)&qword_100066CD8);
  }
  return result;
}

uint64_t sub_10002BC78()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002BC9C(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v3;

  return sub_100024E58(a1, a2, a3, v3);
}

uint64_t sub_10002BCA4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 72, 7);
}

void *sub_10002BCC8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16)
           + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_isEditing) = 1;
  return sub_10002337C((__int128 *)(v0 + 24));
}

unint64_t sub_10002BD00()
{
  unint64_t result;

  result = qword_100066D08;
  if (!qword_100066D08)
  {
    result = swift_getWitnessTable(&unk_1000465A8, &type metadata for FavoriteColorPickerView);
    atomic_store(result, (unint64_t *)&qword_100066D08);
  }
  return result;
}

_QWORD *sub_10002BD44(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_10002BD6C(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

void sub_10002BD94(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  __int128 v5;
  __int128 v6;

  v2 = *(void **)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
  if (v2)
  {
    v4 = v2;
    dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)(&v5, a1);

    if ((unint64_t)v6 >> 1 != 0xFFFFFFFF)
      __asm { BR              X11 }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  JUMPOUT(0x10002C21CLL);
}

_OWORD *sub_10002C23C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for _UIColorPickerContentViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100066E38;
  if (!qword_100066E38)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for _UIColorPickerContentViewController);
  return result;
}

uint64_t sub_10002C298(uint64_t a1)
{
  _QWORD v2[11];

  v2[0] = &unk_1000469F8;
  v2[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[3] = &unk_100046A10;
  v2[4] = &unk_100046A10;
  v2[5] = &unk_100046A10;
  v2[6] = &unk_100046A10;
  v2[7] = &unk_100046A10;
  v2[8] = &unk_100046A10;
  v2[9] = &unk_100046A10;
  v2[10] = &unk_100046A28;
  return swift_initClassMetadata2(a1, 0, 11, v2, a1 + qword_10006B6B8);
}

uint64_t sub_10002C31C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046B30);
  v5 = swift_getKeyPath(&unk_100046B58);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10002C398(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046B30);
  v5 = swift_getKeyPath(&unk_100046B58);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

char *sub_10002C408()
{
  char *v0;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char *result;
  void *v33;
  id v34;
  char *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t KeyPath;
  uint64_t v41;
  id v42;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  NSString v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  Swift::String v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (**v97)();
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
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[4];

  v1 = sub_1000060E4(&qword_100066EE8);
  v113 = *(_QWORD *)(v1 - 8);
  v114 = v1;
  __chkstk_darwin(v1);
  v112 = (char *)&v100 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000060E4(&qword_100066EF0);
  v110 = *(_QWORD *)(v3 - 8);
  v111 = v3;
  __chkstk_darwin(v3);
  v109 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_1000060E4(&qword_100066EF8);
  v102 = *(_QWORD *)(v115 - 8);
  __chkstk_darwin(v115);
  v6 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4((uint64_t *)&unk_100066F00);
  v105 = *(_QWORD *)(v7 - 8);
  v106 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000060E4((uint64_t *)&unk_100066460);
  v103 = *(_QWORD *)(v10 - 8);
  v104 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000060E4((uint64_t *)&unk_100066F10);
  v107 = *(_QWORD *)(v13 - 8);
  v108 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for UIHostingControllerSizingOptions(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = &v0[qword_100066DE0];
  *(_QWORD *)v19 = 0x64657463656C6573;
  *((_QWORD *)v19 + 1) = 0xEB00000000626154;
  v20 = qword_100066DE8;
  v21 = objc_allocWithZone((Class)type metadata accessor for FavoritesStore());
  v22 = v0;
  *(_QWORD *)&v0[v20] = objc_msgSend(v21, "init");
  v23 = qword_100066DF0;
  v24 = type metadata accessor for ColorPickerState(0);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  v25 = sub_100021964((uint64_t)_swiftEmptyArrayStorage);
  *(_QWORD *)&v22[v23] = v25;
  *(_QWORD *)&v22[qword_100066DF8] = 0;
  *(_QWORD *)&v22[qword_100066E00] = 0;
  *(_QWORD *)&v22[qword_100066E08] = 0;
  *(_QWORD *)&v22[qword_100066E10] = 0;
  *(_QWORD *)&v22[qword_100066E18] = 0;
  *(_QWORD *)&v22[qword_100066E20] = 0;
  *(_QWORD *)&v22[qword_100066E28] = 0;
  v22[qword_100066E30] = 0;
  v26 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v27 = swift_retain(v25);
  v28 = ObservedObject.init(wrappedValue:)(v27, v24, v26);
  v30 = v29;

  v116[0] = v28;
  v116[1] = v30;
  swift_retain(v30);
  v31 = (id)UIHostingController.init(rootView:)(v116);
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  dispatch thunk of UIHostingController.sizingOptions.setter(v18);
  result = (char *)objc_msgSend(v31, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v33 = result;
  v101 = v30;
  v34 = objc_msgSend(result, "layer");

  objc_msgSend(v34, "setHitTestsAsOpaque:", 1);
  v35 = (char *)v31;
  UIHostingController.safeAreaRegions.setter(0);

  result = (char *)objc_msgSend(v35, "view");
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v36 = result;
  objc_msgSend(result, "_setSafeAreaInsetsFrozen:", 1);

  v37 = qword_100066DF0;
  v38 = *(_QWORD *)&v35[qword_100066DF0];
  v39 = *(void **)&v35[qword_100066DE8];
  KeyPath = swift_getKeyPath(&unk_100046AA0);
  v41 = swift_getKeyPath(&unk_100046AC8);
  swift_retain(v38);
  v42 = v39;
  static Published.subscript.getter(v116, v38, KeyPath, v41);
  swift_release(KeyPath);
  swift_release(v41);
  v43 = sub_10000D154(v116[0]);

  v44 = swift_getKeyPath(&unk_100046AE8);
  v45 = swift_getKeyPath(&unk_100046B10);
  v116[0] = v43;
  static Published.subscript.setter(v116, v38, v44, v45);
  v46 = *(_QWORD *)&v35[v37];
  sub_100021520((uint64_t)v12);
  swift_beginAccess(v46 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isVolatile, v116, 33, 0);
  v47 = sub_1000060E4(&qword_100066F20);
  Published.projectedValue.getter(v47);
  swift_endAccess(v116);
  v48 = sub_100009FA0(&qword_100066F28, &qword_100066EF8, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v49 = v115;
  v100 = v48;
  Publisher<>.removeDuplicates()(v115);
  v102 = *(_QWORD *)(v102 + 8);
  ((void (*)(char *, uint64_t))v102)(v6, v49);
  v50 = sub_100009FA0(&qword_100066F30, (uint64_t *)&unk_100066460, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v51 = sub_100009FA0(&qword_100066F38, (uint64_t *)&unk_100066F00, (uint64_t)&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
  v52 = v104;
  v53 = v106;
  Publisher.combineLatest<A>(_:)(v9, v104, v106, v50, v51);
  (*(void (**)(char *, uint64_t))(v105 + 8))(v9, v53);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v12, v52);
  v54 = swift_allocObject(&unk_10005BEE0, 24, 7);
  swift_unknownObjectWeakInit(v54 + 16, v35);
  v55 = swift_allocObject(&unk_10005BF08, 32, 7);
  *(_QWORD *)(v55 + 16) = sub_10002F87C;
  *(_QWORD *)(v55 + 24) = v54;
  v56 = sub_100009FA0((unint64_t *)&unk_100066F40, (uint64_t *)&unk_100066F10, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest<A, B>);
  v57 = v108;
  v58 = Publisher<>.sink(receiveValue:)(sub_10002F8A8, v55, v108, v56);
  swift_release(v55);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v15, v57);
  v59 = *(_QWORD *)&v35[qword_100066DF8];
  *(_QWORD *)&v35[qword_100066DF8] = v58;
  swift_release(v59);
  v60 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v61 = *(_QWORD *)&v35[qword_100066DE0 + 8];
  swift_bridgeObjectRetain(v61);
  v62 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v61);
  v63 = objc_msgSend(v60, "stringForKey:", v62);

  if (v63)
  {
    v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
    v66 = v65;

    v67._countAndFlagsBits = v64;
    v67._object = v66;
    v68 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100059A80, v67);
    swift_bridgeObjectRelease(v66);
    if (v68 <= 2)
    {
      v69 = *(_QWORD *)&v35[v37];
      v70 = swift_getKeyPath(&unk_100046B30);
      v71 = swift_getKeyPath(&unk_100046B58);
      LOBYTE(v116[0]) = v68;
      swift_retain(v69);
      static Published.subscript.setter(v116, v69, v70, v71);
    }
  }
  swift_beginAccess(*(_QWORD *)&v35[v37] + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedTab, v116, 33, 0);
  v72 = sub_1000060E4(&qword_1000669B0);
  v73 = v109;
  Published.projectedValue.getter(v72);
  swift_endAccess(v116);
  v74 = swift_allocObject(&unk_10005BEE0, 24, 7);
  swift_unknownObjectWeakInit(v74 + 16, v35);
  v75 = sub_100009FA0((unint64_t *)&unk_100066F50, &qword_100066EF0, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v76 = v111;
  v77 = Publisher<>.sink(receiveValue:)(sub_10002F8D4, v74, v111, v75);
  swift_release(v74);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v73, v76);
  v78 = *(_QWORD *)&v35[qword_100066E20];
  *(_QWORD *)&v35[qword_100066E20] = v77;
  swift_release(v78);
  swift_beginAccess(*(_QWORD *)&v35[v37] + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperShowing, v116, 33, 0);
  Published.projectedValue.getter(v47);
  swift_endAccess(v116);
  v79 = swift_allocObject(&unk_10005BEE0, 24, 7);
  swift_unknownObjectWeakInit(v79 + 16, v35);
  v80 = v115;
  v81 = v100;
  v82 = Publisher<>.sink(receiveValue:)(sub_10002F8DC, v79, v115, v100);
  swift_release(v79);
  v83 = (void (*)(char *, uint64_t))v102;
  ((void (*)(char *, uint64_t))v102)(v6, v80);
  v84 = *(_QWORD *)&v35[qword_100066E10];
  *(_QWORD *)&v35[qword_100066E10] = v82;
  swift_release(v84);
  swift_beginAccess(*(_QWORD *)&v35[v37] + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperIsFloating, v116, 33, 0);
  Published.projectedValue.getter(v47);
  swift_endAccess(v116);
  v85 = swift_allocObject(&unk_10005BEE0, 24, 7);
  swift_unknownObjectWeakInit(v85 + 16, v35);
  v86 = Publisher<>.sink(receiveValue:)(sub_10002F8E4, v85, v80, v81);
  swift_release(v85);
  v83(v6, v80);
  v87 = *(_QWORD *)&v35[qword_100066E18];
  *(_QWORD *)&v35[qword_100066E18] = v86;
  swift_release(v87);
  swift_beginAccess(*(_QWORD *)&v35[v37] + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__favoriteColors, v116, 33, 0);
  v88 = sub_1000060E4(&qword_1000669E8);
  v89 = v112;
  Published.projectedValue.getter(v88);
  swift_endAccess(v116);
  v90 = swift_allocObject(&unk_10005BEE0, 24, 7);
  swift_unknownObjectWeakInit(v90 + 16, v35);
  v91 = sub_100009FA0((unint64_t *)&unk_100066F60, &qword_100066EE8, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v92 = v114;
  v93 = Publisher<>.sink(receiveValue:)(sub_10002F8EC, v90, v114, v91);
  swift_release(v101);
  swift_release(v90);

  (*(void (**)(char *, uint64_t))(v113 + 8))(v89, v92);
  v94 = *(_QWORD *)&v35[qword_100066E08];
  *(_QWORD *)&v35[qword_100066E08] = v93;
  swift_release(v94);
  v95 = *(_QWORD *)&v35[v37];
  v96 = swift_allocObject(&unk_10005BEE0, 24, 7);
  swift_unknownObjectWeakInit(v96 + 16, v35);
  v97 = (void (**)())(v95 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
  v98 = *(_QWORD *)(v95 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
  v99 = *(_QWORD *)(v95 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close + 8);
  *v97 = sub_10002F8F4;
  v97[1] = (void (*)())v96;
  sub_10000CCDC(v98, v99);
  return v35;
}

void sub_10002CEF4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5;
  void *Strong;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[24];

  v5 = a3 + 16;
  swift_beginAccess(a3 + 16, v12, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    if ((*((_BYTE *)Strong + qword_100066E30) & 1) == 0)
    {
      v8 = objc_msgSend(Strong, "parentViewController");
      if (v8)
      {
        v9 = v8;
        v10 = objc_opt_self(_UIColorPickerContainerViewController);
        v11 = (void *)swift_dynamicCastObjCClass(v9, v10);
        if (!v11)

      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v11, "_pickerDidSelectColor:isVolatile:", a1, a2 & 1);

    }
  }
}

void sub_10002CFD0(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t Strong;
  char *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  NSString v9;
  uint64_t v10;
  NSString v11;
  _BYTE v12[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (char *)Strong;
    v6 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
    v7 = 0xE800000000000000;
    if (v2 != 1)
      v7 = 0xE700000000000000;
    if (v2)
      v8 = v7;
    else
      v8 = 0xE400000000000000;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    v10 = *(_QWORD *)&v5[qword_100066DE0 + 8];
    swift_bridgeObjectRetain(v10);
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
    objc_msgSend(v6, "setValue:forKey:", v9, v11);

  }
}

void sub_10002D108(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  void *Strong;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void **aBlock;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v25, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    if (v2 && (v6 = objc_msgSend(Strong, "parentViewController")) != 0)
    {
      v7 = v6;
      v8 = objc_opt_self(_UIColorPickerContainerViewController);
      v9 = swift_dynamicCastObjCClass(v7, v8);
      if (v9)
      {
        v10 = (void *)v9;
        v11 = swift_allocObject(&unk_10005BF30, 24, 7);
        *(_QWORD *)(v11 + 16) = v5;
        v23 = sub_10002F928;
        v24 = v11;
        aBlock = _NSConcreteStackBlock;
        v20 = 1107296256;
        v21 = sub_10002D690;
        v22 = &unk_10005BF48;
        v12 = _Block_copy(&aBlock);
        v13 = v24;
        v14 = v5;
        swift_release(v13);
        v15 = swift_allocObject(&unk_10005BF80, 24, 7);
        *(_QWORD *)(v15 + 16) = v14;
        v23 = sub_10002F948;
        v24 = v15;
        aBlock = _NSConcreteStackBlock;
        v20 = 1107296256;
        v21 = sub_1000270B8;
        v22 = &unk_10005BF98;
        v16 = _Block_copy(&aBlock);
        v17 = v24;
        v18 = v14;
        swift_release(v17);
        objc_msgSend(v10, "_pickerDidShowEyedropperWithSelectionBlock:dismissBlock:", v12, v16);

        _Block_release(v16);
        _Block_release(v12);
      }
      else
      {

      }
    }
    else
    {
      v7 = v5;
    }

  }
}

uint64_t sub_10002D2C0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000075F4(0, &qword_100066C78, OS_dispatch_queue_ptr);
  v10 = (void *)static OS_dispatch_queue.main.getter();
  v11 = swift_allocObject(&unk_10005C020, 32, 7);
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_10002F9CC;
  v24 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000270B8;
  aBlock[3] = &unk_10005C038;
  v12 = _Block_copy(aBlock);
  v13 = v24;
  v14 = a2;
  v15 = a1;
  v16 = swift_release(v13);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = _swiftEmptyArrayStorage;
  v17 = sub_100006848(&qword_100066C80, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v18 = sub_1000060E4(&qword_100066C88);
  v19 = sub_100009FA0((unint64_t *)&qword_100066C90, &qword_100066C88, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v21);
}

uint64_t sub_10002D4DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[6];

  v4[2] = a1;
  v4[3] = a2;
  v2 = static Animation.default.getter();
  withAnimation<A>(_:_:)(v2, sub_10002F9D4, v4, (char *)&type metadata for () + 8);
  return swift_release(v2);
}

uint64_t sub_10002D538(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  CGColor *v4;
  CGColorSpace *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t KeyPath;
  uint64_t v13;
  _QWORD v15[4];
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v2 = *(_QWORD *)(a1 + qword_100066DF0);
  v3 = a2;
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");
  v5 = CGColorGetColorSpace(v4);

  if (v5)
  {
    v6 = sub_1000184E4(v5);
    if (v6 != 2)
    {
      sub_1000183BC(v3, v6 & 1, (uint64_t)&v17);
      v7 = v17;
      v8 = v18;
      v9 = v19;
      v10 = v20;
      v11 = v21;

      goto LABEL_8;
    }

  }
  if (qword_100065088 != -1)
    swift_once(&qword_100065088, sub_10002141C);
  sub_1000183BC(v3, byte_10006B6A0, (uint64_t)&v17);
  v7 = v17;
  v8 = v18;
  v9 = v19;
  v10 = v20;
  v11 = v21;
LABEL_8:
  KeyPath = swift_getKeyPath(&unk_100046BC0);
  v13 = swift_getKeyPath(&unk_100046BE8);
  v15[0] = v7;
  v15[1] = v8;
  v15[2] = v9;
  v15[3] = v10;
  v16 = v11;
  swift_retain(v2);
  return static Published.subscript.setter(v15, v2, KeyPath, v13);
}

void sub_10002D690(uint64_t a1, void *a2)
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

uint64_t sub_10002D6E0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000075F4(0, &qword_100066C78, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_10005BFD0, 24, 7);
  *(_QWORD *)(v10 + 16) = a1;
  aBlock[4] = sub_10002F950;
  v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000270B8;
  aBlock[3] = &unk_10005BFE8;
  v11 = _Block_copy(aBlock);
  v12 = v22;
  v13 = a1;
  v14 = swift_release(v12);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = _swiftEmptyArrayStorage;
  v15 = sub_100006848(&qword_100066C80, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_1000060E4(&qword_100066C88);
  v17 = sub_100009FA0((unint64_t *)&qword_100066C90, &qword_100066C88, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10002D8F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  char v5;

  v1 = *(_QWORD *)(a1 + qword_100066DF0);
  KeyPath = swift_getKeyPath(&unk_100046B78);
  v3 = swift_getKeyPath(&unk_100046BA0);
  v5 = 0;
  swift_retain(v1);
  return static Published.subscript.setter(&v5, v1, KeyPath, v3);
}

void sub_10002D968(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  void *Strong;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v10, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    if (v2)
    {
      v6 = objc_msgSend(Strong, "parentViewController");
      if (v6)
      {
        v7 = v6;
        v8 = objc_opt_self(_UIColorPickerContainerViewController);
        v9 = (void *)swift_dynamicCastObjCClass(v7, v8);
        if (!v9)

      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v9, "_pickerDidFloatEyeDropper");

    }
  }
}

void sub_10002DA24(float64x2_t **a1, uint64_t a2)
{
  float64x2_t *v2;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  id v10;
  _QWORD v11[3];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, (char *)v11 + 1, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = *(void **)(Strong + qword_100066DE8);
    v7 = *(_QWORD *)(Strong + qword_100066DF0);
    KeyPath = swift_getKeyPath(&unk_100046AA0);
    v9 = swift_getKeyPath(&unk_100046AC8);
    v10 = v6;
    static Published.subscript.getter(v11, v7, KeyPath, v9);
    swift_release(KeyPath);
    swift_release(v9);
    sub_10000D28C(v2, v11[0]);

  }
}

void sub_10002DAFC(uint64_t a1)
{
  uint64_t v1;
  void *Strong;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    v4 = objc_msgSend(Strong, "parentViewController");
    if (v4)
    {
      v5 = v4;
      v6 = objc_opt_self(_UIColorPickerContainerViewController);
      v7 = (void *)swift_dynamicCastObjCClass(v5, v6);
      if (!v7)

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "_pickerDidFinish");

  }
}

char *sub_10002DBAC()
{
  return sub_10002C408();
}

void sub_10002DBCC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_10002F6C0();
}

void sub_10002DBF0(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController(0);
  v4 = v7.receiver;
  objc_msgSendSuper2(&v7, "viewWillAppear:", a3);
  v5 = objc_msgSend(v4, "view", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setBackgroundColor:", 0);

  }
  else
  {
    __break(1u);
  }
}

void sub_10002DC88(void *a1, uint64_t a2, uint64_t a3)
{
  char *v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  char v8;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController(0);
  v4 = (char *)v9.receiver;
  objc_msgSendSuper2(&v9, "viewDidDisappear:", a3);
  v5 = *(_QWORD *)&v4[qword_100066DF0];
  KeyPath = swift_getKeyPath(&unk_100046A58);
  v7 = swift_getKeyPath(&unk_100046A80);
  v8 = 0;
  swift_retain(v5);
  static Published.subscript.setter(&v8, v5, KeyPath, v7);

}

uint64_t sub_10002DD34(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (**v4)();
  id v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __CFString *v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  _QWORD v30[4];
  char v31;
  _QWORD v32[4];
  char v33;

  v2 = v1;
  v3 = qword_100066E30;
  *(_BYTE *)(v1 + qword_100066E30) = 1;
  v4 = off_100066000;
  if (a1)
  {
    v5 = a1;
    v6 = String._bridgeToObjectiveC()();
    type metadata accessor for CFString(0);
    v8 = v7;
    v9 = sub_100006848((unint64_t *)&qword_100066F80, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_1000431B0);
    v10 = (id)kCGColorSpaceSRGB;
    v11 = static _CFObject.== infix(_:_:)(v10, v6, v8, v9);

    v29 = v3;
    if ((v11 & 1) != 0)
    {

      v12 = 0;
    }
    else
    {
      v18 = (id)kCGColorSpaceDisplayP3;
      v19 = static _CFObject.== infix(_:_:)(v18, v6, v8, v9);

      if ((v19 & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        if (qword_100065088 != -1)
          swift_once(&qword_100065088, sub_10002141C);
        v12 = byte_10006B6A0;
      }
    }
    v20 = v5;
    sub_1000183BC(v20, v12, (uint64_t)v32);
    v16 = v32[0];
    v15 = v32[1];
    v14 = v32[2];
    v21 = v32[3];
    v17 = v33;
    v22 = *(_QWORD *)(v2 + qword_100066DF0);
    KeyPath = swift_getKeyPath(&unk_100046AA0);
    v24 = swift_getKeyPath(&unk_100046AC8);
    static Published.subscript.getter(v30, v22, KeyPath, v24);

    swift_release(KeyPath);
    swift_release(v24);
    if (LOBYTE(v30[0]))
      v13 = v21;
    else
      v13 = 0x3FF0000000000000;
    v4 = off_100066000;
    v3 = v29;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 2;
  }
  v25 = *(_QWORD *)((char *)v4[446] + v2);
  v26 = swift_getKeyPath(&unk_100046BC0);
  v27 = swift_getKeyPath(&unk_100046BE8);
  v30[0] = v16;
  v30[1] = v15;
  v30[2] = v14;
  v30[3] = v13;
  v31 = v17;
  swift_retain(v25);
  result = static Published.subscript.setter(v30, v25, v26, v27);
  *(_BYTE *)(v2 + v3) = 0;
  return result;
}

uint64_t sub_10002DF80(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = a3;
  v9 = a1;
  sub_10002DD34(a3);

  return swift_bridgeObjectRelease(v7);
}

CGColorSpaceRef sub_10002DFEC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  id v18;
  NSString v19;
  NSString v20;
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
  _OWORD *v34;
  _OWORD *v35;
  CGColor *v36;
  CGColorSpace *v37;
  __CFString *v38;
  id *v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  CGColor *v72;
  CGColorSpaceRef result;
  CGColorSpace *v74;
  CGColorSpaceRef v75;
  CGColorSpaceRef v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  CGFloat Alpha;
  unint64_t v81;
  unint64_t v82;
  CGFloat *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned __int8 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int8 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned __int8 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned __int8 v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  id v128;
  uint64_t v129;
  CFStringRef v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _OWORD v135[2];
  char v136;
  _OWORD v137[2];
  char v138;

  v2 = v1;
  v4 = sub_1000060E4(&qword_100066158);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v126 - v8;
  v10 = *(void **)(v1 + qword_100066E28);
  *(_QWORD *)(v2 + qword_100066E28) = a1;
  v11 = a1;

  v12 = *(_QWORD *)(v2 + qword_100066DF0);
  LOBYTE(a1) = objc_msgSend(v11, "_shouldUseDarkGridInDarkMode");
  KeyPath = swift_getKeyPath(&unk_100046C08);
  v14 = swift_getKeyPath(&unk_100046C30);
  LOBYTE(v137[0]) = (_BYTE)a1;
  swift_retain(v12);
  static Published.subscript.setter(v137, v12, KeyPath, v14);
  v15 = objc_msgSend(v11, "title");
  if (!v15)
  {
    v16 = sub_1000075F4(0, (unint64_t *)&qword_100066F70, UIColorPickerViewController_ptr);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v16);
    v18 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
    v19 = String._bridgeToObjectiveC()();
    v20 = String._bridgeToObjectiveC()();
    v15 = objc_msgSend(v18, "localizedStringForKey:value:table:", v19, 0, v20);

  }
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v23 = v22;

  v24 = swift_getKeyPath(&unk_100046C50);
  v25 = swift_getKeyPath(&unk_100046C78);
  *(_QWORD *)&v137[0] = v21;
  *((_QWORD *)&v137[0] + 1) = v23;
  swift_retain(v12);
  static Published.subscript.setter(v137, v12, v24, v25);
  LOBYTE(v24) = objc_msgSend(v11, "_allowsNoColor");
  v26 = swift_getKeyPath(&unk_100046C98);
  v27 = swift_getKeyPath(&unk_100046CC0);
  LOBYTE(v137[0]) = v24;
  swift_retain(v12);
  static Published.subscript.setter(v137, v12, v26, v27);
  v28 = swift_getKeyPath(&unk_100046C98);
  v29 = swift_getKeyPath(&unk_100046CC0);
  static Published.subscript.getter(v137, v12, v28, v29);
  swift_release(v28);
  swift_release(v29);
  if ((v137[0] & 1) != 0)
    goto LABEL_13;
  v30 = swift_getKeyPath(&unk_100046BC0);
  v31 = swift_getKeyPath(&unk_100046BE8);
  static Published.subscript.getter(v137, v12, v30, v31);
  swift_release(v30);
  swift_release(v31);
  if (v138 != 2)
    goto LABEL_13;
  v32 = swift_getKeyPath(&unk_100046CE0);
  v33 = swift_getKeyPath(&unk_100046D08);
  static Published.subscript.getter(v135, v12, v32, v33);
  swift_release(v32);
  swift_release(v33);
  v137[0] = v135[0];
  v137[1] = v135[1];
  v138 = v136;
  sub_1000176F4();
  v35 = v34;
  v36 = (CGColor *)objc_msgSend(v34, "CGColor");
  v37 = CGColorGetColorSpace(v36);

  if (v37)
  {
    v38 = (__CFString *)CGColorSpaceCopyName(v37);

    if (v38)
      goto LABEL_12;
  }
  if (qword_100065088 != -1)
    goto LABEL_68;
  while (1)
  {
    if (byte_10006B6A0)
      v39 = (id *)&kCGColorSpaceDisplayP3;
    else
      v39 = (id *)&kCGColorSpaceSRGB;
    v38 = (__CFString *)*v39;
LABEL_12:
    static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v41 = v40;
    v42 = v35;
    sub_10002DD34(v35);

    swift_bridgeObjectRelease(v41);
LABEL_13:
    v43 = swift_getKeyPath(&unk_100046AA0);
    v44 = swift_getKeyPath(&unk_100046AC8);
    static Published.subscript.getter(v135, v12, v43, v44);
    swift_release(v43);
    swift_release(v44);
    LODWORD(v43) = LOBYTE(v135[0]);
    if ((_DWORD)v43 != objc_msgSend(v11, "showsAlpha"))
    {
      v45 = objc_msgSend(v11, "showsAlpha");
      v46 = swift_getKeyPath(&unk_100046AA0);
      v47 = swift_getKeyPath(&unk_100046AC8);
      LOBYTE(v135[0]) = v45;
      swift_retain(v12);
      static Published.subscript.setter(v135, v12, v46, v47);
      v48 = sub_10000D154((char)objc_msgSend(v11, "showsAlpha"));
      v49 = swift_getKeyPath(&unk_100046AE8);
      v50 = swift_getKeyPath(&unk_100046B10);
      *(_QWORD *)&v135[0] = v48;
      swift_retain(v12);
      static Published.subscript.setter(v135, v12, v49, v50);
    }
    v51 = swift_getKeyPath(&unk_100046D28);
    v52 = swift_getKeyPath(&unk_100046D50);
    static Published.subscript.getter(v135, v12, v51, v52);
    swift_release(v51);
    swift_release(v52);
    LODWORD(v52) = LOBYTE(v135[0]);
    if ((_DWORD)v52 != objc_msgSend(v11, "_showsEyedropper"))
    {
      v53 = objc_msgSend(v11, "_showsEyedropper");
      v54 = swift_getKeyPath(&unk_100046D28);
      v55 = swift_getKeyPath(&unk_100046D50);
      LOBYTE(v135[0]) = v53;
      swift_retain(v12);
      static Published.subscript.setter(v135, v12, v54, v55);
    }
    v56 = swift_getKeyPath(&unk_100046D70);
    v57 = swift_getKeyPath(&unk_100046D98);
    static Published.subscript.getter(v135, v12, v56, v57);
    swift_release(v56);
    swift_release(v57);
    LODWORD(v57) = LOBYTE(v135[0]);
    if ((_DWORD)v57 != objc_msgSend(v11, "_showsGridOnly"))
    {
      v58 = objc_msgSend(v11, "_showsGridOnly");
      v59 = swift_getKeyPath(&unk_100046D70);
      v60 = swift_getKeyPath(&unk_100046D98);
      LOBYTE(v135[0]) = v58;
      swift_retain(v12);
      static Published.subscript.setter(v135, v12, v59, v60);
    }
    v61 = objc_msgSend(v11, "_suggestedColors");
    if (!v61)
    {
      v67 = 0;
      goto LABEL_40;
    }
    v62 = v61;
    v63 = sub_1000075F4(0, &qword_100065910, UIColor_ptr);
    v64 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v62, v63);

    if ((unint64_t)v64 >> 62)
    {
      if (v64 < 0)
        v84 = v64;
      else
        v84 = v64 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v64);
      v65 = _CocoaArrayWrapper.endIndex.getter(v84);
      swift_bridgeObjectRelease(v64);
      if (!v65)
      {
LABEL_39:
        swift_bridgeObjectRelease(v64);
        v67 = _swiftEmptyArrayStorage;
LABEL_40:
        v85 = swift_getKeyPath(&unk_100046DB8);
        v86 = swift_getKeyPath(&unk_100046DE0);
        static Published.subscript.getter(v135, v12, v85, v86);
        swift_release(v85);
        swift_release(v86);
        v87 = *(_QWORD *)&v135[0];
        if (*(_QWORD *)&v135[0])
        {
          if (v67)
          {
            v88 = sub_100028FB8(*(uint64_t *)&v135[0], (uint64_t)v67);
            swift_bridgeObjectRelease(v87);
            if ((v88 & 1) != 0)
            {
              swift_bridgeObjectRelease(v67);
              goto LABEL_48;
            }
          }
          else
          {
            swift_bridgeObjectRelease(*(_QWORD *)&v135[0]);
          }
LABEL_47:
          v89 = swift_getKeyPath(&unk_100046DB8);
          v90 = swift_getKeyPath(&unk_100046DE0);
          *(_QWORD *)&v135[0] = v67;
          swift_retain(v12);
          static Published.subscript.setter(v135, v12, v89, v90);
        }
        else if (v67)
        {
          goto LABEL_47;
        }
LABEL_48:
        if (objc_msgSend(v11, "_userInterfaceStyleForGrid"))
        {
          if (objc_msgSend(v11, "_userInterfaceStyleForGrid") == (id)2)
          {
            v91 = (unsigned int *)&enum case for ColorScheme.dark(_:);
            goto LABEL_54;
          }
          if (objc_msgSend(v11, "_userInterfaceStyleForGrid") == (id)1)
          {
            v91 = (unsigned int *)&enum case for ColorScheme.light(_:);
LABEL_54:
            v93 = *v91;
            v94 = type metadata accessor for ColorScheme(0);
            v95 = *(_QWORD *)(v94 - 8);
            (*(void (**)(char *, uint64_t, uint64_t))(v95 + 104))(v9, v93, v94);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v95 + 56))(v9, 0, 1, v94);
LABEL_55:
            v96 = swift_getKeyPath(&unk_100046F68);
            v97 = swift_getKeyPath(&unk_100046F90);
            sub_10002FB9C((uint64_t)v9, (uint64_t)v7);
            swift_retain(v12);
            static Published.subscript.setter(v7, v12, v96, v97);
            sub_10002FBE4((uint64_t)v9);
          }
          v98 = swift_getKeyPath(&unk_100046E00);
          v99 = swift_getKeyPath(&unk_100046E28);
          static Published.subscript.getter(v135, v12, v98, v99);
          swift_release(v98);
          swift_release(v99);
          LODWORD(v99) = LOBYTE(v135[0]);
          if ((_DWORD)v99 != objc_msgSend(v11, "_isEmbedded"))
          {
            v100 = objc_msgSend(v11, "_isEmbedded");
            v101 = swift_getKeyPath(&unk_100046E00);
            v102 = swift_getKeyPath(&unk_100046E28);
            LOBYTE(v135[0]) = v100;
            swift_retain(v12);
            static Published.subscript.setter(v135, v12, v101, v102);
          }
          v103 = swift_getKeyPath(&unk_100046E48);
          v104 = swift_getKeyPath(&unk_100046E70);
          static Published.subscript.getter(v135, v12, v103, v104);
          swift_release(v103);
          swift_release(v104);
          LODWORD(v104) = LOBYTE(v135[0]);
          if ((_DWORD)v104 != objc_msgSend(v11, "_isInPopoverPresentation"))
          {
            v105 = objc_msgSend(v11, "_isInPopoverPresentation");
            v106 = swift_getKeyPath(&unk_100046E48);
            v107 = swift_getKeyPath(&unk_100046E70);
            LOBYTE(v135[0]) = v105;
            swift_retain(v12);
            static Published.subscript.setter(v135, v12, v106, v107);
          }
          v108 = swift_getKeyPath(&unk_100046E90);
          v109 = swift_getKeyPath(&unk_100046EB8);
          static Published.subscript.getter(v135, v12, v108, v109);
          swift_release(v108);
          swift_release(v109);
          LODWORD(v109) = LOBYTE(v135[0]);
          if ((_DWORD)v109 != objc_msgSend(v11, "_useLandscapeLayout"))
          {
            v110 = objc_msgSend(v11, "_useLandscapeLayout");
            v111 = swift_getKeyPath(&unk_100046E90);
            v112 = swift_getKeyPath(&unk_100046EB8);
            LOBYTE(v135[0]) = v110;
            swift_retain(v12);
            static Published.subscript.setter(v135, v12, v111, v112);
          }
          v113 = swift_getKeyPath(&unk_100046ED8);
          v114 = swift_getKeyPath(&unk_100046F00);
          static Published.subscript.getter(v135, v12, v113, v114);
          swift_release(v113);
          swift_release(v114);
          v115 = *(double *)v135;
          objc_msgSend(v11, "_preferredWidth");
          if (v115 != v116)
          {
            objc_msgSend(v11, "_preferredWidth");
            v118 = v117;
            v119 = swift_getKeyPath(&unk_100046ED8);
            v120 = swift_getKeyPath(&unk_100046F00);
            *(_QWORD *)&v135[0] = v118;
            swift_retain(v12);
            static Published.subscript.setter(v135, v12, v119, v120);
          }
          v121 = swift_getKeyPath(&unk_100046F20);
          v122 = swift_getKeyPath(&unk_100046F48);
          static Published.subscript.getter(v135, v12, v121, v122);
          swift_release(v121);
          swift_release(v122);
          LODWORD(v122) = LOBYTE(v135[0]);
          result = (CGColorSpaceRef)objc_msgSend(v11, "_isInSheetPresentation");
          if ((_DWORD)v122 != (_DWORD)result)
          {
            v123 = objc_msgSend(v11, "_isInSheetPresentation");
            v124 = swift_getKeyPath(&unk_100046F20);
            v125 = swift_getKeyPath(&unk_100046F48);
            LOBYTE(v135[0]) = v123;
            swift_retain(v12);
            return (CGColorSpaceRef)static Published.subscript.setter(v135, v12, v124, v125);
          }
          return result;
        }
        v92 = type metadata accessor for ColorScheme(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v92 - 8) + 56))(v9, 1, 1, v92);
        goto LABEL_55;
      }
    }
    else
    {
      v65 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v65)
        goto LABEL_39;
    }
    *(_QWORD *)&v135[0] = _swiftEmptyArrayStorage;
    v35 = v135;
    sub_1000297EC(0, v65 & ~(v65 >> 63), 0);
    if ((v65 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_68:
    swift_once(&qword_100065088, sub_10002141C);
  }
  v126 = v9;
  v127 = v7;
  v128 = v11;
  v129 = v12;
  v66 = 0;
  v67 = *(_QWORD **)&v135[0];
  v131 = v64 & 0xC000000000000001;
  v130 = kCGColorSpaceSRGB;
  while (1)
  {
    v68 = v131
        ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v66, v64)
        : *(id *)(v64 + 8 * v66 + 32);
    v69 = v68;
    v70 = v65;
    v71 = v64;
    v72 = (CGColor *)objc_msgSend(v68, "CGColor", v126, v127, v128, v129);
    result = (CGColorSpaceRef)UISCreateCachedColorTransform(v130);
    v133 = 0;
    v134 = 0;
    v132 = 0;
    if (!result)
      break;
    v74 = result;
    result = CGColorGetColorSpace(v72);
    if (!result)
      goto LABEL_71;
    v75 = result;
    result = (CGColorSpaceRef)CGColorRef.components.getter();
    if (!result)
    {
      __break(1u);
      break;
    }
    v76 = result;
    CGColorTransformConvertColorComponents(v74, v75, 3, (char *)result + 32, &v132);

    swift_bridgeObjectRelease(v76);
    v77 = v132;
    v78 = v133;
    v79 = v134;
    Alpha = CGColorGetAlpha(v72);

    *(_QWORD *)&v135[0] = v67;
    v82 = v67[2];
    v81 = v67[3];
    if (v82 >= v81 >> 1)
    {
      sub_1000297EC((char *)(v81 > 1), v82 + 1, 1);
      v67 = *(_QWORD **)&v135[0];
    }
    ++v66;
    v67[2] = v82 + 1;
    v83 = (CGFloat *)&v67[5 * v82];
    *((_QWORD *)v83 + 4) = v77;
    *((_QWORD *)v83 + 5) = v78;
    *((_QWORD *)v83 + 6) = v79;
    v83[7] = Alpha;
    *((_BYTE *)v83 + 64) = 0;
    v65 = v70;
    v64 = v71;
    if (v70 == v66)
    {
      swift_bridgeObjectRelease(v71);
      v12 = v129;
      v11 = v128;
      v7 = v127;
      v9 = v126;
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
  return result;
}

void sub_10002EEA0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_10002DFEC(v4);

}

void sub_10002EEF8(void *a1, int a2, void *aBlock)
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  id v6;

  v4 = _Block_copy(aBlock);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = a1;
  v5(v4);
  _Block_release(v4);

}

void sub_10002EF50(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "parentViewController");
  if (v2)
  {
    v3 = v2;
    v4 = objc_opt_self(_UIColorPickerContainerViewController);
    v2 = (id)swift_dynamicCastObjCClass(v3, v4);
    if (!v2)
    {

      v2 = 0;
    }
  }
  v5 = v2;
  objc_msgSend(v2, "_pickerDidFinish");

}

uint64_t sub_10002EFD0()
{
  return 1;
}

void sub_10002EFD8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_100066DE0 + 8));

  swift_release(*(_QWORD *)(v0 + qword_100066DF0));
  swift_release(*(_QWORD *)(v0 + qword_100066DF8));
  swift_release(*(_QWORD *)(v0 + qword_100066E00));
  swift_release(*(_QWORD *)(v0 + qword_100066E08));
  swift_release(*(_QWORD *)(v0 + qword_100066E10));
  swift_release(*(_QWORD *)(v0 + qword_100066E18));
  swift_release(*(_QWORD *)(v0 + qword_100066E20));

}

id sub_10002F088()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10002F0BC(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_100066DE0 + 8));

  swift_release(*(_QWORD *)(a1 + qword_100066DF0));
  swift_release(*(_QWORD *)(a1 + qword_100066DF8));
  swift_release(*(_QWORD *)(a1 + qword_100066E00));
  swift_release(*(_QWORD *)(a1 + qword_100066E08));
  swift_release(*(_QWORD *)(a1 + qword_100066E10));
  swift_release(*(_QWORD *)(a1 + qword_100066E18));
  swift_release(*(_QWORD *)(a1 + qword_100066E20));

}

void sub_10002F178()
{
  _swift_stdlib_reportUnimplementedInitializer("ColorPickerUIService._UIColorPickerContentViewController", 56, "init(rootView:)", 15, 0);
  __break(1u);
}

void sub_10002F1A4()
{
  _swift_stdlib_reportUnimplementedInitializer("ColorPickerUIService._UIColorPickerContentViewController", 56, "init(coder:rootView:)", 21, 0);
  __break(1u);
}

uint64_t sub_10002F1D0()
{
  return type metadata accessor for _UIColorPickerContentViewController(0);
}

uint64_t sub_10002F1D8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046A58, (uint64_t)&unk_100046A80, a2);
}

uint64_t sub_10002F1EC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046A58, (uint64_t)&unk_100046A80, a2);
}

uint64_t sub_10002F210(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046A58, (uint64_t)&unk_100046A80);
}

uint64_t sub_10002F224(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046A58, (uint64_t)&unk_100046A80);
}

double sub_10002F248@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v6;
  double result;
  __int128 v8;
  _OWORD v9[2];
  char v10;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046CE0);
  v5 = swift_getKeyPath(&unk_100046D08);
  static Published.subscript.getter(v9, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  v6 = v10;
  result = *(double *)v9;
  v8 = v9[1];
  *(_OWORD *)a2 = v9[0];
  *(_OWORD *)(a2 + 16) = v8;
  *(_BYTE *)(a2 + 32) = v6;
  return result;
}

uint64_t sub_10002F2CC(__int128 *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v9 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  v4 = *((_BYTE *)a1 + 32);
  v5 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046CE0);
  v7 = swift_getKeyPath(&unk_100046D08);
  v10 = v9;
  v11 = v2;
  v12 = v3;
  v13 = v4;
  swift_retain(v5);
  return static Published.subscript.setter(&v10, v5, KeyPath, v7);
}

uint64_t sub_10002F35C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046C50);
  v5 = swift_getKeyPath(&unk_100046C78);
  static Published.subscript.getter(v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v8[1];
  *a2 = v8[0];
  a2[1] = v7;
  return result;
}

uint64_t sub_10002F3D8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046C50);
  v6 = swift_getKeyPath(&unk_100046C78);
  v8[0] = v3;
  v8[1] = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v4);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t sub_10002F458@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046AA0, (uint64_t)&unk_100046AC8, a2);
}

uint64_t sub_10002F46C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046AA0, (uint64_t)&unk_100046AC8);
}

uint64_t sub_10002F480@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046D28, (uint64_t)&unk_100046D50, a2);
}

uint64_t sub_10002F494(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046D28, (uint64_t)&unk_100046D50);
}

uint64_t sub_10002F4A8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046B78, (uint64_t)&unk_100046BA0, a2);
}

uint64_t sub_10002F4BC(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046B78, (uint64_t)&unk_100046BA0);
}

uint64_t sub_10002F4D0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046E00, (uint64_t)&unk_100046E28, a2);
}

uint64_t sub_10002F4E4(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046E00, (uint64_t)&unk_100046E28);
}

uint64_t sub_10002F4F8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046E48, (uint64_t)&unk_100046E70, a2);
}

uint64_t sub_10002F50C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046E48, (uint64_t)&unk_100046E70);
}

uint64_t sub_10002F520@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046F20, (uint64_t)&unk_100046F48, a2);
}

uint64_t sub_10002F534(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046F20, (uint64_t)&unk_100046F48);
}

uint64_t sub_10002F548@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046C08, (uint64_t)&unk_100046C30, a2);
}

uint64_t sub_10002F55C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046C08, (uint64_t)&unk_100046C30);
}

uint64_t sub_10002F570@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100046F68);
  v5 = swift_getKeyPath(&unk_100046F90);
  static Published.subscript.getter(a2, v3, KeyPath, v5);
  swift_release(KeyPath);
  return swift_release(v5);
}

uint64_t sub_10002F5D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t v14;

  v4 = sub_1000060E4(&qword_100066158);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v14 - v8;
  sub_10002FB9C(a1, (uint64_t)&v14 - v8);
  v10 = *a2;
  KeyPath = swift_getKeyPath(&unk_100046F68);
  v12 = swift_getKeyPath(&unk_100046F90);
  sub_10002FB9C((uint64_t)v9, (uint64_t)v7);
  swift_retain(v10);
  static Published.subscript.setter(v7, v10, KeyPath, v12);
  return sub_10002FBE4((uint64_t)v9);
}

void sub_10002F6C0()
{
  _BYTE *v0;
  _BYTE *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  v2 = &v0[qword_100066DE0];
  *v2 = 0x64657463656C6573;
  v2[1] = 0xEB00000000626154;
  v3 = qword_100066DE8;
  *(_QWORD *)&v1[v3] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FavoritesStore()), "init");
  v4 = qword_100066DF0;
  v5 = type metadata accessor for ColorPickerState(0);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  *(_QWORD *)&v1[v4] = sub_100021964((uint64_t)_swiftEmptyArrayStorage);
  *(_QWORD *)&v1[qword_100066DF8] = 0;
  *(_QWORD *)&v1[qword_100066E00] = 0;
  *(_QWORD *)&v1[qword_100066E08] = 0;
  *(_QWORD *)&v1[qword_100066E10] = 0;
  *(_QWORD *)&v1[qword_100066E18] = 0;
  *(_QWORD *)&v1[qword_100066E20] = 0;
  *(_QWORD *)&v1[qword_100066E28] = 0;
  v1[qword_100066E30] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100048550, "ColorPickerUIService/_UIColorPickerContentViewController.swift", 62, 2, 102, 0);
  __break(1u);
}

uint64_t sub_10002F808@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046AA0, (uint64_t)&unk_100046AC8, a2);
}

uint64_t sub_10002F82C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046AA0, (uint64_t)&unk_100046AC8);
}

uint64_t sub_10002F858()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10002F87C(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_10002CEF4(a1, a2, v2);
}

uint64_t sub_10002F884()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F8A8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_10002F8D4(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_10002CFD0(a1, v1);
}

void sub_10002F8DC(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_10002D108(a1, v1);
}

void sub_10002F8E4(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_10002D968(a1, v1);
}

void sub_10002F8EC(float64x2_t **a1)
{
  uint64_t v1;

  sub_10002DA24(a1, v1);
}

void sub_10002F8F4()
{
  uint64_t v0;

  sub_10002DAFC(v0);
}

uint64_t sub_10002F904()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F928(void *a1)
{
  uint64_t v1;

  return sub_10002D2C0(a1, *(void **)(v1 + 16));
}

uint64_t sub_10002F930(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002F940(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002F948()
{
  uint64_t v0;

  return sub_10002D6E0(*(void **)(v0 + 16));
}

uint64_t sub_10002F950()
{
  uint64_t v0;

  return sub_10002D8F4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10002F958@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046B78, (uint64_t)&unk_100046BA0, a2);
}

uint64_t sub_10002F97C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046B78, (uint64_t)&unk_100046BA0);
}

uint64_t sub_10002F9A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F9CC()
{
  uint64_t v0;

  return sub_10002D4DC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10002F9D4()
{
  uint64_t v0;

  return sub_10002D538(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10002F9F4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046C08, (uint64_t)&unk_100046C30, a2);
}

uint64_t sub_10002FA18(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046C08, (uint64_t)&unk_100046C30);
}

uint64_t sub_10002FA54@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046D28, (uint64_t)&unk_100046D50, a2);
}

uint64_t sub_10002FA78(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046D28, (uint64_t)&unk_100046D50);
}

uint64_t sub_10002FAAC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046E00, (uint64_t)&unk_100046E28, a2);
}

uint64_t sub_10002FAD0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046E00, (uint64_t)&unk_100046E28);
}

uint64_t sub_10002FAF4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046E48, (uint64_t)&unk_100046E70, a2);
}

uint64_t sub_10002FB18(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046E48, (uint64_t)&unk_100046E70);
}

uint64_t sub_10002FB4C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014328(a1, (uint64_t)&unk_100046F20, (uint64_t)&unk_100046F48, a2);
}

uint64_t sub_10002FB70(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000143B4(a1, a2, a3, a4, (uint64_t)&unk_100046F20, (uint64_t)&unk_100046F48);
}

uint64_t sub_10002FB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000060E4(&qword_100066158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002FBE4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000060E4(&qword_100066158);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10002FC6C()
{
  char *v0;
  char *v1;
  char **v2;
  id v3;
  _UNKNOWN **v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id *v25;
  const CAShapeLayerLineCap *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id *v33;
  const CAShapeLayerLineJoin *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  Class isa;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  double v66;
  uint64_t v67;

  v1 = v0;
  v2 = &off_100063000;
  v3 = objc_msgSend(v0, "layer");
  v4 = &_sSbN_ptr;
  v5 = objc_opt_self(CAShapeLayer);
  v6 = (void *)swift_dynamicCastObjCClassUnconditional(v3, v5, 0, 0, 0);
  v7 = OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath;
  v8 = *(void **)&v1[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  if (v8)
    v9 = objc_msgSend(v8, "CGPath");
  else
    v9 = 0;
  objc_msgSend(v6, "setPath:", v9);

  v10 = objc_msgSend(v1, "layer");
  v11 = objc_opt_self(CAShapeLayer);
  v12 = (void *)swift_dynamicCastObjCClassUnconditional(v10, v11, 0, 0, 0);
  v13 = *(void **)&v1[v7];
  if (v13)
    objc_msgSend(v13, "lineWidth");
  else
    v14 = 1.0;
  objc_msgSend(v12, "setLineWidth:", v14);

  v15 = objc_msgSend(v1, "layer");
  v16 = objc_opt_self(CAShapeLayer);
  v17 = (void *)swift_dynamicCastObjCClassUnconditional(v15, v16, 0, 0, 0);
  v18 = *(void **)&v1[v7];
  if (v18)
    objc_msgSend(v18, "miterLimit");
  else
    v19 = 10.0;
  objc_msgSend(v17, "setMiterLimit:", v19);

  v20 = objc_msgSend(v1, "layer");
  v21 = objc_opt_self(CAShapeLayer);
  v22 = (void *)swift_dynamicCastObjCClassUnconditional(v20, v21, 0, 0, 0);
  v23 = *(void **)&v1[v7];
  if (v23)
  {
    v24 = objc_msgSend(v23, "lineCapStyle");
    v25 = (id *)&kCALineCapSquare;
    v26 = &kCALineCapRound;
    if (v24 != 1)
      v26 = &kCALineCapButt;
    if (v24 != 2)
      v25 = (id *)v26;
  }
  else
  {
    v25 = (id *)&kCALineCapButt;
  }
  v27 = *v25;
  objc_msgSend(v22, "setLineCap:", v27);

  v28 = objc_msgSend(v1, "layer");
  v29 = objc_opt_self(CAShapeLayer);
  v30 = (void *)swift_dynamicCastObjCClassUnconditional(v28, v29, 0, 0, 0);
  v31 = *(void **)&v1[v7];
  if (v31)
  {
    v32 = objc_msgSend(v31, "lineJoinStyle");
    v33 = (id *)&kCALineJoinBevel;
    v34 = &kCALineJoinRound;
    if (v32 != 1)
      v34 = &kCALineJoinMiter;
    if (v32 != 2)
      v33 = (id *)v34;
  }
  else
  {
    v33 = (id *)&kCALineJoinMiter;
  }
  v35 = *v33;
  objc_msgSend(v30, "setLineJoin:", v35);

  v36 = objc_msgSend(v1, "layer");
  v37 = objc_opt_self(CAShapeLayer);
  v38 = (void *)swift_dynamicCastObjCClassUnconditional(v36, v37, 0, 0, 0);
  v39 = *(void **)&v1[v7];
  if (v39 && (objc_msgSend(v39, "usesEvenOddFillRule") & 1) != 0)
    v40 = (id *)&kCAFillRuleEvenOdd;
  else
    v40 = (id *)&kCAFillRuleNonZero;
  v41 = *v40;
  objc_msgSend(v38, "setFillRule:", v41);

  v42 = *(void **)&v1[v7];
  if (v42)
  {
    v67 = 0;
    v43 = v42;
    objc_msgSend(v43, "getLineDash:count:phase:", 0, &v67, 0);
    v44 = v67;
    if (v67 >= 1)
    {
      v66 = 0.0;
      v45 = static Array._allocateBufferUninitialized(minimumCapacity:)(v67, &type metadata for CGFloat);
      *(_QWORD *)(v45 + 16) = v44;
      bzero((void *)(v45 + 32), 8 * v44);
      objc_msgSend(v43, "getLineDash:count:phase:", v45 + 32, &v67, &v66);
      v46 = objc_msgSend(v1, "layer");
      v47 = objc_opt_self(CAShapeLayer);
      v48 = swift_dynamicCastObjCClassUnconditional(v46, v47, 0, 0, 0);
      v49 = (void *)v48;
      v50 = *(_QWORD *)(v45 + 16);
      if (v50)
      {
        v63 = (void *)v48;
        v64 = v46;
        swift_bridgeObjectRetain(v45);
        specialized ContiguousArray.reserveCapacity(_:)(v50);
        v51 = 0;
        do
        {
          v52 = v51 + 1;
          v53 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", *(double *)(v45 + 8 * v51 + 32));
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          v54 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v54);
          v55 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v53);
          specialized ContiguousArray._endMutation()(v55);
          v51 = v52;
        }
        while (v50 != v52);
        swift_bridgeObjectRelease_n(v45, 2);
        v4 = &_sSbN_ptr;
        v2 = &off_100063000;
        v49 = v63;
        v46 = v64;
      }
      else
      {
        swift_bridgeObjectRelease(v45);
      }
      sub_1000075F4(0, &qword_100066FC0, NSNumber_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      objc_msgSend(v49, "setLineDashPattern:", isa);

      v60 = objc_msgSend(v1, v2[275]);
      v61 = objc_opt_self(v4[119]);
      v62 = (void *)swift_dynamicCastObjCClassUnconditional(v60, v61, 0, 0, 0);
      objc_msgSend(v62, "setLineDashPhase:", v66);

    }
  }
  else
  {
    v56 = objc_msgSend(v1, "layer");
    v57 = objc_opt_self(CAShapeLayer);
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v56, v57, 0, 0, 0), "setLineDashPattern:", 0);

    v65 = objc_msgSend(v1, "layer");
    v58 = objc_opt_self(CAShapeLayer);
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v65, v58, 0, 0, 0), "setLineDashPhase:", 0.0);

  }
}

id sub_1000303F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShapeView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ShapeView()
{
  return objc_opt_self(_TtC20ColorPickerUIService9ShapeView);
}

id sub_100030450(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v9 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView;
  v10 = objc_allocWithZone((Class)UIView);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, "init");
  v12 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView;
  v13 = type metadata accessor for ShapeView();
  *(_QWORD *)&v11[v12] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v13)), "init");
  v14 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView;
  *(_QWORD *)&v11[v14] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  v17.receiver = v11;
  v17.super_class = (Class)type metadata accessor for RemoveColorCell();
  v15 = objc_msgSendSuper2(&v17, "initWithFrame:", a1, a2, a3, a4);
  sub_100030688();

  return v15;
}

id sub_100030574(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  v3 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView;
  v4 = objc_allocWithZone((Class)UIView);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView;
  v7 = type metadata accessor for ShapeView();
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)), "init");
  v8 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView;
  *(_QWORD *)&v5[v8] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for RemoveColorCell();
  v9 = objc_msgSendSuper2(&v13, "initWithCoder:", a1);
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    sub_100030688();

  }
  return v10;
}

void sub_100030688()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t ObjCClassFromMetadata;
  id v21;
  NSString v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v1 = objc_msgSend(v0, "contentView");
  v2 = (void *)objc_opt_self(UIColor);
  v3 = objc_msgSend(v2, "whiteColor");
  objc_msgSend(v1, "setBackgroundColor:", v3);

  v4 = objc_msgSend(v0, "contentView");
  v5 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView];
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_msgSend(v0, "contentView");
  v7 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView];
  objc_msgSend(v6, "setMaskView:", v7);

  v8 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView];
  v9 = objc_msgSend(v2, "systemRedColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v10 = objc_msgSend(v8, "layer");
  objc_msgSend(v10, "setCornerRadius:", 1.5);

  v11 = objc_msgSend(v8, "layer");
  objc_msgSend(v11, "setCornerCurve:", kCACornerCurveContinuous);

  objc_msgSend(v8, "setClipsToBounds:", 1);
  v12 = objc_msgSend(v0, "contentView");
  objc_msgSend(v12, "addSubview:", v8);

  v13 = objc_msgSend(v2, "systemGray5Color");
  objc_msgSend(v5, "setBackgroundColor:", v13);

  v14 = objc_msgSend(v2, "blackColor");
  v15 = objc_msgSend(v7, "layer");
  v16 = objc_opt_self(CAShapeLayer);
  v17 = (void *)swift_dynamicCastObjCClassUnconditional(v15, v16, 0, 0, 0);
  if (v14)
    v18 = objc_msgSend(v14, "CGColor");
  else
    v18 = 0;
  objc_msgSend(v17, "setFillColor:", v18);

  objc_msgSend(v0, "setIsAccessibilityElement:", 1);
  v19 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v19);
  v21 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v22 = String._bridgeToObjectiveC()();
  v23 = String._bridgeToObjectiveC()();
  v24 = objc_msgSend(v21, "localizedStringForKey:value:table:", v22, 0, v23);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v26 = v25;

  v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v26);
  objc_msgSend(v0, "setAccessibilityLabel:", v27);

}

void sub_100030AFC()
{
  char *v0;
  char *v1;
  void *v2;
  char *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double x;
  double y;
  double width;
  double height;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  unsigned int v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  CGAffineTransform v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v1 = v0;
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for RemoveColorCell();
  objc_msgSendSuper2(&v33, "layoutSubviews");
  v2 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView];
  objc_msgSend(v1, "bounds");
  objc_msgSend(v2, "setFrame:");
  v3 = *(char **)&v1[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView];
  objc_msgSend(v1, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v1, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_opt_self(UIBezierPath);
  v13 = objc_msgSend(v12, "bezierPathWithOvalInRect:", v5, v7, v9, v11);
  if (objc_msgSend(v1, "isSelected"))
  {
    objc_msgSend(v1, "bounds");
    v35 = CGRectInset(v34, 3.0, 3.0);
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
    objc_msgSend(v1, "bounds");
    v37 = CGRectInset(v36, 6.0, 6.0);
    v18 = v37.origin.x;
    v19 = v37.origin.y;
    v20 = v37.size.width;
    v21 = v37.size.height;
    v22 = objc_msgSend(v12, "bezierPathWithOvalInRect:", x, y, width, height);
    v23 = objc_msgSend(v22, "bezierPathByReversingPath");

    objc_msgSend(v13, "appendPath:", v23);
    v24 = objc_msgSend(v12, "bezierPathWithOvalInRect:", v18, v19, v20, v21);
    objc_msgSend(v13, "appendPath:", v24);

  }
  v25 = *(void **)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(_QWORD *)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v13;
  v26 = v13;

  sub_10002FC6C();
  v27 = objc_msgSend(v1, "isSelected");
  objc_msgSend(v1, "bounds");
  v28 = CGRectGetHeight(v38);
  v29 = -8.0;
  if (v27)
    v29 = -18.0;
  v30 = *(void **)&v1[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView];
  *(_OWORD *)&v32.a = 0x3FF0000000000000uLL;
  v31 = v28 + v29;
  v32.c = 0.0;
  v32.d = 1.0;
  *(_OWORD *)&v32.tx = 0uLL;
  objc_msgSend(v30, "setTransform:", &v32);
  objc_msgSend(v30, "setBounds:", 0.0, 0.0, 3.0, v31);
  objc_msgSend(v1, "center");
  objc_msgSend(v30, "setCenter:");
  CGAffineTransformMakeRotation(&v32, 0.785398163);
  objc_msgSend(v30, "setTransform:", &v32);

}

UIAccessibilityTraits sub_100030E80()
{
  void *v0;
  UIAccessibilityTraits result;

  if (!objc_msgSend(v0, "isSelected"))
    return UIAccessibilityTraitButton;
  result = UIAccessibilityTraitSelected;
  if (!UIAccessibilityTraitSelected)
  {
    if (!UIAccessibilityTraitButton)
      return 0;
    return UIAccessibilityTraitButton | UIAccessibilityTraitSelected;
  }
  if ((UIAccessibilityTraitButton & ~UIAccessibilityTraitSelected) != 0)
    return UIAccessibilityTraitButton | UIAccessibilityTraitSelected;
  return result;
}

id sub_100030EFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoveColorCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoveColorCell()
{
  return objc_opt_self(_TtC20ColorPickerUIService15RemoveColorCell);
}

ValueMetadata *type metadata accessor for ColorLens()
{
  return &type metadata for ColorLens;
}

uint64_t sub_100030FA4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100052058, 1);
}

void sub_100030FB4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  char v20;
  double v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v3 = type metadata accessor for Color.RGBColorSpace(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static Alignment.center.getter(v5);
  v32 = v9;
  v33 = v8;
  sub_100031150(v1, (uint64_t)&v35);
  v10 = v36;
  v11 = v37;
  v12 = v38;
  v30 = v39;
  v31 = v35;
  v13 = v40;
  v29 = v41;
  v14 = v42;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for Color.RGBColorSpace.sRGBLinear(_:), v3);
  v15 = Color.init(_:white:opacity:)(v7, 0.0, 0.33);
  v16 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if (v17 == (id)6)
    v19 = 4.0;
  else
    v19 = 2.0;
  v34 = v14;
  v20 = static Edge.Set.all.getter(v18);
  v21 = EdgeInsets.init(_all:)(v19);
  v22 = v34;
  v23 = v32;
  *(_QWORD *)a1 = v33;
  *(_QWORD *)(a1 + 8) = v23;
  *(_OWORD *)(a1 + 16) = v31;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  *(_OWORD *)(a1 + 56) = v30;
  v24 = v29;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v24;
  *(_BYTE *)(a1 + 88) = v22;
  *(_QWORD *)(a1 + 96) = v15;
  *(_QWORD *)(a1 + 104) = 0x4000000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 128) = v20;
  *(double *)(a1 + 136) = v21;
  *(_QWORD *)(a1 + 144) = v25;
  *(_QWORD *)(a1 + 152) = v26;
  *(_QWORD *)(a1 + 160) = v27;
  *(_WORD *)(a1 + 168) = 0;
}

uint64_t sub_100031150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t KeyPath;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  char v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v4 = type metadata accessor for Color.RGBColorSpace(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
  v9 = Color.init(uiColor:)(v8);
  KeyPath = swift_getKeyPath(&unk_100047050);
  v11 = *(double *)a1;
  v12 = *(double *)(a1 + 8);
  v13 = *(double *)(a1 + 16);
  v14 = *(double *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    v15 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
  else
    v15 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v15, v4);
  v16 = Color.init(_:red:green:blue:opacity:)(v7, v11, v12, v13, v14);
  v17 = swift_getKeyPath(&unk_100047050);
  v18 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if (v19 == (id)6)
    v20 = 2.0;
  else
    v20 = 3.0;
  v21 = static Edge.Set.all.getter();
  v22 = EdgeInsets.init(_all:)(v20);
  *(_QWORD *)a2 = KeyPath;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 24) = v16;
  *(_BYTE *)(a2 + 32) = v21;
  *(double *)(a2 + 40) = v22;
  *(_QWORD *)(a2 + 48) = v23;
  *(_QWORD *)(a2 + 56) = v24;
  *(_QWORD *)(a2 + 64) = v25;
  *(_BYTE *)(a2 + 72) = 0;
  v26 = swift_retain(KeyPath);
  return swift_release(v26);
}

void sub_1000312EC(uint64_t a1@<X8>)
{
  sub_100030FB4(a1);
}

uint64_t sub_100031324@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10003134C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100031374(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10003139C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

unint64_t sub_1000313C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067010;
  if (!qword_100067010)
  {
    v1 = sub_100009E2C(&qword_100067018);
    sub_10000C94C(&qword_100067020, &qword_100067028, (void (*)(void))sub_100031454);
    sub_10001640C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067010);
  }
  return result;
}

uint64_t sub_100031454()
{
  return sub_10000C94C(&qword_100067030, &qword_100067038, (void (*)(void))sub_100031478);
}

unint64_t sub_100031478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067040;
  if (!qword_100067040)
  {
    v1 = sub_100009E2C(&qword_100067048);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100067040);
  }
  return result;
}

uint64_t destroy for ColorWell(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t initializeWithCopy for ColorWell(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for ColorWell(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = *((_OWORD *)a2 + 1);
  v9 = *((_OWORD *)a2 + 2);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  *((_OWORD *)a1 + 1) = v8;
  *((_OWORD *)a1 + 2) = v9;
  return a1;
}

uint64_t assignWithTake for ColorWell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  swift_release(*(_QWORD *)a1);
  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorWell(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorWell(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorWell()
{
  return &type metadata for ColorWell;
}

uint64_t sub_100031690(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000520C0, 1);
}

uint64_t sub_1000316A0(uint64_t a1)
{
  unint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  NSString v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD v28[3];
  _OWORD v29[2];
  char v30;
  _OWORD v31[2];
  char v32;

  sub_100009A88(a1, (uint64_t)v29, &qword_100065BC8);
  if (v30 == 2)
  {
    v1 = sub_1000152E4();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
    v3 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
    v4 = String._bridgeToObjectiveC()();
    v5 = String._bridgeToObjectiveC()();
    v6 = objc_msgSend(v3, "localizedStringForKey:value:table:", v4, 0, v5);

    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v9 = v8;

    *(_QWORD *)&v31[0] = v7;
    *((_QWORD *)&v31[0] + 1) = v9;
    v10 = sub_10000CC44();
    v11 = v31;
  }
  else
  {
    v31[0] = v29[0];
    v31[1] = v29[1];
    v32 = v30;
    sub_1000176F4();
    v13 = v12;
    v14 = objc_msgSend(v12, "_accessibilityNameWithLuma");

    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v17 = v16;

    v28[0] = v15;
    v28[1] = v17;
    v10 = sub_10000CC44();
    v11 = v28;
  }
  v18 = Text.init<A>(_:)(v11, &type metadata for String, v10);
  v20 = v19;
  v22 = v21;
  v24 = v23 & 1;
  v25 = sub_1000060E4(&qword_100067058);
  v26 = sub_100032034();
  View.accessibility(value:)(v18, v20, v24, v22, v25, v26);
  sub_10000CC88(v18, v20, v24);
  return swift_bridgeObjectRelease(v22);
}

uint64_t sub_1000318A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _OWORD v13[3];
  char v14;
  _BYTE v15[40];

  v1 = sub_1000060E4(&qword_100067050);
  __chkstk_darwin(v1);
  v3 = (_QWORD *)((char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_1000060E4(&qword_100067058);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v3 = static Alignment.center.getter(v5);
  v3[1] = v8;
  v9 = sub_1000060E4(&qword_100067060);
  sub_1000319F4((__int128 *)v0, (uint64_t)v3 + *(int *)(v9 + 44));
  sub_100009C1C((uint64_t)v3, (uint64_t)v7, &qword_100067050);
  sub_100009CF0((uint64_t)v3, &qword_100067050);
  v10 = *(_OWORD *)(v0 + 16);
  v13[0] = *(_OWORD *)v0;
  v13[1] = v10;
  v13[2] = *(_OWORD *)(v0 + 32);
  v14 = *(_BYTE *)(v0 + 48);
  v11 = sub_1000060E4(&qword_100067068);
  Binding.wrappedValue.getter(v11);
  sub_100009A88((uint64_t)v15, (uint64_t)v13, &qword_100065BC8);
  sub_1000316A0((uint64_t)v13);
  return sub_100009CF0((uint64_t)v7, &qword_100067058);
}

uint64_t sub_1000319F4@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t KeyPath;
  uint64_t *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  char v77;
  double v78;
  double v79;
  double v80;
  double v81;
  char v82;

  v73 = a2;
  v67 = type metadata accessor for Color.RGBColorSpace(0);
  v3 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_1000060E4(&qword_100067080);
  __chkstk_darwin(v71);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_1000060E4(&qword_100067088);
  __chkstk_darwin(v72);
  v70 = (uint64_t *)((char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v9);
  v11 = (_OWORD *)((char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_1000060E4(&qword_100067090);
  __chkstk_darwin(v12);
  v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_1000060E4(&qword_100067098);
  __chkstk_darwin(v66);
  v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1000060E4(&qword_1000670A0);
  v17 = __chkstk_darwin(v68);
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v69 = (uint64_t)&v66 - v20;
  v21 = a1[1];
  v74 = *a1;
  v75 = v21;
  v76 = a1[2];
  v77 = *((_BYTE *)a1 + 48);
  v22 = sub_1000060E4(&qword_100067068);
  v23 = Binding.wrappedValue.getter(v22);
  v24 = v82;
  if (v82 == 2)
  {
    v25 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray5Color");
    v26 = Color.init(uiColor:)(v25);
    v27 = (char *)v11 + *(int *)(v9 + 20);
    v28 = enum case for RoundedCornerStyle.continuous(_:);
    v29 = type metadata accessor for RoundedCornerStyle(0);
    v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v27, v28, v29);
    __asm { FMOV            V0.2D, #1.5 }
    *v11 = _Q0;
    v36 = static Alignment.center.getter(v30);
    _FrameLayout.init(width:height:alignment:)(&v74, 0x4008000000000000, 0, 0, 1, v36, v37);
    sub_100020BDC((uint64_t)v11, (uint64_t)v14);
    v38 = &v14[*(int *)(v12 + 36)];
    v39 = v75;
    *(_OWORD *)v38 = v74;
    *((_OWORD *)v38 + 1) = v39;
    *((_OWORD *)v38 + 2) = v76;
    v40 = sub_10001DB34((uint64_t)v11);
    v41 = static Color.red.getter(v40);
    KeyPath = swift_getKeyPath(&unk_1000470E0);
    sub_100009C1C((uint64_t)v14, (uint64_t)v16, &qword_100067090);
    v43 = (uint64_t *)&v16[*(int *)(v66 + 36)];
    *v43 = KeyPath;
    v43[1] = v41;
    v44 = sub_100009CF0((uint64_t)v14, &qword_100067090);
    v45 = static UnitPoint.center.getter(v44);
    v47 = v46;
    sub_100009C1C((uint64_t)v16, (uint64_t)v19, &qword_100067098);
    v48 = (double *)&v19[*(int *)(v68 + 36)];
    *v48 = 0.785398163;
    v48[1] = v45;
    *((_QWORD *)v48 + 2) = v47;
    sub_100009CF0((uint64_t)v16, &qword_100067098);
    v49 = v69;
    sub_100009A88((uint64_t)v19, v69, &qword_1000670A0);
    sub_100009C1C(v49, (uint64_t)v19, &qword_1000670A0);
    v50 = (uint64_t)v70;
    *v70 = v26;
    v51 = sub_1000060E4(&qword_1000670A8);
    sub_100009C1C((uint64_t)v19, v50 + *(int *)(v51 + 48), &qword_1000670A0);
    swift_retain_n(v26, 2);
    sub_100009CF0((uint64_t)v19, &qword_1000670A0);
    swift_release(v26);
    sub_100009C1C(v50, (uint64_t)v7, &qword_100067088);
    swift_storeEnumTagMultiPayload(v7, v71, 1);
    v52 = sub_1000060E4(&qword_1000670B0);
    v53 = sub_100009FA0(&qword_1000670B8, &qword_1000670B0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v54 = sub_100009FA0(&qword_1000670C0, &qword_100067088, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(v7, v52, v72, v53, v54);
    sub_100009CF0(v50, &qword_100067088);
    sub_100009CF0(v49, &qword_1000670A0);
  }
  else
  {
    v55 = v78;
    v56 = v79;
    v57 = v80;
    v58 = v81;
    v59 = static Color.white.getter(v23);
    v60 = static Color.black.getter();
    v61 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
    if ((v24 & 1) != 0)
      v61 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *v61, v67);
    v26 = Color.init(_:red:green:blue:opacity:)(v5, v55, v56, v57, v58);
    swift_retain_n(v59, 2);
    swift_retain(v60);
    swift_retain(v26);
    swift_release(v59);
    *(_QWORD *)v7 = v59;
    *((_QWORD *)v7 + 1) = v60;
    *((_WORD *)v7 + 8) = 256;
    *((_QWORD *)v7 + 3) = v26;
    swift_storeEnumTagMultiPayload(v7, v71, 0);
    v62 = sub_1000060E4(&qword_1000670B0);
    v63 = sub_100009FA0(&qword_1000670B8, &qword_1000670B0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v64 = sub_100009FA0(&qword_1000670C0, &qword_100067088, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(v7, v62, v72, v63, v64);
    swift_release(v59);
    swift_release(v60);
  }
  return swift_release(v26);
}

uint64_t sub_100031FF4()
{
  return sub_1000318A8();
}

unint64_t sub_100032034()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067070;
  if (!qword_100067070)
  {
    v1 = sub_100009E2C(&qword_100067058);
    sub_100009FA0(&qword_100067078, &qword_100067050, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067070);
  }
  return result;
}

double sub_1000320B8@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  double MinX;
  double MaxY;
  double MaxX;
  double MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  double result;
  __int128 v20;
  _OWORD v21[2];
  char v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  Path.init()(v21);
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  MaxY = CGRectGetMaxY(v24);
  Path.move(to:)(MinX, MaxY);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = a4;
  v26.size.height = a5;
  MinY = CGRectGetMinY(v26);
  Path.addLine(to:)(MaxX, MinY);
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  v14 = CGRectGetMinX(v27);
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  v15 = CGRectGetMinY(v28);
  Path.addLine(to:)(v14, v15);
  v29.origin.x = a2;
  v29.origin.y = a3;
  v29.size.width = a4;
  v29.size.height = a5;
  v16 = CGRectGetMinX(v29);
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  v17 = CGRectGetMaxY(v30);
  Path.addLine(to:)(v16, v17);
  Path.closeSubpath()();
  v18 = v22;
  result = *(double *)v21;
  v20 = v21[1];
  *(_OWORD *)a1 = v21[0];
  *(_OWORD *)(a1 + 16) = v20;
  *(_BYTE *)(a1 + 32) = v18;
  return result;
}

uint64_t sub_100032214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100032478();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100032264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100032478();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000322B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100032478();
  return Shape.body.getter(a1, v2);
}

ValueMetadata *type metadata accessor for Triangle()
{
  return &type metadata for Triangle;
}

unint64_t sub_100032308()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000670C8;
  if (!qword_1000670C8)
  {
    v1 = sub_100009E2C(&qword_1000670D0);
    sub_100032034();
    sub_100032374();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000670C8);
  }
  return result;
}

unint64_t sub_100032374()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000657D0;
  if (!qword_1000657D0)
  {
    v1 = type metadata accessor for AccessibilityAttachmentModifier(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AccessibilityAttachmentModifier, v1);
    atomic_store(result, (unint64_t *)&qword_1000657D0);
  }
  return result;
}

uint64_t sub_1000323BC()
{
  return sub_100009FA0(&qword_1000670D8, &qword_1000670E0, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
}

unint64_t sub_1000323EC()
{
  unint64_t result;

  result = qword_1000670E8;
  if (!qword_1000670E8)
  {
    result = swift_getWitnessTable(&unk_10004716C, &type metadata for Triangle);
    atomic_store(result, (unint64_t *)&qword_1000670E8);
  }
  return result;
}

unint64_t sub_100032434()
{
  unint64_t result;

  result = qword_1000670F0;
  if (!qword_1000670F0)
  {
    result = swift_getWitnessTable(&unk_10004711C, &type metadata for Triangle);
    atomic_store(result, (unint64_t *)&qword_1000670F0);
  }
  return result;
}

unint64_t sub_100032478()
{
  unint64_t result;

  result = qword_1000670F8;
  if (!qword_1000670F8)
  {
    result = swift_getWitnessTable(&unk_1000471BC, &type metadata for Triangle);
    atomic_store(result, (unint64_t *)&qword_1000670F8);
  }
  return result;
}

id sub_1000324BC(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *ObjCClassFromMetadata;
  uint64_t v17;
  id v18;
  objc_super v20;

  v9 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color;
  v10 = (void *)objc_opt_self(UIColor);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, "blackColor");
  v12 = &v11[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction] = 0;
  v13 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView;
  *(_QWORD *)&v11[v13] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v14 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView;
  v15 = type metadata accessor for ShapeView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v15);
  *(_QWORD *)&v11[v14] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");
  v17 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView;
  *(_QWORD *)&v11[v17] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");

  v20.receiver = v11;
  v20.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  v18 = objc_msgSendSuper2(&v20, "initWithFrame:", a1, a2, a3, a4);
  sub_1000327F0();

  return v18;
}

id sub_100032624(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *ObjCClassFromMetadata;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v3 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color;
  v4 = (void *)objc_opt_self(UIColor);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "blackColor");
  v6 = &v5[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction] = 0;
  v7 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView;
  *(_QWORD *)&v5[v7] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v8 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView;
  v9 = type metadata accessor for ShapeView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v9);
  *(_QWORD *)&v5[v8] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");
  v11 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView;
  *(_QWORD *)&v5[v11] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");

  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  v12 = objc_msgSendSuper2(&v16, "initWithCoder:", a1);
  v13 = v12;
  if (v12)
  {
    v14 = v12;
    sub_1000327F0();

  }
  return v13;
}

id sub_10003277C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UIEditMenuInteraction), "initWithDelegate:", v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1000327F0()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v1 = objc_msgSend(v0, "contentView");
  v2 = (void *)objc_opt_self(UIColor);
  v3 = objc_msgSend(v2, "whiteColor");
  objc_msgSend(v1, "setBackgroundColor:", v3);

  v4 = objc_msgSend(v0, "contentView");
  v5 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView];
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_msgSend(v0, "contentView");
  v7 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView];
  objc_msgSend(v6, "addSubview:", v7);

  v8 = objc_msgSend(v0, "contentView");
  v9 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView];
  objc_msgSend(v8, "setMaskView:", v9);

  objc_msgSend(v7, "setBackgroundColor:", *(_QWORD *)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color]);
  v10 = objc_msgSend(v2, "blackColor");
  v11 = objc_msgSend(v5, "layer");
  v12 = objc_opt_self(CAShapeLayer);
  v13 = (void *)swift_dynamicCastObjCClassUnconditional(v11, v12, 0, 0, 0);
  if (v10)
    v14 = objc_msgSend(v10, "CGColor");
  else
    v14 = 0;
  objc_msgSend(v13, "setFillColor:", v14);

  v15 = objc_msgSend(v2, "blackColor");
  v16 = objc_msgSend(v9, "layer");
  v17 = objc_opt_self(CAShapeLayer);
  v18 = (void *)swift_dynamicCastObjCClassUnconditional(v16, v17, 0, 0, 0);
  if (v15)
    v19 = objc_msgSend(v15, "CGColor");
  else
    v19 = 0;
  objc_msgSend(v18, "setFillColor:", v19);

  v20 = sub_10003277C();
  objc_msgSend(v0, "addInteraction:", v20);

}

void sub_100032B60()
{
  char *v0;
  char *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char *v10;
  char *v11;
  id v12;
  double MinX;
  double v14;
  double v15;
  double MaxX;
  double v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  double x;
  double y;
  double width;
  double height;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v1 = v0;
  v35.receiver = v0;
  v35.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  objc_msgSendSuper2(&v35, "layoutSubviews");
  objc_msgSend(v0, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView], "setFrame:");
  v10 = *(char **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
  v11 = *(char **)&v1[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView];
  objc_msgSend(v11, "setFrame:", v3, v5, v7, v9);
  v12 = objc_msgSend(objc_allocWithZone((Class)UIBezierPath), "init");
  v36.origin.x = v3;
  v36.origin.y = v5;
  v36.size.width = v7;
  v36.size.height = v9;
  MinX = CGRectGetMinX(v36);
  v37.origin.x = v3;
  v37.origin.y = v5;
  v37.size.width = v7;
  v37.size.height = v9;
  objc_msgSend(v12, "moveToPoint:", MinX, CGRectGetMinY(v37));
  v38.origin.x = v3;
  v38.origin.y = v5;
  v38.size.width = v7;
  v38.size.height = v9;
  v14 = CGRectGetMinX(v38);
  v39.origin.x = v3;
  v39.origin.y = v5;
  v39.size.width = v7;
  v39.size.height = v9;
  objc_msgSend(v12, "addLineToPoint:", v14, CGRectGetMinY(v39));
  v40.origin.x = v3;
  v40.origin.y = v5;
  v40.size.width = v7;
  v40.size.height = v9;
  v15 = CGRectGetMinX(v40);
  v41.origin.x = v3;
  v41.origin.y = v5;
  v41.size.width = v7;
  v41.size.height = v9;
  objc_msgSend(v12, "addLineToPoint:", v15, CGRectGetMaxY(v41));
  v42.origin.x = v3;
  v42.origin.y = v5;
  v42.size.width = v7;
  v42.size.height = v9;
  MaxX = CGRectGetMaxX(v42);
  v43.origin.x = v3;
  v43.origin.y = v5;
  v43.size.width = v7;
  v43.size.height = v9;
  objc_msgSend(v12, "addLineToPoint:", MaxX, CGRectGetMinY(v43));
  v44.origin.x = v3;
  v44.origin.y = v5;
  v44.size.width = v7;
  v44.size.height = v9;
  v17 = CGRectGetMinX(v44);
  v45.origin.x = v3;
  v45.origin.y = v5;
  v45.size.width = v7;
  v45.size.height = v9;
  objc_msgSend(v12, "addLineToPoint:", v17, CGRectGetMinY(v45));
  objc_msgSend(v12, "closePath");
  v18 = *(void **)&v10[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(_QWORD *)&v10[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v12;
  v19 = v12;

  sub_10002FC6C();
  v20 = (void *)objc_opt_self(UIBezierPath);
  v21 = objc_msgSend(v20, "bezierPathWithOvalInRect:", v3, v5, v7, v9);
  if (objc_msgSend(v1, "isSelected"))
  {
    v46.origin.x = v3;
    v46.origin.y = v5;
    v46.size.width = v7;
    v46.size.height = v9;
    v47 = CGRectInset(v46, 3.0, 3.0);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    v47.origin.x = v3;
    v47.origin.y = v5;
    v47.size.width = v7;
    v47.size.height = v9;
    v48 = CGRectInset(v47, 6.0, 6.0);
    v26 = v48.origin.x;
    v27 = v48.origin.y;
    v28 = v48.size.width;
    v29 = v48.size.height;
    v30 = objc_msgSend(v20, "bezierPathWithOvalInRect:", x, y, width, height);
    v31 = objc_msgSend(v30, "bezierPathByReversingPath");

    objc_msgSend(v21, "appendPath:", v31);
    v32 = objc_msgSend(v20, "bezierPathWithOvalInRect:", v26, v27, v28, v29);
    objc_msgSend(v21, "appendPath:", v32);

  }
  v33 = *(void **)&v11[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(_QWORD *)&v11[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v21;
  v34 = v21;

  sub_10002FC6C();
}

id sub_100033208()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FavoriteColorWellCell()
{
  return objc_opt_self(_TtC20ColorPickerUIService21FavoriteColorWellCell);
}

uint64_t sub_1000332D4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000060E4(&qword_1000671B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100033314(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100033324()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033348()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100033368()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SpectrumView.Coordinator()
{
  return objc_opt_self(_TtCV20ColorPickerUIService12SpectrumView11Coordinator);
}

ValueMetadata *type metadata accessor for SpectrumView()
{
  return &type metadata for SpectrumView;
}

uint64_t sub_1000333C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for SpectrumView.Coordinator();
  result = swift_allocObject(v2, 24, 7);
  *(_QWORD *)(result + 16) = 0;
  *a1 = result;
  return result;
}

uint64_t sub_1000333F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000334BC();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100033448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000334BC();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100033498(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000334BC();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_1000334BC()
{
  unint64_t result;

  result = qword_100067278;
  if (!qword_100067278)
  {
    result = swift_getWitnessTable(&unk_100047264, &type metadata for SpectrumView);
    atomic_store(result, (unint64_t *)&qword_100067278);
  }
  return result;
}

id sub_100033500()
{
  id v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v5;

  v0 = objc_msgSend(objc_allocWithZone((Class)MTKView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, "setOpaque:", 1);
  objc_msgSend(v0, "setPaused:", 1);
  objc_msgSend(v0, "setEnableSetNeedsDisplay:", 1);
  sub_1000060E4(&qword_100067280);
  UIViewRepresentableContext.coordinator.getter(&v5);
  v1 = v5;
  v2 = objc_msgSend(objc_allocWithZone((Class)SpectrumRenderer), "initWithMetal:", v0);
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  swift_release(v1);

  return v0;
}

uint64_t sub_1000335DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain(v5);
  }
  else
  {
    v8 = a2[1];
    *(_QWORD *)(a1 + 8) = v8;
    v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_OWORD *)(a1 + 32) = v9;
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v10 = *(int *)(a3 + 20);
    v11 = a1 + v10;
    v12 = (uint64_t)a2 + v10;
    swift_retain(v5);
    swift_retain(v8);
    v13 = sub_1000060E4(&qword_100067288);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = *(int *)(a3 + 24);
    v15 = (uint64_t *)(a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
  }
  return a1;
}

uint64_t sub_100033710(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  swift_release(*a1);
  swift_release(a1[1]);
  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_1000060E4(&qword_100067288);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 24));
  v7 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v6, v7) != 1)
    return swift_release(*v6);
  v8 = type metadata accessor for DynamicTypeSize(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
}

uint64_t sub_1000337C4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *a2;
  v7 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v7;
  v8 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = (uint64_t)a2 + v9;
  swift_retain(v6);
  swift_retain(v7);
  v12 = sub_1000060E4(&qword_100067288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  v14 = (uint64_t *)(a1 + v13);
  v15 = (uint64_t *)((char *)a2 + v13);
  v16 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
  {
    v17 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v14, v15, v17);
    v18 = 1;
  }
  else
  {
    v19 = *v15;
    *v14 = *v15;
    swift_retain(v19);
    v18 = 0;
  }
  swift_storeEnumTagMultiPayload(v14, v16, v18);
  return a1;
}

uint64_t *sub_1000338C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  v8 = a2[1];
  v9 = a1[1];
  a1[1] = v8;
  swift_retain(v8);
  swift_release(v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  v10 = *(int *)(a3 + 20);
  v11 = (uint64_t)a1 + v10;
  v12 = (uint64_t)a2 + v10;
  v13 = sub_1000060E4(&qword_100067288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  if (a1 != a2)
  {
    v14 = *(int *)(a3 + 24);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    sub_100009CF0((uint64_t)a1 + v14, &qword_100065570);
    v17 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = 1;
    }
    else
    {
      v20 = *v16;
      *v15 = *v16;
      swift_retain(v20);
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v15, v17, v19);
  }
  return a1;
}

uint64_t sub_100033A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1000060E4(&qword_100067288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
  {
    v15 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload(v12, v14, 1);
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t *sub_100033B08(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  v7 = a1[1];
  a1[1] = a2[1];
  swift_release(v7);
  v8 = *((_OWORD *)a2 + 2);
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)a1 + 2) = v8;
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  v9 = *(int *)(a3 + 20);
  v10 = (uint64_t)a1 + v9;
  v11 = (uint64_t)a2 + v9;
  v12 = sub_1000060E4(&qword_100067288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  if (a1 != a2)
  {
    v13 = *(int *)(a3 + 24);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    sub_100009CF0((uint64_t)a1 + v13, &qword_100065570);
    v16 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
    {
      v17 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload(v14, v16, 1);
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100033C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100033C3C);
}

uint64_t sub_100033C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000060E4(&qword_100067288);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = sub_1000060E4(&qword_100065578);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_100033CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100033CF0);
}

uint64_t sub_100033CF0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_1000060E4(&qword_100067288);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_1000060E4(&qword_100065578);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for ColorSpaceButton(uint64_t a1)
{
  uint64_t result;

  result = qword_1000672E8;
  if (!qword_1000672E8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ColorSpaceButton);
  return result;
}

void sub_100033DD0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  v6[0] = "1";
  sub_100033E60(319);
  if (v3 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000802C(319);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_100033E60(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000672F8)
  {
    v2 = sub_100009960();
    v3 = type metadata accessor for ScaledMetric(a1, &type metadata for CGFloat, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000672F8);
  }
}

uint64_t sub_100033EB8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005220C, 1);
}

uint64_t sub_100033EC8@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t KeyPath;
  char *v26;
  uint64_t (**v27)();
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[16];
  uint64_t v38;
  _BYTE v39[16];
  uint64_t v40;
  _OWORD v41[7];

  v36 = a1;
  v35 = sub_1000060E4(&qword_100067330);
  v2 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1000060E4(&qword_100067338);
  __chkstk_darwin(v32);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1000060E4(&qword_100067340);
  __chkstk_darwin(v34);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_1000060E4(&qword_100067348);
  __chkstk_darwin(v33);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v1;
  v38 = v1;
  v11 = sub_1000060E4(&qword_100067350);
  v12 = sub_1000060E4(&qword_100067358);
  v13 = sub_100034D0C();
  v14 = sub_100009FA0(&qword_100067388, &qword_100067358, (uint64_t)&protocol conformance descriptor for Picker<A, B, C>);
  Menu.init(content:label:)(sub_100034CFC, v39, sub_100034D04, v37, v11, v12, v13, v14);
  type metadata accessor for ColorSpaceButton(0);
  v15 = sub_1000060E4(&qword_100067288);
  v16 = ScaledMetric.wrappedValue.getter(v41, v15);
  v17 = *(_QWORD *)&v41[0];
  v18 = static Alignment.center.getter(v16);
  v30 = 1;
  v29 = 1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v41, 0, 1, 0, 1, 0, 1, v17, 0, 0, v29, 0, v30, v18, v19);
  v20 = v35;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v4, v35);
  v21 = &v6[*(int *)(v32 + 36)];
  v22 = v41[5];
  *((_OWORD *)v21 + 4) = v41[4];
  *((_OWORD *)v21 + 5) = v22;
  *((_OWORD *)v21 + 6) = v41[6];
  v23 = v41[1];
  *(_OWORD *)v21 = v41[0];
  *((_OWORD *)v21 + 1) = v23;
  v24 = v41[3];
  *((_OWORD *)v21 + 2) = v41[2];
  *((_OWORD *)v21 + 3) = v24;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
  KeyPath = swift_getKeyPath(&unk_1000473D0);
  sub_100009C1C((uint64_t)v6, (uint64_t)v8, &qword_100067338);
  v26 = &v8[*(int *)(v34 + 36)];
  *(_QWORD *)v26 = KeyPath;
  v26[8] = 1;
  sub_100009CF0((uint64_t)v6, &qword_100067338);
  sub_100009C1C((uint64_t)v8, (uint64_t)v10, &qword_100067340);
  v27 = (uint64_t (**)())&v10[*(int *)(v33 + 36)];
  *v27 = sub_100034E24;
  v27[1] = 0;
  sub_100009CF0((uint64_t)v8, &qword_100067340);
  return sub_100009A88((uint64_t)v10, v36, &qword_100067348);
}

uint64_t sub_100034268(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _QWORD v37[2];
  char v38;

  v2 = type metadata accessor for ColorSpaceButton(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100034F24(a1, (uint64_t)v5);
  type metadata accessor for MainActor(0);
  v6 = ((uint64_t (*)(void))static MainActor.shared.getter)();
  v7 = *(unsigned __int8 *)(v3 + 80);
  v8 = (v7 + 32) & ~v7;
  v9 = v8 + v4;
  v10 = v7 | 7;
  v11 = swift_allocObject(&unk_10005C428, v9, v7 | 7);
  *(_QWORD *)(v11 + 16) = v6;
  *(_QWORD *)(v11 + 24) = &protocol witness table for MainActor;
  sub_100034F6C((uint64_t)v5, v11 + v8);
  v12 = sub_100034F24(a1, (uint64_t)v5);
  v13 = static MainActor.shared.getter(v12);
  v14 = swift_allocObject(&unk_10005C450, v9, v10);
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = &protocol witness table for MainActor;
  sub_100034F6C((uint64_t)v5, v14 + v8);
  Binding.init(get:set:)(&v33, sub_100034FB0, v11, sub_1000350E4, v14, &type metadata for SomeColor.ColorSpace);
  v37[0] = v33;
  v37[1] = v34;
  v38 = v35;
  v15 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v15);
  v17 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v18 = String._bridgeToObjectiveC()();
  v19 = String._bridgeToObjectiveC()();
  v20 = objc_msgSend(v17, "localizedStringForKey:value:table:", v18, 0, v19);

  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v23 = v22;

  v33 = v21;
  v34 = v23;
  v24 = sub_10000CC44();
  v33 = Text.init<A>(_:)(&v33, &type metadata for String, v24);
  v34 = v25;
  v35 = v26 & 1;
  v36 = v27;
  v28 = sub_1000060E4(&qword_1000673A0);
  v29 = sub_100035124();
  v30 = sub_100035168();
  return Picker.init(selection:label:content:)(v37, &v33, sub_100034510, 0, &type metadata for Text, &type metadata for SomeColor.ColorSpace, v28, &protocol witness table for Text, v29, v30);
}

uint64_t sub_100034510()
{
  uint64_t KeyPath;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _UNKNOWN **v5;

  v5 = &off_100059C78;
  KeyPath = swift_getKeyPath(&unk_100047438);
  v1 = sub_1000060E4(&qword_100065E90);
  v2 = sub_100009FA0(&qword_1000673B8, &qword_100065E90, (uint64_t)&protocol conformance descriptor for [A]);
  v3 = sub_100035124();
  return ForEach<>.init(_:id:content:)(&v5, KeyPath, sub_1000345C8, 0, v1, &type metadata for Text, v2, v3, &protocol witness table for Text);
}

uint64_t sub_1000345C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[0] = sub_100017798();
  v8[1] = v2;
  v3 = sub_10000CC44();
  result = Text.init<A>(_:)(v8, &type metadata for String, v3);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(_QWORD *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_100034620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t ObjCClassFromMetadata;
  void *v11;
  id v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t KeyPath;
  id v42;
  NSString v43;
  NSString v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (**v62)();
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  char v78;
  _QWORD v79[4];

  v73 = a2;
  v67 = type metadata accessor for DynamicTypeSize(0);
  v3 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000060E4(&qword_100067390);
  v71 = *(_QWORD *)(v6 - 8);
  v72 = v6;
  __chkstk_darwin(v6);
  v68 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_1000060E4(&qword_100067350);
  __chkstk_darwin(v70);
  v69 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v9);
  v66 = ObjCClassFromMetadata;
  v11 = (void *)objc_opt_self(NSBundle);
  v12 = objc_msgSend(v11, "bundleForClass:", ObjCClassFromMetadata);
  v13 = String._bridgeToObjectiveC()();
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, 0, v14);

  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v18 = v17;

  v19 = sub_1000060E4(&qword_100065EF8);
  v20 = swift_allocObject(v19, 72, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100042F50;
  v21 = *(_QWORD *)(a1 + 8);
  v22 = *(_BYTE *)(a1 + 48);
  v74 = *(_QWORD *)a1;
  v75 = v21;
  v23 = *(_OWORD *)(a1 + 32);
  v76 = *(_OWORD *)(a1 + 16);
  v77 = v23;
  v78 = v22;
  v24 = sub_1000060E4(&qword_100066D40);
  Binding.wrappedValue.getter(v24);
  v25 = sub_100017798();
  v27 = v26;
  *(_QWORD *)(v20 + 56) = &type metadata for String;
  *(_QWORD *)(v20 + 64) = sub_100034E94();
  *(_QWORD *)(v20 + 32) = v25;
  *(_QWORD *)(v20 + 40) = v27;
  v28 = static String.localizedStringWithFormat(_:_:)(v16, v18, v20);
  v30 = v29;
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v20);
  v74 = v28;
  v75 = v30;
  v31 = sub_10000CC44();
  v32 = Text.init<A>(_:)(&v74, &type metadata for String, v31);
  v64 = v32;
  v34 = v33;
  v36 = v35;
  v65 = v35;
  v38 = v37 & 1;
  type metadata accessor for ColorSpaceButton(0);
  v39 = sub_100013E74((uint64_t)v5);
  LOBYTE(v28) = DynamicTypeSize.isAccessibilitySize.getter(v39);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v67);
  if ((v28 & 1) != 0)
    v40 = 1;
  else
    v40 = 2;
  KeyPath = swift_getKeyPath(&unk_100047400);
  v74 = v32;
  v75 = v34;
  LOBYTE(v76) = v38;
  *((_QWORD *)&v76 + 1) = v36;
  *(_QWORD *)&v77 = KeyPath;
  BYTE8(v77) = v40;
  v42 = objc_msgSend(v11, "bundleForClass:", v66);
  v43 = String._bridgeToObjectiveC()();
  v44 = String._bridgeToObjectiveC()();
  v45 = objc_msgSend(v42, "localizedStringForKey:value:table:", v43, 0, v44);

  v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
  v48 = v47;

  v79[0] = v46;
  v79[1] = v48;
  v49 = Text.init<A>(_:)(v79, &type metadata for String, v31);
  v51 = v50;
  v53 = v52;
  v55 = v54 & 1;
  v56 = sub_1000060E4(&qword_100067368);
  v57 = sub_100034DA0();
  v58 = v68;
  View.overrideMenuTitle(_:)(v49, v51, v55, v53, v56, v57);
  sub_10000CC88(v49, v51, v55);
  swift_bridgeObjectRelease(v53);
  sub_10000CC88(v64, v34, v38);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v65);
  v60 = v71;
  v59 = v72;
  v61 = (uint64_t)v69;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v69, v58, v72);
  v62 = (uint64_t (**)())(v61 + *(int *)(v70 + 36));
  *v62 = sub_100034E24;
  v62[1] = 0;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v58, v59);
  return sub_100009A88(v61, v73, &qword_100067350);
}

uint64_t sub_100034AEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1000060E4(&qword_100066D40);
  result = Binding.wrappedValue.getter(v2);
  *a1 = v4;
  return result;
}

uint64_t sub_100034B48(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  int v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  char v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  char v19;
  unsigned __int8 v20;

  v5 = *a1;
  v6 = a4[1];
  v7 = *((_BYTE *)a4 + 48);
  v15 = *a4;
  v16 = v6;
  v8 = *((_OWORD *)a4 + 2);
  v17 = *((_OWORD *)a4 + 1);
  v18 = v8;
  v19 = v7;
  v9 = sub_1000060E4(&qword_100066D40);
  result = Binding.wrappedValue.getter(v9);
  if (v5 != v20)
  {
    v11 = __chkstk_darwin(result);
    v13[2] = a4;
    v14 = v5;
    v12 = static Animation.default.getter(v11);
    withAnimation<A>(_:_:)(v12, sub_1000351C4, v13, (char *)&type metadata for () + 8);
    return swift_release(v12);
  }
  return result;
}

uint64_t sub_100034C10(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _OWORD v12[2];
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _OWORD v21[2];
  char v22;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = *((_BYTE *)a1 + 48);
  v14 = *a1;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v10 = sub_1000060E4(&qword_100066D40);
  Binding.wrappedValue.getter(v10);
  if ((a2 & 1) != 0)
    sub_100017DD0((uint64_t)v21);
  else
    sub_100017C8C((uint64_t)v21);
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v12[0] = v21[0];
  v12[1] = v21[1];
  v13 = v22;
  return Binding.wrappedValue.setter(v12, v10);
}

uint64_t sub_100034CFC()
{
  uint64_t v0;

  return sub_100034268(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100034D04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100034620(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_100034D0C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100067360;
  if (!qword_100067360)
  {
    v1 = sub_100009E2C(&qword_100067350);
    v2[0] = sub_100009E2C(&qword_100067368);
    v2[1] = sub_100034DA0();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.overrideMenuTitle(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067360);
  }
  return result;
}

unint64_t sub_100034DA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067370;
  if (!qword_100067370)
  {
    v1 = sub_100009E2C(&qword_100067368);
    sub_100009FA0(&qword_100067378, &qword_100067380, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067370);
  }
  return result;
}

uint64_t sub_100034E24()
{
  return Transaction.animation.setter(0);
}

uint64_t sub_100034E48@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.menuTitleVisibility.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100034E70(unsigned __int8 *a1)
{
  return EnvironmentValues.menuTitleVisibility.setter(*a1);
}

unint64_t sub_100034E94()
{
  unint64_t result;

  result = qword_100067398;
  if (!qword_100067398)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100067398);
  }
  return result;
}

uint64_t sub_100034ED8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100034F00(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100034F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ColorSpaceButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100034F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ColorSpaceButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100034FB0@<X0>(_BYTE *a1@<X8>)
{
  type metadata accessor for ColorSpaceButton(0);
  return sub_100034AEC(a1);
}

uint64_t sub_100034FF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for ColorSpaceButton(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + v4));
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v6 = v0 + v4 + *(int *)(v1 + 20);
  v7 = sub_1000060E4(&qword_100067288);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v9 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v8, v10);
  }
  else
  {
    swift_release(*v8);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1000350E4(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSpaceButton(0) - 8) + 80);
  return sub_100034B48(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t *)(v1 + ((v3 + 32) & ~v3)));
}

unint64_t sub_100035124()
{
  unint64_t result;

  result = qword_1000673A8;
  if (!qword_1000673A8)
  {
    result = swift_getWitnessTable(&unk_100044B08, &type metadata for SomeColor.ColorSpace);
    atomic_store(result, (unint64_t *)&qword_1000673A8);
  }
  return result;
}

unint64_t sub_100035168()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000673B0;
  if (!qword_1000673B0)
  {
    v1 = sub_100009E2C(&qword_1000673A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_1000673B0);
  }
  return result;
}

uint64_t sub_1000351C4()
{
  uint64_t v0;

  return sub_100034C10(*(uint64_t **)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_1000351E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000673C0;
  if (!qword_1000673C0)
  {
    v1 = sub_100009E2C(&qword_100067348);
    sub_100035250();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000673C0);
  }
  return result;
}

unint64_t sub_100035250()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000673C8;
  if (!qword_1000673C8)
  {
    v1 = sub_100009E2C(&qword_100067340);
    sub_1000352D4();
    sub_100009FA0(&qword_1000673E0, &qword_1000673E8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000673C8);
  }
  return result;
}

unint64_t sub_1000352D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000673D0;
  if (!qword_1000673D0)
  {
    v1 = sub_100009E2C(&qword_100067338);
    sub_100009FA0(&qword_1000673D8, &qword_100067330, (uint64_t)&protocol conformance descriptor for Menu<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000673D0);
  }
  return result;
}

uint64_t *sub_100035358(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v15);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[1];
    v8 = a2[2];
    v4[1] = v7;
    v4[2] = v8;
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)v4 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain(v7);
    v12 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
      v14 = 1;
    }
    else
    {
      v16 = *v11;
      *v10 = *v11;
      swift_retain(v16);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v14);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t sub_100035450(uint64_t a1, uint64_t a2)
{
  return sub_10003CBCC(a1, a2, &qword_100065570, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_100035464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (uint64_t *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  swift_retain(v6);
  v11 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    v13 = 1;
  }
  else
  {
    v14 = *v10;
    *v9 = *v10;
    swift_retain(v14);
    v13 = 0;
  }
  swift_storeEnumTagMultiPayload(v9, v11, v13);
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_100035530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  swift_retain(v7);
  swift_release(v6);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (uint64_t *)(a1 + v8);
    v10 = (uint64_t *)(a2 + v8);
    sub_100009CF0(a1 + v8, &qword_100065570);
    v11 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_100035628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_1000356F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release(v6);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 24);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_100009CF0(a1 + v7, &qword_100065570);
    v10 = sub_1000060E4(&qword_100065570);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_1000357E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000357F4);
}

uint64_t sub_1000357F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v9 = sub_1000060E4(&qword_100065578);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_100035880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003588C);
}

uint64_t sub_10003588C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1000060E4(&qword_100065578);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ColorSlider(uint64_t a1)
{
  return sub_10003C508(a1, qword_100067460, (uint64_t)&nominal type descriptor for ColorSlider);
}

void sub_100035918(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = &unk_1000474B0;
  v4[1] = &unk_1000474C8;
  sub_10003D110(319, (unint64_t *)&qword_1000655E8, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

uint64_t sub_1000359B0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100052340, 1);
}

uint64_t sub_1000359C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  ValueMetadata *v23;
  _UNKNOWN **v24;
  _QWORD *v25;
  void *v26;
  uint64_t (*v27)(uint64_t, double);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t (*v50)(uint64_t);
  uint64_t v51;
  uint64_t OpaqueTypeConformance2;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  _QWORD v71[3];
  ValueMetadata *v72;
  _UNKNOWN **v73;
  uint64_t (*v74)(uint64_t);
  unint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  char v79;
  __int128 v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  char v84;
  __int128 v85;

  v2 = (_QWORD *)v1;
  v66 = a1;
  v64 = type metadata accessor for AccessibilityChildBehavior(0);
  v62 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v4 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CPSlider(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_1000060E4(&qword_1000675D0);
  __chkstk_darwin(v61);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_1000060E4(&qword_1000675D8);
  v63 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v60 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000060E4(&qword_1000675E0);
  __chkstk_darwin(v12);
  v59 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009E80(v1, (uint64_t)v8, type metadata accessor for CPSlider);
  v14 = *(unsigned __int8 *)(v6 + 80);
  v15 = (v14 + 16) & ~v14;
  v57 = v15 + v7;
  v56 = v14 | 7;
  v16 = swift_allocObject(&unk_10005C7A0, v15 + v7, v14 | 7);
  v58 = v15;
  sub_1000151B0((uint64_t)v8, v16 + v15, type metadata accessor for CPSlider);
  v17 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 == (id)6)
    v20 = 0x4046000000000000;
  else
    v20 = 0x4042000000000000;
  v21 = static Alignment.center.getter(v19);
  _FrameLayout.init(width:height:alignment:)(&v81, 0, 1, v20, 0, v21, v22);
  v74 = sub_10003BED8;
  v75 = v16;
  v76 = v81;
  v77 = v82;
  v78 = v83;
  v79 = v84;
  v80 = v85;
  if (*(unsigned __int8 *)v2 >= 3u)
  {
    v23 = &type metadata for PercentageSliderControlStyle;
    v24 = &off_10005C770;
    v72 = &type metadata for PercentageSliderControlStyle;
    v73 = &off_10005C770;
    v25 = (_QWORD *)swift_allocObject(&unk_10005C560, 64, 7);
    v25[2] = sub_100037BB4;
    v25[3] = 0;
    v25[4] = sub_100037C7C;
    v25[5] = 0;
    v26 = sub_100037F58;
  }
  else
  {
    v23 = &type metadata for IntegerSliderControlStyle;
    v24 = &off_10005C750;
    v72 = &type metadata for IntegerSliderControlStyle;
    v73 = &off_10005C750;
    v25 = (_QWORD *)swift_allocObject(&unk_10005C600, 64, 7);
    v25[2] = sub_1000382FC;
    v25[3] = 0;
    v25[4] = sub_1000383D8;
    v25[5] = 0;
    v26 = sub_1000384BC;
  }
  v25[6] = v26;
  v25[7] = 0;
  v71[0] = v25;
  sub_100018BB0(v71, (uint64_t)v23);
  v27 = (uint64_t (*)(uint64_t, double))((uint64_t (__cdecl *)())v24[1])();
  v29 = v28;
  v30 = v2[2];
  v31 = v2[3];
  v67 = v2[1];
  v68 = v30;
  v69 = v31;
  v32 = sub_1000060E4(&qword_1000675E8);
  v33 = Binding.wrappedValue.getter(v32);
  v34 = v27(v33, v70);
  v36 = v35;
  swift_release(v29);
  v67 = v34;
  v68 = v36;
  v37 = sub_10000CC44();
  v38 = Text.init<A>(_:)(&v67, &type metadata for String, v37);
  v40 = v39;
  v42 = v41;
  v44 = v43 & 1;
  sub_1000152C4(v71);
  v45 = sub_1000060E4(&qword_1000675F0);
  v46 = sub_10003BEEC();
  View.accessibility(value:)(v38, v40, v44, v42, v45, v46);
  sub_10000CC88(v38, v40, v44);
  swift_bridgeObjectRelease(v42);
  v47 = swift_release(v75);
  static AccessibilityChildBehavior.combine.getter(v47);
  v48 = sub_10003BF70();
  v49 = v60;
  v50 = (uint64_t (*)(uint64_t))v61;
  View.accessibilityElement(children:)(v4, v61, v48);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v4, v64);
  sub_100009CF0((uint64_t)v10, &qword_1000675D0);
  sub_100009E80((uint64_t)v2, (uint64_t)v8, type metadata accessor for CPSlider);
  v51 = swift_allocObject(&unk_10005C7C8, v57, v56);
  sub_1000151B0((uint64_t)v8, v51 + v58, type metadata accessor for CPSlider);
  v74 = v50;
  v75 = v48;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v74, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v53 = (uint64_t)v59;
  v54 = v65;
  View.accessibilityAdjustableAction(_:)(sub_10003C0DC, v51, v65, OpaqueTypeConformance2);
  swift_release(v51);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v49, v54);
  return sub_100009A88(v53, v66, &qword_1000675E0);
}

uint64_t sub_100035F44@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  char *v26;
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
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  char *v57;
  _BYTE *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v73 = a3;
  v5 = type metadata accessor for CPSlider(0);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  v62 = *(_QWORD *)(v5 - 8);
  v63 = v6;
  __chkstk_darwin(v5);
  v61 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = type metadata accessor for GeometryProxy(0);
  v8 = *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64);
  v9 = *(_QWORD *)(v59 - 8);
  __chkstk_darwin(v59);
  v10 = type metadata accessor for LocalCoordinateSpace(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = type metadata accessor for DragGesture(0);
  v67 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v57 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1000060E4(&qword_1000660A0);
  v70 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  v60 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000060E4(&qword_1000660A8);
  v16 = *(_QWORD *)(v15 - 8);
  v71 = v15;
  v72 = v16;
  __chkstk_darwin(v15);
  v66 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_1000060E4(&qword_100067618);
  v18 = __chkstk_darwin(v69);
  v20 = (uint64_t *)((char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v20 = static Alignment.center.getter(v18);
  v20[1] = v21;
  v64 = v20;
  v22 = (uint64_t)v20 + *(int *)(sub_1000060E4(&qword_100067620) + 44);
  v58 = a2;
  v23 = sub_1000363FC(a2, a1, v22);
  static CoordinateSpaceProtocol<>.local.getter(v23);
  DragGesture.init<A>(minimumDistance:coordinateSpace:)(v12, v10, &protocol witness table for LocalCoordinateSpace, 0.0);
  v24 = v9;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v26 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v59;
  v25(v26, a1, v59);
  v28 = v61;
  sub_100009E80((uint64_t)a2, v61, type metadata accessor for CPSlider);
  v29 = *(unsigned __int8 *)(v24 + 80);
  v30 = (v29 + 16) & ~v29;
  v31 = *(unsigned __int8 *)(v62 + 80);
  v32 = (v8 + v31 + v30) & ~v31;
  v33 = v63;
  v62 = v31 | 7;
  v34 = swift_allocObject(&unk_10005C7F0, v32 + v63, v31 | 7 | v29);
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v34 + v30, v26, v27);
  v35 = v34 + v32;
  v36 = v28;
  sub_1000151B0(v28, v35, type metadata accessor for CPSlider);
  v37 = sub_100006848(&qword_100066108, (uint64_t (*)(uint64_t))&type metadata accessor for DragGesture, (uint64_t)&protocol conformance descriptor for DragGesture);
  v38 = sub_100006848(&qword_100066110, (uint64_t (*)(uint64_t))&type metadata accessor for DragGesture.Value, (uint64_t)&protocol conformance descriptor for DragGesture.Value);
  v39 = v60;
  v40 = v65;
  v41 = v57;
  Gesture<>.onChanged(_:)(sub_10003C20C, v34, v65, v37, v38);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v41, v40);
  sub_100009E80((uint64_t)v58, v36, type metadata accessor for CPSlider);
  v42 = (v31 + 16) & ~v31;
  v43 = swift_allocObject(&unk_10005C818, v42 + v33, v62);
  sub_1000151B0(v36, v43 + v42, type metadata accessor for CPSlider);
  v44 = sub_100009FA0(&qword_100066118, &qword_1000660A0, (uint64_t)&protocol conformance descriptor for _ChangedGesture<A>);
  v45 = v66;
  v46 = v68;
  Gesture.onEnded(_:)(sub_10003C278, v43, v68, v44);
  swift_release(v43);
  v47 = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v39, v46);
  v48 = static GestureMask.all.getter(v47);
  v49 = sub_100009FA0(&qword_100067628, &qword_100067618, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v50 = sub_100009FA0(&qword_100066150, &qword_1000660A8, (uint64_t)&protocol conformance descriptor for _EndedGesture<A>);
  v51 = v48;
  v52 = v71;
  v53 = v49;
  v54 = (uint64_t)v64;
  View.gesture<A>(_:including:)(v45, v51, v69, v71, v53, v50);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v45, v52);
  return sub_100009CF0(v54, &qword_100067618);
}

uint64_t sub_1000363FC@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
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
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  char **v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  double v49;
  double v50;
  char *v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t KeyPath;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t result;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[2];
  uint64_t v110;
  char *v111;
  _QWORD *v112;
  char *v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  uint64_t v118;
  char *v119;
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
  char v133;
  _OWORD v134[2];
  uint64_t v135;

  v109[1] = a2;
  v125 = a3;
  v110 = type metadata accessor for PositionModifier(0);
  __chkstk_darwin(v110);
  v112 = (_QWORD *)((char *)v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v114 = sub_1000060E4(&qword_100067630);
  __chkstk_darwin(v114);
  v113 = (char *)v109 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_1000060E4(&qword_100067638);
  v121 = *(_QWORD *)(v122 - 8);
  __chkstk_darwin(v122);
  v111 = (char *)v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4(&qword_100067640);
  v8 = __chkstk_darwin(v7);
  v124 = (uint64_t)v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v123 = (uint64_t)v109 - v10;
  v11 = sub_1000060E4(&qword_100067648);
  __chkstk_darwin(v11);
  v13 = (char *)v109 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Capsule(0);
  v15 = __chkstk_darwin(v14);
  v115 = (char *)v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)v109 - v17;
  v19 = sub_1000060E4(&qword_100067650);
  __chkstk_darwin(v19);
  v21 = (_QWORD *)((char *)v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = sub_1000060E4(&qword_100067658);
  __chkstk_darwin(v22);
  v24 = (char *)v109 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1000060E4(&qword_100067660);
  __chkstk_darwin(v25);
  v27 = (char *)v109 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_1000060E4(&qword_100067668);
  __chkstk_darwin(v118);
  v117 = (char *)v109 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_1000060E4(&qword_100067670);
  v30 = __chkstk_darwin(v29);
  v120 = (uint64_t)v109 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v119 = (char *)v109 - v33;
  v34 = __chkstk_darwin(v32);
  v116 = (char *)v109 - v35;
  *v21 = static Alignment.center.getter(v34);
  v21[1] = v36;
  v37 = sub_1000060E4(&qword_100067678);
  sub_100036D90(a1, (uint64_t)v21 + *(int *)(v37 + 44));
  sub_100009C1C((uint64_t)v21, (uint64_t)v24, &qword_100067650);
  sub_100009CF0((uint64_t)v21, &qword_100067650);
  v38 = enum case for RoundedCornerStyle.continuous(_:);
  v39 = type metadata accessor for RoundedCornerStyle(0);
  v40 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104);
  v40(v18, v38, v39);
  v41 = (uint64_t)&v27[*(int *)(v25 + 36)];
  sub_100009E80((uint64_t)v18, v41, (uint64_t (*)(_QWORD))&type metadata accessor for Capsule);
  *(_WORD *)(v41 + *(int *)(sub_1000060E4(&qword_100067680) + 36)) = 256;
  sub_100009C1C((uint64_t)v24, (uint64_t)v27, &qword_100067658);
  sub_100009EC4((uint64_t)v18, (uint64_t (*)(_QWORD))&type metadata accessor for Capsule);
  sub_100009CF0((uint64_t)v24, &qword_100067658);
  v42 = (uint64_t)v115;
  v40(v115, v38, v39);
  LODWORD(v40) = *a1;
  v43 = a1;
  v44 = (void *)objc_opt_self(UIColor);
  v45 = &selRef_systemGrayColor;
  if ((_DWORD)v40 != 3)
    v45 = &selRef_clearColor;
  v46 = Color.init(uiColor:)(objc_msgSend(v44, *v45));
  v47 = Color.opacity(_:)(0.2);
  swift_release(v46);
  v48 = objc_msgSend((id)objc_opt_self(UITraitCollection), "currentTraitCollection");
  objc_msgSend(v48, "displayScale");
  v50 = v49;

  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v134, 0, 0, _swiftEmptyArrayStorage, 1.0 / v50, 10.0, 0.0);
  sub_100009E80(v42, (uint64_t)v13, (uint64_t (*)(_QWORD))&type metadata accessor for Capsule);
  v51 = &v13[*(int *)(sub_1000060E4(&qword_100067688) + 36)];
  v52 = v134[1];
  *(_OWORD *)v51 = v134[0];
  *((_OWORD *)v51 + 1) = v52;
  *((_QWORD *)v51 + 4) = v135;
  v53 = sub_1000060E4(&qword_100067690);
  *(_QWORD *)&v13[*(int *)(v53 + 52)] = v47;
  *(_WORD *)&v13[*(int *)(v53 + 56)] = 256;
  v54 = static Alignment.center.getter(v53);
  v56 = v55;
  v57 = (uint64_t *)&v13[*(int *)(sub_1000060E4(&qword_100067698) + 36)];
  *v57 = v54;
  v57[1] = v56;
  v58 = sub_100009EC4(v42, (uint64_t (*)(_QWORD))&type metadata accessor for Capsule);
  v59 = static Alignment.center.getter(v58);
  v61 = v60;
  v62 = v118;
  v63 = (uint64_t)v117;
  v64 = (uint64_t)&v117[*(int *)(v118 + 36)];
  sub_100009C1C((uint64_t)v13, v64, &qword_100067648);
  v65 = (uint64_t *)(v64 + *(int *)(sub_1000060E4(&qword_1000676A0) + 36));
  v66 = (uint64_t)v116;
  *v65 = v59;
  v65[1] = v61;
  sub_100009C1C((uint64_t)v27, v63, &qword_100067660);
  sub_100009CF0((uint64_t)v13, &qword_100067648);
  sub_100009CF0((uint64_t)v27, &qword_100067660);
  v67 = sub_10003C2E4();
  v68 = (uint64_t)v119;
  View.accessibility(hidden:)(1, v62, v67);
  sub_100009CF0(v63, &qword_100067668);
  sub_100009A88(v68, v66, &qword_100067670);
  v69 = (_QWORD *)((char *)v43 + *(int *)(type metadata accessor for CPSlider(0) + 32));
  v70 = *v69;
  if (*v69)
  {
    KeyPath = swift_getKeyPath(&unk_100047588);
    v72 = swift_getKeyPath(&unk_1000475B0);
    v73 = swift_retain(v70);
    static Published.subscript.getter(&v129, v73, KeyPath, v72);
    swift_release(v70);
    swift_release(KeyPath);
    swift_release(v72);
    if (v133 == 2)
    {
      v74 = 1;
      v75 = v123;
    }
    else
    {
      v76 = v129;
      v77 = v130;
      v78 = v131;
      v79 = v132;
      v80 = v133 & 1;
      v81 = v43[2];
      v82 = v43[3];
      v126 = v43[1];
      v127 = v81;
      v128 = v82;
      v83 = sub_1000060E4(&qword_1000675E8);
      v84 = Binding.projectedValue.getter(v83);
      v85 = v129;
      v86 = v130;
      v87 = v131;
      v88 = GeometryProxy.size.getter(v84);
      v89 = (uint64_t)v112;
      *v112 = v85;
      *(_QWORD *)(v89 + 8) = v86;
      *(_QWORD *)(v89 + 16) = v87;
      *(double *)(v89 + 24) = v88;
      *(_QWORD *)(v89 + 32) = v90;
      v91 = (_QWORD *)(v89 + *(int *)(v110 + 24));
      *v91 = swift_getKeyPath(&unk_100047558);
      v92 = sub_1000060E4(&qword_100065DC0);
      swift_storeEnumTagMultiPayload(v91, v92, 0);
      v93 = v114;
      v94 = (uint64_t)v113;
      sub_100009E80(v89, (uint64_t)&v113[*(int *)(v114 + 36)], type metadata accessor for PositionModifier);
      *(_QWORD *)v94 = v76;
      *(_QWORD *)(v94 + 8) = v77;
      *(_QWORD *)(v94 + 16) = v78;
      *(_QWORD *)(v94 + 24) = v79;
      *(_BYTE *)(v94 + 32) = v80;
      v95 = sub_100009EC4(v89, type metadata accessor for PositionModifier);
      v96 = static UnitPoint.center.getter(v95);
      v98 = v97;
      v99 = sub_10003C470();
      v100 = (uint64_t)v111;
      View.accessibility(activationPoint:)(v93, v99, v96, v98);
      sub_100009CF0(v94, &qword_100067630);
      v75 = v123;
      sub_100009A88(v100, v123, &qword_100067638);
      v74 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v121 + 56))(v75, v74, 1, v122);
    v101 = v120;
    sub_100009C1C(v66, v120, &qword_100067670);
    v102 = v124;
    sub_100009C1C(v75, v124, &qword_100067640);
    v103 = v125;
    sub_100009C1C(v101, v125, &qword_100067670);
    v104 = sub_1000060E4(&qword_1000676D8);
    sub_100009C1C(v102, v103 + *(int *)(v104 + 48), &qword_100067640);
    sub_100009CF0(v75, &qword_100067640);
    sub_100009CF0(v66, &qword_100067670);
    sub_100009CF0(v102, &qword_100067640);
    return sub_100009CF0(v101, &qword_100067670);
  }
  else
  {
    v106 = v69[1];
    v107 = type metadata accessor for ColorPickerState(0);
    v108 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    result = EnvironmentObject.error()(0, v106, v107, v108);
    __break(1u);
  }
  return result;
}

uint64_t sub_100036D90@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  char v52;
  double v53;
  double v54;
  double v55;
  double v56;
  char v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;

  v47 = a2;
  v3 = type metadata accessor for Color.RGBColorSpace(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  *(_QWORD *)&v46 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v46 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v46 - v10;
  v12 = type metadata accessor for OpacityBackground(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (_QWORD *)((char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = sub_1000060E4(&qword_1000676F0);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v21 = (char *)&v46 - v20;
  if (*a1 == 3)
  {
    *v15 = 0x4028000000000000;
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v11, enum case for Color.RGBColorSpace.displayP3(_:), v3);
    v15[1] = Color.init(_:red:green:blue:opacity:)(v11, 0.851, 0.847, 0.855, 1.0);
    v22 = (_QWORD *)((char *)v15 + *(int *)(v12 + 24));
    *v22 = swift_getKeyPath(&unk_1000477B8);
    v23 = sub_1000060E4(&qword_100065B20);
    swift_storeEnumTagMultiPayload(v22, v23, 0);
    sub_1000151B0((uint64_t)v15, (uint64_t)v21, type metadata accessor for OpacityBackground);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v21, v24, 1, v12);
  v25 = sub_1000060E4(&qword_1000676F8);
  v26 = swift_allocObject(v25, 48, 7);
  *(_OWORD *)(v26 + 16) = xmmword_100043AF0;
  sub_100037120();
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v28 = enum case for Color.RGBColorSpace.displayP3(_:);
  v29 = enum case for Color.RGBColorSpace.sRGB(_:);
  if (v52)
    v30 = enum case for Color.RGBColorSpace.displayP3(_:);
  else
    v30 = enum case for Color.RGBColorSpace.sRGB(_:);
  v27(v9, v30, v3);
  *(_QWORD *)(v26 + 32) = Color.init(_:red:green:blue:opacity:)(v9, v48, v49, v50, v51);
  sub_10003735C();
  if (v57)
    v31 = v28;
  else
    v31 = v29;
  v32 = v46;
  v27((char *)v46, v31, v3);
  v33 = Color.init(_:red:green:blue:opacity:)(v32, v53, v54, v55, v56);
  *(_QWORD *)(v26 + 40) = v33;
  v58 = v26;
  specialized Array._endMutation()(v33);
  v34 = Gradient.init(colors:)(v58);
  v35 = static UnitPoint.leading.getter();
  v37 = v36;
  v38 = static UnitPoint.trailing.getter();
  LinearGradient.init(gradient:startPoint:endPoint:)(&v58, v34, v35, v37, v38, v39);
  sub_100009C1C((uint64_t)v21, (uint64_t)v19, &qword_1000676F0);
  v40 = v58;
  v46 = v59;
  v41 = v60;
  v42 = v61;
  v43 = v47;
  sub_100009C1C((uint64_t)v19, v47, &qword_1000676F0);
  v44 = v43 + *(int *)(sub_1000060E4(&qword_100067700) + 48);
  *(_QWORD *)v44 = v40;
  *(_OWORD *)(v44 + 8) = v46;
  *(_QWORD *)(v44 + 24) = v41;
  *(_QWORD *)(v44 + 32) = v42;
  swift_bridgeObjectRetain(v40);
  sub_100009CF0((uint64_t)v21, &qword_1000676F0);
  swift_bridgeObjectRelease(v40);
  return sub_100009CF0((uint64_t)v19, &qword_1000676F0);
}

void sub_100037120()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  id v6;
  CGColor *v7;
  CGColorSpace *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for CPSlider(0) + 32));
  v2 = *v1;
  if (!*v1)
  {
    v10 = v1[1];
    v11 = type metadata accessor for ColorPickerState(0);
    v12 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    EnvironmentObject.error()(0, v10, v11, v12);
    __break(1u);
    JUMPOUT(0x10003734CLL);
  }
  KeyPath = swift_getKeyPath(&unk_100047588);
  v4 = swift_getKeyPath(&unk_1000475B0);
  v5 = swift_retain(v2);
  static Published.subscript.getter(&v13, v5, KeyPath, v4);
  swift_release(v2);
  swift_release(KeyPath);
  swift_release(v4);
  if (v14 == 2)
  {
    v6 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
    v7 = (CGColor *)objc_msgSend(v6, "CGColor");
    v8 = CGColorGetColorSpace(v7);

    if (v8)
    {
      v9 = sub_1000184E4(v8);
      if (v9 != 2)
      {
        sub_1000183BC(v6, v9 & 1, (uint64_t)&v13);

        goto LABEL_11;
      }

    }
    if (qword_100065088 != -1)
      swift_once(&qword_100065088, sub_10002141C);
    sub_1000183BC(v6, byte_10006B6A0, (uint64_t)&v13);
  }
LABEL_11:
  __asm { BR              X10 }
}

void sub_10003735C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  id v6;
  CGColor *v7;
  CGColorSpace *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for CPSlider(0) + 32));
  v2 = *v1;
  if (!*v1)
  {
    v10 = v1[1];
    v11 = type metadata accessor for ColorPickerState(0);
    v12 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
    EnvironmentObject.error()(0, v10, v11, v12);
    __break(1u);
    JUMPOUT(0x100037588);
  }
  KeyPath = swift_getKeyPath(&unk_100047588);
  v4 = swift_getKeyPath(&unk_1000475B0);
  v5 = swift_retain(v2);
  static Published.subscript.getter(&v13, v5, KeyPath, v4);
  swift_release(v2);
  swift_release(KeyPath);
  swift_release(v4);
  if (v14 == 2)
  {
    v6 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
    v7 = (CGColor *)objc_msgSend(v6, "CGColor");
    v8 = CGColorGetColorSpace(v7);

    if (v8)
    {
      v9 = sub_1000184E4(v8);
      if (v9 != 2)
      {
        sub_1000183BC(v6, v9 & 1, (uint64_t)&v13);

        goto LABEL_11;
      }

    }
    if (qword_100065088 != -1)
      swift_once(&qword_100065088, sub_10002141C);
    sub_1000183BC(v6, byte_10006B6A0, (uint64_t)&v13);
  }
LABEL_11:
  __asm { BR              X10 }
}

uint64_t sub_100037598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  GeometryProxy.size.getter(a1);
  v5 = v4 * 0.5;
  v7 = GeometryProxy.size.getter(v6);
  GeometryProxy.size.getter(v8);
  v10 = v7 - v9 * 0.5;
  v13 = DragGesture.Value.location.getter(v11);
  if (v13 >= v10)
    v13 = v10;
  if (v5 > v13)
    v14 = v5;
  else
    v14 = v13;
  GeometryProxy.size.getter(v12);
  v16 = v14 - v15 * 0.5;
  v18 = GeometryProxy.size.getter(v17);
  GeometryProxy.size.getter(v19);
  v21 = v16 / (v18 - v20);
  if (v21 < 0.0)
    v21 = 0.0;
  v22 = *(_QWORD *)(a3 + 16);
  v23 = *(_QWORD *)(a3 + 24);
  v30 = *(_QWORD *)(a3 + 8);
  v31 = v22;
  v32 = v23;
  v29 = fmin(v21, 1.0);
  v24 = sub_1000060E4(&qword_1000675E8);
  Binding.wrappedValue.setter(&v29, v24);
  v25 = *(_QWORD *)(a3 + 40);
  v26 = *(_BYTE *)(a3 + 48);
  v30 = *(_QWORD *)(a3 + 32);
  v31 = v25;
  LOBYTE(v32) = v26;
  LOBYTE(v29) = 1;
  v27 = sub_1000060E4(&qword_100065290);
  return Binding.wrappedValue.setter(&v29, v27);
}

uint64_t sub_1000376B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a2 + 40);
  v3 = *(_BYTE *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = v2;
  v9 = v3;
  v6 = 0;
  v4 = sub_1000060E4(&qword_100065290);
  return Binding.wrappedValue.setter(&v6, v4);
}

uint64_t sub_100037708(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  v4 = type metadata accessor for AccessibilityAdjustmentDirection(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for AccessibilityAdjustmentDirection.increment(_:))
  {
    v9 = a2[1];
    v10 = a2[2];
    v11 = a2[3];
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v12 = sub_1000060E4(&qword_1000675E8);
    Binding.wrappedValue.getter(v12);
    v13 = fmin(v18 + 0.1, 1.0);
LABEL_6:
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v13;
    return Binding.wrappedValue.setter(&v18, v12);
  }
  if (v8 == enum case for AccessibilityAdjustmentDirection.decrement(_:))
  {
    v9 = a2[1];
    v10 = a2[2];
    v11 = a2[3];
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v12 = sub_1000060E4(&qword_1000675E8);
    Binding.wrappedValue.getter(v12);
    v13 = v18 + -0.1;
    if (v18 + -0.1 < 0.0)
      v13 = 0.0;
    goto LABEL_6;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

double sub_100037888()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  double v16;

  v1 = v0;
  v2 = type metadata accessor for LayoutDirection(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v15 - v7;
  type metadata accessor for PositionModifier(0);
  sub_1000140E0((uint64_t)v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, enum case for LayoutDirection.rightToLeft(_:), v2);
  v9 = static LayoutDirection.== infix(_:_:)(v8, v6);
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  v11 = v1[1];
  v12 = v1[2];
  v15[0] = *v1;
  v15[1] = v11;
  v15[2] = v12;
  v13 = sub_1000060E4(&qword_1000675E8);
  Binding.wrappedValue.getter(v13);
  if ((v9 & 1) != 0)
    return 1.0 - v16;
  else
    return v16;
}

uint64_t sub_1000379D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t result;
  double *v10;

  v5 = *(double *)(v2 + 32);
  v6 = v5 * 0.5;
  v7 = v5 * 0.5 + sub_100037888() * (*(double *)(v2 + 24) - v5);
  v8 = sub_1000060E4(&qword_100067850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  result = sub_1000060E4(&qword_100067858);
  v10 = (double *)(a2 + *(int *)(result + 36));
  *v10 = v7;
  v10[1] = v6;
  return result;
}

id sub_100037A5C()
{
  id result;

  result = sub_100037A78();
  qword_1000673F0 = (uint64_t)result;
  return result;
}

id sub_100037A78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  Class isa;
  uint64_t v7;

  v0 = type metadata accessor for Locale(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone((Class)NSNumberFormatter), "init");
  static Locale.current.getter();
  isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v4, "setLocale:", isa);

  objc_msgSend(v4, "setAllowsFloats:", 0);
  objc_msgSend(v4, "setNumberStyle:", 3);
  objc_msgSend(v4, "setMinimumFractionDigits:", 0);
  objc_msgSend(v4, "setMaximumFractionDigits:", 0);
  return v4;
}

id sub_100037B84()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)NSNumberFormatter), "init");
  qword_1000673F8 = (uint64_t)result;
  return result;
}

uint64_t sub_100037BB4(double a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", a1);
  if (qword_100065098 != -1)
    swift_once(&qword_100065098, sub_100037A5C);
  v2 = objc_msgSend((id)qword_1000673F0, "stringFromNumber:", v1);
  if (v2)
  {
    v3 = v2;
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  }
  else
  {

    return 0;
  }
  return v4;
}

uint64_t sub_100037C7C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  Swift::String_optional v19;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String_optional v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void (*v27)(char *, uint64_t);
  Swift::String v28;
  void *v29;
  NSString v30;
  id v31;
  id v32;
  double v33;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v35 - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v35 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v35 - v15;
  v17 = 0xE000000000000000;
  v39 = 0;
  v40 = 0xE000000000000000;
  v18 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v18 = a1 & 0xFFFFFFFFFFFFLL;
  v35 = a1;
  v36 = a2;
  v37 = 0;
  v38 = v18;
  swift_bridgeObjectRetain(a2);
  v19 = String.Iterator.next()();
  if (v19.value._object)
  {
    countAndFlagsBits = v19.value._countAndFlagsBits;
    object = v19.value._object;
    do
    {
      v23 = CharacterSet.init(charactersIn:)(countAndFlagsBits, object);
      static CharacterSet.decimalDigits.getter(v23);
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v16, v4);
      v24 = sub_100006848(&qword_1000674F8, (uint64_t (*)(uint64_t))&type metadata accessor for CharacterSet, (uint64_t)&protocol conformance descriptor for CharacterSet);
      dispatch thunk of SetAlgebra.intersection(_:)(v14, v4, v24);
      v25 = sub_100006848(&qword_100067500, (uint64_t (*)(uint64_t))&type metadata accessor for CharacterSet, (uint64_t)&protocol conformance descriptor for CharacterSet);
      v26 = dispatch thunk of static Equatable.== infix(_:_:)(v11, v16, v4, v25);
      v27 = *(void (**)(char *, uint64_t))(v5 + 8);
      v27(v11, v4);
      v27(v14, v4);
      v27(v16, v4);
      if ((v26 & 1) != 0)
      {
        v28._countAndFlagsBits = countAndFlagsBits;
        v28._object = object;
        String.append(_:)(v28);
      }
      swift_bridgeObjectRelease(object);
      v22 = String.Iterator.next()();
      countAndFlagsBits = v22.value._countAndFlagsBits;
      object = v22.value._object;
    }
    while (v22.value._object);
    v17 = v40;
  }
  swift_bridgeObjectRelease(v36);
  if (qword_1000650A0 != -1)
    swift_once(&qword_1000650A0, sub_100037B84);
  v29 = (void *)qword_1000673F8;
  v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  v31 = objc_msgSend(v29, "numberFromString:", v30);

  if (!v31)
    return 0;
  v32 = objc_msgSend(v31, "integerValue");

  v33 = (double)(uint64_t)v32 / 100.0;
  if (v33 < 0.0)
    v33 = 0.0;
  return fmin(v33, 1.0);
}

uint64_t sub_100037F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((sub_100038028(a1, a2) & 1) == 0)
    return 1;
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", a3, a4, v7);

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LOBYTE(v8) = sub_100038028(v9, v11);
  swift_bridgeObjectRelease(v11);
  return v8 & 1;
}

id sub_100038028(uint64_t a1, uint64_t a2)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id result;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;

  v26 = a1;
  v27 = a2;
  v2 = type metadata accessor for CharacterSet(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v26 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v26 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v26 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v26 - v17;
  v19 = static CharacterSet.decimalDigits.getter(v16);
  static CharacterSet.whitespaces.getter(v19);
  if (qword_100065098 != -1)
    swift_once(&qword_100065098, sub_100037A5C);
  result = objc_msgSend((id)qword_1000673F0, "percentSymbol", v26, v27);
  if (result)
  {
    v21 = result;
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v24 = v23;

    CharacterSet.init(charactersIn:)(v22, v24);
    swift_bridgeObjectRelease(v24);
    CharacterSet.union(_:)(v15);
    CharacterSet.union(_:)(v12);
    v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v6, v2);
    CharacterSet.init(charactersIn:)(v26, v27);
    LOBYTE(v21) = CharacterSet.isSuperset(of:)(v6);
    v25(v6, v2);
    v25(v9, v2);
    v25(v12, v2);
    v25(v15, v2);
    v25(v18, v2);
    return (id)(v21 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100038228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  Class isa;
  id result;
  uint64_t v7;

  v0 = type metadata accessor for Locale(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone((Class)NSNumberFormatter), "init");
  static Locale.current.getter();
  isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v4, "setLocale:", isa);

  result = objc_msgSend(v4, "setAllowsFloats:", 0);
  qword_100067400 = (uint64_t)v4;
  return result;
}

uint64_t sub_1000382FC(double a1)
{
  double v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;

  v1 = round(a1 * 255.0);
  if (qword_1000650A8 != -1)
    swift_once(&qword_1000650A8, sub_100038228);
  v2 = (void *)qword_100067400;
  v3 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", v1);
  v4 = objc_msgSend(v2, "stringFromNumber:", v3);

  if (!v4)
    return 0;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);

  return v5;
}

uint64_t sub_1000383D8()
{
  void *v0;
  NSString v1;
  id v2;
  id v3;
  double v4;

  if (qword_1000650A8 != -1)
    swift_once(&qword_1000650A8, sub_100038228);
  v0 = (void *)qword_100067400;
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "numberFromString:", v1);

  if (!v2)
    return 0;
  v3 = objc_msgSend(v2, "integerValue");

  v4 = fmin((double)(uint64_t)v3 / 255.0, 1.0);
  if (v4 < 0.0)
    v4 = 0.0;
  return *(_QWORD *)&v4;
}

BOOL sub_1000384BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v24;

  v6 = type metadata accessor for CharacterSet(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v24 - v11;
  v13 = String._bridgeToObjectiveC()();
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", a3, a4, v14);

  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v18 = v17;

  v19 = CharacterSet.init(charactersIn:)(v16, v18);
  static CharacterSet.decimalDigits.getter(v19);
  if ((CharacterSet.isSuperset(of:)(v12) & 1) != 0)
  {
    v20 = String.count.getter(v16, v18);
    swift_bridgeObjectRelease(v18);

    v21 = *(void (**)(char *, uint64_t))(v7 + 8);
    v21(v10, v6);
    v21(v12, v6);
    return v20 < 4;
  }
  else
  {
    swift_bridgeObjectRelease(v18);

    v23 = *(void (**)(char *, uint64_t))(v7 + 8);
    v23(v10, v6);
    v23(v12, v6);
    return 0;
  }
}

uint64_t sub_100038658()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain(v0[1]);
  return v1;
}

uint64_t sub_100038684()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain(*(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_1000386B0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_retain(*(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t sub_1000386DC@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = sub_1000060E4(&qword_1000674A0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = static HorizontalAlignment.leading.getter(v4);
  v8 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = 0x4014000000000000;
  if (v9 == (id)6)
    v10 = 0x4020000000000000;
  *(_QWORD *)v6 = v7;
  *((_QWORD *)v6 + 1) = v10;
  v6[16] = 0;
  v11 = sub_1000060E4(&qword_1000674A8);
  sub_1000387D8(v1, (uint64_t)&v6[*(int *)(v11 + 44)]);
  return sub_100009A88((uint64_t)v6, a1, &qword_1000674A0);
}

uint64_t sub_1000387D8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  unsigned __int8 *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  uint64_t v113;

  v108 = a2;
  v103 = sub_1000060E4(&qword_1000674B0);
  __chkstk_darwin(v103);
  v104 = (uint64_t *)((char *)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_1000060E4(&qword_1000674B8);
  v5 = __chkstk_darwin(v4);
  v107 = (char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v106 = (uint64_t)&v97 - v7;
  v8 = type metadata accessor for DynamicTypeSize(0);
  v100 = *(_QWORD *)(v8 - 8);
  v101 = v8;
  __chkstk_darwin(v8);
  v99 = (uint64_t)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000060E4(&qword_1000674C0);
  v11 = __chkstk_darwin(v10);
  v105 = (uint64_t)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v97 = (char *)&v97 - v14;
  __chkstk_darwin(v13);
  v16 = (char *)&v97 - v15;
  v17 = (void *)objc_opt_self(UIDevice);
  v18 = objc_msgSend(v17, "currentDevice");
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  v109 = a1;
  sub_100039CEC(*a1);
  v22 = v20;
  v23 = v21;
  v102 = v16;
  if (v19 != (id)6)
  {
    v110 = v20;
    v111 = v21;
    v24 = sub_10000CC44();
    v22 = StringProtocol.localizedUppercase.getter(&type metadata for String, v24);
    v26 = v25;
    swift_bridgeObjectRelease(v23);
    v23 = v26;
  }
  v110 = v22;
  v111 = v23;
  v98 = sub_10000CC44();
  v27 = Text.init<A>(_:)(&v110, &type metadata for String, v98);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = objc_msgSend(v17, "currentDevice");
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if (v35 == (id)6)
    v36 = static Font.headline.getter();
  else
    v36 = static Font.footnote.getter();
  v37 = v36;
  v38 = v31 & 1;
  v39 = Text.font(_:)(v36, v27, v29, v38, v33);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  swift_release(v37);
  v46 = v43 & 1;
  sub_10000CC88(v27, v29, v38);
  swift_bridgeObjectRelease(v33);
  v47 = type metadata accessor for ColorSlider(0);
  v48 = Text.fontWeight(_:)(*(_QWORD *)&v109[*(int *)(v47 + 28)], 0, v39, v41, v46, v45);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  sub_10000CC88(v39, v41, v46);
  swift_bridgeObjectRelease(v45);
  v55 = objc_msgSend(v17, "currentDevice");
  v56 = objc_msgSend(v55, "userInterfaceIdiom");

  if (v56 == (id)6)
    v58 = static Color.white.getter(v57);
  else
    v58 = static Color.secondary.getter();
  v59 = v58;
  v60 = v52 & 1;
  v61 = Text.foregroundColor(_:)(v58, v48, v50, v52 & 1, v54);
  v63 = v62;
  v65 = v64;
  v67 = v66;
  swift_release(v59);
  sub_10000CC88(v48, v50, v60);
  swift_bridgeObjectRelease(v54);
  v110 = v61;
  v111 = v63;
  v112 = v65 & 1;
  v113 = v67;
  v68 = (uint64_t)v97;
  View.accessibility(hidden:)(1, &type metadata for Text, &protocol witness table for Text);
  sub_10000CC88(v61, v63, v65 & 1);
  swift_bridgeObjectRelease(v67);
  v69 = (uint64_t)v102;
  sub_100009A88(v68, (uint64_t)v102, &qword_1000674C0);
  v70 = v99;
  v71 = sub_100013E74(v99);
  LOBYTE(v68) = DynamicTypeSize.isAccessibilitySize.getter(v71);
  v72 = (*(uint64_t (**)(uint64_t, uint64_t))(v100 + 8))(v70, v101);
  if ((v68 & 1) != 0)
  {
    v110 = static HorizontalAlignment.center.getter(v72);
    v111 = 0;
    v112 = 1;
    v73 = sub_1000098AC();
    v74 = &type metadata for VStackLayout;
  }
  else
  {
    v110 = static VerticalAlignment.center.getter(v72);
    v111 = 0x4030000000000000;
    v112 = 0;
    v73 = sub_100009868();
    v74 = &type metadata for HStackLayout;
  }
  v75 = AnyLayout.init<A>(_:)(&v110, v74, v73);
  v77 = v103;
  v76 = (uint64_t)v104;
  *v104 = v75;
  v78 = v76 + *(int *)(v77 + 44);
  swift_retain(v75);
  v79 = v78;
  v80 = (char *)v109;
  sub_100038DE8(v109, v79);
  sub_100039CEC(*v80);
  v110 = v81;
  v111 = v82;
  v83 = Text.init<A>(_:)(&v110, &type metadata for String, v98);
  v85 = v84;
  v87 = v86;
  v89 = v88 & 1;
  v90 = sub_10003AE80();
  v91 = (uint64_t)v107;
  View.accessibility(label:)(v83, v85, v89, v87, v77, v90);
  sub_10000CC88(v83, v85, v89);
  swift_bridgeObjectRelease(v87);
  sub_100009CF0(v76, &qword_1000674B0);
  v92 = v106;
  sub_100009A88(v91, v106, &qword_1000674B8);
  v93 = v105;
  sub_100009C1C(v69, v105, &qword_1000674C0);
  sub_100009C1C(v92, v91, &qword_1000674B8);
  v94 = v108;
  sub_100009C1C(v93, v108, &qword_1000674C0);
  v95 = sub_1000060E4(&qword_1000674E0);
  sub_100009C1C(v91, v94 + *(int *)(v95 + 48), &qword_1000674B8);
  swift_release(v75);
  sub_100009CF0(v92, &qword_1000674B8);
  sub_100009CF0(v69, &qword_1000674C0);
  sub_100009CF0(v91, &qword_1000674B8);
  return sub_100009CF0(v93, &qword_1000674C0);
}

uint64_t sub_100038DE8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unsigned __int8 *v40;
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
  _QWORD *v53;
  void *v54;
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
  id v68;
  id v69;
  id v70;
  double v71;
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
  int v82;
  id v83;
  int v84;
  char v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  uint64_t v88;
  uint64_t v89;
  _OWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t result;
  uint64_t v108;
  int v109;
  int v110;
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
  char *v125;
  unsigned __int8 *v126;
  uint64_t v127;
  unsigned __int8 v128;
  unsigned __int8 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t (*v149)(double *);
  uint64_t v150;
  uint64_t (*v151)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  uint64_t v166;
  unsigned __int8 v167;
  uint64_t v168;
  unsigned __int8 v169;
  uint64_t v170;
  uint64_t v171;

  v117 = a2;
  v3 = type metadata accessor for ColorSlider(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = (char *)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = type metadata accessor for CPSlider(0);
  v7 = __chkstk_darwin(v123);
  v9 = (char *)&v108 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v126 = a1;
  v127 = (uint64_t)&v108 - v10;
  LODWORD(v118) = *a1;
  sub_100009E80((uint64_t)a1, (uint64_t)v6, type metadata accessor for ColorSlider);
  v124 = type metadata accessor for MainActor(0);
  v11 = static MainActor.shared.getter(v124);
  v12 = *(unsigned __int8 *)(v4 + 80);
  v121 = v12;
  v122 = v5;
  v13 = ((v12 + 32) & ~v12) + v5;
  v14 = (v12 + 32) & ~v12;
  v15 = v12 | 7;
  v120 = v13;
  v115 = v12 | 7;
  v16 = swift_allocObject(&unk_10005C4C0, v13, v12 | 7);
  *(_QWORD *)(v16 + 16) = v11;
  *(_QWORD *)(v16 + 24) = &protocol witness table for MainActor;
  v119 = v14;
  sub_1000151B0((uint64_t)v6, v16 + v14, type metadata accessor for ColorSlider);
  v17 = (uint64_t)a1;
  v18 = (uint64_t)v6;
  v19 = sub_100009E80(v17, (uint64_t)v6, type metadata accessor for ColorSlider);
  v20 = static MainActor.shared.getter(v19);
  v21 = swift_allocObject(&unk_10005C4E8, v13, v15);
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = &protocol witness table for MainActor;
  sub_1000151B0(v18, v21 + v14, type metadata accessor for ColorSlider);
  Binding.init(get:set:)(&v142, sub_10003AF34, v16, sub_10003AFF4, v21, &type metadata for CGFloat);
  v22 = v142;
  v23 = v143;
  v24 = v144;
  v25 = (uint64_t)v126;
  v26 = *((_QWORD *)v126 + 1);
  v27 = *((_QWORD *)v126 + 2);
  v28 = type metadata accessor for ColorPickerState(0);
  v29 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  v30 = EnvironmentObject.projectedValue.getter(v26, v27, v28, v29);
  KeyPath = swift_getKeyPath(&unk_100047530);
  EnvironmentObject.Wrapper.subscript.getter(&v142, KeyPath, v30, v29);
  swift_release(KeyPath);
  swift_release(v30);
  v32 = v142;
  v33 = v143;
  v34 = v144;
  *v9 = v118;
  *((_QWORD *)v9 + 1) = v22;
  *((_QWORD *)v9 + 2) = v23;
  *((_QWORD *)v9 + 3) = v24;
  *((_QWORD *)v9 + 4) = v32;
  *((_QWORD *)v9 + 5) = v33;
  v9[48] = v34;
  v35 = v123;
  v36 = &v9[*(int *)(v123 + 28)];
  *(_QWORD *)v36 = swift_getKeyPath(&unk_100047558);
  v37 = sub_1000060E4(&qword_100065DC0);
  swift_storeEnumTagMultiPayload(v36, v37, 0);
  v38 = &v9[*(int *)(v35 + 32)];
  v118 = v28;
  v39 = v28;
  v40 = (unsigned __int8 *)v25;
  v113 = v29;
  v41 = v29;
  v42 = v115;
  *(_QWORD *)v38 = EnvironmentObject.init()(v39, v41);
  *((_QWORD *)v38 + 1) = v43;
  v125 = v9;
  sub_1000151B0((uint64_t)v9, v127, type metadata accessor for CPSlider);
  v44 = sub_100009E80(v25, v18, type metadata accessor for ColorSlider);
  v45 = static MainActor.shared.getter(v44);
  v46 = v120;
  v47 = swift_allocObject(&unk_10005C510, v120, v42);
  *(_QWORD *)(v47 + 16) = v45;
  *(_QWORD *)(v47 + 24) = &protocol witness table for MainActor;
  v48 = v119;
  sub_1000151B0(v18, v47 + v119, type metadata accessor for ColorSlider);
  v49 = sub_100009E80((uint64_t)v40, v18, type metadata accessor for ColorSlider);
  v50 = static MainActor.shared.getter(v49);
  v51 = swift_allocObject(&unk_10005C538, v46, v42);
  *(_QWORD *)(v51 + 16) = v50;
  *(_QWORD *)(v51 + 24) = &protocol witness table for MainActor;
  sub_1000151B0(v18, v51 + v48, type metadata accessor for ColorSlider);
  Binding.init(get:set:)(&v142, sub_10003AF34, v47, sub_10003AFF4, v51, &type metadata for CGFloat);
  v120 = v142;
  v124 = v143;
  v52 = v144;
  if (*v40 >= 3u)
  {
    *((_QWORD *)&v131 + 1) = &type metadata for PercentageSliderControlStyle;
    *(_QWORD *)&v132 = &off_10005C770;
    v53 = (_QWORD *)swift_allocObject(&unk_10005C560, 64, 7);
    v53[2] = sub_100037BB4;
    v53[3] = 0;
    v53[4] = sub_100037C7C;
    v53[5] = 0;
    v54 = sub_100037F58;
  }
  else
  {
    *((_QWORD *)&v131 + 1) = &type metadata for IntegerSliderControlStyle;
    *(_QWORD *)&v132 = &off_10005C750;
    v53 = (_QWORD *)swift_allocObject(&unk_10005C600, 64, 7);
    v53[2] = sub_1000382FC;
    v53[3] = 0;
    v53[4] = sub_1000383D8;
    v53[5] = 0;
    v54 = sub_1000384BC;
  }
  v53[6] = v54;
  v53[7] = 0;
  v55 = v121;
  *(_QWORD *)&v130 = v53;
  v56 = sub_1000060E4(&qword_1000674E8);
  LODWORD(v123) = swift_dynamicCast(&v142, &v130, v56, &type metadata for PercentageSliderControlStyle, 6);
  if ((_DWORD)v123)
  {
    v57 = v143;
    v58 = v145;
    swift_release(v147);
    swift_release(v58);
    swift_release(v57);
  }
  v59 = (uint64_t)v126;
  sub_100009E80((uint64_t)v126, v18, type metadata accessor for ColorSlider);
  v60 = (v55 + 16) & ~v55;
  v61 = v60 + v122;
  v122 = swift_allocObject(&unk_10005C588, v60 + v122, v42);
  sub_1000151B0(v18, v122 + v60, type metadata accessor for ColorSlider);
  sub_100009E80(v59, v18, type metadata accessor for ColorSlider);
  v116 = swift_allocObject(&unk_10005C5B0, v61, v42);
  sub_1000151B0(v18, v116 + v60, type metadata accessor for ColorSlider);
  sub_100009E80(v59, v18, type metadata accessor for ColorSlider);
  v115 = swift_allocObject(&unk_10005C5D8, v61, v42);
  sub_1000151B0(v18, v115 + v60, type metadata accessor for ColorSlider);
  v62 = v118;
  v63 = v113;
  v64 = EnvironmentObject.init()(v118, v113);
  v119 = v65;
  LOBYTE(v130) = 0;
  State.init(wrappedValue:)(&v142, &v130, &type metadata for Bool);
  LODWORD(v121) = v142;
  v114 = v143;
  sub_100039B6C();
  v67 = v66;
  v68 = objc_msgSend((id)objc_opt_self(UIFontMetrics), "defaultMetrics");
  v69 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v70 = objc_msgSend(v69, "userInterfaceIdiom");

  v71 = 36.0;
  if (v70 == (id)6)
    v71 = 44.0;
  v72 = v67;
  objc_msgSend(v68, "scaledValueForValue:", v71);
  v74 = v73;

  v76 = static Alignment.center.getter(v75);
  _FrameLayout.init(width:height:alignment:)(&v166, v72, 0, v74, 0, v76, v77);
  v78 = *(_QWORD *)(v59 + 8);
  if (v78)
  {
    v112 = v170;
    v113 = v171;
    v111 = v168;
    v118 = v166;
    v129 = v167;
    v128 = v169;
    v79 = swift_getKeyPath(&unk_100047588);
    v80 = swift_getKeyPath(&unk_1000475B0);
    v81 = swift_retain(v78);
    static Published.subscript.getter(&v142, v81, v79, v80);
    swift_release(v79);
    swift_release(v80);
    v82 = v146;
    swift_release(v78);
    v83 = sub_100008090(v82 != 2);
    v108 = Color.init(uiColor:)(v83);
    v84 = static Edge.Set.all.getter(v108);
    v85 = v84;
    v86 = v129;
    v109 = v84;
    v110 = v129;
    v87 = v128;
    LODWORD(v126) = v128;
    v88 = (uint64_t)v125;
    sub_100009E80(v127, (uint64_t)v125, type metadata accessor for CPSlider);
    v89 = v117;
    sub_100009E80(v88, v117, type metadata accessor for CPSlider);
    v90 = (_OWORD *)(v89 + *(int *)(sub_1000060E4(&qword_1000674F0) + 48));
    *(_QWORD *)&v130 = v64;
    *((_QWORD *)&v130 + 1) = v119;
    *(_QWORD *)&v131 = v120;
    *((_QWORD *)&v131 + 1) = v124;
    *(_QWORD *)&v132 = v52;
    BYTE8(v132) = 1;
    BYTE9(v132) = v123;
    *(_QWORD *)&v133 = 8;
    *((_QWORD *)&v133 + 1) = sub_10003B0B0;
    *(_QWORD *)&v134 = v122;
    *((_QWORD *)&v134 + 1) = sub_10003B1C8;
    v92 = v115;
    v91 = v116;
    *(_QWORD *)&v135 = v116;
    *((_QWORD *)&v135 + 1) = sub_10003B238;
    *(_QWORD *)&v136 = v115;
    BYTE8(v136) = v121;
    v117 = v64;
    v93 = v113;
    v94 = v114;
    *(_QWORD *)&v137 = v114;
    *((_QWORD *)&v137 + 1) = v118;
    LOBYTE(v138) = v86;
    v96 = v111;
    v95 = v112;
    *((_QWORD *)&v138 + 1) = v111;
    LOBYTE(v139) = v87;
    *((_QWORD *)&v139 + 1) = v112;
    *(_QWORD *)&v140 = v113;
    v97 = v108;
    *((_QWORD *)&v140 + 1) = v108;
    LOBYTE(v141) = v85;
    *((_QWORD *)&v141 + 1) = 0x4020000000000000;
    v98 = v134;
    v99 = v135;
    v100 = v137;
    v90[6] = v136;
    v90[7] = v100;
    v90[4] = v98;
    v90[5] = v99;
    v101 = v130;
    v102 = v131;
    v103 = v133;
    v90[2] = v132;
    v90[3] = v103;
    *v90 = v101;
    v90[1] = v102;
    v104 = v138;
    v105 = v139;
    v106 = v141;
    v90[10] = v140;
    v90[11] = v106;
    v90[8] = v104;
    v90[9] = v105;
    sub_10003B2BC((uint64_t *)&v130);
    sub_100009EC4(v127, type metadata accessor for CPSlider);
    v142 = v117;
    v143 = v119;
    v144 = v120;
    v145 = v124;
    v146 = v52;
    LOBYTE(v147) = 1;
    BYTE1(v147) = v123;
    v148 = 8;
    v149 = sub_10003B0B0;
    v150 = v122;
    v151 = sub_10003B1C8;
    v152 = v91;
    v153 = sub_10003B238;
    v154 = v92;
    v155 = v121;
    v156 = v94;
    v157 = v118;
    v158 = v110;
    v159 = v96;
    v160 = (char)v126;
    v161 = v95;
    v162 = v93;
    v163 = v97;
    v164 = v109;
    v165 = 0x4020000000000000;
    sub_10003B34C(&v142);
    return sub_100009EC4((uint64_t)v125, type metadata accessor for CPSlider);
  }
  else
  {
    result = EnvironmentObject.error()(0, *((_QWORD *)v126 + 2), v62, v63);
    __break(1u);
  }
  return result;
}

uint64_t sub_1000397AC(double *a1, unsigned __int8 *a2)
{
  double v2;
  ValueMetadata *v3;
  _UNKNOWN **v4;
  _QWORD *v5;
  void *v6;
  uint64_t (*v7)(double);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  ValueMetadata *v13;
  _UNKNOWN **v14;

  v2 = *a1;
  if (*a2 >= 3u)
  {
    v3 = &type metadata for PercentageSliderControlStyle;
    v4 = &off_10005C770;
    v13 = &type metadata for PercentageSliderControlStyle;
    v14 = &off_10005C770;
    v5 = (_QWORD *)swift_allocObject(&unk_10005C560, 64, 7);
    v5[2] = sub_100037BB4;
    v5[3] = 0;
    v5[4] = sub_100037C7C;
    v5[5] = 0;
    v6 = sub_100037F58;
  }
  else
  {
    v3 = &type metadata for IntegerSliderControlStyle;
    v4 = &off_10005C750;
    v13 = &type metadata for IntegerSliderControlStyle;
    v14 = &off_10005C750;
    v5 = (_QWORD *)swift_allocObject(&unk_10005C600, 64, 7);
    v5[2] = sub_1000382FC;
    v5[3] = 0;
    v5[4] = sub_1000383D8;
    v5[5] = 0;
    v6 = sub_1000384BC;
  }
  v5[6] = v6;
  v5[7] = 0;
  v12[0] = v5;
  sub_100018BB0(v12, (uint64_t)v3);
  v7 = (uint64_t (*)(double))((uint64_t (__cdecl *)())v4[1])();
  v9 = v8;
  v10 = v7(v2);
  swift_release(v9);
  sub_1000152C4(v12);
  return v10;
}

uint64_t sub_1000398D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  ValueMetadata *v7;
  _UNKNOWN **v8;
  _QWORD *v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  _QWORD v18[3];
  ValueMetadata *v19;
  _UNKNOWN **v20;

  if (*a3 >= 3u)
  {
    v7 = &type metadata for PercentageSliderControlStyle;
    v8 = &off_10005C770;
    v19 = &type metadata for PercentageSliderControlStyle;
    v20 = &off_10005C770;
    v9 = (_QWORD *)swift_allocObject(&unk_10005C560, 64, 7);
    v9[2] = sub_100037BB4;
    v9[3] = 0;
    v9[4] = sub_100037C7C;
    v9[5] = 0;
    v10 = sub_100037F58;
  }
  else
  {
    v7 = &type metadata for IntegerSliderControlStyle;
    v8 = &off_10005C750;
    v19 = &type metadata for IntegerSliderControlStyle;
    v20 = &off_10005C750;
    v9 = (_QWORD *)swift_allocObject(&unk_10005C600, 64, 7);
    v9[2] = sub_1000382FC;
    v9[3] = 0;
    v9[4] = sub_1000383D8;
    v9[5] = 0;
    v10 = sub_1000384BC;
  }
  v9[6] = v10;
  v9[7] = 0;
  v18[0] = v9;
  sub_100018BB0(v18, (uint64_t)v7);
  v11 = (uint64_t (*)(uint64_t, uint64_t))((uint64_t (__cdecl *)())v8[2])();
  v13 = v12;
  v14 = v11(a1, a2);
  v16 = v15;
  swift_release(v13);
  *(_QWORD *)a4 = v14;
  *(_BYTE *)(a4 + 8) = v16 & 1;
  return sub_1000152C4(v18);
}

uint64_t sub_100039A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7)
{
  ValueMetadata *v13;
  _UNKNOWN **v14;
  _QWORD *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD v22[3];
  ValueMetadata *v23;
  _UNKNOWN **v24;

  if (*a7 >= 3u)
  {
    v13 = &type metadata for PercentageSliderControlStyle;
    v14 = &off_10005C770;
    v23 = &type metadata for PercentageSliderControlStyle;
    v24 = &off_10005C770;
    v15 = (_QWORD *)swift_allocObject(&unk_10005C560, 64, 7);
    v15[2] = sub_100037BB4;
    v15[3] = 0;
    v15[4] = sub_100037C7C;
    v15[5] = 0;
    v16 = sub_100037F58;
  }
  else
  {
    v13 = &type metadata for IntegerSliderControlStyle;
    v14 = &off_10005C750;
    v23 = &type metadata for IntegerSliderControlStyle;
    v24 = &off_10005C750;
    v15 = (_QWORD *)swift_allocObject(&unk_10005C600, 64, 7);
    v15[2] = sub_1000382FC;
    v15[3] = 0;
    v15[4] = sub_1000383D8;
    v15[5] = 0;
    v16 = sub_1000384BC;
  }
  v15[6] = v16;
  v15[7] = 0;
  v22[0] = v15;
  sub_100018BB0(v22, (uint64_t)v13);
  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((uint64_t (__cdecl *)())v14[3])();
  v19 = v18;
  v20 = v17(a1, a2, a3, a4, a5, a6);
  swift_release(v19);
  sub_1000152C4(v22);
  return v20 & 1;
}

void sub_100039B6C()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  v3 = objc_msgSend((id)objc_opt_self(UIFontMetrics), "defaultMetrics");
  if (v2 == (id)6)
  {
    objc_msgSend(v3, "scaledValueForValue:", 88.0);
LABEL_7:

    return;
  }
  v4 = *(_QWORD *)(v0 + 8);
  if (v4)
  {
    KeyPath = swift_getKeyPath(&unk_1000475D0);
    v6 = swift_getKeyPath(&unk_1000475F8);
    v7 = swift_retain(v4);
    static Published.subscript.getter(&v12, v7, KeyPath, v6);
    swift_release(v4);
    swift_release(KeyPath);
    swift_release(v6);
    v8 = 76.0;
    if ((_BYTE)v12)
      v8 = 70.0;
    objc_msgSend(v3, "scaledValueForValue:", v8);
    goto LABEL_7;
  }
  v9 = *(_QWORD *)(v0 + 16);
  v10 = type metadata accessor for ColorPickerState(0);
  v11 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  EnvironmentObject.error()(0, v9, v10, v11);
  __break(1u);
}

void sub_100039CEC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100039D18()
{
  unint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;

  v0 = sub_1000152E4();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, v4);

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  return v6;
}

uint64_t sub_100039ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;

  v4 = type metadata accessor for ColorSlider(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a3 + 8);
  if (v7)
  {
    KeyPath = swift_getKeyPath(&unk_100047588);
    v9 = swift_getKeyPath(&unk_1000475B0);
    v10 = swift_retain(v7);
    static Published.subscript.getter(&v21, v10, KeyPath, v9);
    swift_release(v7);
    swift_release(KeyPath);
    swift_release(v9);
    v11 = v22;
    sub_100009E80(a3, (uint64_t)v6, type metadata accessor for ColorSlider);
    if (v11 != 2)
      goto LABEL_5;
    v12 = *((_QWORD *)v6 + 1);
    if (v12)
    {
      v13 = swift_getKeyPath(&unk_100047618);
      v14 = swift_getKeyPath(&unk_100047640);
      v15 = swift_retain(v12);
      static Published.subscript.getter(&v21, v15, v13, v14);
      swift_release(v12);
      swift_release(v13);
      swift_release(v14);
LABEL_5:
      sub_100009EC4((uint64_t)v6, type metadata accessor for ColorSlider);
      __asm { BR              X10 }
    }
    v16 = *((_QWORD *)v6 + 2);
  }
  else
  {
    v16 = *(_QWORD *)(a3 + 16);
  }
  v17 = type metadata accessor for ColorPickerState(0);
  v18 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v16, v17, v18);
  __break(1u);
  return result;
}

uint64_t sub_10003A0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;

  v5 = type metadata accessor for ColorSlider(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a4 + 8);
  if (v8)
  {
    KeyPath = swift_getKeyPath(&unk_100047588);
    v10 = swift_getKeyPath(&unk_1000475B0);
    v11 = swift_retain(v8);
    static Published.subscript.getter(&v22, v11, KeyPath, v10);
    swift_release(v8);
    swift_release(KeyPath);
    swift_release(v10);
    v12 = v23;
    sub_100009E80(a4, (uint64_t)v7, type metadata accessor for ColorSlider);
    if (v12 == 2)
    {
      v13 = *((_QWORD *)v7 + 1);
      if (!v13)
      {
        v17 = *((_QWORD *)v7 + 2);
        goto LABEL_9;
      }
      v14 = swift_getKeyPath(&unk_100047618);
      v15 = swift_getKeyPath(&unk_100047640);
      v16 = swift_retain(v13);
      static Published.subscript.getter(&v22, v16, v14, v15);
      swift_release(v13);
      swift_release(v14);
      swift_release(v15);
    }
    sub_100009EC4((uint64_t)v7, type metadata accessor for ColorSlider);
    if (*(_QWORD *)(a4 + 8))
      __asm { BR              X10 }
  }
  v17 = *(_QWORD *)(a4 + 16);
LABEL_9:
  v18 = type metadata accessor for ColorPickerState(0);
  v19 = sub_100006848((unint64_t *)&qword_100065350, type metadata accessor for ColorPickerState, (uint64_t)&unk_100045F30);
  result = EnvironmentObject.error()(0, v17, v18, v19);
  __break(1u);
  return result;
}

uint64_t sub_10003A318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = type metadata accessor for RoundedRectangle(0);
  v6 = __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *v2;
  v10 = (char *)v8 + *(int *)(v6 + 20);
  v11 = enum case for RoundedCornerStyle.continuous(_:);
  v12 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  *v8 = v9;
  v8[1] = v9;
  v13 = a2 + *(int *)(sub_1000060E4(&qword_1000675C0) + 36);
  sub_100009E80((uint64_t)v8, v13, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_1000060E4(&qword_1000656A8) + 36)) = 256;
  v14 = sub_1000060E4(&qword_1000675C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a2, a1, v14);
  return sub_100009EC4((uint64_t)v8, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
}

void sub_10003A43C(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = static HorizontalAlignment.center.getter(a1);
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  v6 = sub_1000060E4(&qword_100067860);
  sub_10003A494(a2, a1, a3 + *(int *)(v6 + 44));
}

void sub_10003A494(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v15;
  double v16;
  double v17;
  uint64_t v18;
  BOOL v19;
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
  uint64_t v30;
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v33 = a3;
  v5 = type metadata accessor for GeometryProxy(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = type metadata accessor for OpacityBackground(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000060E4(&qword_100067868);
  v34 = *(_QWORD *)(v12 - 8);
  v35 = v12;
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a2;
  GeometryProxy.size.getter(v13);
  v17 = v16 / *a1;
  if ((~*(_QWORD *)&v17 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v18 = (uint64_t)v17;
  if ((uint64_t)v17 <= 2)
    v18 = 2;
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    goto LABEL_12;
  if ((v20 & 0x8000000000000000) == 0)
  {
    v36[0] = 0;
    v36[1] = v20;
    KeyPath = swift_getKeyPath(&unk_1000478E0);
    sub_100009E80((uint64_t)a1, (uint64_t)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v5);
    v21 = *(unsigned __int8 *)(v9 + 80);
    v22 = (v21 + 16) & ~v21;
    v23 = *(unsigned __int8 *)(v6 + 80);
    v24 = (v10 + v23 + v22) & ~v23;
    v25 = swift_allocObject(&unk_10005C868, v24 + v7, v21 | v23 | 7);
    sub_1000151B0((uint64_t)v11, v25 + v22, type metadata accessor for OpacityBackground);
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v25 + v24, (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    v26 = sub_1000060E4(&qword_1000660E0);
    v27 = sub_1000060E4(&qword_100067870);
    v28 = sub_10001DA84();
    v29 = sub_100009FA0(&qword_100067878, &qword_100067870, (uint64_t)&protocol conformance descriptor for HStack<A>);
    ForEach<>.init(_:id:content:)(v36, KeyPath, sub_10003D458, v25, v26, v27, v28, &protocol witness table for Int, v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v33, v15, v35);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_10003A72C(uint64_t *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a1;
  *(_QWORD *)a3 = static VerticalAlignment.center.getter(a1);
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  v6 = sub_1000060E4(&qword_100067880);
  sub_10003A78C(a2, v5, a3 + *(int *)(v6 + 44));
}

void sub_10003A78C(double *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v6 = type metadata accessor for OpacityBackground(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000060E4(&qword_100067888);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = GeometryProxy.size.getter(v12) / *a1;
  if ((~*(_QWORD *)&v15 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v15 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v16 = (uint64_t)v15;
  if ((uint64_t)v15 <= 2)
    v16 = 2;
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    goto LABEL_12;
  if ((v18 & 0x8000000000000000) == 0)
  {
    v30[0] = 0;
    v30[1] = v18;
    KeyPath = swift_getKeyPath(&unk_1000478E0);
    v29 = v10;
    sub_100009E80((uint64_t)a1, (uint64_t)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
    v20 = *(unsigned __int8 *)(v7 + 80);
    v21 = (v20 + 16) & ~v20;
    v22 = (v8 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
    v23 = swift_allocObject(&unk_10005C890, v22 + 8, v20 | 7);
    sub_1000151B0((uint64_t)v9, v23 + v21, type metadata accessor for OpacityBackground);
    *(_QWORD *)(v23 + v22) = a2;
    v24 = sub_1000060E4(&qword_1000660E0);
    v25 = sub_1000060E4(&qword_100067890);
    v26 = sub_10001DA84();
    v27 = sub_10003D5EC();
    ForEach<>.init(_:id:content:)(v30, KeyPath, sub_10003D58C, v23, v24, v25, v26, &protocol witness table for Int, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a3, v14, v29);
    return;
  }
LABEL_13:
  __break(1u);
}

double sub_10003A9B0@<D0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  double result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v19;

  v6 = sub_10003AA4C(a3, *a1);
  v7 = *a2;
  v8 = static Alignment.center.getter(v6);
  _FrameLayout.init(width:height:alignment:)(&v15, v7, 0, v7, 0, v8, v9);
  v10 = v15;
  v11 = v16;
  v12 = v17;
  v13 = v18;
  *(_QWORD *)a4 = v6;
  *(_WORD *)(a4 + 8) = 256;
  *(_QWORD *)(a4 + 16) = v10;
  *(_BYTE *)(a4 + 24) = v11;
  *(_QWORD *)(a4 + 32) = v12;
  *(_BYTE *)(a4 + 40) = v13;
  result = *(double *)&v19;
  *(_OWORD *)(a4 + 48) = v19;
  return result;
}

uint64_t sub_10003AA4C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v3 = v2;
  v6 = type metadata accessor for ColorScheme(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v17 - v11;
  type metadata accessor for OpacityBackground(0);
  sub_100013EA8((uint64_t)v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, enum case for ColorScheme.dark(_:), v6);
  v13 = static ColorScheme.== infix(_:_:)(v12, v10);
  v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v15 = ((uint64_t (*)(char *, uint64_t))v14)(v12, v6);
  if ((v13 & 1) != 0)
  {
    result = static Color.black.getter(v15);
    if ((a2 & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    result = static Color.white.getter(v15);
    if ((a2 & 1) != 0)
    {
LABEL_3:
      if ((a1 & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  if ((a1 & 1) != 0)
    return result;
LABEL_4:
  swift_release(result);
  return swift_retain(*(_QWORD *)(v3 + 8));
}

uint64_t sub_10003AB6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  id v13;
  id v14;
  void (*v15)(char *, uint64_t, uint64_t);
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = a2;
  v3 = sub_1000060E4(&qword_1000678F0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060E4(&qword_1000678F8);
  __chkstk_darwin(v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000060E4(&qword_100067900);
  __chkstk_darwin(v10);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  if (v14 == (id)6)
  {
    v15(v12, a1, v3);
    *(_QWORD *)&v12[*(int *)(v10 + 36)] = 0x3FC999999999999ALL;
    sub_100009C1C((uint64_t)v12, (uint64_t)v9, &qword_100067900);
    swift_storeEnumTagMultiPayload(v9, v7, 0);
    v16 = sub_10003D828();
    v17 = sub_100009FA0(&qword_100067910, &qword_1000678F0, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    _ConditionalContent<>.init(storage:)(v9, v10, v3, v16, v17);
    return sub_100009CF0((uint64_t)v12, &qword_100067900);
  }
  else
  {
    v15(v6, a1, v3);
    v15(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload(v9, v7, 1);
    v19 = sub_10003D828();
    v20 = sub_100009FA0(&qword_100067910, &qword_1000678F0, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    _ConditionalContent<>.init(storage:)(v9, v10, v3, v19, v20);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_10003ADCC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_100009E80(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10005C840, v7 + v5, v6 | 7);
  result = sub_1000151B0((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for OpacityBackground);
  *a2 = sub_10003D2E8;
  a2[1] = (uint64_t (*)(uint64_t))v8;
  return result;
}

unint64_t sub_10003AE80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000674C8;
  if (!qword_1000674C8)
  {
    v1 = sub_100009E2C(&qword_1000674B0);
    sub_100009FA0(&qword_100065B00, &qword_100065B08, (uint64_t)&protocol conformance descriptor for _LayoutRoot<A>);
    sub_100009FA0(&qword_1000674D0, &qword_1000674D8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _VariadicView.Tree<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000674C8);
  }
  return result;
}

uint64_t type metadata accessor for CPSlider(uint64_t a1)
{
  return sub_10003C508(a1, (uint64_t *)&unk_100067568, (uint64_t)&nominal type descriptor for CPSlider);
}

uint64_t sub_10003AF3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ColorSlider(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v7 = sub_1000060E4(&qword_100065570);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10003B00C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSlider(0) - 8) + 80);
  return sub_100039ED8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_10003B050(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSlider(0) - 8) + 80);
  return sub_10003A0C4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_10003B094()
{
  return sub_10003B108(type metadata accessor for ColorSlider, &qword_100065570, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003B0B0(double *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSlider(0) - 8) + 80);
  return sub_1000397AC(a1, (unsigned __int8 *)(v1 + ((v3 + 16) & ~v3)));
}

uint64_t sub_10003B0EC()
{
  return sub_10003B108(type metadata accessor for ColorSlider, &qword_100065570, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003B108(uint64_t (*a1)(_QWORD), uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a1(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 16) & ~v8;
  v10 = *(_QWORD *)(v7 + 64);
  swift_release(*(_QWORD *)(v3 + v9 + 8));
  v11 = (_QWORD *)(v3 + v9 + *(int *)(v6 + 24));
  v12 = sub_1000060E4(a2);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    v13 = a3(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v11, v13);
  }
  else
  {
    swift_release(*v11);
  }
  return swift_deallocObject(v3, v9 + v10, v8 | 7);
}

uint64_t sub_10003B1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSlider(0) - 8) + 80);
  return sub_1000398D4(a1, a2, (unsigned __int8 *)(v3 + ((v7 + 16) & ~v7)), a3);
}

uint64_t sub_10003B21C()
{
  return sub_10003B108(type metadata accessor for ColorSlider, &qword_100065570, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003B238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;

  v13 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorSlider(0) - 8) + 80);
  return sub_100039A10(a1, a2, a3, a4, a5, a6, (unsigned __int8 *)(v6 + ((v13 + 16) & ~v13)));
}

uint64_t *sub_10003B2BC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[8];
  v6 = a1[10];
  v7 = a1[12];
  v8 = a1[21];
  swift_retain(a1[14]);
  swift_retain(v8);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t *sub_10003B34C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[8];
  v6 = a1[10];
  v7 = a1[12];
  v8 = a1[14];
  swift_release(a1[21]);
  swift_release(v7);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v2);
  swift_release(v3);
  swift_release(v8);
  return a1;
}

uint64_t sub_10003B3E0()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[5]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

ValueMetadata *type metadata accessor for IntegerSliderControlStyle()
{
  return &type metadata for IntegerSliderControlStyle;
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwxx_0(_QWORD *a1)
{
  swift_release(a1[1]);
  swift_release(a1[3]);
  return swift_release(a1[5]);
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwcp_0(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain(v3);
  swift_retain(v6);
  swift_retain(v4);
  return a1;
}

_QWORD *_s20ColorPickerUIService25IntegerSliderControlStyleVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_retain(v6);
  swift_release(v7);
  v9 = a2[4];
  v8 = a2[5];
  v10 = a1[5];
  a1[4] = v9;
  a1[5] = v8;
  swift_retain(v8);
  swift_release(v10);
  return a1;
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwta_0(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];
  swift_release(v6);
  return a1;
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_10003B5F4(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PercentageSliderControlStyle()
{
  return &type metadata for PercentageSliderControlStyle;
}

ValueMetadata *type metadata accessor for ColorSlider.PlatformBasedShapeModifier()
{
  return &type metadata for ColorSlider.PlatformBasedShapeModifier;
}

_BYTE *sub_10003B660(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _BYTE *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_BYTE *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a2[1];
    v8 = a2[2];
    *((_QWORD *)v4 + 1) = v7;
    *((_QWORD *)v4 + 2) = v8;
    v9 = a2[4];
    *((_QWORD *)v4 + 3) = a2[3];
    *((_QWORD *)v4 + 4) = v9;
    v10 = a2[5];
    v4[48] = *((_BYTE *)a2 + 48);
    v11 = *(int *)(a3 + 28);
    v12 = (uint64_t *)&v4[v11];
    v13 = (uint64_t *)((char *)a2 + v11);
    *((_QWORD *)v4 + 5) = v10;
    swift_retain(v7);
    swift_retain(v8);
    swift_retain(v9);
    swift_retain(v10);
    v14 = sub_1000060E4(&qword_100065DC0);
    if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
    {
      v15 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
      v16 = 1;
    }
    else
    {
      v18 = *v13;
      *v12 = *v13;
      swift_retain(v18);
      v16 = 0;
    }
    swift_storeEnumTagMultiPayload(v12, v14, v16);
    v19 = *(int *)(a3 + 32);
    v20 = &v4[v19];
    v21 = (uint64_t *)((char *)a2 + v19);
    v17 = *v21;
    v22 = v21[1];
    *v20 = v17;
    v20[1] = v22;
  }
  swift_retain(v17);
  return v4;
}

uint64_t sub_10003B798(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(a1[1]);
  swift_release(a1[2]);
  swift_release(a1[4]);
  swift_release(a1[5]);
  v4 = (_QWORD *)((char *)a1 + *(int *)(a2 + 28));
  v5 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  return swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 32)));
}

uint64_t sub_10003B838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v8;
  v9 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = *(int *)(a3 + 28);
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  *(_QWORD *)(a1 + 40) = v9;
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  v13 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
  {
    v14 = type metadata accessor for LayoutDirection(0);
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
  v17 = *(int *)(a3 + 32);
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  v21 = v19[1];
  *v18 = v20;
  v18[1] = v21;
  swift_retain(v20);
  return a1;
}

uint64_t sub_10003B948(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  swift_retain(v7);
  swift_release(v6);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  swift_retain(v8);
  swift_release(v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v11;
  swift_retain(v11);
  swift_release(v10);
  v12 = *(_QWORD *)(a2 + 40);
  v13 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v12;
  swift_retain(v12);
  swift_release(v13);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  if (a1 != a2)
  {
    v14 = *(int *)(a3 + 28);
    v15 = (uint64_t *)(a1 + v14);
    v16 = (uint64_t *)(a2 + v14);
    sub_100009CF0(a1 + v14, &qword_100065DC0);
    v17 = sub_1000060E4(&qword_100065DC0);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = 1;
    }
    else
    {
      v20 = *v16;
      *v15 = *v16;
      swift_retain(v20);
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v15, v17, v19);
  }
  v21 = *(int *)(a3 + 32);
  v22 = a1 + v21;
  v23 = (uint64_t *)(a2 + v21);
  v24 = *(_QWORD *)(a1 + v21);
  v25 = *v23;
  *(_QWORD *)(a1 + v21) = *v23;
  swift_retain(v25);
  swift_release(v24);
  *(_QWORD *)(v22 + 8) = v23[1];
  return a1;
}

uint64_t sub_10003BAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(int *)(a3 + 28);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_10003BB94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v8);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v9);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 28);
    v11 = (void *)(a1 + v10);
    v12 = (const void *)(a2 + v10);
    sub_100009CF0(a1 + v10, &qword_100065DC0);
    v13 = sub_1000060E4(&qword_100065DC0);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload(v11, v13, 1);
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = *(int *)(a3 + 32);
  v16 = a1 + v15;
  v17 = (_QWORD *)(a2 + v15);
  v18 = *(_QWORD *)(a1 + v15);
  *(_QWORD *)(a1 + v15) = *v17;
  swift_release(v18);
  *(_QWORD *)(v16 + 8) = v17[1];
  return a1;
}

uint64_t sub_10003BCD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003BCE4);
}

uint64_t sub_10003BCE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000060E4(&qword_100067508);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_10003BD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003BD70);
}

uint64_t sub_10003BD70(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_1000060E4(&qword_100067508);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_10003BDE8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = &unk_1000474B0;
  v4[1] = &unk_1000476C8;
  v4[2] = &unk_1000476E0;
  sub_10003D110(319, (unint64_t *)&unk_100067578, (uint64_t (*)(uint64_t))&type metadata accessor for LayoutDirection);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = &unk_1000474C8;
    swift_initStructMetadata(a1, 256, 5, v4, a1 + 16);
  }
}

uint64_t sub_10003BE88()
{
  return sub_100009FA0(&qword_1000675B8, &qword_1000674A0, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_10003BEB4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000523F0, 1);
}

uint64_t sub_10003BEC4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000523C8, 1);
}

uint64_t sub_10003BED8(uint64_t a1)
{
  return sub_10003D2FC(a1, type metadata accessor for CPSlider, (uint64_t (*)(uint64_t, uint64_t))sub_100035F44);
}

unint64_t sub_10003BEEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000675F8;
  if (!qword_1000675F8)
  {
    v1 = sub_100009E2C(&qword_1000675F0);
    sub_100009FA0(&qword_100067600, &qword_100067608, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000675F8);
  }
  return result;
}

unint64_t sub_10003BF70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067610;
  if (!qword_100067610)
  {
    v1 = sub_100009E2C(&qword_1000675D0);
    sub_10003BEEC();
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067610);
  }
  return result;
}

uint64_t sub_10003BFF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for CPSlider(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  swift_release(*(_QWORD *)(v0 + v4 + 16));
  swift_release(*(_QWORD *)(v0 + v4 + 32));
  swift_release(*(_QWORD *)(v0 + v4 + 40));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 28));
  v7 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)(v0 + v4 + *(int *)(v1 + 32)));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10003C0DC(uint64_t a1)
{
  return sub_10003C284(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100037708);
}

uint64_t sub_10003C0E8()
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
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for CPSlider(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = *(_QWORD *)(v7 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v9 + 8));
  swift_release(*(_QWORD *)(v0 + v9 + 16));
  swift_release(*(_QWORD *)(v0 + v9 + 32));
  swift_release(*(_QWORD *)(v0 + v9 + 40));
  v11 = (_QWORD *)(v0 + v9 + *(int *)(v6 + 28));
  v12 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    v13 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v11, v13);
  }
  else
  {
    swift_release(*v11);
  }
  swift_release(*(_QWORD *)(v0 + v9 + *(int *)(v6 + 32)));
  return swift_deallocObject(v0, v9 + v10, v3 | v8 | 7);
}

uint64_t sub_10003C20C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(type metadata accessor for GeometryProxy(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CPSlider(0) - 8) + 80);
  return sub_100037598(a1, v1 + v4, v1 + ((v4 + v5 + v6) & ~v6));
}

uint64_t sub_10003C278(uint64_t a1)
{
  return sub_10003C284(a1, sub_1000376B8);
}

uint64_t sub_10003C284(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CPSlider(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t type metadata accessor for PositionModifier(uint64_t a1)
{
  return sub_10003C508(a1, qword_100067760, (uint64_t)&nominal type descriptor for PositionModifier);
}

unint64_t sub_10003C2E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000676A8;
  if (!qword_1000676A8)
  {
    v1 = sub_100009E2C(&qword_100067668);
    sub_10003C368();
    sub_100009FA0(&qword_1000676D0, &qword_1000676A0, (uint64_t)&protocol conformance descriptor for _OverlayModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000676A8);
  }
  return result;
}

unint64_t sub_10003C368()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000676B0;
  if (!qword_1000676B0)
  {
    v1 = sub_100009E2C(&qword_100067660);
    sub_10003C3EC();
    sub_100009FA0(&qword_1000676C8, &qword_100067680, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000676B0);
  }
  return result;
}

unint64_t sub_10003C3EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000676B8;
  if (!qword_1000676B8)
  {
    v1 = sub_100009E2C(&qword_100067658);
    sub_100009FA0(&qword_1000676C0, &qword_100067650, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000676B8);
  }
  return result;
}

unint64_t sub_10003C470()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000676E0;
  if (!qword_1000676E0)
  {
    v1 = sub_100009E2C(&qword_100067630);
    sub_100020E10();
    sub_100006848(&qword_1000676E8, type metadata accessor for PositionModifier, (uint64_t)&unk_100047884);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000676E0);
  }
  return result;
}

uint64_t type metadata accessor for OpacityBackground(uint64_t a1)
{
  return sub_10003C508(a1, qword_1000677F8, (uint64_t)&nominal type descriptor for OpacityBackground);
}

uint64_t sub_10003C508(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_10003C544(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain(v5);
  }
  else
  {
    v7 = a2[1];
    v6 = a2[2];
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    v8 = *(int *)(a3 + 24);
    v9 = (uint64_t *)(a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain(v5);
    swift_retain(v7);
    v11 = sub_1000060E4(&qword_100065DC0);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = v9;
      v14 = v11;
      v15 = 1;
    }
    else
    {
      v16 = *v10;
      *v9 = *v10;
      swift_retain(v16);
      v13 = v9;
      v14 = v11;
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_10003C630(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*a1);
  swift_release(a1[1]);
  v4 = (_QWORD *)((char *)a1 + *(int *)(a2 + 24));
  v5 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for LayoutDirection(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t sub_10003C6B0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  v6 = *(int *)(a3 + 24);
  v7 = (uint64_t *)(a1 + v6);
  v8 = (uint64_t *)((char *)a2 + v6);
  swift_retain(v4);
  swift_retain(v5);
  v9 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
    v11 = 1;
  }
  else
  {
    v12 = *v8;
    *v7 = *v8;
    swift_retain(v12);
    v11 = 0;
  }
  swift_storeEnumTagMultiPayload(v7, v9, v11);
  return a1;
}

uint64_t *sub_10003C770(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  v8 = a2[1];
  v9 = a1[1];
  a1[1] = v8;
  swift_retain(v8);
  swift_release(v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 24);
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    sub_100009CF0((uint64_t)a1 + v10, &qword_100065DC0);
    v13 = sub_1000060E4(&qword_100065DC0);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for LayoutDirection(0);
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
  }
  return a1;
}

uint64_t sub_10003C874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = sub_1000060E4(&qword_100065DC0);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload(v5, v7, 1);
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t *sub_10003C92C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  v7 = a1[1];
  a1[1] = a2[1];
  swift_release(v7);
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  a1[4] = a2[4];
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    sub_100009CF0((uint64_t)a1 + v8, &qword_100065DC0);
    v11 = sub_1000060E4(&qword_100065DC0);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003CA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003CA28);
}

uint64_t sub_10003CA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003CF70(a1, a2, a3, &qword_100067508);
}

uint64_t sub_10003CA34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003CA40);
}

uint64_t sub_10003CA40(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1000060E4(&qword_100067508);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_10003CAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003D09C(a1, a2, a3, (uint64_t)&unk_1000476C8, (uint64_t)&unk_100047808, (unint64_t *)&unk_100067578, (uint64_t (*)(uint64_t))&type metadata accessor for LayoutDirection);
}

uint64_t *sub_10003CADC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v14);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 24);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain(v5);
    v9 = sub_1000060E4(&qword_100065B20);
    if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
    {
      v10 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
      v11 = v7;
      v12 = v9;
      v13 = 1;
    }
    else
    {
      v15 = *v8;
      *v7 = *v8;
      swift_retain(v15);
      v11 = v7;
      v12 = v9;
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_10003CBB8(uint64_t a1, uint64_t a2)
{
  return sub_10003CBCC(a1, a2, &qword_100065B20, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme);
}

uint64_t sub_10003CBCC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  swift_release(*(_QWORD *)(a1 + 8));
  v8 = (_QWORD *)(a1 + *(int *)(a2 + 24));
  v9 = sub_1000060E4(a3);
  if (swift_getEnumCaseMultiPayload(v8, v9) != 1)
    return swift_release(*v8);
  v10 = a4(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v8, v10);
}

_QWORD *sub_10003CC54(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (_QWORD *)((char *)a1 + v5);
  v7 = (_QWORD *)((char *)a2 + v5);
  swift_retain(v4);
  v8 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v6, v7, v9);
    v10 = 1;
  }
  else
  {
    v11 = *v7;
    *v6 = *v7;
    swift_retain(v11);
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v8, v10);
  return a1;
}

_QWORD *sub_10003CCFC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    sub_100009CF0((uint64_t)a1 + v8, &qword_100065B20);
    v11 = sub_1000060E4(&qword_100065B20);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
  }
  return a1;
}

_OWORD *sub_10003CDD8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload(v5, v7, 1);
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_10003CE80(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a1[1];
  a1[1] = a2[1];
  swift_release(v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_100009CF0((uint64_t)a1 + v7, &qword_100065B20);
    v10 = sub_1000060E4(&qword_100065B20);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003CF58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003CF64);
}

uint64_t sub_10003CF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003CF70(a1, a2, a3, &qword_100065FF8);
}

uint64_t sub_10003CF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v5;
  uint64_t v9;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF)
      LODWORD(v5) = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_1000060E4(a4);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_10003CFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003CFF8);
}

uint64_t sub_10003CFF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1000060E4(&qword_100065FF8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_10003D070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003D09C(a1, a2, a3, (uint64_t)&value witness table for Builtin.Int64 + 64, (uint64_t)&value witness table for Builtin.NativeObject + 64, (unint64_t *)&qword_100066068, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
}

void sub_10003D09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, uint64_t (*a7)(uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[0] = a4;
  v10[1] = a5;
  sub_10003D110(319, a6, a7);
  if (v9 <= 0x3F)
  {
    v10[2] = *(_QWORD *)(v8 - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v10, a1 + 16);
  }
}

void sub_10003D110(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

unint64_t sub_10003D160()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067838;
  if (!qword_100067838)
  {
    v1 = sub_100009E2C(&qword_1000675C0);
    sub_100009FA0(&qword_100067840, &qword_1000675C8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_100009FA0(&qword_1000656C8, &qword_1000656A8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067838);
  }
  return result;
}

unint64_t sub_10003D200()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100067848;
  if (!qword_100067848)
  {
    v1 = sub_100009E2C(&qword_1000675E0);
    v2[0] = sub_100009E2C(&qword_1000675D0);
    v2[1] = sub_10003BF70();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_100006848((unint64_t *)&qword_1000657D0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067848);
  }
  return result;
}

uint64_t sub_10003D2AC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005245C, 1);
}

uint64_t sub_10003D2BC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100052434, 1);
}

uint64_t sub_10003D2CC()
{
  return sub_10003B108(type metadata accessor for OpacityBackground, &qword_100065B20, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme);
}

uint64_t sub_10003D2E8(uint64_t a1)
{
  return sub_10003D2FC(a1, type metadata accessor for OpacityBackground, (uint64_t (*)(uint64_t, uint64_t))sub_10003A43C);
}

uint64_t sub_10003D2FC(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(a2(0) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

uint64_t sub_10003D358()
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
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = type metadata accessor for OpacityBackground(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v10 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v11 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v10, v12);
  }
  else
  {
    swift_release(*v10);
  }
  v13 = v3 | v8 | 7;
  v14 = (v4 + v5 + v8) & ~v8;
  v15 = v14 + v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v14, v6);
  return swift_deallocObject(v0, v15, v13);
}

void sub_10003D458(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = type metadata accessor for OpacityBackground(0);
  v6 = (*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  type metadata accessor for GeometryProxy(0);
  sub_10003A72C(a1, (double *)(v2 + v6), a2);
}

uint64_t sub_10003D4D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for OpacityBackground(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v7 = sub_1000060E4(&qword_100065B20);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_deallocObject(v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

double sub_10003D58C@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for OpacityBackground(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_10003A9B0(a1, (uint64_t *)(v2 + v6), *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), a2);
}

unint64_t sub_10003D5EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067898;
  if (!qword_100067898)
  {
    v1 = sub_100009E2C(&qword_100067890);
    sub_100009FA0(&qword_1000678A0, &qword_1000678A8, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067898);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpacityBackground.PlatformBasedOpacityModifier()
{
  return &type metadata for OpacityBackground.PlatformBasedOpacityModifier;
}

unint64_t sub_10003D684()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000678B0;
  if (!qword_1000678B0)
  {
    v1 = sub_100009E2C(&qword_100067858);
    sub_100009FA0(&qword_1000678B8, &qword_100067850, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_10003D708();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000678B0);
  }
  return result;
}

unint64_t sub_10003D708()
{
  unint64_t result;

  result = qword_1000678C0;
  if (!qword_1000678C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _PositionLayout, &type metadata for _PositionLayout);
    atomic_store(result, (unint64_t *)&qword_1000678C0);
  }
  return result;
}

unint64_t sub_10003D750()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000678C8;
  if (!qword_1000678C8)
  {
    v1 = sub_100009E2C(&qword_1000678D0);
    sub_100009FA0(&qword_1000678D8, &qword_1000678E0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    sub_10003D7D4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000678C8);
  }
  return result;
}

unint64_t sub_10003D7D4()
{
  unint64_t result;

  result = qword_1000678E8;
  if (!qword_1000678E8)
  {
    result = swift_getWitnessTable(&unk_100047920, &type metadata for OpacityBackground.PlatformBasedOpacityModifier);
    atomic_store(result, (unint64_t *)&qword_1000678E8);
  }
  return result;
}

uint64_t sub_10003D818(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100052484, 1);
}

unint64_t sub_10003D828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067908;
  if (!qword_100067908)
  {
    v1 = sub_100009E2C(&qword_100067900);
    sub_100009FA0(&qword_100067910, &qword_1000678F0, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067908);
  }
  return result;
}

unint64_t sub_10003D8B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100067918;
  if (!qword_100067918)
  {
    v1 = sub_100009E2C(&qword_100067920);
    sub_10003D828();
    sub_100009FA0(&qword_100067910, &qword_1000678F0, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100067918);
  }
  return result;
}

uint64_t sub_10003D940()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC20ColorPickerUIServiceP33_D307BB65DC256D00E4EEC5B631A99B9119ResourceBundleClass);
}

id sub_10003E8A4(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "eyedropperDidSelectColor:", a2);
    v3 = *(void **)(a1 + 32);
  }
  return _objc_msgSend(v3, "eyedropperDidDismiss");
}

float sub_10003EACC(float *a1, float a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  int v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  float v14;
  float v15;

  v2 = a1[1];
  v3 = *a1 * 3.0;
  v4 = (float)((float)(a1[2] - *a1) * 3.0) - v3;
  v5 = (float)(1.0 - v3) - v4;
  v6 = 8;
  v7 = a2;
  while (1)
  {
    v8 = v7 * (float)(v3 + (float)(v7 * (float)(v4 + (float)(v5 * v7))));
    if (vabds_f32(v8, a2) < 0.00001)
      break;
    v9 = v3 + (float)(v7 * (float)((float)(v4 + v4) + (float)((float)(v5 * 3.0) * v7)));
    if (fabsf(v9) >= 0.000001)
    {
      v7 = v7 - (float)((float)(v8 - a2) / v9);
      if (--v6)
        continue;
    }
    v7 = 0.0;
    if (a2 >= 0.0)
    {
      v7 = 1.0;
      if (a2 <= 1.0)
      {
        v10 = 0.0;
        v11 = 1.0;
        v12 = -1025;
        v7 = a2;
        do
        {
          if (__CFADD__(v12++, 1))
            break;
          v14 = v7 * (float)(v3 + (float)(v7 * (float)(v4 + (float)(v5 * v7))));
          if (vabds_f32(v14, a2) < 0.00001)
            break;
          if ((float)(v14 - a2) >= 0.0)
            v11 = v7;
          else
            v10 = v7;
          v7 = (float)(v11 - v10) * 0.5 + v10;
        }
        while (v10 < v11);
      }
    }
    break;
  }
  v15 = (float)((float)(a1[3] - v2) * 3.0) - (float)(v2 * 3.0);
  return v7
       * (float)((float)(v2 * 3.0)
               + (float)(v7 * (float)(v15 + (float)((float)((float)(1.0 - (float)(v2 * 3.0)) - v15) * v7))));
}

float sub_10003EC24(float *a1, float a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  int v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int v13;
  float v15;
  float v16;

  v2 = *a1;
  v3 = a1[1];
  v4 = v3 * 3.0;
  v5 = (float)((float)(a1[3] - v3) * 3.0) - (float)(v3 * 3.0);
  v6 = (float)(1.0 - v4) - v5;
  v7 = 8;
  v8 = a2;
  while (1)
  {
    v9 = v8 * (float)(v4 + (float)(v8 * (float)(v5 + (float)(v6 * v8))));
    if (vabds_f32(v9, a2) < 0.00001)
      break;
    v10 = v4 + (float)(v8 * (float)((float)(v5 + v5) + (float)((float)(v6 * 3.0) * v8)));
    if (fabsf(v10) >= 0.000001)
    {
      v8 = v8 - (float)((float)(v9 - a2) / v10);
      if (--v7)
        continue;
    }
    v8 = 0.0;
    if (a2 >= 0.0)
    {
      v8 = 1.0;
      if (a2 <= 1.0)
      {
        v11 = 0.0;
        v12 = 1.0;
        v13 = -1025;
        v8 = a2;
        do
        {
          if (__CFADD__(v13++, 1))
            break;
          v15 = v8 * (float)(v4 + (float)(v8 * (float)(v5 + (float)(v6 * v8))));
          if (vabds_f32(v15, a2) < 0.00001)
            break;
          if ((float)(v15 - a2) >= 0.0)
            v12 = v8;
          else
            v11 = v8;
          v8 = (float)(v12 - v11) * 0.5 + v11;
        }
        while (v11 < v12);
      }
    }
    break;
  }
  v16 = (float)((float)(a1[2] - v2) * 3.0) - (float)(v2 * 3.0);
  return v8
       * (float)((float)(v2 * 3.0)
               + (float)(v8 * (float)(v16 + (float)((float)((float)(1.0 - (float)(v2 * 3.0)) - v16) * v8))));
}

__n64 sub_10003ED7C(double a1)
{
  float v1;
  __n64 result;
  double v3;
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  float v9;
  float v10;

  v1 = 0.5 - *((float *)&a1 + 1) * 0.5;
  if (v1 >= 0.16667)
  {
    v3 = v1;
    if (v1 >= 0.33333)
    {
      if (v3 >= 0.500000015)
      {
        if (v1 >= 0.66667)
        {
          v8 = v3 * 6.0;
          if (v3 >= 0.833333358)
          {
            v10 = 1.0 - (v8 + -5.0);
            sub_10003EACC(flt_100047A20, v10);
            return (__n64)COERCE_UNSIGNED_INT(1.0);
          }
          else
          {
            v9 = v8 + -4.0;
            result.n64_f32[0] = sub_10003EACC(flt_100047A20, v9);
            result.n64_u32[1] = 0;
          }
        }
        else
        {
          v6 = 1.0 - (v3 * 6.0 + -3.0);
          v7 = sub_10003EACC(flt_100047A20, v6);
          result.n64_u32[0] = 0;
          result.n64_f32[1] = v7;
        }
      }
      else
      {
        v5 = v3 * 6.0 + -2.0;
        sub_10003EACC(flt_100047A20, v5);
        result.n64_u32[0] = 0;
        result.n64_u32[1] = 1.0;
      }
    }
    else
    {
      v4 = 1.0 - (v3 * 6.0 + -1.0);
      result.n64_f32[0] = sub_10003EACC(flt_100047A20, v4);
      result.n64_u32[1] = 1.0;
    }
  }
  else
  {
    return (__n64)__PAIR64__(COERCE_UNSIGNED_INT(sub_10003EACC(flt_100047A20, v1 * 6.0)), 1.0);
  }
  return result;
}

float sub_10003EF48(__n128 a1)
{
  float v4;
  float v5;
  float v6;

  if (a1.n128_f32[0] >= a1.n128_f32[1] && a1.n128_f32[0] >= a1.n128_f32[2])
  {
    v4 = (float)(a1.n128_f32[1] - a1.n128_f32[2]) / (float)(a1.n128_f32[0] - fminf(a1.n128_f32[1], a1.n128_f32[2]));
    goto LABEL_17;
  }
  if (a1.n128_f32[1] >= a1.n128_f32[0] && a1.n128_f32[1] >= a1.n128_f32[2])
  {
    v5 = (float)(a1.n128_f32[2] - a1.n128_f32[0]) / (float)(a1.n128_f32[1] - fminf(a1.n128_f32[0], a1.n128_f32[2]));
    v6 = 2.0;
LABEL_16:
    v4 = v5 + v6;
LABEL_17:
    while (v4 < 0.0)
      v4 = v4 + 6.0;
    return v4 * 60.0;
  }
  v4 = 0.0;
  if (a1.n128_f32[2] >= a1.n128_f32[0] && a1.n128_f32[2] >= a1.n128_f32[1])
  {
    v5 = (float)(a1.n128_f32[0] - a1.n128_f32[1]) / (float)(a1.n128_f32[2] - fminf(a1.n128_f32[0], a1.n128_f32[1]));
    v6 = 4.0;
    goto LABEL_16;
  }
  return v4 * 60.0;
}

float sub_10003EFE4(__n128 a1)
{
  float v1;
  __int128 v2;
  int v3;
  float v4;
  __n128 v5;
  float v6;
  __int128 v7;
  float v8;
  __int128 v10;

  v1 = sub_10003EF48(a1);
  *(_QWORD *)&v2 = 0;
  v3 = 100;
  v4 = 0.5;
  while (1)
  {
    v10 = v2;
    v5.n128_u64[0] = sub_10003ED7C(*(double *)&v2).n64_u64[0];
    v6 = sub_10003EF48(v5);
    if (vabds_f32(v1, v6) < 0.001)
      break;
    v7 = v10;
    if (v1 >= v6)
      v8 = -v4;
    else
      v8 = v4;
    *((float *)&v7 + 1) = *((float *)&v10 + 1) + v8;
    v4 = v4 * 0.5;
    --v3;
    v2 = v7;
    if (!v3)
      return *((float *)&v2 + 1);
  }
  DWORD1(v2) = DWORD1(v10);
  return *((float *)&v2 + 1);
}

void sub_10003F35C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10003F47C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10003F648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10003F6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10003F758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(_UIColorPickerUIServiceAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commonInit");
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegate");
}

id objc_msgSend__hostedWindowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hostedWindowScene");
}

id objc_msgSend__isEmbedded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEmbedded");
}

id objc_msgSend__isInPopoverPresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isInPopoverPresentation");
}

id objc_msgSend__pickerDidDismissEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidDismissEyedropper");
}

id objc_msgSend__pickerDidFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidFinish");
}

id objc_msgSend__pickerDidFloatEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidFloatEyedropper");
}

id objc_msgSend__pickerDidSelectColor_colorSpace_isVolatile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidSelectColor:colorSpace:isVolatile:");
}

id objc_msgSend__pickerDidShowEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidShowEyedropper");
}

id objc_msgSend__preferredWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredWidth");
}

id objc_msgSend__setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setConfiguration:");
}

id objc_msgSend__setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDelegate:");
}

id objc_msgSend__setInitialBuildingResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInitialBuildingResponder:");
}

id objc_msgSend__setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPreferredContentSize:");
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTouchInsets:");
}

id objc_msgSend__updateContentViewConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateContentViewConfiguration");
}

id objc_msgSend_actionForColorPickerDidDismissEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForColorPickerDidDismissEyedropper");
}

id objc_msgSend_actionForColorPickerDidFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForColorPickerDidFinish");
}

id objc_msgSend_actionForColorPickerDidFloatEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForColorPickerDidFloatEyedropper");
}

id objc_msgSend_actionForColorPickerDidSelectColor_colorSpace_isVolatile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForColorPickerDidSelectColor:colorSpace:isVolatile:");
}

id objc_msgSend_actionForColorPickerDidShowEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForColorPickerDidShowEyedropper");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorAttachments");
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorPixelFormat");
}

id objc_msgSend_colorWithDisplayP3Red_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithDisplayP3Red:green:blue:alpha:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandBuffer");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_currentDrawable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDrawable");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentRenderPassDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRenderPassDescriptor");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_drawPrimitives_vertexStart_vertexCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawPrimitives:vertexStart:vertexCount:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEncoding");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eyedropperDidSelectColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eyedropperDidSelectColor:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initializeVertexBuffer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeVertexBuffer");
}

id objc_msgSend_invokeEyedropper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeEyedropper");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keyboardLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardLayoutGuide");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainSystem");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:image:identifier:options:children:");
}

id objc_msgSend_newBufferWithBytes_length_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBufferWithBytes:length:options:");
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCommandQueue");
}

id objc_msgSend_newDefaultLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDefaultLibrary");
}

id objc_msgSend_newFunctionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newFunctionWithName:");
}

id objc_msgSend_newRenderPipelineStateWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRenderPipelineStateWithDescriptor:error:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_presentDrawable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDrawable:");
}

id objc_msgSend_renderCommandEncoderWithDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderCommandEncoderWithDescriptor:");
}

id objc_msgSend_replaceMenuForIdentifier_withMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceMenuForIdentifier:withMenu:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_sendAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAction:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setCaptureObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptureObject:");
}

id objc_msgSend_setClearColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearColor:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setFloatEyedropperOnStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloatEyedropperOnStart:");
}

id objc_msgSend_setFragmentFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFragmentFunction:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestsAsOpaque:");
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPixelFormat:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setRenderPipelineState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderPipelineState:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setVertexBuffer_offset_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexBuffer:offset:atIndex:");
}

id objc_msgSend_setVertexFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexFunction:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_set_preferredWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preferredWidth:");
}

id objc_msgSend_setupRenderPipeline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupRenderPipeline");
}

id objc_msgSend_sharedCaptureManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedCaptureManager");
}

id objc_msgSend_showSamplerWithSelectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSamplerWithSelectionHandler:");
}

id objc_msgSend_startCaptureWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCaptureWithDescriptor:error:");
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopCapture");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "system");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}
