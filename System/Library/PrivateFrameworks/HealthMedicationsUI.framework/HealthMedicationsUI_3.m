uint64_t sub_1BC2AB7FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  id v5;

  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1EDA0FCF0 != -1)
    swift_once();
  swift_beginAccess();
  objc_msgSend(v5, sel_postNotificationName_object_, qword_1EDA0ED30, a2);

  return a3(a2);
}

id sub_1BC2AB8C4(uint64_t a1, void *a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);
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
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a2;
  v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1BC0E7998(0, &qword_1EF3F9D20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v24 - v7;
  v9 = sub_1BC2B338C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0E38];
  sub_1BC0E7998(0, (unint64_t *)&unk_1EF3FCD50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0E38], v2);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v24 - v15;
  v17 = sub_1BC2B24A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_1BC2B3380();
  sub_1BC2B38F0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1BC0F2444((uint64_t)v16, (unint64_t *)&unk_1EF3FCD50, v13);
  sub_1BC2B2228();
  swift_bridgeObjectRelease();
  result = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (result)
  {
    v19 = result;
    sub_1BC2ACBB8((uint64_t)v8, (uint64_t)v6);
    v20 = sub_1BC2B2234();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v6, 1, v20) != 1)
    {
      v22 = (void *)sub_1BC2B2210();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v20);
    }
    sub_1BC1069E4(MEMORY[0x1E0DEE9D8]);
    v23 = (void *)sub_1BC2B43AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_openSensitiveURL_withOptions_, v22, v23);

    objc_msgSend(v25, sel_dismissViewControllerAnimated_completion_, 1, 0);
    return (id)sub_1BC0F2444((uint64_t)v8, &qword_1EF3F9D20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id _sSo17UIAlertControllerC19HealthMedicationsUIE46makeAlertForMedicationWithIncompatibleSchedule10deviceName9okHandler06cancelP0ABSS_yycSgAHtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  uint64_t aBlock;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  void *v41;
  uint64_t v42;

  if (qword_1EDA0FEE8 != -1)
    swift_once();
  v9 = (void *)qword_1EDA0FEF8;
  sub_1BC0E7998(0, qword_1EDA0ED40, (uint64_t (*)(uint64_t))sub_1BC15DBC0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BC2B92D0;
  *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v10 + 64) = sub_1BC0F2748();
  *(_QWORD *)(v10 + 32) = a1;
  *(_QWORD *)(v10 + 40) = a2;
  v11 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  sub_1BC2B443C();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v13 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v33 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v13, v14, 1, 0xE000000000000000);

  v15 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  sub_1BC0F2690(a3);
  v17 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v41 = sub_1BC2ACB1C;
  v42 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v38 = 1107296256;
  v39 = sub_1BC1D2994;
  v40 = &block_descriptor_18_1;
  v18 = _Block_copy(&aBlock);
  swift_release();
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
  _Block_release(v18);

  v21 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a5;
  *(_QWORD *)(v22 + 24) = a6;
  sub_1BC0F2690(a5);
  v23 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v41 = sub_1BC2ACB1C;
  v42 = v22;
  aBlock = MEMORY[0x1E0C809B0];
  v38 = 1107296256;
  v39 = sub_1BC1D2994;
  v40 = &block_descriptor_24_0;
  v24 = _Block_copy(&aBlock);
  swift_release();
  v25 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v23, 0, v24, 0xE000000000000000);
  _Block_release(v24);

  v26 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v33;
  v28 = v33;
  v29 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v41 = sub_1BC2ACBB0;
  v42 = v27;
  aBlock = MEMORY[0x1E0C809B0];
  v38 = 1107296256;
  v39 = sub_1BC1D2994;
  v40 = &block_descriptor_30;
  v30 = _Block_copy(&aBlock);
  swift_release();
  v31 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v29, 1, v30, 0xE000000000000000);
  _Block_release(v30);

  objc_msgSend(v28, sel_addAction_, v20);
  objc_msgSend(v28, sel_addAction_, v25);
  objc_msgSend(v28, sel_addAction_, v31);

  return v28;
}

id _sSo17UIAlertControllerC19HealthMedicationsUIE27makeAlertForExsitingConcept7concept11listManager11showHandlerABSgSo9HKConceptC_0C22RecordsConceptsSupport04ListjM0CySo022HKMedicationUserDomainJ0CctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v30;
  _QWORD aBlock[6];

  if (qword_1EDA0FEE8 != -1)
    swift_once();
  v4 = (void *)qword_1EDA0FEF8;
  sub_1BC0E7998(0, qword_1EDA0ED40, (uint64_t (*)(uint64_t))sub_1BC15DBC0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BC2B92D0;
  v6 = v4;
  swift_bridgeObjectRetain();
  v7 = sub_1BC2B4F4C();
  v9 = sub_1BC1F3134(v7, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v5 + 64) = sub_1BC0F2748();
  *(_QWORD *)(v5 + 32) = v9;
  *(_QWORD *)(v5 + 40) = v11;
  sub_1BC2B2144();
  if (*(_QWORD *)(v5 + 16))
  {
    sub_1BC2B443C();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

  }
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v12, 0, 1, 0xE000000000000000);

  v14 = (void *)sub_1BC2B3920();
  if (!v14)
  {
    v14 = (void *)sub_1BC2B3908();
    if (!v14)
    {

      return 0;
    }
  }
  v15 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v14;
  v16[3] = a3;
  v16[4] = a4;
  v30 = v14;
  swift_retain();
  v17 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1BC2ACB4C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC1D2994;
  aBlock[3] = &block_descriptor_12_1;
  v18 = _Block_copy(aBlock);
  swift_release();
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
  _Block_release(v18);

  v21 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v22 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v22, 1, 0, 0xE000000000000000);

  objc_msgSend(v13, sel_addAction_, v20);
  objc_msgSend(v13, sel_addAction_, v23);
  v24 = (void *)sub_1BC2B3920();

  if (!v24)
  {
    v25 = (void *)sub_1BC2B3908();

    if (v25)
    {
      v26 = (id)qword_1EDA0FEF8;
      swift_bridgeObjectRetain();
      sub_1BC2B2144();
      swift_bridgeObjectRelease();

      v27 = (void *)sub_1BC2B4430();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setMessage_, v27, 0xE000000000000000);

      return v13;
    }

    return 0;
  }

  return v13;
}

id _sSo17UIAlertControllerC19HealthMedicationsUIE31makeAlertForArchivingMedication9onConfirm0K6CancelAByyc_yycSgtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t aBlock;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  uint64_t (*v29)();
  uint64_t v30;

  if (qword_1EDA0FEE8 != -1)
    swift_once();
  v5 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v6 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v7 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v7, v8, 1, 0xE000000000000000);

  v10 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  swift_retain();
  v12 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v29 = sub_1BC118CE4;
  v30 = v11;
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_1BC1D2994;
  v28 = &block_descriptor_32;
  v13 = _Block_copy(&aBlock);
  swift_release();
  v14 = (void *)objc_opt_self();
  v15 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v12, 0, v13, 0xE000000000000000);
  _Block_release(v13);

  v16 = (id)qword_1EDA0FEF8;
  swift_bridgeObjectRetain();
  sub_1BC2B2144();
  swift_bridgeObjectRelease();

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  sub_1BC0F2690(a3);
  v18 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v29 = sub_1BC2ACB1C;
  v30 = v17;
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_1BC1D2994;
  v28 = &block_descriptor_6_0;
  v19 = _Block_copy(&aBlock);
  swift_release();
  v20 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v18, 1, v19, 0xE000000000000000);
  _Block_release(v19);

  objc_msgSend(v9, sel_addAction_, v15);
  objc_msgSend(v9, sel_addAction_, v20);

  return v9;
}

uint64_t sub_1BC2ACAF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC2ACB20()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC2ACB4C(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC2AB7FC(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t objectdestroy_2Tm_3()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC2ACB8C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1BC2ACBB0(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC2AB8C4(a1, *(void **)(v1 + 16));
}

uint64_t sub_1BC2ACBB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0E7998(0, &qword_1EF3F9D20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FieldItem.init(text:placeholder:height:isEnabled:isNumeric:characterLimit:verticalAlignment:firstResponderHandler:hasClearButton:updateHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  int *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  _QWORD *v29;

  sub_1BC2B242C();
  v20 = (int *)type metadata accessor for FieldItem();
  v21 = (_QWORD *)(a9 + v20[5]);
  v22 = (_QWORD *)(a9 + v20[6]);
  v23 = a9 + v20[10];
  v24 = (_QWORD *)(a9 + v20[14]);
  v25 = (uint64_t *)(a9 + v20[15]);
  type metadata accessor for FieldCell();
  sub_1BC0E008C(&qword_1EF4020C0, v26, (uint64_t (*)(uint64_t))type metadata accessor for FieldCell, (uint64_t)&unk_1BC2C6D84);
  result = sub_1BC2B2930();
  *v25 = result;
  v25[1] = v28;
  *v21 = a1;
  v21[1] = a2;
  *v22 = a3;
  v22[1] = a4;
  *(double *)(a9 + v20[7]) = a10;
  *(_QWORD *)v23 = a7;
  *(_BYTE *)(v23 + 8) = a8 & 1;
  *(_BYTE *)(a9 + v20[9]) = a6;
  *(_BYTE *)(a9 + v20[8]) = a5;
  *(_QWORD *)(a9 + v20[12]) = a11;
  *v24 = a12;
  v24[1] = a13;
  v29 = (_QWORD *)(a9 + v20[13]);
  *v29 = a15;
  v29[1] = a16;
  *(_BYTE *)(a9 + v20[11]) = a14;
  return result;
}

uint64_t type metadata accessor for FieldItem()
{
  uint64_t result;

  result = qword_1EF402128;
  if (!qword_1EF402128)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for FieldCell()
{
  return objc_opt_self();
}

uint64_t FieldItem.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BC2B2438();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FieldItem.text.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for FieldItem() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FieldItem.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for FieldItem() + 20));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FieldItem.text.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.placeholder.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for FieldItem() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FieldItem.placeholder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for FieldItem() + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FieldItem.placeholder.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

double FieldItem.height.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for FieldItem() + 28));
}

uint64_t FieldItem.height.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FieldItem();
  *(double *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*FieldItem.height.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.isEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FieldItem() + 32));
}

uint64_t FieldItem.isEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FieldItem();
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*FieldItem.isEnabled.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.isNumeric.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FieldItem() + 36));
}

uint64_t FieldItem.isNumeric.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FieldItem();
  *(_BYTE *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*FieldItem.isNumeric.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.characterLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for FieldItem() + 40));
}

uint64_t FieldItem.characterLimit.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for FieldItem();
  v6 = v2 + *(int *)(result + 40);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*FieldItem.characterLimit.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.hasClearButton.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FieldItem() + 44));
}

uint64_t FieldItem.hasClearButton.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FieldItem();
  *(_BYTE *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*FieldItem.hasClearButton.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.verticalAlignment.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for FieldItem() + 48));
}

uint64_t FieldItem.verticalAlignment.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FieldItem();
  *(_QWORD *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*FieldItem.verticalAlignment.modify())()
{
  type metadata accessor for FieldItem();
  return nullsub_1;
}

uint64_t FieldItem.reuseIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for FieldItem() + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FieldItem.uniqueIdentifier.getter()
{
  sub_1BC2B23FC();
  sub_1BC2B44FC();
  swift_bridgeObjectRelease();
  return 0x657449646C656946;
}

double static FieldItem.defaultTextFieldHeight.getter()
{
  return 44.0;
}

uint64_t FieldItem.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for FieldItem();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 20) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  if (*(_QWORD *)(v0 + *(int *)(v1 + 24) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  return sub_1BC2B5480();
}

uint64_t FieldItem.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_1BC2B5450();
  v1 = type metadata accessor for FieldItem();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 20) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  if (*(_QWORD *)(v0 + *(int *)(v1 + 24) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  sub_1BC2B5480();
  return sub_1BC2B548C();
}

uint64_t sub_1BC2AD508(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(v2 + *(int *)(a2 + 20) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  if (*(_QWORD *)(v2 + *(int *)(a2 + 24) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  return sub_1BC2B5480();
}

uint64_t sub_1BC2AD5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC2B5450();
  if (*(_QWORD *)(v2 + *(int *)(a2 + 20) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  if (*(_QWORD *)(v2 + *(int *)(a2 + 24) + 8))
  {
    sub_1BC2B5468();
    swift_bridgeObjectRetain();
    sub_1BC2B44D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC2B5468();
  }
  sub_1BC2B5480();
  return sub_1BC2B548C();
}

uint64_t sub_1BC2AD6E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BC2AD718()
{
  sub_1BC2B23FC();
  sub_1BC2B44FC();
  swift_bridgeObjectRelease();
  return 0x657449646C656946;
}

uint64_t sub_1BC2AD770(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 40));
}

char *sub_1BC2AD784()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  char *v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField;
  v2 = *(void **)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField];
  if (v2)
  {
    v3 = *(char **)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField];
  }
  else
  {
    v4 = sub_1BC2AD7E4(v0);
    v5 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

char *sub_1BC2AD7E4(void *a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  char *v13;
  id v14;
  char *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  type metadata accessor for UITextFieldWithInsets();
  v2 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_1BC2B4868();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = &v2[OBJC_IVAR____TtC19HealthMedicationsUI21UITextFieldWithInsets_insets];
  swift_beginAccess();
  *(_QWORD *)v11 = v4;
  *((_QWORD *)v11 + 1) = v6;
  *((_QWORD *)v11 + 2) = v8;
  *((_QWORD *)v11 + 3) = v10;
  v11[32] = 0;
  v12 = (void *)objc_opt_self();
  v13 = v2;
  v14 = objc_msgSend(v12, sel_secondarySystemBackgroundColor);
  objc_msgSend(v13, sel_setBackgroundColor_, v14);

  objc_msgSend(v13, sel_setAdjustsFontForContentSizeCategory_, 1);
  sub_1BC0E1D38(0, (unint64_t *)&qword_1EDA0FDC0);
  v15 = v13;
  v16 = (void *)sub_1BC2B4C64();
  objc_msgSend(v15, sel_setFont_, v16);

  objc_msgSend(v15, sel_setContentVerticalAlignment_, 1);
  v17 = v15;
  if (objc_msgSend(a1, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
    v18 = 2;
  else
    v18 = 1;
  objc_msgSend(v17, sel_setContentHorizontalAlignment_, v18);

  objc_msgSend(v17, sel_setBorderStyle_, 0);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1BC2B263C();
  v19 = (id)*MEMORY[0x1E0CD2A68];
  sub_1BC2B4C88();

  objc_msgSend(v17, sel_setDelegate_, a1);
  objc_msgSend(v17, sel_addTarget_action_forControlEvents_, a1, sel_textFieldDidChangeWithSender_, 0x20000);
  sub_1BC0E7940();
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1BC2B92B0;
  *(_QWORD *)(v20 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 5, a1, 0);
  *(_QWORD *)(v20 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 0, a1, sel_didTapDoneWithSender_);
  sub_1BC2B45A4();
  sub_1BC2B485C();
  swift_bridgeObjectRelease();
  return v17;
}

id sub_1BC2ADAE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;

  v1 = v0;
  v2 = sub_1BC2B24A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter;
  v7 = *(void **)(v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter);
  if (v7)
  {
    v8 = *(id *)(v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter);
  }
  else
  {
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
    objc_msgSend(v9, sel_setNumberStyle_, 1);
    sub_1BC2B2468();
    v10 = (void *)sub_1BC2B245C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v9, sel_setLocale_, v10);

    v11 = *(void **)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v9;
    v8 = v9;

    v7 = 0;
  }
  v12 = v7;
  return v8;
}

char *sub_1BC2ADBEC(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  id v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  *(_QWORD *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter] = 0;
  v9 = (uint64_t *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier];
  v20 = sub_1BC2B4460();
  v21 = v10;
  swift_bridgeObjectRetain();
  sub_1BC2B44FC();
  v11 = v4;
  swift_bridgeObjectRelease();
  *v9 = v20;
  v9[1] = v21;
  v12 = &v11[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item];
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_QWORD *)v12 + 4) = 0;

  v22.receiver = v11;
  v22.super_class = (Class)type metadata accessor for FieldCell();
  v13 = (char *)objc_msgSendSuper2(&v22, sel_initWithFrame_, a1, a2, a3, a4);
  v14 = objc_msgSend(v13, sel_contentView);
  v15 = sub_1BC2AD784();
  objc_msgSend(v14, sel_addSubview_, v15);

  v16 = (uint64_t *)&v13[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier];
  swift_beginAccess();
  v18 = *v16;
  v17 = v16[1];
  swift_bridgeObjectRetain();
  sub_1BC2AF9E8(v18, v17);
  swift_bridgeObjectRelease();

  return v13;
}

void sub_1BC2ADDA8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  _BYTE v36[24];
  _QWORD v37[5];

  sub_1BC0E1C64(0, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v36[-v2];
  sub_1BC0E7940();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BC2BDB30;
  v5 = sub_1BC2AD784();
  v6 = objc_msgSend(v5, sel_leadingAnchor);

  v7 = objc_msgSend(v0, sel_contentView);
  v8 = objc_msgSend(v7, sel_leadingAnchor);

  v9 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v8);
  *(_QWORD *)(v4 + 32) = v9;
  v10 = sub_1BC2AD784();
  v11 = objc_msgSend(v10, sel_trailingAnchor);

  v12 = objc_msgSend(v0, sel_contentView);
  v13 = objc_msgSend(v12, sel_trailingAnchor);

  v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(_QWORD *)(v4 + 40) = v14;
  v15 = sub_1BC2AD784();
  v16 = objc_msgSend(v15, sel_topAnchor);

  v17 = objc_msgSend(v0, sel_contentView);
  v18 = objc_msgSend(v17, sel_topAnchor);

  v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(_QWORD *)(v4 + 48) = v19;
  v20 = sub_1BC2AD784();
  v21 = objc_msgSend(v20, sel_bottomAnchor);

  v22 = objc_msgSend(v0, sel_contentView);
  v23 = objc_msgSend(v22, sel_bottomAnchor);

  v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(_QWORD *)(v4 + 56) = v24;
  v25 = sub_1BC2AD784();
  v26 = objc_msgSend(v25, sel_heightAnchor);

  v27 = (uint64_t)v0 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1BC0E5774(v27, (uint64_t)v37);
  if (!v37[3])
  {
    sub_1BC0E1CFC((uint64_t)v37, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    v32 = type metadata accessor for FieldItem();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v3, 1, 1, v32);
    goto LABEL_5;
  }
  sub_1BC0E1B94();
  v28 = type metadata accessor for FieldItem();
  v29 = swift_dynamicCast();
  v30 = *(_QWORD *)(v28 - 8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v3, v29 ^ 1u, 1, v28);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v30 + 48))(v3, 1, v28) == 1)
  {
LABEL_5:
    sub_1BC0E1CFC((uint64_t)v3, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
    v31 = 44.0;
    goto LABEL_6;
  }
  v31 = *(double *)&v3[*(int *)(v28 + 28)];
  sub_1BC1E18F4((uint64_t)v3);
LABEL_6:
  v33 = (void *)objc_opt_self();
  v34 = objc_msgSend(v26, sel_constraintGreaterThanOrEqualToConstant_, v31);

  *(_QWORD *)(v4 + 64) = v34;
  v37[0] = v4;
  sub_1BC2B45A4();
  sub_1BC0E1D38(0, (unint64_t *)&qword_1EDA0FCE0);
  v35 = (void *)sub_1BC2B4580();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_activateConstraints_, v35);

}

uint64_t sub_1BC2AE228()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int v13;
  char *v14;
  char *v15;
  id v16;
  char *v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  char *v27;
  void *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  id v35;
  id v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];

  v1 = sub_1BC2B39E0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0E1C64(0, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v43 - v6;
  v8 = (int *)type metadata accessor for FieldItem();
  v9 = *((_QWORD *)v8 - 1);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)v0 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1BC0E5774(v12, (uint64_t)v45);
  if (v45[3])
  {
    sub_1BC0E1B94();
    v13 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v9 + 56))(v7, v13 ^ 1u, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v9 + 48))(v7, 1, v8) != 1)
    {
      sub_1BC2B1050((uint64_t)v7, (uint64_t)v11);
      v14 = sub_1BC2AD784();
      v15 = sub_1BC2AD784();
      v16 = objc_msgSend(v15, sel_constraints);

      if (!v16)
      {
        sub_1BC0E1D38(0, (unint64_t *)&qword_1EDA0FCE0);
        sub_1BC2B458C();
        v16 = (id)sub_1BC2B4580();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v14, sel_removeConstraints_, v16);

      sub_1BC2ADDA8();
      v17 = sub_1BC2AD784();
      if (*(_QWORD *)&v11[v8[5] + 8])
      {
        swift_bridgeObjectRetain();
        v18 = (void *)sub_1BC2B4430();
        swift_bridgeObjectRelease();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v17, sel_setText_, v18);

      v27 = sub_1BC2AD784();
      if (*(_QWORD *)&v11[v8[6] + 8])
      {
        swift_bridgeObjectRetain();
        v28 = (void *)sub_1BC2B4430();
        swift_bridgeObjectRelease();
      }
      else
      {
        v28 = 0;
      }
      objc_msgSend(v27, sel_setPlaceholder_, v28);

      v29 = sub_1BC2AD784();
      objc_msgSend(v29, sel_setContentVerticalAlignment_, *(_QWORD *)&v11[v8[12]]);

      v30 = sub_1BC2AD784();
      if (objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
        v31 = 2;
      else
        v31 = 1;
      objc_msgSend(v30, sel_setContentHorizontalAlignment_, v31);

      if (v11[v8[9]] == 1)
      {
        v32 = sub_1BC2AD784();
        objc_msgSend(v32, sel_setKeyboardType_, 8);

      }
      if (v11[v8[11]] == 1)
      {
        v33 = sub_1BC2AD784();
        objc_msgSend(v33, sel_setClearButtonMode_, 1);

      }
      v34 = sub_1BC2AD784();
      objc_msgSend(v34, sel_setEnabled_, v11[v8[8]]);

      if (*(_QWORD *)&v11[v8[14]])
      {
        v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3D80]), sel_initWithTarget_action_, v0, sel_didTapCell);
        objc_msgSend(v0, sel_addGestureRecognizer_, v35);

        return sub_1BC1E18F4((uint64_t)v11);
      }
      v36 = objc_msgSend(v0, sel_gestureRecognizers);
      if (!v36)
        return sub_1BC1E18F4((uint64_t)v11);
      v37 = v36;
      sub_1BC0E1D38(0, &qword_1EF4021E8);
      v38 = sub_1BC2B458C();

      if (v38 >> 62)
      {
        swift_bridgeObjectRetain();
        result = sub_1BC2B52D0();
        v39 = result;
        if (result)
          goto LABEL_28;
      }
      else
      {
        v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
        result = swift_bridgeObjectRetain();
        if (v39)
        {
LABEL_28:
          if (v39 < 1)
          {
            __break(1u);
            return result;
          }
          for (i = 0; i != v39; ++i)
          {
            if ((v38 & 0xC000000000000001) != 0)
              v41 = (id)MEMORY[0x1BCCEE950](i, v38);
            else
              v41 = *(id *)(v38 + 8 * i + 32);
            v42 = v41;
            objc_msgSend(v0, sel_removeGestureRecognizer_, v41);

          }
        }
      }
      swift_bridgeObjectRelease_n();
      return sub_1BC1E18F4((uint64_t)v11);
    }
  }
  else
  {
    sub_1BC0E1CFC((uint64_t)v45, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    (*(void (**)(char *, uint64_t, uint64_t, int *))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1BC0E1CFC((uint64_t)v7, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  sub_1BC2B39A4();
  v19 = v0;
  v20 = sub_1BC2B39D4();
  v21 = sub_1BC2B48C8();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v43 = v1;
    v44 = v23;
    *(_DWORD *)v22 = 136446210;
    sub_1BC0E5774(v12, (uint64_t)v45);
    sub_1BC0E1C64(0, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    v24 = sub_1BC2B4490();
    v45[0] = sub_1BC12540C(v24, v25, &v44);
    sub_1BC2B4FD0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0DC000, v20, v21, "Incorrect view model for FieldCell: %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCEF3A0](v23, -1, -1);
    MEMORY[0x1BCCEF3A0](v22, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v43);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_1BC2AE8D4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t (*v15)(void);
  char *v16;
  char v17;
  char *v18;
  char *v19;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];

  v1 = v0;
  v2 = sub_1BC2B39E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0E1C64(0, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v28 - v7;
  v9 = type metadata accessor for FieldItem();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t)v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1BC0E5774(v13, (uint64_t)v30);
  if (!v30[3])
  {
    sub_1BC0E1CFC((uint64_t)v30, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_8:
    sub_1BC0E1CFC((uint64_t)v8, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
    sub_1BC2B39A4();
    v21 = v1;
    v22 = sub_1BC2B39D4();
    v23 = sub_1BC2B48C8();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v28 = v2;
      v29 = v25;
      *(_DWORD *)v24 = 136446210;
      sub_1BC0E5774(v13, (uint64_t)v30);
      sub_1BC0E1C64(0, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
      v26 = sub_1BC2B4490();
      v30[0] = sub_1BC12540C(v26, v27, &v29);
      sub_1BC2B4FD0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0DC000, v22, v23, "Incorrect view model for FieldCell: %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCEF3A0](v25, -1, -1);
      MEMORY[0x1BCCEF3A0](v24, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v28);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  sub_1BC0E1B94();
  v14 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, v14 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    goto LABEL_8;
  sub_1BC2B1050((uint64_t)v8, (uint64_t)v12);
  v15 = *(uint64_t (**)(void))&v12[*(int *)(v9 + 56)];
  if (v15)
  {
    swift_retain();
    v16 = sub_1BC2AD784();
    v17 = v15();

    sub_1BC0F2600((uint64_t)v15);
    if ((v17 & 1) != 0)
    {
      v18 = sub_1BC2AD784();
      objc_msgSend(v18, sel_setUserInteractionEnabled_, 1);

      v19 = sub_1BC2AD784();
      objc_msgSend(v19, sel_becomeFirstResponder);

    }
  }
  return sub_1BC1E18F4((uint64_t)v12);
}

uint64_t sub_1BC2AECC8(void *a1, uint64_t a2, uint64_t a3)
{
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
  id v16;
  void *v17;
  char *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  char *v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  char v29;
  char *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  _QWORD v53[5];

  v6 = sub_1BC2B39E0();
  v48 = *(_QWORD *)(v6 - 8);
  v49 = v6;
  MEMORY[0x1E0C80A78](v6);
  v51 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC2B28D0();
  v45 = *(_QWORD *)(v8 - 8);
  v46 = v8;
  MEMORY[0x1E0C80A78](v8);
  v44 = (uint64_t *)((char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BC0E1C64(0, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v43 - v11;
  v13 = type metadata accessor for FieldItem();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v47 = (uint64_t)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(a1, sel_text);
  if (v16)
  {
    v17 = v16;
    sub_1BC2B4460();

  }
  v18 = (char *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  v19 = (void *)sub_1BC2B4430();
  v20 = objc_msgSend(v18, sel_stringByReplacingCharactersInRange_withString_, a2, a3, v19);

  v21 = sub_1BC2B4460();
  v23 = v22;

  v24 = v50;
  v25 = &v50[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item];
  swift_beginAccess();
  sub_1BC0E5774((uint64_t)v25, (uint64_t)v53);
  if (!v53[3])
  {
    sub_1BC0E1CFC((uint64_t)v53, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    goto LABEL_8;
  }
  sub_1BC0E1B94();
  v26 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, v26 ^ 1u, 1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1BC0E1CFC((uint64_t)v12, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
    v30 = v51;
    sub_1BC2B39A4();
    v31 = v24;
    v32 = sub_1BC2B39D4();
    v33 = sub_1BC2B48C8();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v50 = v18;
      v36 = v35;
      v52 = v35;
      *(_DWORD *)v34 = 136446210;
      sub_1BC0E5774((uint64_t)v25, (uint64_t)v53);
      sub_1BC0E1C64(0, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
      v37 = sub_1BC2B4490();
      v53[0] = sub_1BC12540C(v37, v38, &v52);
      sub_1BC2B4FD0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0DC000, v32, v33, "Incorrect view model for FieldCell: %{public}s", v34, 0xCu);
      v29 = 1;
      swift_arrayDestroy();
      MEMORY[0x1BCCEF3A0](v36, -1, -1);
      MEMORY[0x1BCCEF3A0](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v51, v49);
      return v29 & 1;
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v30, v49);
LABEL_11:
    v29 = 1;
    return v29 & 1;
  }
  v27 = v47;
  sub_1BC2B1050((uint64_t)v12, v47);
  if (*(_BYTE *)(v27 + *(int *)(v13 + 36)) != 1)
  {
    v40 = v27 + *(int *)(v13 + 40);
    if ((*(_BYTE *)(v40 + 8) & 1) == 0)
    {
      v41 = *(_QWORD *)v40;
      v42 = sub_1BC2B44E4();

      swift_bridgeObjectRelease();
      sub_1BC1E18F4(v27);
      v29 = v41 >= v42;
      return v29 & 1;
    }
    sub_1BC1E18F4(v27);
    swift_bridgeObjectRelease();

    goto LABEL_11;
  }
  v28 = v44;
  sub_1BC2AF1E4(v21, v23, v44);
  swift_bridgeObjectRelease();
  v29 = sub_1BC2B28C4();

  (*(void (**)(uint64_t *, uint64_t))(v45 + 8))(v28, v46);
  sub_1BC1E18F4(v27);
  return v29 & 1;
}

id sub_1BC2AF1E4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  void *v3;
  void *v4;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  id v28;
  void *v29;
  char *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id result;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  char *v63;
  char *v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t, uint64_t);
  char *v78;
  char *v79;
  void (*v80)(char *, uint64_t);
  uint64_t *v81;
  id v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  void *v88;
  uint64_t v89;
  unint64_t v90;

  v4 = v3;
  sub_1BC0E1C64(0, (unint64_t *)&unk_1EF3FCD50, (void (*)(uint64_t))MEMORY[0x1E0CB0E38]);
  v9 = MEMORY[0x1E0C80A78](v8);
  v79 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v77 - v11;
  v13 = sub_1BC2B24A4();
  v85 = *(_QWORD *)(v13 - 8);
  v86 = v13;
  v14 = MEMORY[0x1E0C80A78](v13);
  v78 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v87 = (char *)&v77 - v16;
  v17 = sub_1BC2B1FC4();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v84 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v77 - v21;
  v89 = a1;
  v90 = a2;
  sub_1BC2B1FB8();
  sub_1BC0FF070();
  v23 = sub_1BC2B500C();
  v25 = v24;
  v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  v83 = v17;
  v26(v22, v17);
  v27 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v27 = v23 & 0xFFFFFFFFFFFFLL;
  if (!v27)
  {
    v54 = *MEMORY[0x1E0D2A308];
    v55 = sub_1BC2B28D0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 104))(a3, v54, v55);
    return (id)swift_bridgeObjectRelease();
  }
  v80 = v26;
  v28 = sub_1BC2ADAE0();
  objc_msgSend(v28, sel_copy);

  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC0E1D38(0, (unint64_t *)&unk_1EF4021D8);
  swift_dynamicCast();
  v29 = v88;
  v30 = sub_1BC2AD784();
  v31 = objc_msgSend(v30, sel_textInputMode);

  v81 = a3;
  if (!v31
    || (v32 = objc_msgSend(v31, sel_primaryLanguage), v31, !v32))
  {
    v77 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
    v77(v12, 1, 1, v86);
    goto LABEL_9;
  }
  v82 = v4;
  v33 = v29;
  sub_1BC2B4460();

  swift_bridgeObjectRetain();
  sub_1BC2B2444();
  v35 = v85;
  v34 = v86;
  v77 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
  v77(v12, 0, 1, v86);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v12, 1, v34) == 1)
  {
    v29 = v33;
LABEL_9:
    sub_1BC2B2498();
    sub_1BC0E1CFC((uint64_t)v12, (unint64_t *)&unk_1EF3FCD50, (void (*)(uint64_t))MEMORY[0x1E0CB0E38]);
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v87, v12, v34);
  v29 = v33;
LABEL_10:
  v82 = v29;
  result = objc_msgSend(v29, sel_decimalSeparator);
  if (result)
  {
    v37 = result;
    v38 = sub_1BC2B4460();
    v40 = v39;

    v41 = v87;
    sub_1BC2B2450();
    v89 = v38;
    v90 = v40;
    swift_bridgeObjectRetain();
    sub_1BC2B44FC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v42 = v84;
    sub_1BC2B1FAC();
    swift_bridgeObjectRelease();
    v89 = v23;
    v90 = v25;
    v43 = sub_1BC2B500C();
    v45 = v44;
    swift_bridgeObjectRelease();
    v46 = HIBYTE(v45) & 0xF;
    if ((v45 & 0x2000000000000000) == 0)
      v46 = v43 & 0xFFFFFFFFFFFFLL;
    if (!v46)
    {

      swift_bridgeObjectRelease();
      v80(v42, v83);
      (*(void (**)(char *, uint64_t))(v85 + 8))(v41, v86);
      v56 = *MEMORY[0x1E0D2A308];
      v57 = sub_1BC2B28D0();
      return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v81, v56, v57);
    }
    v47 = (void *)sub_1BC2B4430();
    v48 = v82;
    v49 = objc_msgSend(v82, sel_numberFromString_, v47);

    v50 = v81;
    v51 = v85;
    if (v49)
    {
      swift_bridgeObjectRelease();
      v52 = v49;
      v53 = v86;
    }
    else
    {
      v58 = (void *)sub_1BC2B245C();
      objc_msgSend(v48, sel_setLocale_, v58);

      v59 = (void *)sub_1BC2B4430();
      swift_bridgeObjectRelease();
      v60 = objc_msgSend(v48, sel_numberFromString_, v59);

      v61 = sub_1BC2ADAE0();
      v62 = objc_msgSend(v61, sel_locale);

      if (v62)
      {
        v63 = v78;
        sub_1BC2B248C();

        v64 = v79;
        v53 = v86;
        (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v79, v63, v86);
        v77(v64, 0, 1, v53);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v64, 1, v53) == 1)
        {
          v62 = 0;
        }
        else
        {
          v62 = (id)sub_1BC2B245C();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v64, v53);
        }
      }
      else
      {
        v53 = v86;
        v77(v79, 1, 1, v86);
      }
      v48 = v82;
      objc_msgSend(v82, sel_setLocale_, v62);

      if (!v60)
        goto LABEL_29;
      v52 = v60;
    }
    v65 = v49;
    v66 = objc_msgSend(v48, sel_stringFromNumber_, v52);
    if (v66)
    {
      v67 = v66;
      v68 = (uint64_t)v48;
      v69 = sub_1BC2B4460();
      v71 = v70;

      objc_msgSend(v52, sel_doubleValue);
      v73 = v72;

      v80(v84, v83);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v87, v53);
      *v50 = v69;
      v50[1] = v71;
      v50[2] = v73;
      v50[3] = v68;
      v74 = (unsigned int *)MEMORY[0x1E0D2A310];
LABEL_30:
      v75 = *v74;
      v76 = sub_1BC2B28D0();
      return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 104))(v50, v75, v76);
    }

LABEL_29:
    v80(v84, v83);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v87, v53);
    v74 = (unsigned int *)MEMORY[0x1E0D2A300];
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

void sub_1BC2AF9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_1BC2B39E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v8 = sub_1BC2AD784();
    v14 = a1;
    v15 = a2;
    swift_bridgeObjectRetain();
    sub_1BC2B44FC();
    v13 = (id)sub_1BC2B4430();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setAccessibilityIdentifier_, v13);

  }
  else
  {
    sub_1BC2B39A4();
    v9 = sub_1BC2B39D4();
    v10 = sub_1BC2B48C8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1BC0DC000, v9, v10, "Unable to set automation identifiers as there is no base identifier.", v11, 2u);
      MEMORY[0x1BCCEF3A0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1BC2AFBC0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v31;
  void (*v32)(char *, uint64_t, unint64_t);
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];

  v33 = a1;
  v2 = sub_1BC2B39E0();
  v34 = *(_QWORD *)(v2 - 8);
  v35 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BC2B28D0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (uint64_t *)((char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BC0E1C64(0, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v33 - v10;
  v12 = type metadata accessor for FieldItem();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (uint64_t)v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1BC0E5774(v16, (uint64_t)v37);
  if (v37[3])
  {
    sub_1BC0E1B94();
    v17 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, v17 ^ 1u, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      sub_1BC2B1050((uint64_t)v11, (uint64_t)v15);
      v18 = objc_msgSend(v33, sel_text);
      if (v18)
      {
        v19 = v18;
        v20 = sub_1BC2B4460();
        v22 = v21;

      }
      else
      {
        v20 = 0;
        v22 = 0xE000000000000000;
      }
      if (v15[*(int *)(v12 + 36)] == 1
        && (sub_1BC2AF1E4(v20, v22, v8),
            v31 = sub_1BC2B28C4(),
            (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5),
            (v31 & 1) == 0))
      {
        sub_1BC1E18F4((uint64_t)v15);
        return swift_bridgeObjectRelease();
      }
      else
      {
        v32 = *(void (**)(char *, uint64_t, unint64_t))&v15[*(int *)(v12 + 52)];
        swift_retain();
        v32(v15, v20, v22);
        swift_bridgeObjectRelease();
        swift_release();
        return sub_1BC1E18F4((uint64_t)v15);
      }
    }
  }
  else
  {
    sub_1BC0E1CFC((uint64_t)v37, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_1BC0E1CFC((uint64_t)v11, &qword_1EF4021D0, (void (*)(uint64_t))type metadata accessor for FieldItem);
  sub_1BC2B39A4();
  v23 = v1;
  v24 = sub_1BC2B39D4();
  v25 = sub_1BC2B48C8();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v36 = v27;
    *(_DWORD *)v26 = 136446210;
    sub_1BC0E5774(v16, (uint64_t)v37);
    sub_1BC0E1C64(0, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
    v28 = sub_1BC2B4490();
    v37[0] = sub_1BC12540C(v28, v29, &v36);
    sub_1BC2B4FD0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0DC000, v24, v25, "Incorrect view model for FieldCell: %{public}s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCEF3A0](v27, -1, -1);
    MEMORY[0x1BCCEF3A0](v26, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v4, v35);
}

id sub_1BC2B0050()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FieldCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC2B00F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  return sub_1BC0E5774(v3, a1);
}

uint64_t sub_1BC2B0140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1BC0F3E44(a1, v3);
  swift_endAccess();
  sub_1BC2AE228();
  return sub_1BC0E1CFC(a1, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
}

uint64_t (*sub_1BC2B01BC(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1BC2B0204;
}

uint64_t sub_1BC2B0204(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_1BC2AE228();
  return result;
}

void sub_1BC2B0234(uint64_t a1, uint64_t a2)
{
  sub_1BC2AF9E8(a1, a2);
}

uint64_t sub_1BC2B0254()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BC2B02AC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;

  v5 = (_QWORD *)(*v2 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BC2B030C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1BC2B0358()
{
  return sub_1BC2ADAE0();
}

uint64_t _s19HealthMedicationsUI9FieldItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char v36;
  char v37;
  double v39;
  double v40;
  char v41;
  char v42;
  uint64_t v43;
  char *v44;

  v4 = (int *)type metadata accessor for FieldItem();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v43 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v43 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v43 - v15;
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = (char *)&v43 - v18;
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v43 - v21;
  v23 = *(int *)(v20 + 20);
  v24 = (_QWORD *)(a1 + v23);
  v25 = *(_QWORD *)(a1 + v23 + 8);
  v26 = (_QWORD *)(a2 + v23);
  v27 = v26[1];
  if (!v25)
  {
    if (!v27)
    {
LABEL_12:
      sub_1BC1E18B0(a1, (uint64_t)&v43 - v21);
      sub_1BC1E18B0(a2, (uint64_t)v19);
      goto LABEL_13;
    }
LABEL_10:
    sub_1BC1E18B0(a1, (uint64_t)&v43 - v21);
    sub_1BC1E18B0(a2, (uint64_t)v19);
    goto LABEL_11;
  }
  if (!v27)
    goto LABEL_10;
  if (*v24 == *v26 && v25 == v27)
    goto LABEL_12;
  v29 = sub_1BC2B53CC();
  sub_1BC1E18B0(a1, (uint64_t)v22);
  sub_1BC1E18B0(a2, (uint64_t)v19);
  if ((v29 & 1) == 0)
  {
LABEL_11:
    sub_1BC1E18F4((uint64_t)v19);
    sub_1BC1E18F4((uint64_t)v22);
LABEL_25:
    sub_1BC1E18B0(a1, (uint64_t)v16);
    sub_1BC1E18B0(a2, (uint64_t)v13);
    goto LABEL_26;
  }
LABEL_13:
  v44 = v7;
  v30 = v4[6];
  v31 = &v22[v30];
  v32 = *(_QWORD *)&v22[v30 + 8];
  v33 = &v19[v30];
  v34 = *((_QWORD *)v33 + 1);
  if (!v32)
  {
    swift_bridgeObjectRetain();
    sub_1BC1E18F4((uint64_t)v19);
    sub_1BC1E18F4((uint64_t)v22);
    if (!v34)
    {
LABEL_30:
      sub_1BC1E18B0(a1, (uint64_t)v16);
      sub_1BC1E18B0(a2, (uint64_t)v13);
      v7 = v44;
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (!v34)
  {
    swift_bridgeObjectRetain();
    sub_1BC1E18F4((uint64_t)v19);
    sub_1BC1E18F4((uint64_t)v22);
LABEL_24:
    swift_bridgeObjectRelease();
    v7 = v44;
    goto LABEL_25;
  }
  if (*(_QWORD *)v31 == *(_QWORD *)v33 && v32 == v34)
  {
    swift_bridgeObjectRetain();
    sub_1BC1E18F4((uint64_t)v19);
    sub_1BC1E18F4((uint64_t)v22);
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  v36 = sub_1BC2B53CC();
  swift_bridgeObjectRetain();
  sub_1BC1E18F4((uint64_t)v19);
  sub_1BC1E18F4((uint64_t)v22);
  swift_bridgeObjectRelease();
  sub_1BC1E18B0(a1, (uint64_t)v16);
  sub_1BC1E18B0(a2, (uint64_t)v13);
  v7 = v44;
  if ((v36 & 1) == 0)
  {
LABEL_26:
    sub_1BC1E18F4((uint64_t)v13);
    sub_1BC1E18F4((uint64_t)v16);
    sub_1BC1E18B0(a1, (uint64_t)v10);
    sub_1BC1E18B0(a2, (uint64_t)v7);
    goto LABEL_27;
  }
LABEL_31:
  v39 = *(double *)&v16[v4[7]];
  sub_1BC1E18F4((uint64_t)v16);
  v40 = *(double *)&v13[v4[7]];
  sub_1BC1E18F4((uint64_t)v13);
  sub_1BC1E18B0(a1, (uint64_t)v10);
  sub_1BC1E18B0(a2, (uint64_t)v7);
  if (v39 == v40)
  {
    v41 = v10[v4[8]];
    sub_1BC1E18F4((uint64_t)v10);
    v42 = v7[v4[8]];
    sub_1BC1E18F4((uint64_t)v7);
    v37 = v41 ^ v42 ^ 1;
    return v37 & 1;
  }
LABEL_27:
  sub_1BC1E18F4((uint64_t)v7);
  sub_1BC1E18F4((uint64_t)v10);
  v37 = 0;
  return v37 & 1;
}

uint64_t sub_1BC2B0710()
{
  return sub_1BC0E008C(&qword_1EF4020C8, 255, (uint64_t (*)(uint64_t))type metadata accessor for FieldItem, (uint64_t)&protocol conformance descriptor for FieldItem);
}

uint64_t dispatch thunk of CharacterLimitProvider.characterLimit.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

_QWORD *initializeBufferWithCopyOfBuffer for FieldItem(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BC2B2438();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (_QWORD *)((char *)a1 + v9);
    v14 = (_QWORD *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *((_BYTE *)a1 + v16) = *((_BYTE *)a2 + v16);
    v17 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    v20 = a3[12];
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    *(_QWORD *)((char *)a1 + v20) = *(_QWORD *)((char *)a2 + v20);
    v21 = a3[13];
    v22 = a3[14];
    v23 = (_QWORD *)((char *)a1 + v21);
    v24 = (_QWORD *)((char *)a2 + v21);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = (_QWORD *)((char *)a1 + v22);
    v27 = (char *)a2 + v22;
    v28 = *(_QWORD *)((char *)a2 + v22);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (v28)
    {
      v29 = *((_QWORD *)v27 + 1);
      *v26 = v28;
      v26[1] = v29;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v26 = *(_OWORD *)v27;
    }
    v31 = a3[15];
    v32 = (_QWORD *)((char *)a1 + v31);
    v33 = (_QWORD *)((char *)a2 + v31);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FieldItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BC2B2438();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 56)))
    swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FieldItem(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

  v6 = sub_1BC2B2438();
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
  v15 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  v19 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v19) = *(_QWORD *)(a2 + v19);
  v20 = a3[13];
  v21 = a3[14];
  v22 = (_QWORD *)(a1 + v20);
  v23 = (_QWORD *)(a2 + v20);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = (_QWORD *)(a1 + v21);
  v26 = a2 + v21;
  v27 = *(_QWORD *)(a2 + v21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v27)
  {
    v28 = *(_QWORD *)(v26 + 8);
    *v25 = v27;
    v25[1] = v28;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v25 = *(_OWORD *)v26;
  }
  v29 = a3[15];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FieldItem(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  v6 = sub_1BC2B2438();
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
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v13 = a3[10];
  v14 = a1 + v13;
  v15 = (uint64_t *)(a2 + v13);
  v16 = *v15;
  *(_BYTE *)(v14 + 8) = *((_BYTE *)v15 + 8);
  *(_QWORD *)v14 = v16;
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v17 = a3[13];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  v21 = a3[14];
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  v24 = *(_QWORD *)(a1 + v21);
  v25 = *(_QWORD *)(a2 + v21);
  if (!v24)
  {
    if (v25)
    {
      v27 = *(_QWORD *)(v23 + 8);
      *v22 = v25;
      v22[1] = v27;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v22 = *(_OWORD *)v23;
    goto LABEL_8;
  }
  if (!v25)
  {
    swift_release();
    goto LABEL_7;
  }
  v26 = *(_QWORD *)(v23 + 8);
  *v22 = v25;
  v22[1] = v26;
  swift_retain();
  swift_release();
LABEL_8:
  v28 = a3[15];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (_QWORD *)(a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FieldItem(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_1BC2B2438();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v16 = *v15;
  if (*v15)
  {
    v17 = v15[1];
    *v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)v14 = *(_OWORD *)v15;
  }
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for FieldItem(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = sub_1BC2B2438();
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
  v17 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v18 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v21 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  swift_release();
  v22 = a3[14];
  v23 = (_QWORD *)(a1 + v22);
  v24 = a2 + v22;
  v25 = *(_QWORD *)(a1 + v22);
  v26 = *(_QWORD *)(a2 + v22);
  if (!v25)
  {
    if (v26)
    {
      v28 = *(_QWORD *)(v24 + 8);
      *v23 = v26;
      v23[1] = v28;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v23 = *(_OWORD *)v24;
    goto LABEL_8;
  }
  if (!v26)
  {
    swift_release();
    goto LABEL_7;
  }
  v27 = *(_QWORD *)(v24 + 8);
  *v23 = v26;
  v23[1] = v27;
  swift_release();
LABEL_8:
  v29 = a3[15];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (uint64_t *)(a2 + v29);
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FieldItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC2B0E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1BC2B2438();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 52));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for FieldItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC2B0F24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1BC2B2438();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  return result;
}

uint64_t sub_1BC2B0F9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC2B2438();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BC2B1050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FieldItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BC2B1094()
{
  char *v0;
  uint64_t *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter] = 0;
  v1 = (uint64_t *)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier];
  v4 = sub_1BC2B4460();
  v5 = v2;
  swift_bridgeObjectRetain();
  sub_1BC2B44FC();
  swift_bridgeObjectRelease();
  *v1 = v4;
  v1[1] = v5;
  v3 = &v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;

  sub_1BC2B52B8();
  __break(1u);
}

id MedicationListAllDataProvider.__allocating_init(displayType:profile:medication:predicate:)(void *a1, void *a2, void *a3, void *a4)
{
  objc_class *v4;
  char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate;
  *(_QWORD *)&v9[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication] = a3;
  v11 = *(void **)&v9[v10];
  *(_QWORD *)&v9[v10] = a4;
  v12 = a3;
  v13 = a4;

  v16.receiver = v9;
  v16.super_class = v4;
  v14 = objc_msgSendSuper2(&v16, sel_initWithDisplayType_profile_, a1, a2);

  return v14;
}

id MedicationListAllDataProvider.init(displayType:profile:medication:predicate:)(void *a1, void *a2, void *a3, void *a4)
{
  char *v4;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v8 = OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate;
  *(_QWORD *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication] = a3;
  v9 = *(void **)&v4[v8];
  *(_QWORD *)&v4[v8] = a4;
  v10 = a3;
  v11 = a4;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for MedicationListAllDataProvider();
  v12 = objc_msgSendSuper2(&v14, sel_initWithDisplayType_profile_, a1, a2);

  return v12;
}

uint64_t type metadata accessor for MedicationListAllDataProvider()
{
  return objc_opt_self();
}

id sub_1BC2B13C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;

  v1 = v0;
  v12 = MEMORY[0x1E0DEE9D8];
  v2 = *(void **)(v0 + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, sel_semanticIdentifier);
    v5 = objc_msgSend(v4, sel_stringValue);

    if (!v5)
    {
      sub_1BC2B4460();
      v5 = (id)sub_1BC2B4430();
      swift_bridgeObjectRelease();
    }
    v6 = objc_msgSend((id)objc_opt_self(), sel_predicateForMedicationDoseEventWithMedicationIdentifier_, v5);

    MEMORY[0x1BCCEDCF0]();
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1BC2B45C8();
    sub_1BC2B4604();
    sub_1BC2B45A4();

  }
  v7 = *(void **)(v1 + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate);
  if (v7)
  {
    v8 = v7;
    MEMORY[0x1BCCEDCF0]();
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1BC2B45C8();
    sub_1BC2B4604();
    sub_1BC2B45A4();

  }
  sub_1BC0E1D38(0, &qword_1EDA0E9D0);
  v9 = (void *)sub_1BC2B4580();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v9);

  return v10;
}

uint64_t sub_1BC2B15FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  swift_getObjectType();
  sub_1BC127E34(a1, (uint64_t)&v5);
  sub_1BC0E1D38(0, &qword_1EF402200);
  if (swift_dynamicCast())
  {
    v2 = sub_1BC102AA8();

    return v2;
  }
  else
  {
    v5 = 0;
    v6 = 0xE000000000000000;
    sub_1BC2B51BC();
    swift_bridgeObjectRelease();
    v5 = 0xD000000000000023;
    v6 = 0x80000001BC2D6480;
    sub_1BC2B54F8();
    sub_1BC2B44FC();
    swift_bridgeObjectRelease();
    sub_1BC2B44FC();
    result = sub_1BC2B52B8();
    __break(1u);
  }
  return result;
}

uint64_t sub_1BC2B18BC()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t result;

  swift_getObjectType();
  v1 = sub_1BC2B25E8();
  v2 = objc_msgSend(v0, sel_objectAtIndex_forSection_, v1, sub_1BC2B25F4());
  objc_opt_self();
  v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v0, sel_profileName);
    if (v5)
    {
      sub_1BC2B4460();

      v6 = v0;
      swift_unknownObjectRetain();
      v5 = (id)sub_1BC2B4430();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = v0;
      swift_unknownObjectRetain();
    }
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F6D0]), sel_initWithSample_usingInsetStyling_profileName_delegate_, v4, 1, v5, v0);

    swift_unknownObjectRelease_n();
    return (uint64_t)v8;
  }
  else
  {
    swift_unknownObjectRelease();
    sub_1BC2B51BC();
    swift_bridgeObjectRelease();
    sub_1BC2B54F8();
    sub_1BC2B44FC();
    swift_bridgeObjectRelease();
    sub_1BC2B44FC();
    result = sub_1BC2B52B8();
    __break(1u);
  }
  return result;
}

id MedicationListAllDataProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MedicationListAllDataProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MedicationListAllDataProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationListAllDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MedicationListAllDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MedicationListAllDataProvider.__allocating_init(displayType:profile:medication:predicate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for NicknameNotesStepViewController()
{
  uint64_t result;

  result = qword_1EF402230;
  if (!qword_1EF402230)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC2B1D78()
{
  return swift_initClassMetadata2();
}

void sub_1BC2B1DB4(_BYTE *a1@<X8>)
{
  *a1 = -127;
}

void sub_1BC2B1DC0()
{
  sub_1BC2B52B8();
  __break(1u);
}

void sub_1BC2B1E18()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1BC2B1E44()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NicknameNotesStepViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC2B1E78()
{
  return type metadata accessor for NicknameNotesStepViewController();
}

BOOL static FrequencyInterval.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t FrequencyInterval.text.getter()
{
  return sub_1BC243C38(1);
}

unint64_t sub_1BC2B1ECC()
{
  unint64_t result;

  result = qword_1EF402280;
  if (!qword_1EF402280)
  {
    result = MEMORY[0x1BCCEF2BC](&protocol conformance descriptor for FrequencyInterval, &type metadata for FrequencyInterval);
    atomic_store(result, (unint64_t *)&qword_1EF402280);
  }
  return result;
}

uint64_t sub_1BC2B1F10()
{
  return sub_1BC243C38(1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1BC2B1F64()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1BC2B1F70()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1BC2B1F7C()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1BC2B1F88()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BC2B1F94()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BC2B1FA0()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BC2B1FAC()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1BC2B1FB8()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1BC2B1FC4()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1BC2B1FD0()
{
  return MEMORY[0x1E0D2F030]();
}

uint64_t sub_1BC2B1FDC()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_1BC2B1FE8()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t sub_1BC2B1FF4()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1BC2B2000()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1BC2B200C()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1BC2B2018()
{
  return MEMORY[0x1E0CAE5B0]();
}

uint64_t sub_1BC2B2024()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1BC2B2030()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_1BC2B203C()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1BC2B2048()
{
  return MEMORY[0x1E0CAE930]();
}

uint64_t sub_1BC2B2054()
{
  return MEMORY[0x1E0CAE938]();
}

uint64_t sub_1BC2B2060()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1BC2B206C()
{
  return MEMORY[0x1E0CAE9B0]();
}

uint64_t sub_1BC2B2078()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1BC2B2084()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1BC2B2090()
{
  return MEMORY[0x1E0CAEA00]();
}

uint64_t sub_1BC2B209C()
{
  return MEMORY[0x1E0CAEA08]();
}

uint64_t sub_1BC2B20A8()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1BC2B20B4()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1BC2B20C0()
{
  return MEMORY[0x1E0CAEA40]();
}

uint64_t sub_1BC2B20CC()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1BC2B20D8()
{
  return MEMORY[0x1E0CAEA50]();
}

uint64_t sub_1BC2B20E4()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1BC2B20F0()
{
  return MEMORY[0x1E0CAEAA0]();
}

uint64_t sub_1BC2B20FC()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1BC2B2108()
{
  return MEMORY[0x1E0CAEBA8]();
}

uint64_t sub_1BC2B2114()
{
  return MEMORY[0x1E0DC19E0]();
}

uint64_t sub_1BC2B2120()
{
  return MEMORY[0x1E0DC1A00]();
}

uint64_t sub_1BC2B212C()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1BC2B2138()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_1BC2B2144()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BC2B2150()
{
  return MEMORY[0x1E0CAF400]();
}

uint64_t sub_1BC2B215C()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1BC2B2168()
{
  return MEMORY[0x1E0CAF480]();
}

uint64_t sub_1BC2B2174()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1BC2B2180()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1BC2B218C()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1BC2B2198()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1BC2B21A4()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1BC2B21B0()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1BC2B21BC()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1BC2B21C8()
{
  return MEMORY[0x1E0DC1A18]();
}

uint64_t sub_1BC2B21D4()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BC2B21E0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BC2B21EC()
{
  return MEMORY[0x1E0CAFCE8]();
}

uint64_t sub_1BC2B21F8()
{
  return MEMORY[0x1E0CAFCF0]();
}

uint64_t sub_1BC2B2204()
{
  return MEMORY[0x1E0D29978]();
}

uint64_t sub_1BC2B2210()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BC2B221C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BC2B2228()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1BC2B2234()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BC2B2240()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BC2B224C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BC2B2258()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1BC2B2264()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1BC2B2270()
{
  return MEMORY[0x1E0CB03F0]();
}

uint64_t sub_1BC2B227C()
{
  return MEMORY[0x1E0CB03F8]();
}

uint64_t sub_1BC2B2288()
{
  return MEMORY[0x1E0CB0420]();
}

uint64_t sub_1BC2B2294()
{
  return MEMORY[0x1E0CB0428]();
}

uint64_t sub_1BC2B22A0()
{
  return MEMORY[0x1E0CB0448]();
}

uint64_t sub_1BC2B22AC()
{
  return MEMORY[0x1E0CB0450]();
}

uint64_t sub_1BC2B22B8()
{
  return MEMORY[0x1E0CB0460]();
}

uint64_t sub_1BC2B22C4()
{
  return MEMORY[0x1E0CB0468]();
}

uint64_t sub_1BC2B22D0()
{
  return MEMORY[0x1E0CB0470]();
}

uint64_t sub_1BC2B22DC()
{
  return MEMORY[0x1E0CB0478]();
}

uint64_t sub_1BC2B22E8()
{
  return MEMORY[0x1E0CB04B8]();
}

uint64_t sub_1BC2B22F4()
{
  return MEMORY[0x1E0CB04C0]();
}

uint64_t sub_1BC2B2300()
{
  return MEMORY[0x1E0CB04D8]();
}

uint64_t sub_1BC2B230C()
{
  return MEMORY[0x1E0CB04E0]();
}

uint64_t sub_1BC2B2318()
{
  return MEMORY[0x1E0CB0568]();
}

uint64_t sub_1BC2B2324()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1BC2B2330()
{
  return MEMORY[0x1E0D2F038]();
}

uint64_t sub_1BC2B233C()
{
  return MEMORY[0x1E0D29980]();
}

uint64_t sub_1BC2B2348()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1BC2B2354()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1BC2B2360()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BC2B236C()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1BC2B2378()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1BC2B2384()
{
  return MEMORY[0x1E0D2C528]();
}

uint64_t sub_1BC2B2390()
{
  return MEMORY[0x1E0D2C530]();
}

uint64_t sub_1BC2B239C()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1BC2B23A8()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BC2B23B4()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1BC2B23C0()
{
  return MEMORY[0x1E0CB0838]();
}

uint64_t sub_1BC2B23CC()
{
  return MEMORY[0x1E0CB0848]();
}

uint64_t sub_1BC2B23D8()
{
  return MEMORY[0x1E0CB0850]();
}

uint64_t sub_1BC2B23E4()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BC2B23F0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BC2B23FC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BC2B2408()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1BC2B2414()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1BC2B2420()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1BC2B242C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BC2B2438()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BC2B2444()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1BC2B2450()
{
  return MEMORY[0x1E0CB0B80]();
}

uint64_t sub_1BC2B245C()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1BC2B2468()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1BC2B2474()
{
  return MEMORY[0x1E0CB0C08]();
}

uint64_t sub_1BC2B2480()
{
  return MEMORY[0x1E0CB0C10]();
}

uint64_t sub_1BC2B248C()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1BC2B2498()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1BC2B24A4()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1BC2B24B0()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1BC2B24BC()
{
  return MEMORY[0x1E0CB0F80]();
}

uint64_t sub_1BC2B24C8()
{
  return MEMORY[0x1E0CB0FA0]();
}

uint64_t sub_1BC2B24D4()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1BC2B24E0()
{
  return MEMORY[0x1E0CB1000]();
}

uint64_t sub_1BC2B24EC()
{
  return MEMORY[0x1E0CB1008]();
}

uint64_t sub_1BC2B24F8()
{
  return MEMORY[0x1E0D2BCB0]();
}

uint64_t sub_1BC2B2504()
{
  return MEMORY[0x1E0D2BCB8]();
}

uint64_t sub_1BC2B2510()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1BC2B251C()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t sub_1BC2B2528()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_1BC2B2534()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1BC2B2540()
{
  return MEMORY[0x1E0CB1068]();
}

uint64_t sub_1BC2B254C()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1BC2B2558()
{
  return MEMORY[0x1E0CB10B8]();
}

uint64_t sub_1BC2B2564()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1BC2B2570()
{
  return MEMORY[0x1E0CB10D8]();
}

uint64_t sub_1BC2B257C()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1BC2B2588()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1BC2B2594()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1BC2B25A0()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1BC2B25AC()
{
  return MEMORY[0x1E0CB1448]();
}

uint64_t sub_1BC2B25B8()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1BC2B25C4()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1BC2B25D0()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1BC2B25DC()
{
  return MEMORY[0x1E0DC1A20]();
}

uint64_t sub_1BC2B25E8()
{
  return MEMORY[0x1E0DC1A30]();
}

uint64_t sub_1BC2B25F4()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1BC2B2600()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1BC2B260C()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1BC2B2618()
{
  return MEMORY[0x1E0CB1720]();
}

uint64_t sub_1BC2B2624()
{
  return MEMORY[0x1E0CB1728]();
}

uint64_t sub_1BC2B2630()
{
  return MEMORY[0x1E0CB1738]();
}

uint64_t sub_1BC2B263C()
{
  return MEMORY[0x1E0D2A7F0]();
}

uint64_t sub_1BC2B2648()
{
  return MEMORY[0x1E0D2A7F8]();
}

uint64_t sub_1BC2B2654()
{
  return MEMORY[0x1E0D2A800]();
}

uint64_t sub_1BC2B2660()
{
  return MEMORY[0x1E0D2D380]();
}

uint64_t sub_1BC2B266C()
{
  return MEMORY[0x1E0D2D3C0]();
}

uint64_t sub_1BC2B2678()
{
  return MEMORY[0x1E0D2D3E8]();
}

uint64_t sub_1BC2B2684()
{
  return MEMORY[0x1E0D2D3F0]();
}

uint64_t sub_1BC2B2690()
{
  return MEMORY[0x1E0D2D5B0]();
}

uint64_t sub_1BC2B269C()
{
  return MEMORY[0x1E0D2D6F0]();
}

uint64_t sub_1BC2B26A8()
{
  return MEMORY[0x1E0D2DC60]();
}

uint64_t sub_1BC2B26B4()
{
  return MEMORY[0x1E0D2E3C8]();
}

uint64_t sub_1BC2B26C0()
{
  return MEMORY[0x1E0D2E3D0]();
}

uint64_t sub_1BC2B26CC()
{
  return MEMORY[0x1E0D2E3D8]();
}

uint64_t sub_1BC2B26D8()
{
  return MEMORY[0x1E0D2E9A8]();
}

uint64_t sub_1BC2B26E4()
{
  return MEMORY[0x1E0D2E9F8]();
}

uint64_t sub_1BC2B26F0()
{
  return MEMORY[0x1E0D2E670]();
}

uint64_t sub_1BC2B26FC()
{
  return MEMORY[0x1E0D2E718]();
}

uint64_t sub_1BC2B2708()
{
  return MEMORY[0x1E0D2F040]();
}

uint64_t sub_1BC2B2714()
{
  return MEMORY[0x1E0D2F048]();
}

uint64_t sub_1BC2B2720()
{
  return MEMORY[0x1E0D2F050]();
}

uint64_t sub_1BC2B272C()
{
  return MEMORY[0x1E0D2F058]();
}

uint64_t sub_1BC2B2738()
{
  return MEMORY[0x1E0D2F060]();
}

uint64_t sub_1BC2B2744()
{
  return MEMORY[0x1E0D2F068]();
}

uint64_t sub_1BC2B2750()
{
  return MEMORY[0x1E0D2F078]();
}

uint64_t sub_1BC2B275C()
{
  return MEMORY[0x1E0D2F080]();
}

uint64_t sub_1BC2B2768()
{
  return MEMORY[0x1E0D2F088]();
}

uint64_t _s19HealthMedicationsUI34InteractionSeperatorLineDataSourceCfd_0()
{
  return MEMORY[0x1E0D2F098]();
}

uint64_t sub_1BC2B2780()
{
  return MEMORY[0x1E0D2F0A8]();
}

uint64_t sub_1BC2B278C()
{
  return MEMORY[0x1E0D2F0B0]();
}

uint64_t sub_1BC2B2798()
{
  return MEMORY[0x1E0D2F0B8]();
}

uint64_t sub_1BC2B27A4()
{
  return MEMORY[0x1E0D2F0C0]();
}

uint64_t sub_1BC2B27B0()
{
  return MEMORY[0x1E0D2F0C8]();
}

uint64_t sub_1BC2B27BC()
{
  return MEMORY[0x1E0D2F0D0]();
}

uint64_t sub_1BC2B27C8()
{
  return MEMORY[0x1E0D2F0D8]();
}

uint64_t sub_1BC2B27D4()
{
  return MEMORY[0x1E0D2F0E0]();
}

uint64_t sub_1BC2B27E0()
{
  return MEMORY[0x1E0D2F0E8]();
}

uint64_t sub_1BC2B27EC()
{
  return MEMORY[0x1E0D2F0F0]();
}

uint64_t sub_1BC2B27F8()
{
  return MEMORY[0x1E0D2F0F8]();
}

uint64_t sub_1BC2B2804()
{
  return MEMORY[0x1E0D2F100]();
}

uint64_t sub_1BC2B2810()
{
  return MEMORY[0x1E0D2F108]();
}

uint64_t sub_1BC2B281C()
{
  return MEMORY[0x1E0D2F110]();
}

uint64_t sub_1BC2B2828()
{
  return MEMORY[0x1E0D2F118]();
}

uint64_t sub_1BC2B2834()
{
  return MEMORY[0x1E0D2F120]();
}

uint64_t sub_1BC2B2840()
{
  return MEMORY[0x1E0D2F128]();
}

uint64_t sub_1BC2B284C()
{
  return MEMORY[0x1E0D2F130]();
}

uint64_t sub_1BC2B2858()
{
  return MEMORY[0x1E0D2F138]();
}

uint64_t sub_1BC2B2864()
{
  return MEMORY[0x1E0D2F140]();
}

uint64_t sub_1BC2B2870()
{
  return MEMORY[0x1E0D2F148]();
}

uint64_t sub_1BC2B287C()
{
  return MEMORY[0x1E0D29BC0]();
}

uint64_t sub_1BC2B2888()
{
  return MEMORY[0x1E0D29BC8]();
}

uint64_t sub_1BC2B2894()
{
  return MEMORY[0x1E0D2A190]();
}

uint64_t sub_1BC2B28A0()
{
  return MEMORY[0x1E0D2A198]();
}

uint64_t sub_1BC2B28AC()
{
  return MEMORY[0x1E0D2A1C0]();
}

uint64_t sub_1BC2B28B8()
{
  return MEMORY[0x1E0D2A1C8]();
}

uint64_t sub_1BC2B28C4()
{
  return MEMORY[0x1E0D2A2F8]();
}

uint64_t sub_1BC2B28D0()
{
  return MEMORY[0x1E0D2A318]();
}

uint64_t sub_1BC2B28DC()
{
  return MEMORY[0x1E0D2A878]();
}

uint64_t sub_1BC2B28E8()
{
  return MEMORY[0x1E0D2A8A8]();
}

uint64_t sub_1BC2B28F4()
{
  return MEMORY[0x1E0D2A8B8]();
}

uint64_t sub_1BC2B2900()
{
  return MEMORY[0x1E0D2A8E8]();
}

uint64_t sub_1BC2B290C()
{
  return MEMORY[0x1E0D2A9B8]();
}

uint64_t sub_1BC2B2918()
{
  return MEMORY[0x1E0D2A9F0]();
}

uint64_t sub_1BC2B2924()
{
  return MEMORY[0x1E0D2AA00]();
}

uint64_t sub_1BC2B2930()
{
  return MEMORY[0x1E0D2AA08]();
}

uint64_t sub_1BC2B293C()
{
  return MEMORY[0x1E0D2AA30]();
}

uint64_t sub_1BC2B2948()
{
  return MEMORY[0x1E0D2AA40]();
}

uint64_t sub_1BC2B2954()
{
  return MEMORY[0x1E0D2AA48]();
}

uint64_t sub_1BC2B2960()
{
  return MEMORY[0x1E0D2AB28]();
}

uint64_t sub_1BC2B296C()
{
  return MEMORY[0x1E0D2AB30]();
}

uint64_t sub_1BC2B2978()
{
  return MEMORY[0x1E0D2AB58]();
}

uint64_t sub_1BC2B2984()
{
  return MEMORY[0x1E0D2AB60]();
}

uint64_t sub_1BC2B2990()
{
  return MEMORY[0x1E0D2AB68]();
}

uint64_t sub_1BC2B299C()
{
  return MEMORY[0x1E0D2AB78]();
}

uint64_t sub_1BC2B29A8()
{
  return MEMORY[0x1E0D2AB88]();
}

uint64_t sub_1BC2B29B4()
{
  return MEMORY[0x1E0D2AB90]();
}

uint64_t sub_1BC2B29C0()
{
  return MEMORY[0x1E0D2AB98]();
}

uint64_t sub_1BC2B29CC()
{
  return MEMORY[0x1E0D2ABB0]();
}

uint64_t sub_1BC2B29D8()
{
  return MEMORY[0x1E0D2ABC0]();
}

uint64_t sub_1BC2B29E4()
{
  return MEMORY[0x1E0D2ABD0]();
}

uint64_t sub_1BC2B29F0()
{
  return MEMORY[0x1E0D2ACD0]();
}

uint64_t sub_1BC2B29FC()
{
  return MEMORY[0x1E0D2ACD8]();
}

uint64_t sub_1BC2B2A08()
{
  return MEMORY[0x1E0D2ACE0]();
}

uint64_t sub_1BC2B2A14()
{
  return MEMORY[0x1E0D2AD70]();
}

uint64_t sub_1BC2B2A20()
{
  return MEMORY[0x1E0D2AD78]();
}

uint64_t sub_1BC2B2A2C()
{
  return MEMORY[0x1E0D2ADA0]();
}

uint64_t sub_1BC2B2A38()
{
  return MEMORY[0x1E0D2ADA8]();
}

uint64_t sub_1BC2B2A44()
{
  return MEMORY[0x1E0D2ADB8]();
}

uint64_t sub_1BC2B2A50()
{
  return MEMORY[0x1E0D2ADC0]();
}

uint64_t sub_1BC2B2A5C()
{
  return MEMORY[0x1E0D2ADC8]();
}

uint64_t sub_1BC2B2A68()
{
  return MEMORY[0x1E0D2ADD0]();
}

uint64_t sub_1BC2B2A74()
{
  return MEMORY[0x1E0D2ADE0]();
}

uint64_t sub_1BC2B2A80()
{
  return MEMORY[0x1E0D2AE10]();
}

uint64_t sub_1BC2B2A8C()
{
  return MEMORY[0x1E0D2AE18]();
}

uint64_t sub_1BC2B2A98()
{
  return MEMORY[0x1E0D2AE20]();
}

uint64_t sub_1BC2B2AA4()
{
  return MEMORY[0x1E0D2AE28]();
}

uint64_t sub_1BC2B2AB0()
{
  return MEMORY[0x1E0D2AE68]();
}

uint64_t sub_1BC2B2ABC()
{
  return MEMORY[0x1E0D2AE70]();
}

uint64_t sub_1BC2B2AC8()
{
  return MEMORY[0x1E0D2AE80]();
}

uint64_t sub_1BC2B2AD4()
{
  return MEMORY[0x1E0D2AE90]();
}

uint64_t sub_1BC2B2AE0()
{
  return MEMORY[0x1E0D2AE98]();
}

uint64_t sub_1BC2B2AEC()
{
  return MEMORY[0x1E0D2AF18]();
}

uint64_t sub_1BC2B2AF8()
{
  return MEMORY[0x1E0D2AF20]();
}

uint64_t sub_1BC2B2B04()
{
  return MEMORY[0x1E0D2AF28]();
}

uint64_t sub_1BC2B2B10()
{
  return MEMORY[0x1E0D2AF58]();
}

uint64_t sub_1BC2B2B1C()
{
  return MEMORY[0x1E0D2AF60]();
}

uint64_t sub_1BC2B2B28()
{
  return MEMORY[0x1E0D2AFC8]();
}

uint64_t sub_1BC2B2B34()
{
  return MEMORY[0x1E0D2AFD8]();
}

uint64_t sub_1BC2B2B40()
{
  return MEMORY[0x1E0D2AFE0]();
}

uint64_t sub_1BC2B2B4C()
{
  return MEMORY[0x1E0D2AFE8]();
}

uint64_t sub_1BC2B2B58()
{
  return MEMORY[0x1E0D2AFF0]();
}

uint64_t sub_1BC2B2B64()
{
  return MEMORY[0x1E0D2AFF8]();
}

uint64_t sub_1BC2B2B70()
{
  return MEMORY[0x1E0D2B000]();
}

uint64_t sub_1BC2B2B7C()
{
  return MEMORY[0x1E0D2B018]();
}

uint64_t sub_1BC2B2B88()
{
  return MEMORY[0x1E0D2B020]();
}

uint64_t sub_1BC2B2B94()
{
  return MEMORY[0x1E0D2B070]();
}

uint64_t sub_1BC2B2BA0()
{
  return MEMORY[0x1E0D2B078]();
}

uint64_t sub_1BC2B2BAC()
{
  return MEMORY[0x1E0D2B080]();
}

uint64_t sub_1BC2B2BB8()
{
  return MEMORY[0x1E0D2B088]();
}

uint64_t sub_1BC2B2BC4()
{
  return MEMORY[0x1E0D2B090]();
}

uint64_t sub_1BC2B2BD0()
{
  return MEMORY[0x1E0D2B0B8]();
}

uint64_t sub_1BC2B2BDC()
{
  return MEMORY[0x1E0D2B0C8]();
}

uint64_t sub_1BC2B2BE8()
{
  return MEMORY[0x1E0D2B0D8]();
}

uint64_t sub_1BC2B2BF4()
{
  return MEMORY[0x1E0D2B0E8]();
}

uint64_t sub_1BC2B2C00()
{
  return MEMORY[0x1E0D2B0F0]();
}

uint64_t sub_1BC2B2C0C()
{
  return MEMORY[0x1E0D2B0F8]();
}

uint64_t sub_1BC2B2C18()
{
  return MEMORY[0x1E0D2B100]();
}

uint64_t sub_1BC2B2C24()
{
  return MEMORY[0x1E0D2B118]();
}

uint64_t sub_1BC2B2C30()
{
  return MEMORY[0x1E0D2B120]();
}

uint64_t sub_1BC2B2C3C()
{
  return MEMORY[0x1E0D2B128]();
}

uint64_t sub_1BC2B2C48()
{
  return MEMORY[0x1E0D2B138]();
}

uint64_t sub_1BC2B2C54()
{
  return MEMORY[0x1E0D2B140]();
}

uint64_t sub_1BC2B2C60()
{
  return MEMORY[0x1E0D2B160]();
}

uint64_t sub_1BC2B2C6C()
{
  return MEMORY[0x1E0D2B178]();
}

uint64_t sub_1BC2B2C78()
{
  return MEMORY[0x1E0D2B198]();
}

uint64_t sub_1BC2B2C84()
{
  return MEMORY[0x1E0D2B1C0]();
}

uint64_t sub_1BC2B2C90()
{
  return MEMORY[0x1E0D2B1C8]();
}

uint64_t sub_1BC2B2C9C()
{
  return MEMORY[0x1E0D2B1D0]();
}

uint64_t sub_1BC2B2CA8()
{
  return MEMORY[0x1E0D2B1F0]();
}

uint64_t sub_1BC2B2CB4()
{
  return MEMORY[0x1E0D2B1F8]();
}

uint64_t sub_1BC2B2CC0()
{
  return MEMORY[0x1E0D2B200]();
}

uint64_t sub_1BC2B2CCC()
{
  return MEMORY[0x1E0D2B208]();
}

uint64_t sub_1BC2B2CD8()
{
  return MEMORY[0x1E0D2B210]();
}

uint64_t sub_1BC2B2CE4()
{
  return MEMORY[0x1E0D2B218]();
}

uint64_t sub_1BC2B2CF0()
{
  return MEMORY[0x1E0D2B220]();
}

uint64_t sub_1BC2B2CFC()
{
  return MEMORY[0x1E0D2B228]();
}

uint64_t sub_1BC2B2D08()
{
  return MEMORY[0x1E0D2B230]();
}

uint64_t sub_1BC2B2D14()
{
  return MEMORY[0x1E0D2B248]();
}

uint64_t sub_1BC2B2D20()
{
  return MEMORY[0x1E0D2B250]();
}

uint64_t sub_1BC2B2D2C()
{
  return MEMORY[0x1E0D2B2B8]();
}

uint64_t sub_1BC2B2D38()
{
  return MEMORY[0x1E0D2B2C0]();
}

uint64_t sub_1BC2B2D44()
{
  return MEMORY[0x1E0D2B2F0]();
}

uint64_t sub_1BC2B2D50()
{
  return MEMORY[0x1E0D2B2F8]();
}

uint64_t sub_1BC2B2D5C()
{
  return MEMORY[0x1E0D2B308]();
}

uint64_t sub_1BC2B2D68()
{
  return MEMORY[0x1E0D2B320]();
}

uint64_t sub_1BC2B2D74()
{
  return MEMORY[0x1E0D2B330]();
}

uint64_t sub_1BC2B2D80()
{
  return MEMORY[0x1E0D2B338]();
}

uint64_t sub_1BC2B2D8C()
{
  return MEMORY[0x1E0D2B348]();
}

uint64_t sub_1BC2B2D98()
{
  return MEMORY[0x1E0D2B350]();
}

uint64_t sub_1BC2B2DA4()
{
  return MEMORY[0x1E0D2B3E8]();
}

uint64_t sub_1BC2B2DB0()
{
  return MEMORY[0x1E0D2B3F8]();
}

uint64_t _s19HealthMedicationsUI38InteractionFactorsLifestyleOptionsItemCfd_0()
{
  return MEMORY[0x1E0D2B408]();
}

uint64_t sub_1BC2B2DC8()
{
  return MEMORY[0x1E0D2B450]();
}

uint64_t sub_1BC2B2DD4()
{
  return MEMORY[0x1E0D2B460]();
}

uint64_t sub_1BC2B2DE0()
{
  return MEMORY[0x1E0D2B470]();
}

uint64_t sub_1BC2B2DEC()
{
  return MEMORY[0x1E0D2B4A8]();
}

uint64_t sub_1BC2B2DF8()
{
  return MEMORY[0x1E0D2B4B8]();
}

uint64_t sub_1BC2B2E04()
{
  return MEMORY[0x1E0D2B4C0]();
}

uint64_t sub_1BC2B2E10()
{
  return MEMORY[0x1E0D2B4C8]();
}

uint64_t sub_1BC2B2E1C()
{
  return MEMORY[0x1E0D2B4D0]();
}

uint64_t sub_1BC2B2E28()
{
  return MEMORY[0x1E0D2B4D8]();
}

uint64_t sub_1BC2B2E34()
{
  return MEMORY[0x1E0D2B4E0]();
}

uint64_t sub_1BC2B2E40()
{
  return MEMORY[0x1E0D2B508]();
}

uint64_t sub_1BC2B2E4C()
{
  return MEMORY[0x1E0D2B530]();
}

uint64_t sub_1BC2B2E58()
{
  return MEMORY[0x1E0D2B538]();
}

uint64_t sub_1BC2B2E64()
{
  return MEMORY[0x1E0D2B540]();
}

uint64_t sub_1BC2B2E70()
{
  return MEMORY[0x1E0D2B548]();
}

uint64_t sub_1BC2B2E7C()
{
  return MEMORY[0x1E0D2B5B8]();
}

uint64_t sub_1BC2B2E88()
{
  return MEMORY[0x1E0D2B5C0]();
}

uint64_t sub_1BC2B2E94()
{
  return MEMORY[0x1E0D2B5C8]();
}

uint64_t sub_1BC2B2EA0()
{
  return MEMORY[0x1E0D2B620]();
}

uint64_t sub_1BC2B2EAC()
{
  return MEMORY[0x1E0D2B630]();
}

uint64_t sub_1BC2B2EB8()
{
  return MEMORY[0x1E0D2B6A0]();
}

uint64_t sub_1BC2B2EC4()
{
  return MEMORY[0x1E0D2B6B0]();
}

uint64_t sub_1BC2B2ED0()
{
  return MEMORY[0x1E0D2B6B8]();
}

uint64_t sub_1BC2B2EDC()
{
  return MEMORY[0x1E0D2B6C0]();
}

uint64_t sub_1BC2B2EE8()
{
  return MEMORY[0x1E0D2B6F0]();
}

uint64_t sub_1BC2B2EF4()
{
  return MEMORY[0x1E0D2B6F8]();
}

uint64_t sub_1BC2B2F00()
{
  return MEMORY[0x1E0D2B708]();
}

uint64_t sub_1BC2B2F0C()
{
  return MEMORY[0x1E0D2B728]();
}

uint64_t sub_1BC2B2F18()
{
  return MEMORY[0x1E0D2B730]();
}

uint64_t sub_1BC2B2F24()
{
  return MEMORY[0x1E0D2B738]();
}

uint64_t sub_1BC2B2F30()
{
  return MEMORY[0x1E0D2B750]();
}

uint64_t sub_1BC2B2F3C()
{
  return MEMORY[0x1E0D2B760]();
}

uint64_t sub_1BC2B2F48()
{
  return MEMORY[0x1E0D2B768]();
}

uint64_t sub_1BC2B2F54()
{
  return MEMORY[0x1E0D2B770]();
}

uint64_t sub_1BC2B2F60()
{
  return MEMORY[0x1E0D2B7F0]();
}

uint64_t sub_1BC2B2F6C()
{
  return MEMORY[0x1E0D2B850]();
}

uint64_t sub_1BC2B2F78()
{
  return MEMORY[0x1E0D2B860]();
}

uint64_t sub_1BC2B2F84()
{
  return MEMORY[0x1E0D2B8A8]();
}

uint64_t sub_1BC2B2F90()
{
  return MEMORY[0x1E0D2B8B0]();
}

uint64_t sub_1BC2B2F9C()
{
  return MEMORY[0x1E0D2B8B8]();
}

uint64_t sub_1BC2B2FA8()
{
  return MEMORY[0x1E0D2B8D0]();
}

uint64_t sub_1BC2B2FB4()
{
  return MEMORY[0x1E0D2B900]();
}

uint64_t sub_1BC2B2FC0()
{
  return MEMORY[0x1E0D2B908]();
}

uint64_t sub_1BC2B2FCC()
{
  return MEMORY[0x1E0D2B910]();
}

uint64_t sub_1BC2B2FD8()
{
  return MEMORY[0x1E0D2B988]();
}

uint64_t sub_1BC2B2FE4()
{
  return MEMORY[0x1E0D2B990]();
}

uint64_t sub_1BC2B2FF0()
{
  return MEMORY[0x1E0D2B998]();
}

uint64_t sub_1BC2B2FFC()
{
  return MEMORY[0x1E0D2B9A0]();
}

uint64_t sub_1BC2B3008()
{
  return MEMORY[0x1E0D2B9A8]();
}

uint64_t sub_1BC2B3014()
{
  return MEMORY[0x1E0D2B9B0]();
}

uint64_t sub_1BC2B3020()
{
  return MEMORY[0x1E0D2B9B8]();
}

uint64_t sub_1BC2B302C()
{
  return MEMORY[0x1E0D2B9C8]();
}

uint64_t sub_1BC2B3038()
{
  return MEMORY[0x1E0D2B9D8]();
}

uint64_t sub_1BC2B3044()
{
  return MEMORY[0x1E0D2B9F0]();
}

uint64_t sub_1BC2B3050()
{
  return MEMORY[0x1E0D2B9F8]();
}

uint64_t sub_1BC2B305C()
{
  return MEMORY[0x1E0D2BA00]();
}

uint64_t sub_1BC2B3068()
{
  return MEMORY[0x1E0D2BA18]();
}

uint64_t sub_1BC2B3074()
{
  return MEMORY[0x1E0D2BA28]();
}

uint64_t sub_1BC2B3080()
{
  return MEMORY[0x1E0D2CDC8]();
}

uint64_t sub_1BC2B308C()
{
  return MEMORY[0x1E0D2CDD0]();
}

uint64_t sub_1BC2B3098()
{
  return MEMORY[0x1E0D2CDD8]();
}

uint64_t sub_1BC2B30A4()
{
  return MEMORY[0x1E0D2CDE0]();
}

uint64_t sub_1BC2B30B0()
{
  return MEMORY[0x1E0D2CDE8]();
}

uint64_t sub_1BC2B30BC()
{
  return MEMORY[0x1E0D2CDF0]();
}

uint64_t sub_1BC2B30C8()
{
  return MEMORY[0x1E0D2CDF8]();
}

uint64_t sub_1BC2B30D4()
{
  return MEMORY[0x1E0D2CE00]();
}

uint64_t sub_1BC2B30E0()
{
  return MEMORY[0x1E0D2CE08]();
}

uint64_t sub_1BC2B30EC()
{
  return MEMORY[0x1E0D2CE10]();
}

uint64_t sub_1BC2B30F8()
{
  return MEMORY[0x1E0D2CE18]();
}

uint64_t sub_1BC2B3104()
{
  return MEMORY[0x1E0D2CE20]();
}

uint64_t sub_1BC2B3110()
{
  return MEMORY[0x1E0D2CE28]();
}

uint64_t sub_1BC2B311C()
{
  return MEMORY[0x1E0D2CE30]();
}

uint64_t sub_1BC2B3128()
{
  return MEMORY[0x1E0D2CE38]();
}

uint64_t sub_1BC2B3134()
{
  return MEMORY[0x1E0D2C538]();
}

uint64_t sub_1BC2B3140()
{
  return MEMORY[0x1E0D2C548]();
}

uint64_t sub_1BC2B314C()
{
  return MEMORY[0x1E0D2C550]();
}

uint64_t sub_1BC2B3158()
{
  return MEMORY[0x1E0D2C558]();
}

uint64_t sub_1BC2B3164()
{
  return MEMORY[0x1E0D2C560]();
}

uint64_t sub_1BC2B3170()
{
  return MEMORY[0x1E0D2C568]();
}

uint64_t sub_1BC2B317C()
{
  return MEMORY[0x1E0D2C570]();
}

uint64_t sub_1BC2B3188()
{
  return MEMORY[0x1E0D2C578]();
}

uint64_t sub_1BC2B3194()
{
  return MEMORY[0x1E0D2C580]();
}

uint64_t sub_1BC2B31A0()
{
  return MEMORY[0x1E0D2C588]();
}

uint64_t sub_1BC2B31AC()
{
  return MEMORY[0x1E0D2C590]();
}

uint64_t sub_1BC2B31B8()
{
  return MEMORY[0x1E0D2C598]();
}

uint64_t sub_1BC2B31C4()
{
  return MEMORY[0x1E0D2C5A0]();
}

uint64_t sub_1BC2B31D0()
{
  return MEMORY[0x1E0D2C5A8]();
}

uint64_t sub_1BC2B31DC()
{
  return MEMORY[0x1E0D2C5B0]();
}

uint64_t sub_1BC2B31E8()
{
  return MEMORY[0x1E0D2C5B8]();
}

uint64_t sub_1BC2B31F4()
{
  return MEMORY[0x1E0D2C5C0]();
}

uint64_t sub_1BC2B3200()
{
  return MEMORY[0x1E0D2C5D0]();
}

uint64_t sub_1BC2B320C()
{
  return MEMORY[0x1E0D2C5D8]();
}

uint64_t sub_1BC2B3218()
{
  return MEMORY[0x1E0D2C5E0]();
}

uint64_t sub_1BC2B3224()
{
  return MEMORY[0x1E0D2C5F8]();
}

uint64_t sub_1BC2B3230()
{
  return MEMORY[0x1E0D2C600]();
}

uint64_t sub_1BC2B323C()
{
  return MEMORY[0x1E0D2C608]();
}

uint64_t sub_1BC2B3248()
{
  return MEMORY[0x1E0D2C610]();
}

uint64_t sub_1BC2B3254()
{
  return MEMORY[0x1E0D2C618]();
}

uint64_t sub_1BC2B3260()
{
  return MEMORY[0x1E0D2C620]();
}

uint64_t sub_1BC2B326C()
{
  return MEMORY[0x1E0D2C628]();
}

uint64_t sub_1BC2B3278()
{
  return MEMORY[0x1E0D2C630]();
}

uint64_t sub_1BC2B3284()
{
  return MEMORY[0x1E0D2C640]();
}

uint64_t sub_1BC2B3290()
{
  return MEMORY[0x1E0D2C648]();
}

uint64_t sub_1BC2B329C()
{
  return MEMORY[0x1E0D2C650]();
}

uint64_t sub_1BC2B32A8()
{
  return MEMORY[0x1E0D2C658]();
}

uint64_t sub_1BC2B32B4()
{
  return MEMORY[0x1E0D2C660]();
}

uint64_t sub_1BC2B32C0()
{
  return MEMORY[0x1E0D2C678]();
}

uint64_t sub_1BC2B32CC()
{
  return MEMORY[0x1E0D2C680]();
}

uint64_t sub_1BC2B32D8()
{
  return MEMORY[0x1E0D2C688]();
}

uint64_t sub_1BC2B32E4()
{
  return MEMORY[0x1E0D2C690]();
}

uint64_t sub_1BC2B32F0()
{
  return MEMORY[0x1E0D2C698]();
}

uint64_t sub_1BC2B32FC()
{
  return MEMORY[0x1E0D2C6A8]();
}

uint64_t sub_1BC2B3308()
{
  return MEMORY[0x1E0D2C6B0]();
}

uint64_t sub_1BC2B3314()
{
  return MEMORY[0x1E0D2C6B8]();
}

uint64_t sub_1BC2B3320()
{
  return MEMORY[0x1E0D2C6C0]();
}

uint64_t sub_1BC2B332C()
{
  return MEMORY[0x1E0D2C6D0]();
}

uint64_t sub_1BC2B3338()
{
  return MEMORY[0x1E0D2C6E0]();
}

uint64_t sub_1BC2B3344()
{
  return MEMORY[0x1E0D2C6E8]();
}

uint64_t sub_1BC2B3350()
{
  return MEMORY[0x1E0D2C6F0]();
}

uint64_t sub_1BC2B335C()
{
  return MEMORY[0x1E0D2C718]();
}

uint64_t sub_1BC2B3368()
{
  return MEMORY[0x1E0D2C720]();
}

uint64_t sub_1BC2B3374()
{
  return MEMORY[0x1E0D2C728]();
}

uint64_t sub_1BC2B3380()
{
  return MEMORY[0x1E0D2C730]();
}

uint64_t sub_1BC2B338C()
{
  return MEMORY[0x1E0D2C738]();
}

uint64_t sub_1BC2B3398()
{
  return MEMORY[0x1E0D2C740]();
}

uint64_t sub_1BC2B33A4()
{
  return MEMORY[0x1E0D2C748]();
}

uint64_t sub_1BC2B33B0()
{
  return MEMORY[0x1E0D2C750]();
}

uint64_t sub_1BC2B33BC()
{
  return MEMORY[0x1E0D2C768]();
}

uint64_t sub_1BC2B33C8()
{
  return MEMORY[0x1E0D2C770]();
}

uint64_t sub_1BC2B33D4()
{
  return MEMORY[0x1E0D2C778]();
}

uint64_t sub_1BC2B33E0()
{
  return MEMORY[0x1E0D2C780]();
}

uint64_t sub_1BC2B33EC()
{
  return MEMORY[0x1E0D2C788]();
}

uint64_t sub_1BC2B33F8()
{
  return MEMORY[0x1E0D2C790]();
}

uint64_t sub_1BC2B3404()
{
  return MEMORY[0x1E0D2C798]();
}

uint64_t sub_1BC2B3410()
{
  return MEMORY[0x1E0D2C7A0]();
}

uint64_t sub_1BC2B341C()
{
  return MEMORY[0x1E0D2C7A8]();
}

uint64_t sub_1BC2B3428()
{
  return MEMORY[0x1E0D2C7B0]();
}

uint64_t sub_1BC2B3434()
{
  return MEMORY[0x1E0D2C7B8]();
}

uint64_t sub_1BC2B3440()
{
  return MEMORY[0x1E0D2C7C0]();
}

uint64_t sub_1BC2B344C()
{
  return MEMORY[0x1E0D2C7C8]();
}

uint64_t sub_1BC2B3458()
{
  return MEMORY[0x1E0D2C7D8]();
}

uint64_t sub_1BC2B3464()
{
  return MEMORY[0x1E0D2C7E0]();
}

uint64_t sub_1BC2B3470()
{
  return MEMORY[0x1E0D2C7E8]();
}

uint64_t sub_1BC2B347C()
{
  return MEMORY[0x1E0D2C7F0]();
}

uint64_t sub_1BC2B3488()
{
  return MEMORY[0x1E0D2C7F8]();
}

uint64_t sub_1BC2B3494()
{
  return MEMORY[0x1E0D2C800]();
}

uint64_t sub_1BC2B34A0()
{
  return MEMORY[0x1E0D2C808]();
}

uint64_t sub_1BC2B34AC()
{
  return MEMORY[0x1E0D2C820]();
}

uint64_t sub_1BC2B34B8()
{
  return MEMORY[0x1E0D2C828]();
}

uint64_t sub_1BC2B34C4()
{
  return MEMORY[0x1E0D2C830]();
}

uint64_t sub_1BC2B34D0()
{
  return MEMORY[0x1E0D2C838]();
}

uint64_t sub_1BC2B34DC()
{
  return MEMORY[0x1E0D2C848]();
}

uint64_t sub_1BC2B34E8()
{
  return MEMORY[0x1E0D2C850]();
}

uint64_t sub_1BC2B34F4()
{
  return MEMORY[0x1E0D2C860]();
}

uint64_t sub_1BC2B3500()
{
  return MEMORY[0x1E0D2C868]();
}

uint64_t sub_1BC2B350C()
{
  return MEMORY[0x1E0D2C878]();
}

uint64_t sub_1BC2B3518()
{
  return MEMORY[0x1E0D2C880]();
}

uint64_t sub_1BC2B3524()
{
  return MEMORY[0x1E0D2C888]();
}

uint64_t sub_1BC2B3530()
{
  return MEMORY[0x1E0D2C890]();
}

uint64_t sub_1BC2B353C()
{
  return MEMORY[0x1E0D2C8A8]();
}

uint64_t sub_1BC2B3548()
{
  return MEMORY[0x1E0D2C8B0]();
}

uint64_t sub_1BC2B3554()
{
  return MEMORY[0x1E0D2C8B8]();
}

uint64_t sub_1BC2B3560()
{
  return MEMORY[0x1E0D2C8C0]();
}

uint64_t sub_1BC2B356C()
{
  return MEMORY[0x1E0D2C8C8]();
}

uint64_t sub_1BC2B3578()
{
  return MEMORY[0x1E0D2C8D0]();
}

uint64_t sub_1BC2B3584()
{
  return MEMORY[0x1E0D2C8E0]();
}

uint64_t sub_1BC2B3590()
{
  return MEMORY[0x1E0D2C8E8]();
}

uint64_t sub_1BC2B359C()
{
  return MEMORY[0x1E0D2C900]();
}

uint64_t sub_1BC2B35A8()
{
  return MEMORY[0x1E0D2C908]();
}

uint64_t sub_1BC2B35B4()
{
  return MEMORY[0x1E0D2C918]();
}

uint64_t sub_1BC2B35C0()
{
  return MEMORY[0x1E0D2C920]();
}

uint64_t sub_1BC2B35CC()
{
  return MEMORY[0x1E0D2C928]();
}

uint64_t sub_1BC2B35D8()
{
  return MEMORY[0x1E0D2C930]();
}

uint64_t sub_1BC2B35E4()
{
  return MEMORY[0x1E0D2C938]();
}

uint64_t sub_1BC2B35F0()
{
  return MEMORY[0x1E0D2C940]();
}

uint64_t sub_1BC2B35FC()
{
  return MEMORY[0x1E0D2C948]();
}

uint64_t sub_1BC2B3608()
{
  return MEMORY[0x1E0D2C950]();
}

uint64_t sub_1BC2B3614()
{
  return MEMORY[0x1E0D2C978]();
}

uint64_t sub_1BC2B3620()
{
  return MEMORY[0x1E0D2C980]();
}

uint64_t sub_1BC2B362C()
{
  return MEMORY[0x1E0D2C988]();
}

uint64_t sub_1BC2B3638()
{
  return MEMORY[0x1E0D2C990]();
}

uint64_t sub_1BC2B3644()
{
  return MEMORY[0x1E0D2C9A0]();
}

uint64_t sub_1BC2B3650()
{
  return MEMORY[0x1E0D2C9A8]();
}

uint64_t sub_1BC2B365C()
{
  return MEMORY[0x1E0D2C9B0]();
}

uint64_t sub_1BC2B3668()
{
  return MEMORY[0x1E0D2C9B8]();
}

uint64_t sub_1BC2B3674()
{
  return MEMORY[0x1E0D2C9C0]();
}

uint64_t sub_1BC2B3680()
{
  return MEMORY[0x1E0D2C9C8]();
}

uint64_t sub_1BC2B368C()
{
  return MEMORY[0x1E0D2C9D8]();
}

uint64_t sub_1BC2B3698()
{
  return MEMORY[0x1E0D2C9E0]();
}

uint64_t sub_1BC2B36A4()
{
  return MEMORY[0x1E0D2C9F8]();
}

uint64_t sub_1BC2B36B0()
{
  return MEMORY[0x1E0D2CA08]();
}

uint64_t sub_1BC2B36BC()
{
  return MEMORY[0x1E0D2CA10]();
}

uint64_t sub_1BC2B36C8()
{
  return MEMORY[0x1E0D2CA20]();
}

uint64_t sub_1BC2B36D4()
{
  return MEMORY[0x1E0D2CA28]();
}

uint64_t sub_1BC2B36E0()
{
  return MEMORY[0x1E0D2CA30]();
}

uint64_t sub_1BC2B36EC()
{
  return MEMORY[0x1E0D2CA38]();
}

uint64_t sub_1BC2B36F8()
{
  return MEMORY[0x1E0D2CA48]();
}

uint64_t sub_1BC2B3704()
{
  return MEMORY[0x1E0D2CA58]();
}

uint64_t sub_1BC2B3710()
{
  return MEMORY[0x1E0D2CA60]();
}

uint64_t sub_1BC2B371C()
{
  return MEMORY[0x1E0D2CA68]();
}

uint64_t sub_1BC2B3728()
{
  return MEMORY[0x1E0D2CA70]();
}

uint64_t sub_1BC2B3734()
{
  return MEMORY[0x1E0D2CA78]();
}

uint64_t sub_1BC2B3740()
{
  return MEMORY[0x1E0D2CA88]();
}

uint64_t sub_1BC2B374C()
{
  return MEMORY[0x1E0D2CA90]();
}

uint64_t sub_1BC2B3758()
{
  return MEMORY[0x1E0D2CA98]();
}

uint64_t sub_1BC2B3764()
{
  return MEMORY[0x1E0D2CAA0]();
}

uint64_t sub_1BC2B3770()
{
  return MEMORY[0x1E0D2CAA8]();
}

uint64_t sub_1BC2B377C()
{
  return MEMORY[0x1E0D2CAB0]();
}

uint64_t sub_1BC2B3788()
{
  return MEMORY[0x1E0D2CAB8]();
}

uint64_t sub_1BC2B3794()
{
  return MEMORY[0x1E0D2CAC0]();
}

uint64_t sub_1BC2B37A0()
{
  return MEMORY[0x1E0D2CAC8]();
}

uint64_t sub_1BC2B37AC()
{
  return MEMORY[0x1E0D2CAD0]();
}

uint64_t sub_1BC2B37B8()
{
  return MEMORY[0x1E0D2CAD8]();
}

uint64_t sub_1BC2B37C4()
{
  return MEMORY[0x1E0D2CAE0]();
}

uint64_t sub_1BC2B37D0()
{
  return MEMORY[0x1E0D2CAE8]();
}

uint64_t sub_1BC2B37DC()
{
  return MEMORY[0x1E0D2CAF8]();
}

uint64_t sub_1BC2B37E8()
{
  return MEMORY[0x1E0D2CB00]();
}

uint64_t sub_1BC2B37F4()
{
  return MEMORY[0x1E0D2CB08]();
}

uint64_t sub_1BC2B3800()
{
  return MEMORY[0x1E0D2CB10]();
}

uint64_t sub_1BC2B380C()
{
  return MEMORY[0x1E0D2CB18]();
}

uint64_t sub_1BC2B3818()
{
  return MEMORY[0x1E0D2CB20]();
}

uint64_t sub_1BC2B3824()
{
  return MEMORY[0x1E0D2CB30]();
}

uint64_t sub_1BC2B3830()
{
  return MEMORY[0x1E0D2CB58]();
}

uint64_t sub_1BC2B383C()
{
  return MEMORY[0x1E0D2CB60]();
}

uint64_t sub_1BC2B3848()
{
  return MEMORY[0x1E0D2CB80]();
}

uint64_t sub_1BC2B3854()
{
  return MEMORY[0x1E0D2CB90]();
}

uint64_t sub_1BC2B3860()
{
  return MEMORY[0x1E0D2CB98]();
}

uint64_t sub_1BC2B386C()
{
  return MEMORY[0x1E0D2CBA0]();
}

uint64_t sub_1BC2B3878()
{
  return MEMORY[0x1E0D2CBA8]();
}

uint64_t sub_1BC2B3884()
{
  return MEMORY[0x1E0D2CBB0]();
}

uint64_t sub_1BC2B3890()
{
  return MEMORY[0x1E0D2CBB8]();
}

uint64_t sub_1BC2B389C()
{
  return MEMORY[0x1E0D2CBC0]();
}

uint64_t sub_1BC2B38A8()
{
  return MEMORY[0x1E0D2CBC8]();
}

uint64_t sub_1BC2B38B4()
{
  return MEMORY[0x1E0D2CBD0]();
}

uint64_t sub_1BC2B38C0()
{
  return MEMORY[0x1E0D2CBD8]();
}

uint64_t sub_1BC2B38CC()
{
  return MEMORY[0x1E0D2CBE0]();
}

uint64_t sub_1BC2B38D8()
{
  return MEMORY[0x1E0D2CBE8]();
}

uint64_t sub_1BC2B38E4()
{
  return MEMORY[0x1E0D2CBF0]();
}

uint64_t sub_1BC2B38F0()
{
  return MEMORY[0x1E0D2CC28]();
}

uint64_t sub_1BC2B38FC()
{
  return MEMORY[0x1E0D2EF60]();
}

uint64_t sub_1BC2B3908()
{
  return MEMORY[0x1E0D2CC30]();
}

uint64_t sub_1BC2B3914()
{
  return MEMORY[0x1E0D2CC38]();
}

uint64_t sub_1BC2B3920()
{
  return MEMORY[0x1E0D2CC40]();
}

uint64_t sub_1BC2B392C()
{
  return MEMORY[0x1E0D2F158]();
}

uint64_t sub_1BC2B3938()
{
  return MEMORY[0x1E0D2EF80]();
}

uint64_t sub_1BC2B3944()
{
  return MEMORY[0x1E0D2EF98]();
}

uint64_t sub_1BC2B3950()
{
  return MEMORY[0x1E0D2EFA8]();
}

uint64_t sub_1BC2B395C()
{
  return MEMORY[0x1E0D2EFE0]();
}

uint64_t sub_1BC2B3968()
{
  return MEMORY[0x1E0D2EFE8]();
}

uint64_t sub_1BC2B3974()
{
  return MEMORY[0x1E0D2F000]();
}

uint64_t sub_1BC2B3980()
{
  return MEMORY[0x1E0D2F008]();
}

uint64_t sub_1BC2B398C()
{
  return MEMORY[0x1E0D2F010]();
}

uint64_t sub_1BC2B3998()
{
  return MEMORY[0x1E0D2F018]();
}

uint64_t sub_1BC2B39A4()
{
  return MEMORY[0x1E0D2E750]();
}

uint64_t sub_1BC2B39B0()
{
  return MEMORY[0x1E0D2E788]();
}

uint64_t sub_1BC2B39BC()
{
  return MEMORY[0x1E0D2E7C0]();
}

uint64_t sub_1BC2B39C8()
{
  return MEMORY[0x1E0D2CC48]();
}

uint64_t sub_1BC2B39D4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BC2B39E0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BC2B39EC()
{
  return MEMORY[0x1E0DC1A70]();
}

uint64_t sub_1BC2B39F8()
{
  return MEMORY[0x1E0DC1BC8]();
}

uint64_t sub_1BC2B3A04()
{
  return MEMORY[0x1E0DC1BD8]();
}

uint64_t sub_1BC2B3A10()
{
  return MEMORY[0x1E0DC1BE0]();
}

uint64_t sub_1BC2B3A1C()
{
  return MEMORY[0x1E0DC1BE8]();
}

uint64_t sub_1BC2B3A28()
{
  return MEMORY[0x1E0DC1BF0]();
}

uint64_t sub_1BC2B3A34()
{
  return MEMORY[0x1E0DC1C28]();
}

uint64_t sub_1BC2B3A40()
{
  return MEMORY[0x1E0DC1C58]();
}

uint64_t sub_1BC2B3A4C()
{
  return MEMORY[0x1E0DC1C68]();
}

uint64_t sub_1BC2B3A58()
{
  return MEMORY[0x1E0DC1C70]();
}

uint64_t sub_1BC2B3A64()
{
  return MEMORY[0x1E0DC1CA0]();
}

uint64_t sub_1BC2B3A70()
{
  return MEMORY[0x1E0DC1CA8]();
}

uint64_t sub_1BC2B3A7C()
{
  return MEMORY[0x1E0DC1CB0]();
}

uint64_t sub_1BC2B3A88()
{
  return MEMORY[0x1E0DC1CE0]();
}

uint64_t sub_1BC2B3A94()
{
  return MEMORY[0x1E0DC1CE8]();
}

uint64_t sub_1BC2B3AA0()
{
  return MEMORY[0x1E0DC1CF0]();
}

uint64_t sub_1BC2B3AAC()
{
  return MEMORY[0x1E0DC1CF8]();
}

uint64_t sub_1BC2B3AB8()
{
  return MEMORY[0x1E0DC1D20]();
}

uint64_t sub_1BC2B3AC4()
{
  return MEMORY[0x1E0DC1D28]();
}

uint64_t sub_1BC2B3AD0()
{
  return MEMORY[0x1E0DC1D38]();
}

uint64_t sub_1BC2B3ADC()
{
  return MEMORY[0x1E0DC1F88]();
}

uint64_t sub_1BC2B3AE8()
{
  return MEMORY[0x1E0DC1FE8]();
}

uint64_t sub_1BC2B3AF4()
{
  return MEMORY[0x1E0DC1FF0]();
}

uint64_t sub_1BC2B3B00()
{
  return MEMORY[0x1E0DC2020]();
}

uint64_t sub_1BC2B3B0C()
{
  return MEMORY[0x1E0DC20A8]();
}

uint64_t sub_1BC2B3B18()
{
  return MEMORY[0x1E0DC20C8]();
}

uint64_t sub_1BC2B3B24()
{
  return MEMORY[0x1E0DC20D0]();
}

uint64_t sub_1BC2B3B30()
{
  return MEMORY[0x1E0DC2118]();
}

uint64_t sub_1BC2B3B3C()
{
  return MEMORY[0x1E0DC2128]();
}

uint64_t sub_1BC2B3B48()
{
  return MEMORY[0x1E0DC2130]();
}

uint64_t sub_1BC2B3B54()
{
  return MEMORY[0x1E0DC2178]();
}

uint64_t sub_1BC2B3B60()
{
  return MEMORY[0x1E0DC2190]();
}

uint64_t sub_1BC2B3B6C()
{
  return MEMORY[0x1E0DC21B0]();
}

uint64_t sub_1BC2B3B78()
{
  return MEMORY[0x1E0DC21C8]();
}

uint64_t sub_1BC2B3B84()
{
  return MEMORY[0x1E0DC21E8]();
}

uint64_t sub_1BC2B3B90()
{
  return MEMORY[0x1E0DC21F0]();
}

uint64_t sub_1BC2B3B9C()
{
  return MEMORY[0x1E0DC2208]();
}

uint64_t sub_1BC2B3BA8()
{
  return MEMORY[0x1E0DC2210]();
}

uint64_t sub_1BC2B3BB4()
{
  return MEMORY[0x1E0DC2220]();
}

uint64_t sub_1BC2B3BC0()
{
  return MEMORY[0x1E0DC2228]();
}

uint64_t sub_1BC2B3BCC()
{
  return MEMORY[0x1E0DC2238]();
}

uint64_t sub_1BC2B3BD8()
{
  return MEMORY[0x1E0DC2248]();
}

uint64_t sub_1BC2B3BE4()
{
  return MEMORY[0x1E0DC2250]();
}

uint64_t sub_1BC2B3BF0()
{
  return MEMORY[0x1E0DC2258]();
}

uint64_t sub_1BC2B3BFC()
{
  return MEMORY[0x1E0DC22A8]();
}

uint64_t sub_1BC2B3C08()
{
  return MEMORY[0x1E0DC22B8]();
}

uint64_t sub_1BC2B3C14()
{
  return MEMORY[0x1E0DC22D8]();
}

uint64_t sub_1BC2B3C20()
{
  return MEMORY[0x1E0DC22E0]();
}

uint64_t sub_1BC2B3C2C()
{
  return MEMORY[0x1E0DC22F0]();
}

uint64_t sub_1BC2B3C38()
{
  return MEMORY[0x1E0DC22F8]();
}

uint64_t sub_1BC2B3C44()
{
  return MEMORY[0x1E0DC2300]();
}

uint64_t sub_1BC2B3C50()
{
  return MEMORY[0x1E0DC2308]();
}

uint64_t sub_1BC2B3C5C()
{
  return MEMORY[0x1E0DC2310]();
}

uint64_t sub_1BC2B3C68()
{
  return MEMORY[0x1E0DC2320]();
}

uint64_t sub_1BC2B3C74()
{
  return MEMORY[0x1E0DC2330]();
}

uint64_t sub_1BC2B3C80()
{
  return MEMORY[0x1E0DC2350]();
}

uint64_t sub_1BC2B3C8C()
{
  return MEMORY[0x1E0DC2358]();
}

uint64_t sub_1BC2B3C98()
{
  return MEMORY[0x1E0DC2360]();
}

uint64_t sub_1BC2B3CA4()
{
  return MEMORY[0x1E0DC2370]();
}

uint64_t sub_1BC2B3CB0()
{
  return MEMORY[0x1E0DC2378]();
}

uint64_t sub_1BC2B3CBC()
{
  return MEMORY[0x1E0DC2380]();
}

uint64_t sub_1BC2B3CC8()
{
  return MEMORY[0x1E0DC2390]();
}

uint64_t sub_1BC2B3CD4()
{
  return MEMORY[0x1E0DC23A0]();
}

uint64_t sub_1BC2B3CE0()
{
  return MEMORY[0x1E0DC23D8]();
}

uint64_t sub_1BC2B3CEC()
{
  return MEMORY[0x1E0DC2478]();
}

uint64_t sub_1BC2B3CF8()
{
  return MEMORY[0x1E0DC2480]();
}

uint64_t sub_1BC2B3D04()
{
  return MEMORY[0x1E0DC24B8]();
}

uint64_t sub_1BC2B3D10()
{
  return MEMORY[0x1E0DC24D8]();
}

uint64_t sub_1BC2B3D1C()
{
  return MEMORY[0x1E0DC2628]();
}

uint64_t sub_1BC2B3D28()
{
  return MEMORY[0x1E0DC2638]();
}

uint64_t sub_1BC2B3D34()
{
  return MEMORY[0x1E0DC28D8]();
}

uint64_t sub_1BC2B3D40()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1BC2B3D4C()
{
  return MEMORY[0x1E0DC2A28]();
}

uint64_t sub_1BC2B3D58()
{
  return MEMORY[0x1E0DC2A38]();
}

uint64_t sub_1BC2B3D64()
{
  return MEMORY[0x1E0C95680]();
}

uint64_t sub_1BC2B3D70()
{
  return MEMORY[0x1E0C95690]();
}

uint64_t sub_1BC2B3D7C()
{
  return MEMORY[0x1E0C956A0]();
}

uint64_t sub_1BC2B3D88()
{
  return MEMORY[0x1E0C956C0]();
}

uint64_t sub_1BC2B3D94()
{
  return MEMORY[0x1E0C956E0]();
}

uint64_t sub_1BC2B3DA0()
{
  return MEMORY[0x1E0C956E8]();
}

uint64_t sub_1BC2B3DAC()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1BC2B3DB8()
{
  return MEMORY[0x1E0C95778]();
}

uint64_t sub_1BC2B3DC4()
{
  return MEMORY[0x1E0C957D8]();
}

uint64_t sub_1BC2B3DD0()
{
  return MEMORY[0x1E0C95840]();
}

uint64_t sub_1BC2B3DDC()
{
  return MEMORY[0x1E0C95860]();
}

uint64_t sub_1BC2B3DE8()
{
  return MEMORY[0x1E0C958D0]();
}

uint64_t sub_1BC2B3DF4()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1BC2B3E00()
{
  return MEMORY[0x1E0C959E8]();
}

uint64_t sub_1BC2B3E0C()
{
  return MEMORY[0x1E0C95A10]();
}

uint64_t sub_1BC2B3E18()
{
  return MEMORY[0x1E0C95AC0]();
}

uint64_t sub_1BC2B3E24()
{
  return MEMORY[0x1E0C95B68]();
}

uint64_t sub_1BC2B3E30()
{
  return MEMORY[0x1E0C95BA0]();
}

uint64_t sub_1BC2B3E3C()
{
  return MEMORY[0x1E0C95C00]();
}

uint64_t sub_1BC2B3E48()
{
  return MEMORY[0x1E0C95C60]();
}

uint64_t sub_1BC2B3E54()
{
  return MEMORY[0x1E0C95C78]();
}

uint64_t sub_1BC2B3E60()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1BC2B3E6C()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t sub_1BC2B3E78()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1BC2B3E84()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1BC2B3E90()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1BC2B3E9C()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t sub_1BC2B3EA8()
{
  return MEMORY[0x1E0C95E50]();
}

uint64_t sub_1BC2B3EB4()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1BC2B3EC0()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1BC2B3ECC()
{
  return MEMORY[0x1E0C95F68]();
}

uint64_t sub_1BC2B3ED8()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1BC2B3EE4()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1BC2B3EF0()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1BC2B3EFC()
{
  return MEMORY[0x1E0C96078]();
}

uint64_t sub_1BC2B3F08()
{
  return MEMORY[0x1E0C96098]();
}

uint64_t sub_1BC2B3F14()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1BC2B3F20()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1BC2B3F2C()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1BC2B3F38()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1BC2B3F44()
{
  return MEMORY[0x1E0C96130]();
}

uint64_t sub_1BC2B3F50()
{
  return MEMORY[0x1E0C96138]();
}

uint64_t sub_1BC2B3F5C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1BC2B3F68()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1BC2B3F74()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1BC2B3F80()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1BC2B3F8C()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1BC2B3F98()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1BC2B3FA4()
{
  return MEMORY[0x1E0D2E828]();
}

uint64_t sub_1BC2B3FB0()
{
  return MEMORY[0x1E0D2BAB8]();
}

uint64_t sub_1BC2B3FBC()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1BC2B3FC8()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1BC2B3FD4()
{
  return MEMORY[0x1E0C961F0]();
}

uint64_t sub_1BC2B3FE0()
{
  return MEMORY[0x1E0C961F8]();
}

uint64_t sub_1BC2B3FEC()
{
  return MEMORY[0x1E0C96200]();
}

uint64_t sub_1BC2B3FF8()
{
  return MEMORY[0x1E0C96208]();
}

uint64_t sub_1BC2B4004()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1BC2B4010()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1BC2B401C()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t sub_1BC2B4028()
{
  return MEMORY[0x1E0C962A8]();
}

uint64_t sub_1BC2B4034()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1BC2B4040()
{
  return MEMORY[0x1E0C96350]();
}

uint64_t sub_1BC2B404C()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t sub_1BC2B4058()
{
  return MEMORY[0x1E0C96360]();
}

uint64_t sub_1BC2B4064()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1BC2B4070()
{
  return MEMORY[0x1E0C96388]();
}

uint64_t sub_1BC2B407C()
{
  return MEMORY[0x1E0C963C8]();
}

uint64_t sub_1BC2B4088()
{
  return MEMORY[0x1E0C963E8]();
}

uint64_t sub_1BC2B4094()
{
  return MEMORY[0x1E0C963F8]();
}

uint64_t sub_1BC2B40A0()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1BC2B40AC()
{
  return MEMORY[0x1E0C96418]();
}

uint64_t sub_1BC2B40B8()
{
  return MEMORY[0x1E0C96428]();
}

uint64_t sub_1BC2B40C4()
{
  return MEMORY[0x1E0C96430]();
}

uint64_t sub_1BC2B40D0()
{
  return MEMORY[0x1E0CCE6F0]();
}

uint64_t sub_1BC2B40DC()
{
  return MEMORY[0x1E0CCE6F8]();
}

uint64_t sub_1BC2B40E8()
{
  return MEMORY[0x1E0CCE700]();
}

uint64_t sub_1BC2B40F4()
{
  return MEMORY[0x1E0CCE728]();
}

uint64_t sub_1BC2B4100()
{
  return MEMORY[0x1E0CCE730]();
}

uint64_t sub_1BC2B410C()
{
  return MEMORY[0x1E0CCEAA8]();
}

uint64_t sub_1BC2B4118()
{
  return MEMORY[0x1E0CCEAB8]();
}

uint64_t sub_1BC2B4124()
{
  return MEMORY[0x1E0CCEAD0]();
}

uint64_t sub_1BC2B4130()
{
  return MEMORY[0x1E0CD8650]();
}

uint64_t sub_1BC2B413C()
{
  return MEMORY[0x1E0CD8A28]();
}

uint64_t sub_1BC2B4148()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1BC2B4154()
{
  return MEMORY[0x1E0CD91C0]();
}

uint64_t sub_1BC2B4160()
{
  return MEMORY[0x1E0CD93A0]();
}

uint64_t sub_1BC2B416C()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1BC2B4178()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_1BC2B4184()
{
  return MEMORY[0x1E0CDA4B0]();
}

uint64_t sub_1BC2B4190()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1BC2B419C()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1BC2B41A8()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1BC2B41B4()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1BC2B41C0()
{
  return MEMORY[0x1E0CDB630]();
}

uint64_t sub_1BC2B41CC()
{
  return MEMORY[0x1E0CDCF68]();
}

uint64_t sub_1BC2B41D8()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1BC2B41E4()
{
  return MEMORY[0x1E0CDD4E0]();
}

uint64_t sub_1BC2B41F0()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_1BC2B41FC()
{
  return MEMORY[0x1E0CDD5B0]();
}

uint64_t sub_1BC2B4208()
{
  return MEMORY[0x1E0CDD638]();
}

uint64_t sub_1BC2B4214()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_1BC2B4220()
{
  return MEMORY[0x1E0CDDAA0]();
}

uint64_t sub_1BC2B422C()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1BC2B4238()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1BC2B4244()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1BC2B4250()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1BC2B425C()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1BC2B4268()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_1BC2B4274()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_1BC2B4280()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1BC2B428C()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_1BC2B4298()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_1BC2B42A4()
{
  return MEMORY[0x1E0CDFCE0]();
}

uint64_t sub_1BC2B42B0()
{
  return MEMORY[0x1E0CE00E0]();
}

uint64_t sub_1BC2B42BC()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1BC2B42C8()
{
  return MEMORY[0x1E0CE06B8]();
}

uint64_t sub_1BC2B42D4()
{
  return MEMORY[0x1E0CE06C8]();
}

uint64_t sub_1BC2B42E0()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BC2B42EC()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1BC2B42F8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BC2B4304()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BC2B4310()
{
  return MEMORY[0x1E0D2F318]();
}

uint64_t sub_1BC2B431C()
{
  return MEMORY[0x1E0D2F320]();
}

uint64_t sub_1BC2B4328()
{
  return MEMORY[0x1E0D2F348]();
}

uint64_t sub_1BC2B4334()
{
  return MEMORY[0x1E0CB4328]();
}

uint64_t sub_1BC2B4340()
{
  return MEMORY[0x1E0CB4340]();
}

uint64_t sub_1BC2B434C()
{
  return MEMORY[0x1E0CB4350]();
}

uint64_t sub_1BC2B4358()
{
  return MEMORY[0x1E0CB4390]();
}

uint64_t sub_1BC2B4364()
{
  return MEMORY[0x1E0CB43A8]();
}

uint64_t sub_1BC2B4370()
{
  return MEMORY[0x1E0CB43B0]();
}

uint64_t sub_1BC2B437C()
{
  return MEMORY[0x1E0CB43C8]();
}

uint64_t sub_1BC2B4388()
{
  return MEMORY[0x1E0CB43D8]();
}

uint64_t sub_1BC2B4394()
{
  return MEMORY[0x1E0CB43F8]();
}

uint64_t sub_1BC2B43A0()
{
  return MEMORY[0x1E0CB17B8]();
}

uint64_t sub_1BC2B43AC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BC2B43B8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BC2B43C4()
{
  return MEMORY[0x1E0DE9F78]();
}

uint64_t sub_1BC2B43D0()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BC2B43DC()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1BC2B43E8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1BC2B43F4()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1BC2B4400()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1BC2B440C()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BC2B4418()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1BC2B4424()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BC2B4430()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BC2B443C()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1BC2B4448()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BC2B4454()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BC2B4460()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BC2B446C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1BC2B4478()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BC2B4484()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1BC2B4490()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1BC2B449C()
{
  return MEMORY[0x1E0DEA628]();
}

uint64_t sub_1BC2B44A8()
{
  return MEMORY[0x1E0D2E8A8]();
}

uint64_t sub_1BC2B44B4()
{
  return MEMORY[0x1E0D2E8B0]();
}

uint64_t sub_1BC2B44C0()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1BC2B44CC()
{
  return MEMORY[0x1E0D2A600]();
}

uint64_t sub_1BC2B44D8()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BC2B44E4()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1BC2B44F0()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1BC2B44FC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BC2B4508()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BC2B4514()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1BC2B4520()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1BC2B452C()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1BC2B4538()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t sub_1BC2B4544()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1BC2B4550()
{
  return MEMORY[0x1E0D2A618]();
}

uint64_t sub_1BC2B455C()
{
  return MEMORY[0x1E0DEAB08]();
}

uint64_t sub_1BC2B4568()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1BC2B4574()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BC2B4580()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BC2B458C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BC2B4598()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1BC2B45A4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BC2B45B0()
{
  return MEMORY[0x1E0D2F160]();
}

uint64_t sub_1BC2B45BC()
{
  return MEMORY[0x1E0D2F168]();
}

uint64_t sub_1BC2B45C8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BC2B45D4()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1BC2B45E0()
{
  return MEMORY[0x1E0D2CC50]();
}

uint64_t sub_1BC2B45EC()
{
  return MEMORY[0x1E0D2CC58]();
}

uint64_t sub_1BC2B45F8()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1BC2B4604()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BC2B4610()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BC2B461C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1BC2B4628()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1BC2B4634()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1BC2B4640()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1BC2B464C()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1BC2B4658()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1BC2B4664()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1BC2B4670()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1BC2B467C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1BC2B4688()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t sub_1BC2B4694()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1BC2B46A0()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1BC2B46AC()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1BC2B46B8()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1BC2B46C4()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1BC2B46D0()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1BC2B46DC()
{
  return MEMORY[0x1E0DF0A40]();
}

uint64_t sub_1BC2B46E8()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_1BC2B46F4()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_1BC2B4700()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_1BC2B470C()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_1BC2B4718()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_1BC2B4724()
{
  return MEMORY[0x1E0CB1B48]();
}

uint64_t sub_1BC2B4730()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1BC2B473C()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1BC2B4748()
{
  return MEMORY[0x1E0D2F170]();
}

uint64_t sub_1BC2B4754()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1BC2B4760()
{
  return MEMORY[0x1E0DEB060]();
}

uint64_t sub_1BC2B476C()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1BC2B4778()
{
  return MEMORY[0x1E0CB1B90]();
}

uint64_t sub_1BC2B4784()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1BC2B4790()
{
  return MEMORY[0x1E0CB1BA0]();
}

uint64_t sub_1BC2B479C()
{
  return MEMORY[0x1E0DEB178]();
}

uint64_t sub_1BC2B47A8()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1BC2B47B4()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1BC2B47C0()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1BC2B47CC()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1BC2B47D8()
{
  return MEMORY[0x1E0DEB2B0]();
}

uint64_t sub_1BC2B47E4()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1BC2B47F0()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1BC2B47FC()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1BC2B4808()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1BC2B4814()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1BC2B4820()
{
  return MEMORY[0x1E0D2F360]();
}

uint64_t sub_1BC2B482C()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1BC2B4838()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1BC2B4844()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_1BC2B4850()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1BC2B485C()
{
  return MEMORY[0x1E0D2BBA8]();
}

uint64_t sub_1BC2B4868()
{
  return MEMORY[0x1E0D2F178]();
}

uint64_t sub_1BC2B4874()
{
  return MEMORY[0x1E0D2BFF0]();
}

uint64_t sub_1BC2B4880()
{
  return MEMORY[0x1E0D2C048]();
}

uint64_t sub_1BC2B488C()
{
  return MEMORY[0x1E0D2C060]();
}

uint64_t sub_1BC2B4898()
{
  return MEMORY[0x1E0D2C070]();
}

uint64_t sub_1BC2B48A4()
{
  return MEMORY[0x1E0D2A668]();
}

uint64_t sub_1BC2B48B0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BC2B48BC()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BC2B48C8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BC2B48D4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1BC2B48E0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BC2B48EC()
{
  return MEMORY[0x1E0D2CC60]();
}

uint64_t sub_1BC2B48F8()
{
  return MEMORY[0x1E0D2CC68]();
}

uint64_t sub_1BC2B4904()
{
  return MEMORY[0x1E0D2CC70]();
}

uint64_t sub_1BC2B4910()
{
  return MEMORY[0x1E0D2CC78]();
}

uint64_t sub_1BC2B491C()
{
  return MEMORY[0x1E0D2F180]();
}

uint64_t sub_1BC2B4928()
{
  return MEMORY[0x1E0DC2AF0]();
}

uint64_t sub_1BC2B4934()
{
  return MEMORY[0x1E0D2C0F8]();
}

uint64_t sub_1BC2B4940()
{
  return MEMORY[0x1E0D2C110]();
}

uint64_t sub_1BC2B494C()
{
  return MEMORY[0x1E0D2CC80]();
}

uint64_t sub_1BC2B4958()
{
  return MEMORY[0x1E0D2CC88]();
}

uint64_t sub_1BC2B4964()
{
  return MEMORY[0x1E0D2CC90]();
}

uint64_t sub_1BC2B4970()
{
  return MEMORY[0x1E0CB1E40]();
}

uint64_t sub_1BC2B497C()
{
  return MEMORY[0x1E0D2BBB8]();
}

uint64_t sub_1BC2B4988()
{
  return MEMORY[0x1E0D2BBC0]();
}

uint64_t sub_1BC2B4994()
{
  return MEMORY[0x1E0D2BBC8]();
}

uint64_t sub_1BC2B49A0()
{
  return MEMORY[0x1E0D2BBF0]();
}

uint64_t sub_1BC2B49AC()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1BC2B49B8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BC2B49C4()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1BC2B49D0()
{
  return MEMORY[0x1E0DEF878]();
}

uint64_t sub_1BC2B49DC()
{
  return MEMORY[0x1E0DEF880]();
}

uint64_t sub_1BC2B49E8()
{
  return MEMORY[0x1E0DEF890]();
}

uint64_t sub_1BC2B49F4()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1BC2B4A00()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BC2B4A0C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1BC2B4A18()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BC2B4A24()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BC2B4A30()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1BC2B4A3C()
{
  return MEMORY[0x1E0D2F378]();
}

uint64_t sub_1BC2B4A48()
{
  return MEMORY[0x1E0D2F398]();
}

uint64_t sub_1BC2B4A54()
{
  return MEMORY[0x1E0D2F3A0]();
}

uint64_t sub_1BC2B4A60()
{
  return MEMORY[0x1E0D2F3A8]();
}

uint64_t sub_1BC2B4A6C()
{
  return MEMORY[0x1E0DC2C90]();
}

uint64_t sub_1BC2B4A78()
{
  return MEMORY[0x1E0D2F3B0]();
}

uint64_t sub_1BC2B4A84()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1BC2B4A90()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1BC2B4A9C()
{
  return MEMORY[0x1E0DC2D00]();
}

uint64_t sub_1BC2B4AA8()
{
  return MEMORY[0x1E0DC2D08]();
}

uint64_t sub_1BC2B4AB4()
{
  return MEMORY[0x1E0DC2D10]();
}

uint64_t sub_1BC2B4AC0()
{
  return MEMORY[0x1E0DC2D18]();
}

uint64_t sub_1BC2B4ACC()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1BC2B4AD8()
{
  return MEMORY[0x1E0D2F188]();
}

uint64_t sub_1BC2B4AE4()
{
  return MEMORY[0x1E0D2F190]();
}

uint64_t sub_1BC2B4AF0()
{
  return MEMORY[0x1E0D2F198]();
}

uint64_t sub_1BC2B4AFC()
{
  return MEMORY[0x1E0DC2D88]();
}

uint64_t sub_1BC2B4B08()
{
  return MEMORY[0x1E0DC2D90]();
}

uint64_t sub_1BC2B4B14()
{
  return MEMORY[0x1E0D2BC28]();
}

uint64_t sub_1BC2B4B20()
{
  return MEMORY[0x1E0D2CC98]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE7medmoji0eF10Experience29MedicationVisualizationConfigVSgvg_0()
{
  return MEMORY[0x1E0D2CCC0]();
}

uint64_t sub_1BC2B4B38()
{
  return MEMORY[0x1E0D2CCC8]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE10componentsSaySSGSgvg_0()
{
  return MEMORY[0x1E0D2CCD0]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE8doseFormSSSgvg_0()
{
  return MEMORY[0x1E0D2CCD8]();
}

uint64_t sub_1BC2B4B5C()
{
  return MEMORY[0x1E0D2CCE0]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE5titleSSvg_0()
{
  return MEMORY[0x1E0D2CCE8]();
}

uint64_t sub_1BC2B4B74()
{
  return MEMORY[0x1E0D2CCF0]();
}

uint64_t sub_1BC2B4B80()
{
  return MEMORY[0x1E0D2CCF8]();
}

uint64_t sub_1BC2B4B8C()
{
  return MEMORY[0x1E0D2CD00]();
}

uint64_t sub_1BC2B4B98()
{
  return MEMORY[0x1E0D2CD08]();
}

uint64_t sub_1BC2B4BA4()
{
  return MEMORY[0x1E0D2CD10]();
}

uint64_t sub_1BC2B4BB0()
{
  return MEMORY[0x1E0D2CD18]();
}

uint64_t sub_1BC2B4BBC()
{
  return MEMORY[0x1E0D2CD20]();
}

uint64_t sub_1BC2B4BC8()
{
  return MEMORY[0x1E0D2CD28]();
}

uint64_t sub_1BC2B4BD4()
{
  return MEMORY[0x1E0D2CD30]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE8strengthSSSgvg_0()
{
  return MEMORY[0x1E0D2CD38]();
}

uint64_t sub_1BC2B4BEC()
{
  return MEMORY[0x1E0D2CD40]();
}

uint64_t sub_1BC2B4BF8()
{
  return MEMORY[0x1E0D2CD48]();
}

uint64_t sub_1BC2B4C04()
{
  return MEMORY[0x1E0D2CD50]();
}

uint64_t sub_1BC2B4C10()
{
  return MEMORY[0x1E0D2CD58]();
}

uint64_t sub_1BC2B4C1C()
{
  return MEMORY[0x1E0D2CD60]();
}

uint64_t sub_1BC2B4C28()
{
  return MEMORY[0x1E0D2CD68]();
}

uint64_t sub_1BC2B4C34()
{
  return MEMORY[0x1E0D2F1A8]();
}

uint64_t sub_1BC2B4C40()
{
  return MEMORY[0x1E0D2F1B0]();
}

uint64_t sub_1BC2B4C4C()
{
  return MEMORY[0x1E0D2F3C8]();
}

uint64_t sub_1BC2B4C58()
{
  return MEMORY[0x1E0D2F1B8]();
}

uint64_t sub_1BC2B4C64()
{
  return MEMORY[0x1E0D2BC38]();
}

uint64_t sub_1BC2B4C70()
{
  return MEMORY[0x1E0D2F1C0]();
}

uint64_t sub_1BC2B4C7C()
{
  return MEMORY[0x1E0D2F1C8]();
}

uint64_t sub_1BC2B4C88()
{
  return MEMORY[0x1E0D2BC40]();
}

uint64_t sub_1BC2B4C94()
{
  return MEMORY[0x1E0D2BC48]();
}

uint64_t sub_1BC2B4CA0()
{
  return MEMORY[0x1E0D2BC58]();
}

uint64_t sub_1BC2B4CAC()
{
  return MEMORY[0x1E0D2BC60]();
}

uint64_t sub_1BC2B4CB8()
{
  return MEMORY[0x1E0D2CD70]();
}

uint64_t sub_1BC2B4CC4()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1BC2B4CD0()
{
  return MEMORY[0x1E0D2F3D0]();
}

uint64_t sub_1BC2B4CDC()
{
  return MEMORY[0x1E0D2F1D0]();
}

uint64_t sub_1BC2B4CE8()
{
  return MEMORY[0x1E0D2F1D8]();
}

uint64_t sub_1BC2B4CF4()
{
  return MEMORY[0x1E0D2BC68]();
}

uint64_t sub_1BC2B4D00()
{
  return MEMORY[0x1E0D2BC78]();
}

uint64_t sub_1BC2B4D0C()
{
  return MEMORY[0x1E0D2CD78]();
}

uint64_t sub_1BC2B4D18()
{
  return MEMORY[0x1E0D2CD80]();
}

uint64_t sub_1BC2B4D24()
{
  return MEMORY[0x1E0D2CD88]();
}

uint64_t sub_1BC2B4D30()
{
  return MEMORY[0x1E0D2CD90]();
}

uint64_t sub_1BC2B4D3C()
{
  return MEMORY[0x1E0D2BC90]();
}

uint64_t sub_1BC2B4D48()
{
  return MEMORY[0x1E0D2F1E0]();
}

uint64_t sub_1BC2B4D54()
{
  return MEMORY[0x1E0D2F1E8]();
}

uint64_t sub_1BC2B4D60()
{
  return MEMORY[0x1E0D2CD98]();
}

uint64_t sub_1BC2B4D6C()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1BC2B4D78()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1BC2B4D84()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BC2B4D90()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1BC2B4D9C()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1BC2B4DA8()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1BC2B4DB4()
{
  return MEMORY[0x1E0DC3008]();
}

uint64_t sub_1BC2B4DC0()
{
  return MEMORY[0x1E0DC3038]();
}

uint64_t sub_1BC2B4DCC()
{
  return MEMORY[0x1E0DC3070]();
}

uint64_t sub_1BC2B4DD8()
{
  return MEMORY[0x1E0DC3080]();
}

uint64_t sub_1BC2B4DE4()
{
  return MEMORY[0x1E0DC3090]();
}

uint64_t sub_1BC2B4DF0()
{
  return MEMORY[0x1E0DC30C0]();
}

uint64_t sub_1BC2B4DFC()
{
  return MEMORY[0x1E0DC30E8]();
}

uint64_t sub_1BC2B4E08()
{
  return MEMORY[0x1E0DC30F8]();
}

uint64_t sub_1BC2B4E14()
{
  return MEMORY[0x1E0DC3100]();
}

uint64_t sub_1BC2B4E20()
{
  return MEMORY[0x1E0DC3110]();
}

uint64_t sub_1BC2B4E2C()
{
  return MEMORY[0x1E0DC3128]();
}

uint64_t sub_1BC2B4E38()
{
  return MEMORY[0x1E0DC3138]();
}

uint64_t sub_1BC2B4E44()
{
  return MEMORY[0x1E0DC3148]();
}

uint64_t sub_1BC2B4E50()
{
  return MEMORY[0x1E0DC3150]();
}

uint64_t sub_1BC2B4E5C()
{
  return MEMORY[0x1E0DC3170]();
}

uint64_t sub_1BC2B4E68()
{
  return MEMORY[0x1E0DC31A0]();
}

uint64_t sub_1BC2B4E74()
{
  return MEMORY[0x1E0DC31B0]();
}

uint64_t sub_1BC2B4E80()
{
  return MEMORY[0x1E0DC31B8]();
}

uint64_t sub_1BC2B4E8C()
{
  return MEMORY[0x1E0DC31C0]();
}

uint64_t sub_1BC2B4E98()
{
  return MEMORY[0x1E0DC31D0]();
}

uint64_t sub_1BC2B4EA4()
{
  return MEMORY[0x1E0DC31D8]();
}

uint64_t sub_1BC2B4EB0()
{
  return MEMORY[0x1E0DC31E0]();
}

uint64_t sub_1BC2B4EBC()
{
  return MEMORY[0x1E0DC31F0]();
}

uint64_t sub_1BC2B4EC8()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_1BC2B4ED4()
{
  return MEMORY[0x1E0DC3238]();
}

uint64_t sub_1BC2B4EE0()
{
  return MEMORY[0x1E0DC3240]();
}

uint64_t sub_1BC2B4EEC()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_1BC2B4EF8()
{
  return MEMORY[0x1E0DC3258]();
}

uint64_t sub_1BC2B4F04()
{
  return MEMORY[0x1E0D2F1F0]();
}

uint64_t sub_1BC2B4F10()
{
  return MEMORY[0x1E0D2F1F8]();
}

uint64_t sub_1BC2B4F1C()
{
  return MEMORY[0x1E0D2CDA0]();
}

uint64_t sub_1BC2B4F28()
{
  return MEMORY[0x1E0D2CDA8]();
}

uint64_t sub_1BC2B4F34()
{
  return MEMORY[0x1E0D2CDB0]();
}

uint64_t sub_1BC2B4F40()
{
  return MEMORY[0x1E0D2CDB8]();
}

uint64_t sub_1BC2B4F4C()
{
  return MEMORY[0x1E0D2CDC0]();
}

uint64_t sub_1BC2B4F58()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_1BC2B4F64()
{
  return MEMORY[0x1E0CB2300]();
}

uint64_t sub_1BC2B4F70()
{
  return MEMORY[0x1E0CB2328]();
}

uint64_t sub_1BC2B4F7C()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1BC2B4F88()
{
  return MEMORY[0x1E0D2E958]();
}

uint64_t sub_1BC2B4F94()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1BC2B4FA0()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BC2B4FAC()
{
  return MEMORY[0x1E0DEB960]();
}

uint64_t sub_1BC2B4FB8()
{
  return MEMORY[0x1E0DEBB60]();
}

uint64_t sub_1BC2B4FC4()
{
  return MEMORY[0x1E0CB23C8]();
}

uint64_t sub_1BC2B4FD0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BC2B4FDC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BC2B4FE8()
{
  return MEMORY[0x1E0CB2420]();
}

uint64_t sub_1BC2B4FF4()
{
  return MEMORY[0x1E0CB2430]();
}

uint64_t sub_1BC2B5000()
{
  return MEMORY[0x1E0CB2478]();
}

uint64_t sub_1BC2B500C()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1BC2B5018()
{
  return MEMORY[0x1E0CB24D8]();
}

uint64_t sub_1BC2B5024()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BC2B5030()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t sub_1BC2B503C()
{
  return MEMORY[0x1E0DEBFC8]();
}

uint64_t sub_1BC2B5048()
{
  return MEMORY[0x1E0DEBFD0]();
}

uint64_t sub_1BC2B5054()
{
  return MEMORY[0x1E0DEBFD8]();
}

uint64_t sub_1BC2B5060()
{
  return MEMORY[0x1E0DEBFF8]();
}

uint64_t sub_1BC2B506C()
{
  return MEMORY[0x1E0DEC008]();
}

uint64_t sub_1BC2B5078()
{
  return MEMORY[0x1E0DEC010]();
}

uint64_t sub_1BC2B5084()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BC2B5090()
{
  return MEMORY[0x1E0DEC058]();
}

uint64_t sub_1BC2B509C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BC2B50A8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BC2B50B4()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1BC2B50C0()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1BC2B50CC()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1BC2B50D8()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1BC2B50E4()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1BC2B50F0()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1BC2B50FC()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1BC2B5108()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1BC2B5114()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1BC2B5120()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1BC2B512C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1BC2B5138()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1BC2B5144()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1BC2B5150()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1BC2B515C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1BC2B5168()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1BC2B5174()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1BC2B5180()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BC2B518C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BC2B5198()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1BC2B51A4()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BC2B51B0()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BC2B51BC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BC2B51C8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BC2B51D4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BC2B51E0()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BC2B51EC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BC2B51F8()
{
  return MEMORY[0x1E0DEC628]();
}

uint64_t sub_1BC2B5204()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BC2B5210()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BC2B521C()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1BC2B5228()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BC2B5234()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BC2B5240()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BC2B524C()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1BC2B5258()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1BC2B5264()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1BC2B5270()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BC2B527C()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1BC2B5288()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1BC2B5294()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1BC2B52A0()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1BC2B52AC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BC2B52B8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BC2B52C4()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1BC2B52D0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BC2B52DC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BC2B52E8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BC2B52F4()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1BC2B5300()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BC2B530C()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BC2B5318()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BC2B5324()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BC2B5330()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BC2B533C()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1BC2B5348()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1BC2B5354()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BC2B5360()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1BC2B536C()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1BC2B5378()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BC2B5384()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1BC2B5390()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1BC2B539C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BC2B53A8()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BC2B53B4()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1BC2B53C0()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1BC2B53CC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BC2B53D8()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1BC2B53E4()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BC2B53F0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BC2B53FC()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1BC2B5408()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1BC2B5414()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BC2B5420()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BC2B542C()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1BC2B5438()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1BC2B5444()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1BC2B5450()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BC2B545C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BC2B5468()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1BC2B5474()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1BC2B5480()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1BC2B548C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BC2B5498()
{
  return MEMORY[0x1E0D2F200]();
}

uint64_t sub_1BC2B54A4()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BC2B54B0()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BC2B54BC()
{
  return MEMORY[0x1E0DEE298]();
}

uint64_t sub_1BC2B54C8()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BC2B54D4()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1BC2B54E0()
{
  return MEMORY[0x1E0D2F3E0]();
}

uint64_t sub_1BC2B54EC()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t sub_1BC2B54F8()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t HKCurrentSchemaVersionForShardIdentifier()
{
  return MEMORY[0x1E0CB4B28]();
}

uint64_t HKDrugInteractionLifestyleFactorForHKConceptIdentifier()
{
  return MEMORY[0x1E0D2C240]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x1E0D2F498]();
}

uint64_t HKMedicationDoseEventStatusToString()
{
  return MEMORY[0x1E0CB5410]();
}

uint64_t HKOntologyShardSchemaTypeForShardIdentifier()
{
  return MEMORY[0x1E0CB5738]();
}

uint64_t HKStringFromOntologyShardState()
{
  return MEMORY[0x1E0CB5FF8]();
}

uint64_t HKStringFromUserDomainConceptPropertyType()
{
  return MEMORY[0x1E0CB6020]();
}

uint64_t HKUIJoinAttributedStringsForLocale()
{
  return MEMORY[0x1E0D2F548]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x1E0D2F550]();
}

uint64_t HKUIMidDate()
{
  return MEMORY[0x1E0D2F570]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x1E0D2F590]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x1E0DE2C80]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1E0DEEB48]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

