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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1BCCF9518](a1, v6, a5);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
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

id sub_1BC9607E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setAdjustsFontForContentSizeCategory_, 1);
    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    objc_msgSend(v4, sel_setText_, 0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

_QWORD *sub_1BC9608B8(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  _QWORD *v10;
  void (*v11)(void);
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  objc_super v24;

  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label] = 0;
  v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes] = 7;
  v24.receiver = v4;
  v24.super_class = (Class)type metadata accessor for DynamicHeightLabelView();
  v10 = objc_msgSendSuper2(&v24, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v10, sel_setPreservesSuperviewLayoutMargins_, 1);
  v11 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v10) + 0xC8);
  v12 = v10;
  v11();
  objc_msgSend(v12, sel_setLayoutMargins_);

  v13 = v12;
  v14 = sub_1BC9607E8();
  objc_msgSend(v13, sel_addSubview_, v14);

  v15 = (void *)objc_opt_self();
  v16 = sub_1BC9607E8();
  v17 = v13;
  sub_1BC9705FC(v16, v17, 0, 1);

  sub_1BC961A94();
  v18 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_activateConstraints_, v18);

  sub_1BC961AD0();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1BC980D10;
  v20 = sub_1BC97FB9C();
  v21 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 40) = v21;
  v22 = v17;
  MEMORY[0x1BCCF8EDC](v19, sel_preferredContentSizeCategoryDidChange);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v22;
}

unint64_t sub_1BC960B6C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t result;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes);
    if (v2 != 7)
    {
      v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text);
      v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes);
      swift_bridgeObjectRetain();
      sub_1BC961A84(v2);
      sub_1BC960C2C(v3, v1, 0, &v5);
      swift_bridgeObjectRelease();
      return sub_1BC961808(v2);
    }
  }
  return result;
}

void sub_1BC960C2C(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  char *v4;
  char *v5;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  id v12;
  char v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v5 = v4;
  v9 = *a4;
  v10 = (uint64_t *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text];
  *v10 = a1;
  v10[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes];
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes] = v9;
  sub_1BC9617F8(v9);
  sub_1BC961808(v11);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_init);
  if (!*(_QWORD *)(HealthArticleTextAttributes.textAttributes.getter() + 16))
    goto LABEL_6;
  v12 = (id)*MEMORY[0x1E0DC1138];
  sub_1BC96C1DC((uint64_t)v12);
  if ((v13 & 1) == 0)
  {

LABEL_6:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_unknownObjectRetain();

  swift_bridgeObjectRelease();
  objc_opt_self();
  v14 = (id)swift_dynamicCastObjCClass();
  if (v14)
  {
LABEL_8:
    sub_1BC960E94(a1, a2, a3, v14, objc_msgSend(v5, sel_effectiveUserInterfaceLayoutDirection, v19, v9) == (id)1);

    v16 = HealthArticleTextAttributes.textAttributes.getter();
    sub_1BC972B7C(v16);
    type metadata accessor for Key(0);
    sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
    v17 = (void *)sub_1BC97FECC();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_addAttributes_range_, v17, 0, objc_msgSend(v20, sel_length));
    swift_bridgeObjectRelease();

    v18 = sub_1BC9607E8();
    objc_msgSend(v18, sel_setAttributedText_, v20);

    objc_msgSend(v5, sel_setNeedsLayout);
    return;
  }
  swift_unknownObjectRelease();
LABEL_7:
  v15 = sub_1BC9607E8();
  v14 = objc_msgSend(v15, sel_font);

  if (v14)
    goto LABEL_8;
  __break(1u);
}

void sub_1BC960E94(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5)
{
  void *v5;
  void *v7;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v32;

  v7 = a4;
  if ((a5 & 1) != 0)
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v9, (SEL)&selRef_addAttributes_range_, v10);

    objc_msgSend(v5, sel_appendAttributedString_, v11);
    if (!a3)
      return;
    v12 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v32 = a3;
    v13 = (void *)sub_1BC97FEFC();
    v14 = objc_msgSend(v12, (SEL)&selRef_addAttributes_range_, v13);

    objc_msgSend(v5, sel_appendAttributedString_, v14);
    v7 = a4;
  }
  else
  {
    if (!a3)
    {
LABEL_11:
      v29 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
      swift_bridgeObjectRetain();
      v30 = (void *)sub_1BC97FEFC();
      swift_bridgeObjectRelease();
      v32 = objc_msgSend(v29, sel_initWithString_, v30);

      objc_msgSend(v5, sel_appendAttributedString_, v32);
      goto LABEL_12;
    }
    v32 = a3;
  }
  v15 = objc_msgSend((id)objc_opt_self(), sel_textAttachmentWithImage_, v32);
  objc_msgSend(v15, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  v16 = objc_msgSend(v15, sel_image);
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v7, sel_capHeight);
    v19 = v18;
    objc_msgSend(v17, sel_size);
    v21 = round(v19 - v20) * 0.5;
    objc_msgSend(v17, sel_size);
    v23 = v22;
    objc_msgSend(v17, sel_size);
    objc_msgSend(v15, sel_setBounds_, 0.0, v21, v23, v24);

  }
  v25 = objc_msgSend((id)objc_opt_self(), sel_attributedStringWithAttachment_, v15);
  objc_msgSend(v5, (SEL)&ButtonView.ivar_lyt + 4, v25);

  if ((a5 & 1) == 0)
  {
    v26 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v27 = (void *)sub_1BC97FEFC();
    v28 = objc_msgSend(v26, sel_initWithString_, v27);

    objc_msgSend(v5, (SEL)&ButtonView.ivar_lyt + 4, v28);
    goto LABEL_11;
  }

LABEL_12:
}

id sub_1BC9611C8()
{
  void *v0;

  return objc_msgSend(v0, sel_layoutMargins);
}

id sub_1BC9611D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicHeightLabelView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DynamicHeightLabelView()
{
  return objc_opt_self();
}

void type metadata accessor for TimeControlStatus(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1EF475C88);
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1EF475C90);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1EF475C98);
}

uint64_t sub_1BC9612B0(uint64_t a1, uint64_t a2)
{
  return sub_1BC96140C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1BC9612C8(uint64_t a1, uint64_t a2)
{
  return sub_1BC96140C(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1BC9612DC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1BC97FF08();
  *a2 = 0;
  return result;
}

uint64_t sub_1BC961350(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1BC97FF14();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BC9613CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1BC97FF20();
  v2 = sub_1BC97FEFC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BC96140C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BC97FF20();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BC961448()
{
  sub_1BC97FF20();
  sub_1BC97FF5C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC961488()
{
  uint64_t v0;

  sub_1BC97FF20();
  sub_1BC980340();
  sub_1BC97FF5C();
  v0 = sub_1BC980364();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BC9614F8()
{
  return sub_1BC980040();
}

uint64_t sub_1BC961500(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  int v5;
  int v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x1BCCF8E04](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_1BC961550(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  int v5;
  int v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x1BCCF8E10](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_1BC9615A4(float *a1@<X8>)
{
  *a1 = MEMORY[0x1BCCF8E1C]();
}

BOOL sub_1BC9615C8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1BC9615DC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1BC9615EC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1BC9615FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1BC97FF20();
  v2 = v1;
  if (v0 == sub_1BC97FF20() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1BC980310();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BC961688@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1BC97FF20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BC9616B0()
{
  sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
  sub_1BC96178C(&qword_1EF475CB8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E34);
  return sub_1BC9802E0();
}

uint64_t sub_1BC961734()
{
  return sub_1BC96178C(&qword_1EF475CA0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980DF8);
}

uint64_t sub_1BC961760()
{
  return sub_1BC96178C(&qword_1EF475CA8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980DCC);
}

uint64_t sub_1BC96178C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCF95CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC9617CC()
{
  return sub_1BC96178C(&qword_1EF475CB0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E68);
}

unint64_t sub_1BC9617F8(unint64_t result)
{
  if (result >= 7)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_1BC961808(unint64_t result)
{
  if (result != 7)
    return sub_1BC961818(result);
  return result;
}

unint64_t sub_1BC961818(unint64_t result)
{
  if (result >= 7)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1BC961828()
{
  sub_1BC96178C(&qword_1EF475D48, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC981404);
  sub_1BC96178C(&qword_1EF475D50, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC981200);
  return sub_1BC9802E0();
}

uint64_t sub_1BC9618AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BC97FEFC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BC9618F0()
{
  sub_1BC96178C(&qword_1EF475D38, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC9813C0);
  sub_1BC96178C(&qword_1EF475D40, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC981314);
  return sub_1BC9802E0();
}

_DWORD *sub_1BC961974@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

float sub_1BC961984@<S0>(_DWORD *a1@<X8>)
{
  float *v1;
  float result;

  result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_1BC961990()
{
  sub_1BC96178C(&qword_1EF475D58, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_1BC981108);
  sub_1BC96178C((unint64_t *)&unk_1EF475D60, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)"!һ*x%");
  return sub_1BC9802E0();
}

uint64_t sub_1BC961A24()
{
  return sub_1BC980070();
}

uint64_t sub_1BC961A2C()
{
  return sub_1BC980358();
}

void sub_1BC961A5C()
{
  JUMPOUT(0x1BCCF90ECLL);
}

BOOL sub_1BC961A70(float *a1, float *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1BC961A84(unint64_t result)
{
  if (result != 7)
    return sub_1BC9617F8(result);
  return result;
}

unint64_t sub_1BC961A94()
{
  unint64_t result;

  result = qword_1ED6A1458;
  if (!qword_1ED6A1458)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A1458);
  }
  return result;
}

void sub_1BC961AD0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF475CC0)
  {
    sub_1BC961B24();
    v0 = sub_1BC980304();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF475CC0);
  }
}

unint64_t sub_1BC961B24()
{
  unint64_t result;

  result = qword_1EF4760E0;
  if (!qword_1EF4760E0)
  {
    sub_1BC961B5C();
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF4760E0);
  }
  return result;
}

unint64_t sub_1BC961B5C()
{
  unint64_t result;

  result = qword_1EF475CC8;
  if (!qword_1EF475CC8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF475CC8);
  }
  return result;
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1EF475CD0);
}

void type metadata accessor for FeatureKey(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1EF475CD8);
}

uint64_t initializeBufferWithCopyOfBuffer for LinkedTextView.LinkFormat(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1BC961C08(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BC961C28(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1EF475CE0);
}

uint64_t sub_1BC961C74(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BC961C94(uint64_t result, int a2, int a3)
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
  sub_1BC961CE4(a1, &qword_1EF475CE8);
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
  sub_1BC961CE4(a1, &qword_1ED6A1450);
}

void sub_1BC961CE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BC961D28()
{
  return sub_1BC96178C(&qword_1EF475CF0, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_1BC98106C);
}

uint64_t sub_1BC961D54()
{
  return sub_1BC96178C(&qword_1EF475CF8, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_1BC981040);
}

uint64_t sub_1BC961D80()
{
  return sub_1BC96178C(&qword_1EF475D00, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_1BC9810DC);
}

uint64_t sub_1BC961DAC()
{
  return sub_1BC96178C(&qword_1EF475D08, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC9811C4);
}

uint64_t sub_1BC961DD8()
{
  return sub_1BC96178C(&qword_1EF475D10, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC981198);
}

uint64_t sub_1BC961E04()
{
  return sub_1BC96178C(&qword_1EF475D18, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC9812D8);
}

uint64_t sub_1BC961E30()
{
  return sub_1BC96178C(&qword_1EF475D20, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC9812AC);
}

uint64_t sub_1BC961E5C()
{
  return sub_1BC96178C(&qword_1EF475D28, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC981348);
}

uint64_t sub_1BC961E88()
{
  return sub_1BC96178C(&qword_1EF475D30, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC981234);
}

id sub_1BC961EC4(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  objc_super v18;

  v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = -1;
  v10 = &v4[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent];
  v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = &v4[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_rangeOfLink];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 1;
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for LinkedTextView();
  v13 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  v14 = sub_1BC9718D4();

  objc_msgSend(v14, sel_setDelegate_, v13);
  v15 = v13;
  v16 = sub_1BC9718D4();

  objc_msgSend(v16, sel_setUserInteractionEnabled_, 1);
  return v15;
}

void sub_1BC9620F4(__int128 *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  __int128 *v24;
  void (*v25)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char *v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  _QWORD v51[2];
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
  __int128 *v62;
  uint64_t v63;
  _QWORD v64[4];
  unsigned __int8 v65;
  _QWORD v66[4];
  char v67;
  uint64_t v68[4];
  char v69;

  v63 = a5;
  v59 = a4;
  v55 = a3;
  v7 = a1;
  sub_1BC9633A8(a1, (uint64_t)v64);
  v8 = v64[1];
  v60 = v64[0];
  v58 = v64[2];
  v57 = v64[3];
  LODWORD(v62) = v65;
  v54 = sub_1BC97F98C();
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v52 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v61 = (uint64_t)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC963498(0, &qword_1ED6A1020, v13, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v51 - v15;
  v56 = *a2;
  v17 = &v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat];
  v18 = *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat];
  v19 = *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 8];
  v20 = *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 16];
  v21 = *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 24];
  *(_QWORD *)v17 = v60;
  *((_QWORD *)v17 + 1) = v8;
  v51[1] = v8;
  v22 = v57;
  *((_QWORD *)v17 + 2) = v58;
  *((_QWORD *)v17 + 3) = v22;
  v23 = v5;
  v24 = v7;
  LOBYTE(v7) = v17[32];
  v17[32] = (char)v62;
  v62 = v24;
  sub_1BC9633C0((uint64_t)v24);
  sub_1BC963394(v18, v19, v20, v21, v7);
  sub_1BC963314(v63, (uint64_t)v16);
  v25 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
  v60 = v10;
  v25(v16, 0, 1, v10);
  v26 = (uint64_t)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent];
  swift_beginAccess();
  sub_1BC9633F4((uint64_t)v16, v26);
  swift_endAccess();
  if (v59)
    v27 = (void *)sub_1BC97FEFC();
  else
    v27 = 0;
  objc_msgSend(v5, sel_setAccessibilityIdentifier_, v27);

  sub_1BC9633A8(v62, (uint64_t)v68);
  if (v69)
  {
    if (v69 == 1)
    {
      sub_1BC962D08(v68[0], v68[1], (uint64_t)v66);
      v28 = v66[2];
      v29 = v66[3];
      v30 = v67;
      goto LABEL_10;
    }
    v66[0] = v68[2];
    v66[1] = v68[3];
    swift_bridgeObjectRetain();
    sub_1BC97FF74();
    swift_bridgeObjectRetain();
    sub_1BC97FF74();
    v28 = sub_1BC97FF8C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v29 = sub_1BC97FF8C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    v29 = sub_1BC97FF8C();
    v28 = 0;
  }
  v30 = 0;
LABEL_10:
  v31 = v56;
  v32 = &v23[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_rangeOfLink];
  *(_QWORD *)v32 = v28;
  *((_QWORD *)v32 + 1) = v29;
  v32[16] = v30;
  v33 = (void *)sub_1BC97FEFC();
  objc_msgSend(v23, sel_setAccessibilityLabel_, v33);

  v66[0] = v31;
  v34 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1BC972B7C(v34);
  swift_bridgeObjectRelease();
  v35 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v36 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BC963450();
  v37 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  v38 = objc_msgSend(v35, sel_initWithString_attributes_, v36, v37);

  v39 = v61;
  sub_1BC963314(v63, v61);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
  }
  else
  {
    v40 = v53;
    v41 = v52;
    v42 = v39;
    v43 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 32))(v52, v42, v54);
    sub_1BC97F968();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v43);
  }
  if (v32[16] == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v45 = *(_QWORD *)v32;
    v44 = *((_QWORD *)v32 + 1);
    v46 = *MEMORY[0x1E0DC1160];
    v47 = (void *)sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    objc_msgSend(v38, sel_addAttribute_value_range_, v46, v47, v45, v44);

    sub_1BC9633A8(v62, (uint64_t)v66);
    if (v67 != 1)
    {
      v48 = *MEMORY[0x1E0DC1108];
      v49 = (void *)sub_1BC980088();
      objc_msgSend(v38, sel_addAttribute_value_range_, v48, v49, v45, v44);

    }
  }
  v50 = sub_1BC9718D4();
  objc_msgSend(v50, sel_setAttributedText_, v38);

  objc_msgSend(v23, sel_setNeedsLayout);
}

double sub_1BC962680()
{
  void *v0;

  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return 6.0;
}

unint64_t sub_1BC9626C4(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v8;
  char v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v14 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14)
    return 0;
  if (sub_1BC980184() == a1 && v8 == a2)
  {
    v4 = a3;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1BC980310();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
    {
      return a3;
    }
    else
    {
      while (1)
      {
        v11 = sub_1BC98016C();
        if (v11 >> 14 == v14)
          return 0;
        v4 = v11;
        if (sub_1BC980184() == a1 && v12 == a2)
          goto LABEL_6;
        v10 = sub_1BC980310();
        swift_bridgeObjectRelease();
        if ((v10 & 1) != 0)
          return v4;
      }
    }
  }
  return v4;
}

uint64_t sub_1BC96283C()
{
  uint64_t v0;

  sub_1BC963394(*(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 24), *(_BYTE *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 32));
  return sub_1BC96327C(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent);
}

id sub_1BC962874()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkedTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC9628EC()
{
  return type metadata accessor for LinkedTextView();
}

uint64_t type metadata accessor for LinkedTextView()
{
  uint64_t result;

  result = qword_1ED6A10A0;
  if (!qword_1ED6A10A0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC962930()
{
  unint64_t v0;

  sub_1BC963498(319, &qword_1ED6A1020, type metadata accessor for HealthArticleComponent.LinkContent, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_1BC962A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 >= 2u)
  {
    if (a5 != 2)
      return result;
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for LinkedTextView.LinkFormat(uint64_t a1)
{
  return sub_1BC962ADC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1BC962ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 >= 2u)
  {
    if (a5 != 2)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LinkedTextView.LinkFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1BC962A7C(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for LinkedTextView.LinkFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1BC962A7C(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1BC962ADC(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for LinkedTextView.LinkFormat(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1BC962ADC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkedTextView.LinkFormat(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkedTextView.LinkFormat(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BC962CE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1BC962CF0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkedTextView.LinkFormat()
{
  return &type metadata for LinkedTextView.LinkFormat;
}

unint64_t sub_1BC962D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t result;
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
  _QWORD v30[5];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  sub_1BC963498(0, &qword_1EF475DE0, (uint64_t (*)(uint64_t))sub_1BC9634F0, MEMORY[0x1E0DF1F50]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v30 - v9;
  sub_1BC9634F0();
  sub_1BC97FA28();
  v32 = a1;
  v33 = a2;
  sub_1BC963554();
  sub_1BC963598();
  v11 = sub_1BC97FEE4();
  if ((v13 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
LABEL_7:
    result = swift_bridgeObjectRetain();
    v27 = 0;
    v28 = 0;
    v29 = 1;
    goto LABEL_8;
  }
  v30[4] = v11;
  v31 = v8;
  v30[3] = v12;
  v14 = sub_1BC97FFA4();
  v16 = sub_1BC9626C4(93, 0xE100000000000000, v14, v15);
  if ((v17 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v7);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v18 = v16;
  result = sub_1BC980178();
  if (v18 >> 14 >= result >> 14)
  {
    v20 = sub_1BC980190();
    v22 = v21;
    v30[1] = v23;
    v30[2] = v21;
    v24 = v23;
    v26 = v25;
    swift_bridgeObjectRelease();
    v36 = a1;
    v37 = a2;
    v32 = v20;
    v33 = v22;
    v34 = v24;
    v35 = v26;
    sub_1BC9635F8();
    swift_bridgeObjectRetain();
    sub_1BC97FF50();
    swift_bridgeObjectRetain();
    sub_1BC97FFA4();
    swift_bridgeObjectRelease();
    v27 = sub_1BC97FF98();
    swift_bridgeObjectRelease();
    v28 = sub_1BC97FF98();
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v10, v7);
    v29 = 0;
    a1 = v36;
    a2 = v37;
LABEL_8:
    *(_QWORD *)a3 = a1;
    *(_QWORD *)(a3 + 8) = a2;
    *(_QWORD *)(a3 + 16) = v27;
    *(_QWORD *)(a3 + 24) = v28;
    *(_BYTE *)(a3 + 32) = v29;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC962FC8()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  sub_1BC963498(0, &qword_1ED6A1020, type metadata accessor for HealthArticleComponent.LinkContent, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v2 = (char *)&v19 - v1;
  v3 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v7 = (void (**)(void))((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v19 - v8;
  v10 = (uint64_t)v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent;
  swift_beginAccess();
  sub_1BC963220(v10, (uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1BC96327C((uint64_t)v2);
  }
  else
  {
    sub_1BC9632D0((uint64_t)v2, (uint64_t)v9);
    sub_1BC963314((uint64_t)v9, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = *v7;
      v12 = objc_msgSend(v0, sel_viewController);
      if (v12)
      {
        v13 = v12;
        v11();

        swift_release();
        sub_1BC963358((uint64_t)v9);
      }
      else
      {
        sub_1BC963358((uint64_t)v9);
        swift_release();
      }
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
      if (v14)
      {
        v15 = v14;
        v16 = (void *)sub_1BC97F974();
        sub_1BC9737B0(MEMORY[0x1E0DEE9D8]);
        v17 = (void *)sub_1BC97FECC();
        swift_bridgeObjectRelease();
        objc_msgSend(v15, sel_openSensitiveURL_withOptions_, v16, v17);

      }
      sub_1BC963358((uint64_t)v9);
      sub_1BC963358((uint64_t)v7);
    }
  }
  return 0;
}

uint64_t sub_1BC963220(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC963498(0, &qword_1ED6A1020, type metadata accessor for HealthArticleComponent.LinkContent, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC96327C(uint64_t a1)
{
  uint64_t v2;

  sub_1BC963498(0, &qword_1ED6A1020, type metadata accessor for HealthArticleComponent.LinkContent, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BC9632D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC963314(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC963358(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BC963394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF)
    return sub_1BC962ADC(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t sub_1BC9633A8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1BC9633C0(uint64_t a1)
{
  sub_1BC962A7C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_1BC9633F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC963498(0, &qword_1ED6A1020, type metadata accessor for HealthArticleComponent.LinkContent, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BC963450()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF4761C0;
  if (!qword_1EF4761C0)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x1BCCF95CC](&unk_1BC980E94, v1);
    atomic_store(result, (unint64_t *)&qword_1EF4761C0);
  }
  return result;
}

void sub_1BC963498(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1BC9634F0()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_1EF475DE8)
  {
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EF475DE8);
  }
}

unint64_t sub_1BC963554()
{
  unint64_t result;

  result = qword_1EF475DF0;
  if (!qword_1EF475DF0)
  {
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEA980], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF475DF0);
  }
  return result;
}

unint64_t sub_1BC963598()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF475DF8;
  if (!qword_1EF475DF8)
  {
    sub_1BC963498(255, &qword_1EF475DE0, (uint64_t (*)(uint64_t))sub_1BC9634F0, MEMORY[0x1E0DF1F50]);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DF1F60], v1);
    atomic_store(result, (unint64_t *)&qword_1EF475DF8);
  }
  return result;
}

unint64_t sub_1BC9635F8()
{
  unint64_t result;

  result = qword_1EF475E00;
  if (!qword_1EF475E00)
  {
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEBB18], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&qword_1EF475E00);
  }
  return result;
}

double sub_1BC96363C()
{
  void *v0;

  objc_msgSend(v0, sel_layoutMargins);
  return 20.0;
}

id sub_1BC963714()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TitleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TitleView()
{
  return objc_opt_self();
}

double sub_1BC963764()
{
  return 0.25;
}

double HealthArticleHighlightProviding.highlightedAnimationDuration.getter()
{
  return 0.25;
}

double sub_1BC963774()
{
  return 0.1;
}

double HealthArticleHighlightProviding.highlightedOverlayAlpha.getter()
{
  return 0.1;
}

double sub_1BC96378C()
{
  return 1.0;
}

double HealthArticleHighlightProviding.highlightedUnderlayAlpha.getter()
{
  return 1.0;
}

Swift::Void __swiftcall HealthArticleHighlightProviding.setHighlighted(_:animated:)(Swift::Bool _, Swift::Bool animated)
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
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(unint64_t, char *, uint64_t);
  BOOL v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  void *v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _BOOL4 v44;
  _BOOL4 v45;
  uint64_t v46;
  char *v47;
  uint64_t aBlock;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t (*v52)();
  uint64_t v53;

  v4 = v3;
  v42 = v3;
  v5 = v2;
  v44 = _;
  v45 = animated;
  v6 = *(_QWORD *)(v2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x1E0C80A78](_);
  v47 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v8);
  v43 = (char *)&v39 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v39 - v14;
  v16 = *(void (**)(char *, uint64_t))(v6 + 16);
  v16((char *)&v39 - v14, v17);
  v41 = v13;
  ((void (*)(char *, char *, uint64_t))v16)(v13, v15, v5);
  v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v19 = v18 + v7;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v5;
  *(_QWORD *)(v20 + 24) = v4;
  v40 = v6;
  v21 = *(void (**)(unint64_t, char *, uint64_t))(v6 + 32);
  v21(v20 + v18, v15, v5);
  v22 = v44;
  *(_BYTE *)(v20 + v19) = v44;
  v23 = v43;
  ((void (*)(char *, uint64_t, uint64_t))v16)(v43, v46, v5);
  ((void (*)(char *, char *, uint64_t))v16)(v47, v23, v5);
  v24 = v42;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v5;
  *(_QWORD *)(v25 + 24) = v24;
  v21(v25 + v18, v23, v5);
  *(_BYTE *)(v25 + v19) = v22;
  if (v45)
  {
    v26 = *(void (**)(char *, uint64_t))(v40 + 8);
    v26(v41, v5);
    v27 = (uint64_t)v47;
    if (v22)
    {
      sub_1BC963CB0((uint64_t)v47, 1, v5, v24);
      v26((char *)v27, v5);
      v28 = (void *)objc_opt_self();
      v29 = (*(double (**)(uint64_t, uint64_t))(v24 + 24))(v5, v24);
      v52 = sub_1BC963CA4;
      v53 = v20;
      aBlock = MEMORY[0x1E0C809B0];
      v49 = 1107296256;
      v50 = sub_1BC963D80;
      v51 = &block_descriptor_12;
      v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v28, sel_animateWithDuration_animations_, v30, v29);
      swift_release();
      swift_release();
    }
    else
    {
      v26(v47, v5);
      v34 = (void *)objc_opt_self();
      v35 = (*(double (**)(uint64_t, uint64_t))(v24 + 24))(v5, v24);
      v52 = sub_1BC963CA4;
      v53 = v20;
      v36 = MEMORY[0x1E0C809B0];
      aBlock = MEMORY[0x1E0C809B0];
      v49 = 1107296256;
      v50 = sub_1BC963D80;
      v51 = &block_descriptor;
      v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = sub_1BC963D48;
      *(_QWORD *)(v37 + 24) = v25;
      v52 = sub_1BC963DD0;
      v53 = v37;
      aBlock = v36;
      v49 = 1107296256;
      v50 = sub_1BC963DF0;
      v51 = &block_descriptor_9;
      v38 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v34, sel_animateWithDuration_animations_completion_, v30, v38, v35);
      swift_release();
      swift_release();
      _Block_release(v38);
    }
    _Block_release(v30);
  }
  else
  {
    v31 = (uint64_t)v47;
    sub_1BC963CB0((uint64_t)v47, v22, v5, v24);
    v32 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v32(v31, v5);
    v33 = (uint64_t)v41;
    sub_1BC963BD4((uint64_t)v41, v22, v5, v24);
    swift_release();
    swift_release();
    v32(v33, v5);
  }
}

void sub_1BC963BD4(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  double v8;
  double v9;
  id v10;

  v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  v8 = 0.0;
  v9 = 0.0;
  if ((a2 & 1) != 0)
    (*(void (**)(uint64_t, uint64_t, double))(a4 + 32))(a3, a4, 0.0);
  objc_msgSend(v7, sel_setAlpha_, v9);

  v10 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if ((a2 & 1) != 0)
    v8 = (*(double (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  objc_msgSend(v10, sel_setAlpha_, v8);

}

uint64_t sub_1BC963CA4()
{
  return sub_1BC963D54((uint64_t (*)(unint64_t, _QWORD))sub_1BC963BD4);
}

void sub_1BC963CB0(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _BOOL8 v8;
  id v9;

  v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  v8 = (a2 & 1) == 0;
  objc_msgSend(v7, sel_setHidden_, v8);

  v9 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  objc_msgSend(v9, sel_setHidden_, v8);

}

uint64_t sub_1BC963D48()
{
  return sub_1BC963D54((uint64_t (*)(unint64_t, _QWORD))sub_1BC963CB0);
}

uint64_t sub_1BC963D54(uint64_t (*a1)(unint64_t, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return a1(v1 + v3, *(unsigned __int8 *)(v1 + v3 + *(_QWORD *)(v2 + 64)));
}

uint64_t sub_1BC963D80(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1BC963DAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC963DD0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BC963DF0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void __swiftcall HealthArticleHighlightProviding.makeHighlightedImageOverlay()(UIView *__return_ptr retstr)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1BC963F28();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_systemBlackColor);
  v4 = objc_msgSend(v2, sel_systemWhiteColor);
  v5 = (void *)sub_1BC980130();

  objc_msgSend(v1, sel_setBackgroundColor_, v5);
  objc_msgSend(v1, sel_setHidden_, 1);
}

unint64_t sub_1BC963F28()
{
  unint64_t result;

  result = qword_1ED6A1468;
  if (!qword_1ED6A1468)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A1468);
  }
  return result;
}

void __swiftcall HealthArticleHighlightProviding.makeHighlightedSashUnderlay(highlightColor:)(UIView *__return_ptr retstr, UIColor highlightColor)
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setBackgroundColor_, highlightColor.super.isa);
  objc_msgSend(v3, sel_setHidden_, 1);
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedImageOverlay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedSashUnderlay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedAnimationDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedOverlayAlpha.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedUnderlayAlpha.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.setHighlighted(_:animated:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t initializeBufferWithCopyOfBuffer for HealthArticleComponent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_1BC964074 + 4 * byte_1BC981510[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

void sub_1BC964628()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_1EF475ED0)
  {
    sub_1BC964954(255, &qword_1EF475ED8);
    type metadata accessor for HealthArticleComponent.LinkContent(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EF475ED0);
  }
}

uint64_t type metadata accessor for HealthArticleComponent.LinkContent(uint64_t a1)
{
  return sub_1BC965804(a1, qword_1ED6A0FE8);
}

void sub_1BC9646CC()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_1EF475EE0)
  {
    type metadata accessor for HealthArticleComponent.LinkContent(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EF475EE0);
  }
}

void sub_1BC964738()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF475EE8)
  {
    type metadata accessor for HealthArticleComponent.LinkContent(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF475EE8);
  }
}

void sub_1BC9647A0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF475EF0)
  {
    sub_1BC963498(255, &qword_1EF475EF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF078], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF475EF0);
  }
}

void sub_1BC964820()
{
  unint64_t TupleTypeMetadata;
  uint64_t v1;

  if (!qword_1EF475F08)
  {
    MEMORY[0x1E0C80A78](0);
    sub_1BC963498(255, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    sub_1BC964954(255, &qword_1EF475ED8);
    sub_1BC964954(255, &qword_1EF475F10);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_1EF475F08);
  }
}

void sub_1BC964954(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BC980160();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void destroy for HealthArticleComponent(uint64_t a1)
{
  void *v2;
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

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 3u:
    case 4u:
    case 5u:
    case 0xCu:
      goto LABEL_19;
    case 2u:
      swift_bridgeObjectRelease();
      v2 = *(void **)(a1 + 16);
      goto LABEL_5;
    case 6u:
    case 7u:
      swift_bridgeObjectRelease();
      goto LABEL_19;
    case 8u:
    case 0xAu:
    case 0xBu:
      v2 = *(void **)a1;
LABEL_5:

      return;
    case 9u:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    case 0xDu:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BC964628();
      goto LABEL_9;
    case 0xEu:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BC9646CC();
LABEL_9:
      v4 = *(int *)(v3 + 64);
      goto LABEL_11;
    case 0xFu:
      swift_bridgeObjectRelease();
      sub_1BC964738();
      v4 = *(int *)(v5 + 48);
LABEL_11:
      v6 = a1 + v4;
      type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_12:
        swift_release();
      }
      else
      {
        v7 = sub_1BC97F98C();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
      }
      break;
    case 0x10u:
      swift_bridgeObjectRelease();
      sub_1BC9647A0();
      v9 = a1 + *(int *)(v8 + 48);
      v10 = sub_1BC97F920();
      v11 = *(_QWORD *)(v10 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
      break;
    case 0x11u:
      v12 = sub_1BC97F98C();
      v13 = *(_QWORD *)(v12 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(a1, 1, v12))
        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
      sub_1BC964820();
      swift_bridgeObjectRelease();
LABEL_19:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

void initializeWithCopy for HealthArticleComponent()
{
  char *v0;

  v0 = (char *)sub_1BC964BF0 + 4 * byte_1BC981534[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

_QWORD *sub_1BC964BF0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for HealthArticleComponent(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_1BC966420(result, type metadata accessor for HealthArticleComponent);
    v2 = (char *)&loc_1BC9651E8 + 4 * byte_1BC981546[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t type metadata accessor for HealthArticleComponent(uint64_t a1)
{
  return sub_1BC965804(a1, qword_1EF475F88);
}

uint64_t sub_1BC965804(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

_OWORD *initializeWithTake for HealthArticleComponent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0xDu:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      sub_1BC964628();
      v8 = *(int *)(v7 + 64);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (!swift_getEnumCaseMultiPayload())
        goto LABEL_13;
      goto LABEL_8;
    case 0xEu:
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      sub_1BC9646CC();
      v14 = *(int *)(v13 + 64);
      v9 = (char *)a1 + v14;
      v10 = (char *)a2 + v14;
      v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (swift_getEnumCaseMultiPayload())
        goto LABEL_8;
      goto LABEL_13;
    case 0xFu:
      *a1 = *a2;
      sub_1BC964738();
      v16 = *(int *)(v15 + 48);
      v9 = (char *)a1 + v16;
      v10 = (char *)a2 + v16;
      v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_8:
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
LABEL_13:
        v27 = sub_1BC97F98C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v9, v10, v27);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_17;
    case 0x10u:
      *a1 = *a2;
      sub_1BC9647A0();
      v18 = *(int *)(v17 + 48);
      v19 = (char *)a1 + v18;
      v20 = (char *)a2 + v18;
      v21 = sub_1BC97F920();
      v22 = *(_QWORD *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        sub_1BC963498(0, &qword_1EF475EF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF078], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
      goto LABEL_17;
    case 0x11u:
      v24 = sub_1BC97F98C();
      v25 = *(_QWORD *)(v24 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v25 + 48))(a2, 1, v24))
      {
        sub_1BC963498(0, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v25 + 32))(a1, a2, v24);
        (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v25 + 56))(a1, 0, 1, v24);
      }
      sub_1BC964820();
      *(_QWORD *)((char *)a1 + v28[12]) = *(_QWORD *)((char *)a2 + v28[12]);
      *(_OWORD *)((char *)a1 + v28[16]) = *(_OWORD *)((char *)a2 + v28[16]);
      *(_OWORD *)((char *)a1 + v28[20]) = *(_OWORD *)((char *)a2 + v28[20]);
      v29 = v28[24];
      v30 = (char *)a1 + v29;
      v31 = (char *)a2 + v29;
      *(_QWORD *)v30 = *(_QWORD *)v31;
      v30[8] = v31[8];
LABEL_17:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *assignWithTake for HealthArticleComponent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;

  if (a1 != a2)
  {
    sub_1BC966420((uint64_t)a1, type metadata accessor for HealthArticleComponent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0xDu:
        v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        sub_1BC964628();
        v8 = *(int *)(v7 + 64);
        v9 = (char *)a1 + v8;
        v10 = (char *)a2 + v8;
        v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
        if (!swift_getEnumCaseMultiPayload())
          goto LABEL_14;
        goto LABEL_9;
      case 0xEu:
        v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        sub_1BC9646CC();
        v14 = *(int *)(v13 + 64);
        v9 = (char *)a1 + v14;
        v10 = (char *)a2 + v14;
        v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
        if (swift_getEnumCaseMultiPayload())
          goto LABEL_9;
        goto LABEL_14;
      case 0xFu:
        *a1 = *a2;
        sub_1BC964738();
        v16 = *(int *)(v15 + 48);
        v9 = (char *)a1 + v16;
        v10 = (char *)a2 + v16;
        v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
        if (swift_getEnumCaseMultiPayload())
        {
LABEL_9:
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        }
        else
        {
LABEL_14:
          v27 = sub_1BC97F98C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v9, v10, v27);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_18;
      case 0x10u:
        *a1 = *a2;
        sub_1BC9647A0();
        v18 = *(int *)(v17 + 48);
        v19 = (char *)a1 + v18;
        v20 = (char *)a2 + v18;
        v21 = sub_1BC97F920();
        v22 = *(_QWORD *)(v21 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
        {
          sub_1BC963498(0, &qword_1EF475EF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF078], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
          memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
        }
        goto LABEL_18;
      case 0x11u:
        v24 = sub_1BC97F98C();
        v25 = *(_QWORD *)(v24 - 8);
        if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v25 + 48))(a2, 1, v24))
        {
          sub_1BC963498(0, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v25 + 32))(a1, a2, v24);
          (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v25 + 56))(a1, 0, 1, v24);
        }
        sub_1BC964820();
        *(_QWORD *)((char *)a1 + v28[12]) = *(_QWORD *)((char *)a2 + v28[12]);
        *(_OWORD *)((char *)a1 + v28[16]) = *(_OWORD *)((char *)a2 + v28[16]);
        *(_OWORD *)((char *)a1 + v28[20]) = *(_OWORD *)((char *)a2 + v28[20]);
        v29 = v28[24];
        v30 = (char *)a1 + v29;
        v31 = (char *)a2 + v29;
        *(_QWORD *)v30 = *(_QWORD *)v31;
        v30[8] = v31[8];
LABEL_18:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1BC965FEC()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1BC965FFC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;

  v10 = &unk_1BC9815B0;
  v11 = &unk_1BC9815C8;
  v8 = &unk_1BC981598;
  v9 = &unk_1BC981598;
  v12 = MEMORY[0x1E0DE9D18] + 64;
  v13 = MEMORY[0x1E0DE9D18] + 64;
  v14 = &unk_1BC9815B0;
  v15 = &unk_1BC9815B0;
  v16 = &unk_1BC9815E0;
  v17 = &unk_1BC9815F8;
  v18 = &unk_1BC9815E0;
  v19 = MEMORY[0x1E0DE9D10] + 64;
  v20 = &unk_1BC981598;
  type metadata accessor for HealthArticleComponent.LinkContent(319);
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v21 = &v7;
    swift_getTupleTypeLayout3();
    v22 = &v6;
    swift_getTupleTypeLayout2();
    v23 = &v5;
    sub_1BC963498(319, &qword_1EF475EF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF078], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    if (v1 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      v24 = &v4;
      sub_1BC963498(319, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      if (v2 <= 0x3F)
      {
        swift_getTupleTypeLayout();
        v25 = &v3;
        swift_initEnumMetadataMultiPayload();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for HealthArticleComponent.LinkContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_retain();
    }
    else
    {
      v8 = sub_1BC97F98C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HealthArticleComponent.LinkContent(uint64_t a1)
{
  uint64_t v3;

  if (swift_getEnumCaseMultiPayload() == 1)
    return swift_release();
  v3 = sub_1BC97F98C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

_QWORD *initializeWithCopy for HealthArticleComponent.LinkContent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    v5 = sub_1BC97F98C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for HealthArticleComponent.LinkContent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_1BC966420((uint64_t)a1, type metadata accessor for HealthArticleComponent.LinkContent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = a2[1];
      *a1 = *a2;
      a1[1] = v4;
      swift_retain();
    }
    else
    {
      v5 = sub_1BC97F98C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1BC966420(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeWithTake for HealthArticleComponent.LinkContent(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_1BC97F98C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for HealthArticleComponent.LinkContent(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1BC966420((uint64_t)a1, type metadata accessor for HealthArticleComponent.LinkContent);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_1BC97F98C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthArticleComponent.LinkContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for HealthArticleComponent.LinkContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1BC96659C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC97F98C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void sub_1BC96660C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for HealthArticleComponent(0);
  MEMORY[0x1E0C80A78](v1);
  sub_1BC967F68(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_1BC966690 + 4 * byte_1BC981562[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

id sub_1BC966690()
{
  id v0;

  swift_bridgeObjectRelease();
  type metadata accessor for ParagraphView();
  v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

void sub_1BC966934()
{
  uint64_t v0;

  sub_1BC964820();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for VideoView();
  objc_msgSend(objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0), sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1BC967FAC(v0, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  JUMPOUT(0x1BC96691CLL);
}

void sub_1BC9669BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
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
  uint64_t (*v16)(uint64_t);
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
  char *v33;
  _QWORD v34[4];
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;

  v59 = a1;
  v52 = sub_1BC97FB6C();
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v57 = (char *)v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_1BC97F8F0();
  v34[3] = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78](v35);
  v34[2] = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1BC963498(0, &qword_1EF475FC0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF460], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v37 = (char *)v34 - v5;
  v39 = sub_1BC97F950();
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v34[1] = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1BC97F8FC();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  v48 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_1BC97F908();
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](v44);
  v45 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC963498(0, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], v3);
  v10 = MEMORY[0x1E0C80A78](v9);
  v56 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v42 = (char *)v34 - v13;
  MEMORY[0x1E0C80A78](v12);
  v40 = (char *)v34 - v14;
  v15 = sub_1BC97F920();
  v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF078];
  v55 = v15;
  v54 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v41 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  MEMORY[0x1E0C80A78](v19);
  v53 = sub_1BC97F938();
  v50 = *(_QWORD *)(v53 - 8);
  v20 = MEMORY[0x1E0C80A78](v53);
  v36 = (char *)v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v23 = MEMORY[0x1E0C80A78](v22);
  MEMORY[0x1E0C80A78](v23);
  v49 = (char *)v34 - v24;
  sub_1BC963498(0, &qword_1EF475EF8, v16, v3);
  v26 = MEMORY[0x1E0C80A78](v25);
  MEMORY[0x1E0C80A78](v26);
  v58 = (char *)v34 - v27;
  v28 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  v29 = MEMORY[0x1E0C80A78](v28);
  v30 = MEMORY[0x1E0C80A78](v29);
  MEMORY[0x1E0C80A78](v30);
  v31 = type metadata accessor for HealthArticleComponent(0);
  MEMORY[0x1E0C80A78](v31);
  sub_1BC967F68(v60, (uint64_t)v34 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  v60 = v31;
  v33 = (char *)&loc_1BC966EA0 + *((int *)qword_1BC967F20 + swift_getEnumCaseMultiPayload());
  __asm { BR              X10 }
}

uint64_t sub_1BC966EB0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[1];
  type metadata accessor for TitleView();
  if (swift_dynamicCastClass())
  {
    v3 = *v0;
    *(_QWORD *)(v1 - 128) = 0;
    sub_1BC960C2C(v3, v2, 0, (unint64_t *)(v1 - 128));
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC967F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HealthArticleComponent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC967FAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1BC963498(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1BC967FF0(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1BC963498(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_1BC968048(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC963498(0, &qword_1EF475EF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF078], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BC9680A4()
{
  unint64_t result;

  result = qword_1EF475FC8;
  if (!qword_1EF475FC8)
  {
    type metadata accessor for HealthArticleComponent(255);
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF475FC8);
  }
  return result;
}

unint64_t sub_1BC9680DC()
{
  unint64_t result;

  result = qword_1EF475FD0;
  if (!qword_1EF475FD0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF475FD0);
  }
  return result;
}

unint64_t sub_1BC968130()
{
  unint64_t result;

  result = qword_1EF475FD8;
  if (!qword_1EF475FD8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF475FD8);
  }
  return result;
}

uint64_t sub_1BC968170(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_1BC968180()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF475FF0)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF475FF0);
  }
}

double sub_1BC9681F0()
{
  void *v0;

  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return 6.0;
}

id sub_1BC96824C()
{
  return sub_1BC968390(type metadata accessor for ParagraphView);
}

uint64_t type metadata accessor for ParagraphView()
{
  return objc_opt_self();
}

double sub_1BC968278()
{
  void *v0;

  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return 6.0;
}

id sub_1BC9682C8(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t (*a7)(void))
{
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)a7();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, a2, a3, a4, a5);
}

id sub_1BC968340(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithCoder_, a3);
}

id sub_1BC968384()
{
  return sub_1BC968390(type metadata accessor for LastParagraphInSectionView);
}

id sub_1BC968390(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for LastParagraphInSectionView()
{
  return objc_opt_self();
}

uint64_t sub_1BC9683E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v21;

  v4 = v3;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_init);
  v21 = v7;
  v8 = *(_QWORD *)(a3 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = 0;
    v10 = (uint64_t *)(a3 + 40);
    do
    {
      v11 = *(v10 - 1);
      v12 = *v10;
      swift_bridgeObjectRetain();
      sub_1BC9685D4(v9, v11, v12, v4, a3, &v21);
      swift_bridgeObjectRelease();
      v10 += 2;
      ++v9;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1BC97FF74();
    v13 = sub_1BC96950C(0);
    sub_1BC972B7C(v13);
    swift_bridgeObjectRelease();
    v14 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    v15 = (void *)sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
    v16 = (void *)sub_1BC97FECC();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_initWithString_attributes_, v15, v16);

    objc_msgSend(v17, sel_appendAttributedString_, v7);
    v7 = v17;
  }
  v18 = v7;
  v19 = sub_1BC980100();

  return v19;
}

void sub_1BC9685D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, id *a6)
{
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id *v34;
  uint64_t v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v39;
  uint64_t (*v40)();
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v34 = a6;
  v35 = a5;
  v10 = MEMORY[0x1E0CB0E38];
  sub_1BC963498(0, &qword_1EF476020, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0E38], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v34 - v12;
  v14 = sub_1BC969290(a1, a2, a3);
  v16 = v15;
  v44 = v14;
  v45 = v15;
  aBlock = v14;
  v37 = v15;
  v42 = a2;
  v43 = a3;
  v17 = sub_1BC97F9B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
  sub_1BC969450();
  swift_bridgeObjectRetain();
  sub_1BC9801C0();
  LOBYTE(a3) = v18;
  sub_1BC969494((uint64_t)v13, (uint64_t)&qword_1EF476020, (uint64_t)v10, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC963498);
  if ((a3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v20 = 0;
    v19 = 0xE000000000000000;
  }
  else
  {
    aBlock = v14;
    v37 = v16;
    sub_1BC97FF44();
    v20 = aBlock;
    v19 = v37;
  }
  v21 = (_QWORD *)swift_allocObject();
  v22 = a4;
  v21[2] = a4;
  v21[3] = v20;
  v21[4] = v19;
  swift_bridgeObjectRetain();
  v23 = sub_1BC96950C((double (*)(unint64_t))sub_1BC969500);
  swift_release();
  if (*(_QWORD *)(v35 + 16) - 1 > a1)
    sub_1BC97FF74();
  sub_1BC972B7C(v23);
  swift_bridgeObjectRelease();
  v24 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v25 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
  v26 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  v28 = sub_1BC97FF68();
  swift_bridgeObjectRelease();
  v29 = *MEMORY[0x1E0DC1138];
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v22;
  *(_QWORD *)(v30 + 24) = v27;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = sub_1BC96972C;
  *(_QWORD *)(v31 + 24) = v30;
  v40 = sub_1BC963DD0;
  v41 = v31;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v38 = sub_1BC968B70;
  v39 = &block_descriptor_0;
  v32 = _Block_copy(&aBlock);
  v33 = v27;
  swift_retain();
  swift_release();
  objc_msgSend(v33, sel_enumerateAttribute_inRange_options_usingBlock_, v29, 0, v28, 0, v32);
  _Block_release(v32);
  LOBYTE(v29) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v29 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(*v34, sel_appendAttributedString_, v33);
    swift_release();

  }
}

void sub_1BC9689C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9;
  id v10;
  uint64_t inited;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _BYTE v17[24];
  uint64_t v18;

  sub_1BC969744(a1, (uint64_t)v17);
  if (v18)
  {
    v9 = sub_1BC96A1C0(0, &qword_1ED6A1460);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = sub_1BC969DD0(v16);
      sub_1BC96A000(0, &qword_1EF476030, &qword_1EF476038, type metadata accessor for Key);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1BC980D10;
      v12 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 64) = v9;
      *(_QWORD *)(inited + 32) = v12;
      *(_QWORD *)(inited + 40) = v10;
      v13 = v12;
      v14 = v10;
      sub_1BC973AF4(inited);
      type metadata accessor for Key(0);
      sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
      v15 = (void *)sub_1BC97FECC();
      swift_bridgeObjectRelease();
      objc_msgSend(a6, sel_addAttributes_range_, v15, a2, a3);

    }
  }
  else
  {
    sub_1BC969494((uint64_t)v17, (uint64_t)&qword_1EF476028, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC96A31C);
  }
}

uint64_t sub_1BC968B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(__int128 *, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  __int128 v12;

  v9 = *(void (**)(__int128 *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v12 + 1) = swift_getObjectType();
    *(_QWORD *)&v11 = a2;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return sub_1BC969494((uint64_t)&v11, (uint64_t)&unk_1EF476028, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC96A31C);
}

double sub_1BC968C14(uint64_t a1)
{
  uint64_t v2;
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    v3 = (id)*MEMORY[0x1E0DC1138];
    sub_1BC96C1DC((uint64_t)v3);
    if ((v4 & 1) != 0)
    {
      swift_unknownObjectRetain();

      objc_opt_self();
      v5 = swift_dynamicCastObjCClass();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = v3;
        v8 = sub_1BC969DD0(v6);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_1BC968E68((uint64_t)v8, v7, isUniquelyReferenced_nonNull_native);
        swift_unknownObjectRelease();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    else
    {

    }
  }
  v10 = (void *)sub_1BC97FEFC();
  sub_1BC972B7C(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
  v11 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_sizeWithAttributes_, v11);
  v13 = v12;

  return v13;
}

double sub_1BC968DAC(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)sub_1BC97FEFC();
  sub_1BC972B7C(a1);
  type metadata accessor for Key(0);
  sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
  v3 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_sizeWithAttributes_, v3);
  v5 = v4;

  return v5;
}

id sub_1BC968E68(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1BC96C1DC((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1BC96CCCC();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_unknownObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_1BC96C6EC(v12, a3 & 1);
  v18 = sub_1BC96C1DC((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for Key(0);
  result = (id)sub_1BC98031C();
  __break(1u);
  return result;
}

uint64_t sub_1BC968FB8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1BC968FD4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1BC968FD4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1BC96A31C(0, (unint64_t *)&unk_1EF4760A0, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1BC9802D4();
  __break(1u);
  return result;
}

void sub_1BC969150(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = sub_1BC97F9B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  sub_1BC97F9A4();
  v7 = (void *)sub_1BC97F998();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v6, sel_setLocale_, v7);

  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, a1 + 1);
    v9 = objc_msgSend(v6, sel_stringFromNumber_, v8);

    if (v9)
    {
      sub_1BC97FF20();

    }
    else
    {

    }
  }
}

uint64_t sub_1BC969290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;

  type metadata accessor for HealthArticleViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BC97F944();

  sub_1BC969150(a1);
  v9 = v8;
  v11 = v10;
  sub_1BC96A1C0(0, &qword_1EF476078);
  v12 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  sub_1BC963498(0, &qword_1EF476080, (uint64_t (*)(uint64_t))sub_1BC96A1F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1BC9816E0;
  v14 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
  v15 = sub_1BC96A24C();
  *(_QWORD *)(v13 + 32) = v9;
  *(_QWORD *)(v13 + 40) = v11;
  *(_QWORD *)(v13 + 96) = v14;
  *(_QWORD *)(v13 + 104) = v15;
  *(_QWORD *)(v13 + 64) = v15;
  *(_QWORD *)(v13 + 72) = a2;
  *(_QWORD *)(v13 + 80) = a3;
  swift_bridgeObjectRetain();
  v16 = (void *)sub_1BC980154();

  v17 = sub_1BC97FF20();
  return v17;
}

unint64_t sub_1BC969450()
{
  unint64_t result;

  result = qword_1ED6A1440;
  if (!qword_1ED6A1440)
  {
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED6A1440);
  }
  return result;
}

uint64_t sub_1BC969494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_1BC9694DC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_1BC969500(uint64_t a1)
{
  return sub_1BC968C14(a1);
}

unint64_t sub_1BC96950C(double (*a1)(unint64_t))
{
  uint64_t inited;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  double v14;
  id v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;

  sub_1BC96A000(0, (unint64_t *)&qword_1EF475FE8, (unint64_t *)&qword_1EF475FF0, type metadata accessor for Key);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BC9816E0;
  v3 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v4 = (void *)objc_opt_self();
  v5 = *MEMORY[0x1E0DC4A88];
  v6 = v3;
  v7 = objc_msgSend(v4, sel_preferredFontForTextStyle_, v5);
  v8 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 48) = v8;
  v9 = (void *)objc_opt_self();
  v10 = v8;
  *(_QWORD *)(inited + 56) = objc_msgSend(v9, sel_labelColor);
  v11 = sub_1BC973698(inited);
  v12 = objc_allocWithZone(MEMORY[0x1E0DC1288]);
  swift_bridgeObjectRetain();
  v13 = objc_msgSend(v12, sel_init);
  if (a1)
  {
    swift_retain();
    v14 = a1(v11);
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setHeadIndent_, v14);
    sub_1BC968170((uint64_t)a1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v13, sel_setParagraphSpacing_, 12.0);
  v15 = (id)*MEMORY[0x1E0DC1178];
  v16 = v13;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1BC968E68((uint64_t)v16, v15, isUniquelyReferenced_nonNull_native);

  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1BC969708()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1BC96972C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1BC9689C0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_1BC969734()
{
  return swift_deallocObject();
}

uint64_t sub_1BC969744(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC96A31C(0, &qword_1EF476028, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC9697A4(uint64_t a1, uint64_t a2)
{
  uint64_t ObjCClassFromMetadata;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  type metadata accessor for HealthArticleViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BC97F944();

  sub_1BC96A1C0(0, &qword_1EF476078);
  v6 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  sub_1BC963498(0, &qword_1EF476080, (uint64_t (*)(uint64_t))sub_1BC96A1F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BC980D10;
  *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v7 + 64) = sub_1BC96A24C();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  v8 = (void *)sub_1BC980154();

  v9 = sub_1BC97FF20();
  return v9;
}

id sub_1BC969940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int64_t v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v35;
  uint64_t ObjCClassFromMetadata;
  uint64_t v37;

  v3 = a2;
  v4 = *(_QWORD *)(a3 + 16);
  if (v4)
  {
    v37 = MEMORY[0x1E0DEE9D8];
    sub_1BC968FB8(0, v4, 0);
    type metadata accessor for HealthArticleViewController();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v35 = (void *)objc_opt_self();
    v6 = (uint64_t *)(a3 + 40);
    sub_1BC96A1C0(0, &qword_1EF476078);
    do
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      swift_bridgeObjectRetain();
      v9 = objc_msgSend(v35, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1BC97F944();

      v10 = (void *)sub_1BC97FEFC();
      swift_bridgeObjectRelease();
      sub_1BC963498(0, &qword_1EF476080, (uint64_t (*)(uint64_t))sub_1BC96A1F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_1BC980D10;
      *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v11 + 64) = sub_1BC96A24C();
      *(_QWORD *)(v11 + 32) = v8;
      *(_QWORD *)(v11 + 40) = v7;
      swift_bridgeObjectRetain();
      v12 = (void *)sub_1BC980154();

      v13 = sub_1BC97FF20();
      v15 = v14;
      swift_bridgeObjectRelease();

      v17 = *(_QWORD *)(v37 + 16);
      v16 = *(_QWORD *)(v37 + 24);
      if (v17 >= v16 >> 1)
        sub_1BC968FB8(v16 > 1, v17 + 1, 1);
      v6 += 2;
      *(_QWORD *)(v37 + 16) = v17 + 1;
      v18 = v37 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v13;
      *(_QWORD *)(v18 + 40) = v15;
      --v4;
    }
    while (v4);
    v3 = a2;
  }
  sub_1BC96A31C(0, &qword_1EF476090, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC96A290();
  sub_1BC97FEF0();
  swift_bridgeObjectRelease();
  v19 = sub_1BC9697A4(0, 0xE000000000000000);
  v21 = v20;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v19;
  *(_QWORD *)(v22 + 24) = v21;
  v23 = sub_1BC96950C((double (*)(unint64_t))sub_1BC96A314);
  swift_release();
  sub_1BC972B7C(v23);
  swift_bridgeObjectRelease();
  v24 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v25 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
  v26 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_1BC97FF74();
    v28 = sub_1BC96950C(0);
    sub_1BC972B7C(v28);
    swift_bridgeObjectRelease();
    v29 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    v30 = (void *)sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    v31 = (void *)sub_1BC97FECC();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v29, sel_initWithString_attributes_, v30, v31);

    objc_msgSend(v32, sel_appendAttributedString_, v27);
  }
  else
  {
    v32 = (id)sub_1BC980100();
  }

  return v32;
}

id sub_1BC969DD0(void *a1)
{
  id v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t inited;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  double v16;
  id v17;

  v2 = objc_msgSend(a1, sel_fontDescriptor);
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8];
  sub_1BC963498(0, &qword_1EF476040, (uint64_t (*)(uint64_t))sub_1BC96A058, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BC980D10;
  sub_1BC96A000(0, &qword_1EF476050, &qword_1EF476058, type metadata accessor for FeatureKey);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BC9816E0;
  v6 = (void *)*MEMORY[0x1E0DC4A60];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC4A60];
  *(_QWORD *)(inited + 40) = 6;
  v7 = (void *)*MEMORY[0x1E0DC4A50];
  *(_QWORD *)(inited + 48) = *MEMORY[0x1E0DC4A50];
  *(_QWORD *)(inited + 56) = 0;
  v8 = v6;
  v9 = v7;
  *(_QWORD *)(v4 + 32) = sub_1BC9738F8(inited);
  sub_1BC963498(0, &qword_1EF476060, (uint64_t (*)(uint64_t))sub_1BC96A0D8, v3);
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BC980D10;
  v11 = (void *)*MEMORY[0x1E0DC1380];
  *(_QWORD *)(v10 + 32) = *MEMORY[0x1E0DC1380];
  *(_QWORD *)(v10 + 40) = v4;
  v12 = v11;
  v13 = sub_1BC9739F0(v10);
  sub_1BC972F24(v13);
  swift_bridgeObjectRelease();
  type metadata accessor for AttributeName(0);
  sub_1BC96178C(&qword_1EF475D38, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC9813C0);
  v14 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v2, sel_fontDescriptorByAddingAttributes_, v14);

  objc_msgSend(a1, sel_pointSize);
  v17 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v15, v16);

  return v17;
}

void sub_1BC96A000(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_1BC96A15C(255, a3, a4);
    v5 = sub_1BC980304();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1BC96A058()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF476048)
  {
    type metadata accessor for FeatureKey(255);
    sub_1BC96178C(&qword_1EF475D48, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC981404);
    v0 = sub_1BC97FED8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF476048);
  }
}

void sub_1BC96A0D8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF476068)
  {
    type metadata accessor for AttributeName(255);
    sub_1BC963498(255, (unint64_t *)&qword_1EF476070, (uint64_t (*)(uint64_t))sub_1BC96A058, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF476068);
  }
}

void sub_1BC96A15C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t TupleTypeMetadata2;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

uint64_t sub_1BC96A1C0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1BC96A1F8()
{
  unint64_t result;

  result = qword_1EF476088;
  if (!qword_1EF476088)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF476088);
  }
  return result;
}

unint64_t sub_1BC96A24C()
{
  unint64_t result;

  result = qword_1ED6A0FE0;
  if (!qword_1ED6A0FE0)
  {
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED6A0FE0);
  }
  return result;
}

unint64_t sub_1BC96A290()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF476098;
  if (!qword_1EF476098)
  {
    sub_1BC96A31C(255, &qword_1EF476090, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EF476098);
  }
  return result;
}

uint64_t sub_1BC96A2F0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_1BC96A314(uint64_t a1)
{
  return sub_1BC968DAC(a1);
}

void sub_1BC96A31C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t HealthArticleViewController.components.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BC96A370()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = type metadata accessor for HealthArticleComponent(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews;
  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews);
  if (v7)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components);
    v9 = *(_QWORD *)(v8 + 16);
    v7 = MEMORY[0x1E0DEE9D8];
    if (v9)
    {
      v16 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRetain();
      sub_1BC98025C();
      v10 = *(unsigned __int8 *)(v3 + 80);
      v15 = v8;
      v11 = v8 + ((v10 + 32) & ~v10);
      v12 = *(_QWORD *)(v3 + 72);
      do
      {
        sub_1BC967F68(v11, (uint64_t)v5);
        sub_1BC96660C();
        sub_1BC9669BC(v13);
        sub_1BC966420((uint64_t)v5, type metadata accessor for HealthArticleComponent);
        sub_1BC980244();
        sub_1BC980268();
        sub_1BC980274();
        sub_1BC980250();
        v11 += v12;
        --v9;
      }
      while (v9);
      v7 = v16;
      swift_bridgeObjectRelease();
    }
    *(_QWORD *)(v1 + v6) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return v7;
}

id sub_1BC96A4E0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView);
  }
  else
  {
    v4 = (void *)sub_1BC96A540();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_1BC96A540()
{
  id v0;
  void *v1;
  id v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  sub_1BC96A370();
  v0 = objc_allocWithZone(MEMORY[0x1E0DC3CA8]);
  sub_1BC96A1C0(0, &qword_1EF476180);
  v1 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithArrangedSubviews_, v1);

  v3 = sub_1BC96A370();
  v4 = v3;
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v2, sel_setAxis_, 1);
    objc_msgSend(v2, sel_setAlignment_, 1);
    objc_msgSend(v2, sel_setDistribution_, 0);
    objc_msgSend(v2, sel_setSpacing_, 0.0);
    return (uint64_t)v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1BC980298();
  v5 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v5 >= 1)
  {
    v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x1BCCF8FE4](v7, v4);
      else
        v8 = *(id *)(v4 + 8 * v7 + 32);
      v9 = v8;
      ++v7;
      v10 = objc_msgSend(v8, sel_widthAnchor);
      v11 = objc_msgSend(v2, sel_widthAnchor);
      v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

      objc_msgSend(v12, sel_setActive_, 1);
    }
    while (v5 != v7);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC96A758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState))
  {
    v2 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState);
  }
  else
  {
    v2 = sub_1BC96A7BC();
    *(_QWORD *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BC96A7BC()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  char isUniquelyReferenced_nonNull_native;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  uint64_t result;
  unint64_t v25;
  unint64_t v26;
  _OWORD v27[2];
  uint64_t v28;
  id v29;

  v0 = (_QWORD *)sub_1BC973C1C(MEMORY[0x1E0DEE9D8]);
  v1 = sub_1BC96A370();
  if (v1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    v2 = sub_1BC980298();
    swift_bridgeObjectRelease();
    if (v2)
      goto LABEL_3;
LABEL_27:
    swift_bridgeObjectRelease();
    return (uint64_t)v0;
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    goto LABEL_27;
LABEL_3:
  v3 = v1 & 0xC000000000000001;
  v4 = 4;
  v25 = v1 & 0xC000000000000001;
  v26 = v1;
  while (1)
  {
    if (v3)
      v5 = (id)MEMORY[0x1BCCF8FE4](v4 - 4, v1);
    else
      v5 = *(id *)(v1 + 8 * v4);
    v6 = v5;
    v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v29 = v5;
    sub_1BC96A1C0(0, &qword_1EF476180);
    sub_1BC96D234(0, &qword_1EF476188);
    v8 = v6;
    if ((swift_dynamicCast() & 1) != 0)
      break;
    v28 = 0;
    memset(v27, 0, sizeof(v27));

    sub_1BC966420((uint64_t)v27, (uint64_t (*)(_QWORD))sub_1BC96D280);
LABEL_5:
    ++v4;
    if (v7 == v2)
      goto LABEL_27;
  }
  v1 = v2;
  sub_1BC966420((uint64_t)v27, (uint64_t (*)(_QWORD))sub_1BC96D280);
  v9 = v8;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v27[0] = v0;
  v12 = sub_1BC96C350((uint64_t)v9);
  v13 = v0[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
    goto LABEL_24;
  v16 = v11;
  if (v0[3] >= v15)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v0 = *(_QWORD **)&v27[0];
      if ((v11 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_1BC96CE70();
      v0 = *(_QWORD **)&v27[0];
      if ((v16 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v0[(v12 >> 6) + 8] |= 1 << v12;
    v19 = 8 * v12;
    *(_QWORD *)(v0[6] + v19) = v9;
    *(_QWORD *)(v0[7] + v19) = 0;
    v20 = v0[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_25;
    v0[2] = v22;
    v23 = v9;
    goto LABEL_22;
  }
  sub_1BC96CA04(v15, isUniquelyReferenced_nonNull_native);
  v17 = sub_1BC96C350((uint64_t)v9);
  if ((v16 & 1) == (v18 & 1))
  {
    v12 = v17;
    v0 = *(_QWORD **)&v27[0];
    if ((v16 & 1) == 0)
      goto LABEL_20;
LABEL_18:
    *(_QWORD *)(v0[7] + 8 * v12) = 0;
LABEL_22:

    swift_bridgeObjectRelease();
    v2 = v1;
    v3 = v25;
    v1 = v26;
    goto LABEL_5;
  }
  result = sub_1BC98031C();
  __break(1u);
  return result;
}

void sub_1BC96AA70(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_1BC96AAD0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

char *HealthArticleViewController.__allocating_init(title:components:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return HealthArticleViewController.init(title:components:)(a1, a2, a3);
}

char *HealthArticleViewController.init(title:components:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  objc_class *v9;
  char *v10;
  void *v11;
  char *result;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  objc_super v21;

  v5 = type metadata accessor for HealthArticleComponent(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (_QWORD *)((char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components] = a3;
  v9 = (objc_class *)type metadata accessor for HealthArticleViewController();
  v21.receiver = v3;
  v21.super_class = v9;
  v10 = (char *)objc_msgSendSuper2(&v21, sel_initWithNibName_bundle_, 0, 0);
  v11 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setTitle_, v11);

  result = (char *)objc_msgSend(v10, sel_view);
  if (result)
  {
    v13 = result;
    v14 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

    objc_msgSend(v10, sel_setModalPresentationStyle_, 1);
    v15 = *(_QWORD *)&v10[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components];
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v17 = v15 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      v18 = *(_QWORD *)(v6 + 72);
      v20[1] = *(_QWORD *)&v10[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components];
      swift_bridgeObjectRetain();
      do
      {
        sub_1BC967F68(v17, (uint64_t)v8);
        if (swift_getEnumCaseMultiPayload() == 11)
        {
          v19 = (void *)*v8;
          objc_msgSend(v10, sel_addChildViewController_, *v8);
          objc_msgSend(v19, sel_didMoveToParentViewController_, v10);

        }
        else
        {
          sub_1BC966420((uint64_t)v8, type metadata accessor for HealthArticleComponent);
        }
        v17 += v18;
        --v16;
      }
      while (v16);

      swift_bridgeObjectRelease();
    }
    else
    {

    }
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for HealthArticleViewController()
{
  return objc_opt_self();
}

id HealthArticleViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void HealthArticleViewController.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView] = 0;

  sub_1BC98028C();
  __break(1u);
}

uint64_t sub_1BC96AF3C()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  swift_getObjectType();
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for HealthArticleViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  sub_1BC96B1F0();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_dismissArticleModal);
  v2 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v2, sel_setRightBarButtonItem_, v1);

  sub_1BC961AD0();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BC980D10;
  v4 = sub_1BC97FEC0();
  v5 = sub_1BC96178C(&qword_1EF4760F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2F348], MEMORY[0x1E0D2F340]);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  sub_1BC9800C4();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BC96B1F0()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
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
  void *v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  id *v67;

  v1 = v0;
  sub_1BC96A1C0(0, &qword_1EF4761A8);
  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_setPreservesSuperviewLayoutMargins_, 1);
  v3 = objc_msgSend(v0, sel_title);
  if (v3)
  {
    v4 = v3;
    sub_1BC97FF20();

    v65 = sub_1BC969450();
    v64 = MEMORY[0x1E0DEA968];
    sub_1BC9801B4();
    swift_bridgeObjectRelease();
    v5 = v2;
    sub_1BC980214();
    sub_1BC97FF20();
    swift_bridgeObjectRelease();
    sub_1BC97FF74();
    sub_1BC97FF74();
    swift_bridgeObjectRelease();
    v6 = (void *)sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setAccessibilityIdentifier_, v6, v64, v65, v65, v65);

  }
  v7 = (void **)&v1[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView];
  swift_beginAccess();
  v8 = *v7;
  *v7 = v2;
  v9 = v2;

  v10 = objc_msgSend(v1, sel_view);
  if (!v10)
  {
    __break(1u);
    goto LABEL_12;
  }
  v11 = v10;
  objc_msgSend(v10, sel_addSubview_, v9);

  v12 = sub_1BC96A4E0();
  objc_msgSend(v9, sel_addSubview_, v12);

  sub_1BC96D3CC();
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1BC981730;
  v14 = objc_msgSend(v9, sel_frameLayoutGuide);
  v15 = objc_msgSend(v14, sel_topAnchor);

  v16 = objc_msgSend(v1, sel_view);
  if (!v16)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_topAnchor);

  v19 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v18);
  *(_QWORD *)(v13 + 32) = v19;
  v20 = objc_msgSend(v9, sel_frameLayoutGuide);
  v21 = objc_msgSend(v20, sel_leadingAnchor);

  v22 = objc_msgSend(v1, sel_view);
  if (!v22)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, sel_leadingAnchor);

  v25 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v24);
  *(_QWORD *)(v13 + 40) = v25;
  v26 = objc_msgSend(v9, sel_frameLayoutGuide);
  v27 = objc_msgSend(v26, sel_trailingAnchor);

  v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v29 = v28;
  v67 = v7;
  v30 = objc_msgSend(v28, sel_trailingAnchor);

  v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
  *(_QWORD *)(v13 + 48) = v31;
  v32 = objc_msgSend(v9, sel_frameLayoutGuide);
  v33 = objc_msgSend(v32, sel_bottomAnchor);

  v34 = objc_msgSend(v1, sel_view);
  if (!v34)
  {
LABEL_15:
    __break(1u);
    return;
  }
  v35 = v34;
  v66 = (id)objc_opt_self();
  v36 = objc_msgSend(v35, sel_bottomAnchor);

  v37 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v36);
  *(_QWORD *)(v13 + 56) = v37;
  v38 = objc_msgSend(v9, sel_contentLayoutGuide);
  v39 = objc_msgSend(v38, sel_topAnchor);

  v40 = sub_1BC96A4E0();
  v41 = objc_msgSend(v40, sel_topAnchor);

  v42 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v41);
  *(_QWORD *)(v13 + 64) = v42;
  v43 = objc_msgSend(v9, sel_contentLayoutGuide);
  v44 = objc_msgSend(v43, sel_leadingAnchor);

  v45 = sub_1BC96A4E0();
  v46 = objc_msgSend(v45, sel_leadingAnchor);

  v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v46);
  *(_QWORD *)(v13 + 72) = v47;
  v48 = objc_msgSend(v9, sel_contentLayoutGuide);
  v49 = objc_msgSend(v48, sel_trailingAnchor);

  v50 = sub_1BC96A4E0();
  v51 = objc_msgSend(v50, sel_trailingAnchor);

  v52 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v51);
  *(_QWORD *)(v13 + 80) = v52;
  v53 = objc_msgSend(v9, sel_contentLayoutGuide);
  v54 = objc_msgSend(v53, sel_bottomAnchor);

  v55 = sub_1BC96A4E0();
  v56 = objc_msgSend(v55, sel_bottomAnchor);

  v57 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v56);
  *(_QWORD *)(v13 + 88) = v57;
  v58 = objc_msgSend(v9, sel_frameLayoutGuide);
  v59 = objc_msgSend(v58, sel_widthAnchor);

  v60 = sub_1BC96A4E0();
  v61 = objc_msgSend(v60, sel_widthAnchor);

  v62 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v61);
  *(_QWORD *)(v13 + 96) = v62;
  sub_1BC97FFD4();
  sub_1BC96A1C0(0, (unint64_t *)&qword_1ED6A1458);
  v63 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v66, sel_activateConstraints_, v63);

  if (*v67)
    objc_msgSend(*v67, sel_setDelegate_, v1);
  sub_1BC96BA1C(0);

}

uint64_t sub_1BC96BA1C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  __objc2_prot_list **p_base_prots;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  id v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double Height;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t result;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  id *v79;
  int64_t v80;
  __int128 v81[2];
  uint64_t v82;
  void *v83;
  _QWORD v84[3];
  uint64_t v85;
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v2 = v1;
  v4 = sub_1BC96A758();
  v76 = v4 + 64;
  v5 = 1 << *(_BYTE *)(v4 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v4 + 64);
  v74 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState;
  v79 = (id *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  v8 = 0;
  v77 = (unint64_t)(v5 + 63) >> 6;
  v78 = a1 & 1;
  v75 = v4;
  p_base_prots = &ImageView.base_prots;
  if (v7)
    goto LABEL_6;
LABEL_7:
  v12 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v12 < v77)
    {
      v13 = *(_QWORD *)(v76 + 8 * v12);
      v14 = v8 + 1;
      if (v13)
        goto LABEL_20;
      v14 = v8 + 2;
      if (v8 + 2 >= v77)
        return swift_release();
      v13 = *(_QWORD *)(v76 + 8 * v14);
      if (v13)
        goto LABEL_20;
      v14 = v8 + 3;
      if (v8 + 3 >= v77)
        return swift_release();
      v13 = *(_QWORD *)(v76 + 8 * v14);
      if (v13)
      {
LABEL_20:
        v7 = (v13 - 1) & v13;
        v80 = v14;
        for (i = __clz(__rbit64(v13)) + (v14 << 6); ; i = v10 | (v8 << 6))
        {
          v16 = 8 * i;
          v17 = *(void **)(*(_QWORD *)(v4 + 48) + v16);
          v18 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
          v19 = *v79;
          if (*v79)
          {
            v20 = v17;
            objc_msgSend(v19, sel_bounds);
            v22 = v21;
            v24 = v23;
            v26 = v25;
            v28 = v27;
            objc_msgSend(v20, (SEL)p_base_prots[261]);
            v90.origin.x = v29;
            v90.origin.y = v30;
            v90.size.width = v31;
            v90.size.height = v32;
            v87.origin.x = v22;
            v87.origin.y = v24;
            v87.size.width = v26;
            v87.size.height = v28;
            if (CGRectContainsRect(v87, v90))
              v33 = v78 | 2;
            else
              v33 = v78;
          }
          else
          {
            v34 = v17;
            v33 = v78;
          }
          v83 = v17;
          sub_1BC96A1C0(0, &qword_1EF476180);
          sub_1BC96D234(0, &qword_1EF476188);
          v35 = v17;
          if ((swift_dynamicCast() & 1) != 0)
          {
            sub_1BC96D3B4(v81, (uint64_t)v84);
            if (v18 != v33)
            {
              v36 = v85;
              v37 = v86;
              __swift_project_boxed_opaque_existential_1(v84, v85);
              *(_QWORD *)&v81[0] = v33;
              (*(void (**)(__int128 *, uint64_t, uint64_t))(v37 + 8))(v81, v36, v37);
              v38 = v35;
              v39 = v2;
              v40 = sub_1BC96A758();
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&v81[0] = v40;
              v43 = sub_1BC96C350((uint64_t)v38);
              v44 = *(_QWORD *)(v40 + 16);
              v45 = (v42 & 1) == 0;
              v46 = v44 + v45;
              if (__OFADD__(v44, v45))
                goto LABEL_48;
              v47 = v42;
              if (*(_QWORD *)(v40 + 24) >= v46)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                  sub_1BC96CE70();
              }
              else
              {
                sub_1BC96CA04(v46, isUniquelyReferenced_nonNull_native);
                v48 = sub_1BC96C350((uint64_t)v38);
                if ((v47 & 1) != (v49 & 1))
                  goto LABEL_51;
                v43 = v48;
              }
              v2 = v39;
              v50 = *(_QWORD **)&v81[0];
              v4 = v75;
              if ((v47 & 1) != 0)
              {
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v81[0] + 56) + 8 * v43) = v33;
              }
              else
              {
                *(_QWORD *)(*(_QWORD *)&v81[0] + 8 * (v43 >> 6) + 64) |= 1 << v43;
                v51 = 8 * v43;
                *(_QWORD *)(v50[6] + v51) = v38;
                *(_QWORD *)(v50[7] + v51) = v33;
                v52 = v50[2];
                v53 = __OFADD__(v52, 1);
                v54 = v52 + 1;
                if (v53)
                  goto LABEL_49;
                v50[2] = v54;
                v55 = v38;
              }

              swift_bridgeObjectRelease();
              *(_QWORD *)(v2 + v74) = v50;
              swift_bridgeObjectRelease();
            }
            p_base_prots = &ImageView.base_prots;
            if ((v33 & 1) == 0)
            {
              if (*v79)
              {
                objc_msgSend(*v79, sel_bounds);
                v57 = v56;
                v59 = v58;
                v61 = v60;
                v63 = v62;
                objc_msgSend(v35, sel_frame);
                v91.origin.x = v64;
                v91.origin.y = v65;
                v91.size.width = v66;
                v91.size.height = v67;
                v88.origin.x = v57;
                v88.origin.y = v59;
                v88.size.width = v61;
                v88.size.height = v63;
                v89 = CGRectIntersection(v88, v91);
              }
              else
              {
                v89.size.width = 0.0;
                v89.size.height = 0.0;
                v89.origin.x = 0.0;
                v89.origin.y = 0.0;
              }
              Height = CGRectGetHeight(v89);
              objc_msgSend(v35, sel_frame);
              v69 = v85;
              v70 = v86;
              v72 = Height / v71;
              __swift_project_boxed_opaque_existential_1(v84, v85);
              (*(void (**)(uint64_t, uint64_t, double))(v70 + 16))(v69, v70, v72);
            }

            __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
            v8 = v80;
            if (!v7)
              goto LABEL_7;
          }
          else
          {
            v82 = 0;
            memset(v81, 0, sizeof(v81));

            sub_1BC966420((uint64_t)v81, (uint64_t (*)(_QWORD))sub_1BC96D280);
            p_base_prots = (__objc2_prot_list **)(&ImageView + 40);
            v8 = v80;
            if (!v7)
              goto LABEL_7;
          }
LABEL_6:
          v10 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          v80 = v8;
        }
      }
      v15 = v8 + 4;
      if (v8 + 4 < v77)
      {
        v13 = *(_QWORD *)(v76 + 8 * v15);
        if (v13)
        {
          v14 = v8 + 4;
          goto LABEL_20;
        }
        while (1)
        {
          v14 = v15 + 1;
          if (__OFADD__(v15, 1))
            goto LABEL_50;
          if (v14 >= v77)
            return swift_release();
          v13 = *(_QWORD *)(v76 + 8 * v14);
          ++v15;
          if (v13)
            goto LABEL_20;
        }
      }
    }
    return swift_release();
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  result = sub_1BC98031C();
  __break(1u);
  return result;
}

uint64_t sub_1BC96BF34()
{
  return sub_1BC96BA1C(1);
}

uint64_t sub_1BC96BF90()
{
  return sub_1BC96BA1C(0);
}

uint64_t sub_1BC96BFEC(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return sub_1BC96BA1C(0);
  return result;
}

id HealthArticleViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1BC97FEFC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void HealthArticleViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HealthArticleViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthArticleViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

UIInterfaceOrientationMask __swiftcall HealthArticleViewController.navigationControllerSupportedInterfaceOrientations(_:)(UINavigationController *a1)
{
  void *v1;

  return (UIInterfaceOrientationMask)objc_msgSend(v1, sel_supportedInterfaceOrientations);
}

unint64_t sub_1BC96C1DC(uint64_t a1)
{
  uint64_t v2;

  sub_1BC97FF20();
  sub_1BC980340();
  sub_1BC97FF5C();
  v2 = sub_1BC980364();
  swift_bridgeObjectRelease();
  return sub_1BC96C380(a1, v2);
}

unint64_t sub_1BC96C25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC980340();
  sub_1BC97FF5C();
  v4 = sub_1BC980364();
  return sub_1BC96C4F4(a1, a2, v4);
}

unint64_t sub_1BC96C2C4(uint64_t a1)
{
  uint64_t v2;

  sub_1BC97FF20();
  sub_1BC980340();
  sub_1BC97FF5C();
  v2 = sub_1BC980364();
  swift_bridgeObjectRelease();
  return sub_1BC96C380(a1, v2);
}

unint64_t sub_1BC96C350(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BC98013C();
  return sub_1BC96C5D4(a1, v2);
}

unint64_t sub_1BC96C380(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1BC97FF20();
    v8 = v7;
    if (v6 == sub_1BC97FF20() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1BC980310();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1BC97FF20();
          v15 = v14;
          if (v13 == sub_1BC97FF20() && v15 == v16)
            break;
          v18 = sub_1BC980310();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
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

unint64_t sub_1BC96C4F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1BC980310() & 1) == 0)
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
      while (!v14 && (sub_1BC980310() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BC96C5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_1BC96A1C0(0, &qword_1EF476180);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_1BC980148();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_1BC980148();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_1BC96C6EC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  sub_1BC96D424();
  v37 = a2;
  v6 = sub_1BC9802B0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_33;
        v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_33;
          v23 = v36[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v34;
              if ((v37 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v23 = v36[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = 8 * v21;
      v30 = *(void **)(*(_QWORD *)(v5 + 48) + v29);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        v32 = v30;
        swift_unknownObjectRetain();
      }
      sub_1BC97FF20();
      sub_1BC980340();
      sub_1BC97FF5C();
      v14 = sub_1BC980364();
      result = swift_bridgeObjectRelease();
      v15 = -1 << *(_BYTE *)(v7 + 32);
      v16 = v14 & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v30;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v31;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BC96CA04(uint64_t a1, char a2)
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
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  sub_1BC96D2E4();
  v6 = sub_1BC9802B0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
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
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
      v33 = v31;
    result = sub_1BC98013C();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
          goto LABEL_41;
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
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_1BC96CCCC()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1BC96D424();
  v2 = *v0;
  v3 = sub_1BC9802A4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_unknownObjectRetain();
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

id sub_1BC96CE70()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v1 = v0;
  sub_1BC96D2E4();
  v2 = *v0;
  v3 = sub_1BC9802A4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1BC96D00C(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v1 = objc_msgSend(a1, sel_traitCollection);
  v2 = sub_1BC9800E8();

  objc_msgSend((id)objc_opt_self(), sel_edgeInsetsForWidthDesignation_, v2);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = sub_1BC96A4E0();
  objc_msgSend(v11, sel_setDirectionalLayoutMargins_, v4, v6, v8, v10);

}

uint64_t sub_1BC96D0C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1BC96A370();
  *a1 = result;
  return result;
}

uint64_t sub_1BC96D0EC(_QWORD *a1, _QWORD *a2)
{
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

id sub_1BC96D124@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for HealthArticleViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthArticleViewController.componentViews.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HealthArticleViewController.__allocating_init(title:components:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewDidScroll(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewWillBeginDragging(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewDidEndDecelerating(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewDidEndDragging(_:willDecelerate:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t sub_1BC96D234(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_1BC96D280()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF476190)
  {
    sub_1BC96D234(255, &qword_1EF476188);
    v0 = sub_1BC980160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF476190);
  }
}

void sub_1BC96D2E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF476198)
  {
    sub_1BC96A1C0(255, &qword_1EF476180);
    sub_1BC96D35C();
    v0 = sub_1BC9802C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF476198);
  }
}

unint64_t sub_1BC96D35C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF4761A0;
  if (!qword_1EF4761A0)
  {
    v1 = sub_1BC96A1C0(255, &qword_1EF476180);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF4761A0);
  }
  return result;
}

uint64_t sub_1BC96D3B4(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_1BC96D3CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4761B0)
  {
    v0 = sub_1BC980304();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4761B0);
  }
}

void sub_1BC96D424()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4761B8)
  {
    type metadata accessor for Key(255);
    sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
    v0 = sub_1BC9802C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4761B8);
  }
}

uint64_t sub_1BC96D4B0()
{
  uint64_t result;

  result = sub_1BC97FEFC();
  qword_1ED6A1648 = result;
  return result;
}

id static NSNotificationName.articleWasReadByUser.getter()
{
  if (qword_1ED6A1650 != -1)
    swift_once();
  return (id)qword_1ED6A1648;
}

unint64_t static Notification.UserInfoKey.readArticleIdentifier.getter()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for Notification.UserInfoKey()
{
  return &type metadata for Notification.UserInfoKey;
}

HealthArticlesUI::ArticleContentConfigurationProviderViewModel __swiftcall ArticleContentConfigurationProviderViewModel.init(articleIdentifier:)(HealthArticlesUI::ArticleContentConfigurationProviderViewModel articleIdentifier)
{
  HealthArticlesUI::ArticleContentConfigurationProviderViewModel *v1;

  *v1 = articleIdentifier;
  return articleIdentifier;
}

uint64_t sub_1BC96D558()
{
  return 1;
}

uint64_t sub_1BC96D560()
{
  sub_1BC980340();
  sub_1BC98034C();
  return sub_1BC980364();
}

uint64_t sub_1BC96D5A0()
{
  return sub_1BC98034C();
}

uint64_t sub_1BC96D5C4()
{
  sub_1BC980340();
  sub_1BC98034C();
  return sub_1BC980364();
}

unint64_t sub_1BC96D600()
{
  return 0xD000000000000011;
}

uint64_t sub_1BC96D61C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BC96F6F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1BC96D644()
{
  return 0;
}

void sub_1BC96D650(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1BC96D65C()
{
  sub_1BC96D7A0();
  return sub_1BC980388();
}

uint64_t sub_1BC96D684()
{
  sub_1BC96D7A0();
  return sub_1BC980394();
}

uint64_t ArticleContentConfigurationProviderViewModel.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BC96D908(0, &qword_1ED6A1188, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC96D7A0();
  sub_1BC98037C();
  sub_1BC9802F8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BC96D7A0()
{
  unint64_t result;

  result = qword_1ED6A1610;
  if (!qword_1ED6A1610)
  {
    result = MEMORY[0x1BCCF95CC](&unk_1BC981AB4, &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6A1610);
  }
  return result;
}

uint64_t ArticleContentConfigurationProviderViewModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_1BC96D908(0, qword_1ED6A1190, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC96D7A0();
  sub_1BC980370();
  if (!v2)
  {
    v10 = sub_1BC9802EC();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BC96D908(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BC96D7A0();
    v7 = a3(a1, &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BC96D964@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ArticleContentConfigurationProviderViewModel.init(from:)(a1, a2);
}

uint64_t sub_1BC96D978(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BC96D908(0, &qword_1ED6A1188, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC96D7A0();
  sub_1BC98037C();
  sub_1BC9802F8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1BC96DA6C()
{
  sub_1BC970024();
  return sub_1BC97FA94();
}

uint64_t sub_1BC96DAC8()
{
  sub_1BC970024();
  return sub_1BC97FA88();
}

uint64_t sub_1BC96DAFC()
{
  sub_1BC96F774();
  return swift_unknownObjectRetain();
}

uint64_t sub_1BC96DB24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1BC96DB74())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ArticleContentConfigurationProvider.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t ArticleContentConfigurationProvider.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  return result;
}

uint64_t sub_1BC96DBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t *v4;
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
  char *v22;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v80 = a3;
  v94 = a2;
  v86 = a4;
  v6 = *v4;
  sub_1BC96F7A4();
  v8 = v7;
  v83 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v82 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_1BC97FB6C();
  v71 = *(_QWORD *)(v72 - 8);
  MEMORY[0x1E0C80A78](v72);
  v85 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC96F7F8();
  v81 = v11;
  v78 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x1E0C80A78](v11);
  v77 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v79 = (char *)&v69 - v14;
  v76 = sub_1BC97FA34();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x1E0C80A78](v76);
  v74 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = type metadata accessor for ArticleTileView.ViewModel(0);
  v16 = MEMORY[0x1E0C80A78](v73);
  v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v6 + 80);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v16);
  v22 = (char *)&v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *(_QWORD *)(v6 + 88);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v19, v23);
  v84 = v8;
  v70 = a1;
  sub_1BC97FA40();
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 16))(&v89, v87, v88, v94, v19, v23);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  if (v90)
  {
    sub_1BC96F968(&v89, &v91);
    v24 = v92;
    v25 = v93;
    __swift_project_boxed_opaque_existential_1(&v91, v92);
    v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 24))(v24, v25);
    v84 = v27;
    v85 = (char *)v26;
    v28 = v92;
    v29 = v93;
    __swift_project_boxed_opaque_existential_1(&v91, v92);
    v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 32))(v28, v29);
    v32 = v31;
    v33 = v92;
    v34 = v93;
    __swift_project_boxed_opaque_existential_1(&v91, v92);
    v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 40))(v33, v34);
    v36 = v74;
    sub_1BC97FA7C();
    v37 = v92;
    v38 = v93;
    __swift_project_boxed_opaque_existential_1(&v91, v92);
    v39 = *(uint64_t (**)(uint64_t, uint64_t))(v38 + 72);
    v40 = v80;
    swift_retain();
    v41 = v39(v37, v38);
    v43 = v42;
    v44 = v84;
    *(_QWORD *)v18 = v85;
    *((_QWORD *)v18 + 1) = v44;
    *((_QWORD *)v18 + 2) = v30;
    *((_QWORD *)v18 + 3) = v32;
    *((_QWORD *)v18 + 4) = v35;
    v45 = v73;
    v46 = (*(uint64_t (**)(char *, char *, uint64_t))(v75 + 32))(&v18[*(int *)(v73 + 28)], v36, v76);
    *(_QWORD *)&v18[*(int *)(v45 + 32)] = v40;
    v47 = (uint64_t *)&v18[*(int *)(v45 + 36)];
    *v47 = v41;
    v47[1] = v43;
    MEMORY[0x1E0C80A78](v46);
    *(&v69 - 2) = (uint64_t)v18;
    *(&v69 - 1) = v40;
    type metadata accessor for ArticleTileView(0);
    sub_1BC96178C(&qword_1ED6A12C0, type metadata accessor for ArticleTileView, (uint64_t)&protocol conformance descriptor for ArticleTileView);
    v48 = v77;
    sub_1BC97FC98();
    sub_1BC97FD58();
    v49 = v79;
    v50 = v81;
    sub_1BC97FC8C();
    v51 = *(uint64_t (**)(char *, uint64_t))(v78 + 8);
    v52 = v51(v48, v50);
    MEMORY[0x1E0C80A78](v52);
    *(&v69 - 2) = v94;
    *(&v69 - 1) = v40;
    sub_1BC96F9CC();
    v53 = v86;
    v86[3] = v54;
    v53[4] = sub_1BC96178C(&qword_1ED6A1390, (uint64_t (*)(uint64_t))sub_1BC96F9CC, MEMORY[0x1E0CDC120]);
    __swift_allocate_boxed_opaque_existential_1(v53);
    sub_1BC97FAAC();
    sub_1BC96178C(&qword_1ED6A12E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2B448], MEMORY[0x1E0D2B438]);
    sub_1BC97FC80();
    v51(v49, v50);
    sub_1BC966420((uint64_t)v18, type metadata accessor for ArticleTileView.ViewModel);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v91);
  }
  else
  {
    v56 = v6;
    sub_1BC966420((uint64_t)&v89, (uint64_t (*)(_QWORD))sub_1BC96F88C);
    sub_1BC97FB48();
    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v82, v70, v84);
    v57 = sub_1BC97FB60();
    v58 = sub_1BC980094();
    v59 = os_log_type_enabled(v57, v58);
    v60 = v86;
    v61 = v72;
    if (v59)
    {
      v62 = swift_slowAlloc();
      v63 = swift_slowAlloc();
      *(_QWORD *)&v89 = v63;
      *(_DWORD *)v62 = 136446466;
      *(_QWORD *)&v91 = v56;
      swift_getMetatypeMetadata();
      v64 = sub_1BC97FF2C();
      *(_QWORD *)&v91 = sub_1BC9741D8(v64, v65, (uint64_t *)&v89);
      sub_1BC98019C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2080;
      v66 = v84;
      v67 = v82;
      sub_1BC97FA40();
      *(_QWORD *)&v91 = sub_1BC9741D8(v91, *((unint64_t *)&v91 + 1), (uint64_t *)&v89);
      sub_1BC98019C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v83 + 8))(v67, v66);
      _os_log_impl(&dword_1BC95E000, v57, v58, "[%{public}s] No article data provider was found in updateLayout using identifier %s", (uint8_t *)v62, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF9674](v63, -1, -1);
      MEMORY[0x1BCCF9674](v62, -1, -1);

      (*(void (**)(char *, uint64_t))(v71 + 8))(v85, v72);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v83 + 8))(v82, v84);

      (*(void (**)(char *, uint64_t))(v71 + 8))(v85, v61);
    }
    sub_1BC96F904();
    v60[3] = v68;
    v60[4] = sub_1BC96178C(&qword_1EF4761F0, (uint64_t (*)(uint64_t))sub_1BC96F904, MEMORY[0x1E0CDC120]);
    __swift_allocate_boxed_opaque_existential_1(v60);
    return sub_1BC97FC98();
  }
}

uint64_t sub_1BC96E384@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  int *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v4 = type metadata accessor for ArticleTileView.ViewModel(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC970160(a1, (uint64_t)v6);
  *a2 = swift_getKeyPath();
  v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CD87D0];
  sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
  swift_storeEnumTagMultiPayload();
  v8 = (int *)type metadata accessor for ArticleTileView(0);
  v9 = (uint64_t *)((char *)a2 + v8[5]);
  *v9 = swift_getKeyPath();
  sub_1BC963498(0, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], v7);
  swift_storeEnumTagMultiPayload();
  sub_1BC970160((uint64_t)v6, (uint64_t)a2 + v8[6]);
  v10 = (uint64_t *)((char *)a2 + v8[7]);
  sub_1BC97FA70();
  sub_1BC96178C(&qword_1ED6A12D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2AEC0], MEMORY[0x1E0D2AEA0]);
  swift_retain();
  v11 = sub_1BC97FBD8();
  v13 = v12;
  result = sub_1BC966420((uint64_t)v6, type metadata accessor for ArticleTileView.ViewModel);
  *v10 = v11;
  v10[1] = v13;
  return result;
}

uint64_t sub_1BC96E510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_1BC97FB90();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_1BC96E54C()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t ArticleContentConfigurationProvider.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t ArticleContentConfigurationProvider.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1BC96E598()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1BC96E5A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BC96DBE4(a1, a2, a3, a4);
}

uint64_t sub_1BC96E5B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC96E510(a1);
}

uint64_t sub_1BC96E5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for ArticleContentConfigurationProvider(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_1BC97FAB8();
}

void (*sub_1BC96E610(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1BC96DB74();
  return sub_1BC96E654;
}

void sub_1BC96E654(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1BC96E680@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;
  __int128 v11[2];

  v2 = sub_1BC97FB0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC97FAC4();
  sub_1BC97FB00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v10)
  {
    sub_1BC96D3B4(&v9, (uint64_t)v11);
    sub_1BC96D3B4(v11, (uint64_t)&v9);
    sub_1BC97010C();
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      v7 = v8[1];
      *a1 = v8[0];
      a1[1] = v7;
      return result;
    }
  }
  else
  {
    result = sub_1BC966420((uint64_t)&v9, (uint64_t (*)(_QWORD))sub_1BC9700F0);
  }
  *a1 = 0;
  a1[1] = 0;
  return result;
}

uint64_t sub_1BC96E778()
{
  char *v0;
  char *v1;
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  void *v21;
  char *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  os_log_t v45;
  uint64_t (*v46)(char *, uint64_t);
  char *v47;
  os_log_t v48;
  char *v49;
  int v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  _OWORD v59[3];

  v1 = v0;
  v2 = *(_QWORD *)v0;
  v3 = sub_1BC97FB6C();
  v54 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x1E0C80A78](v3);
  v53 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v52 = (char *)&v48 - v6;
  v7 = sub_1BC97FB0C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v2 + class metadata base offset for ArticleContentConfigurationProvider.ActionHandler);
  v55 = *(_QWORD *)(v12 - 8);
  v56 = v2;
  MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v48 - v13;
  sub_1BC96E680(v59);
  v15 = *((_QWORD *)&v59[0] + 1);
  if (*((_QWORD *)&v59[0] + 1))
  {
    v51 = v3;
    v16 = v1;
    v17 = *(_QWORD *)&v59[0];
    v18 = *(_QWORD *)(class metadata base offset for ArticleContentConfigurationProvider.ActionHandler + v56 + 8);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v12, v18);
    v53 = v16;
    sub_1BC97FAC4();
    v19 = sub_1BC97FAE8();
    v20 = *(void (**)(char *, uint64_t))(v8 + 8);
    v20(v11, v7);
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(&v57, v17, v15, v19, v12, v18);
    swift_release();
    swift_bridgeObjectRelease();
    if (v58)
    {
      sub_1BC96F968(&v57, v59);
      sub_1BC96F180((uint64_t)v59);
      sub_1BC97FAC4();
      v21 = (void *)sub_1BC97FAF4();
      v20(v11, v7);
      sub_1BC96ED44(v59, v21);

      (*(void (**)(_OWORD *, uint64_t, uint64_t))(v18 + 32))(v59, v12, v18);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
    }
    else
    {
      sub_1BC966420((uint64_t)&v57, (uint64_t (*)(_QWORD))sub_1BC96F88C);
      v32 = v52;
      sub_1BC97FB48();
      swift_retain_n();
      v33 = sub_1BC97FB60();
      v34 = sub_1BC980094();
      v50 = v34;
      v35 = os_log_type_enabled(v33, v34);
      v36 = v54;
      if (v35)
      {
        v37 = swift_slowAlloc();
        v49 = v14;
        v38 = v37;
        v39 = swift_slowAlloc();
        v48 = v33;
        v40 = v39;
        *(_QWORD *)&v59[0] = v39;
        *(_DWORD *)v38 = 136315394;
        v41 = sub_1BC9803A0();
        *(_QWORD *)&v57 = sub_1BC9741D8(v41, v42, (uint64_t *)v59);
        sub_1BC98019C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2080;
        sub_1BC97FAC4();
        v43 = sub_1BC97FF2C();
        *(_QWORD *)&v57 = sub_1BC9741D8(v43, v44, (uint64_t *)v59);
        sub_1BC98019C();
        swift_release_n();
        swift_bridgeObjectRelease();
        v45 = v48;
        _os_log_impl(&dword_1BC95E000, v48, (os_log_type_t)v50, "[%s]: Received tap for article without underlying article: %s", (uint8_t *)v38, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1BCCF9674](v40, -1, -1);
        MEMORY[0x1BCCF9674](v38, -1, -1);

        (*(void (**)(char *, uint64_t))(v36 + 8))(v52, v51);
        v46 = *(uint64_t (**)(char *, uint64_t))(v55 + 8);
        v47 = v49;
        return v46(v47, v12);
      }
      swift_release_n();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v32, v51);
    }
    v46 = *(uint64_t (**)(char *, uint64_t))(v55 + 8);
    v47 = v14;
    return v46(v47, v12);
  }
  v55 = v7;
  v22 = v53;
  sub_1BC97FB48();
  swift_retain_n();
  v23 = sub_1BC97FB60();
  v24 = sub_1BC980094();
  if (os_log_type_enabled(v23, (os_log_type_t)v24))
  {
    v25 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    *(_QWORD *)&v59[0] = v26;
    *(_DWORD *)v25 = 136315394;
    v27 = sub_1BC9803A0();
    v51 = v3;
    *(_QWORD *)&v57 = sub_1BC9741D8(v27, v28, (uint64_t *)v59);
    sub_1BC98019C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    sub_1BC97FAC4();
    v29 = sub_1BC97FF2C();
    *(_QWORD *)&v57 = sub_1BC9741D8(v29, v30, (uint64_t *)v59);
    sub_1BC98019C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC95E000, v23, (os_log_type_t)v24, "[%s]: Received tap for article without identifier: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCF9674](v26, -1, -1);
    MEMORY[0x1BCCF9674](v25, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v22, v51);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v22, v3);
  }
}

void sub_1BC96ED44(_QWORD *a1, void *a2)
{
  uint64_t *v2;
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
  char *v14;
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
  id v29;
  char *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v51 = a2;
  v4 = *v2;
  v5 = sub_1BC97FB6C();
  v6 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  v50 = v6;
  MEMORY[0x1E0C80A78](v5);
  v52 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_1BC97FB0C();
  v8 = *(_QWORD *)(v53 - 8);
  v9 = MEMORY[0x1E0C80A78](v53);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = v4;
  v12 = *(_QWORD *)(v4 + class metadata base offset for ArticleContentConfigurationProvider.ActionHandler);
  v54 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v47 - v13;
  v16 = *(_QWORD *)(v15 + 8);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v12, v16);
  v17 = a1[3];
  v18 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v17);
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
  v21 = v20;
  sub_1BC97FAC4();
  v22 = sub_1BC97FAE8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v53);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 24))(v19, v21, v22, v12, v16);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v12);
  if (v23)
  {
    v24 = a1[3];
    v25 = a1[5];
    __swift_project_boxed_opaque_existential_1(a1, v24);
    v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(v24, v25);
    v28 = v27;
    v29 = objc_allocWithZone((Class)type metadata accessor for HealthArticleViewController());
    v30 = HealthArticleViewController.init(title:components:)(v26, v28, v23);
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B0]), sel_initWithRootViewController_, v30);
    objc_msgSend(v31, sel_setDelegate_, v30);
    v32 = objc_msgSend(v51, sel_navigationController);
    if (v32)
    {
      v33 = v32;
      objc_msgSend(v32, sel_presentViewController_animated_completion_, v31, 1, 0);

    }
  }
  else
  {
    v34 = v48;
    sub_1BC97FB48();
    sub_1BC970068((uint64_t)a1, (uint64_t)v56);
    v35 = sub_1BC97FB60();
    v36 = sub_1BC980094();
    v37 = os_log_type_enabled(v35, (os_log_type_t)v36);
    v38 = v49;
    if (v37)
    {
      v39 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v55 = v40;
      *(_DWORD *)v39 = 136446466;
      v59 = v34;
      swift_getMetatypeMetadata();
      v41 = sub_1BC97FF2C();
      v59 = sub_1BC9741D8(v41, v42, &v55);
      sub_1BC98019C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      v43 = v57;
      v44 = v58;
      __swift_project_boxed_opaque_existential_1(v56, v57);
      v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v43, v44);
      v59 = sub_1BC9741D8(v45, v46, &v55);
      sub_1BC98019C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
      _os_log_impl(&dword_1BC95E000, v35, (os_log_type_t)v36, "[%{public}s] No article components were found in presentArticle using identifier %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF9674](v40, -1, -1);
      MEMORY[0x1BCCF9674](v39, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v38);
  }
}

void sub_1BC96F180(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  char *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50[4];
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;

  v46 = *v1;
  v47 = sub_1BC97FB6C();
  v49 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BC97FA34();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v44 - v10;
  v12 = sub_1BC97FB0C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC970068(a1, (uint64_t)&v51);
  sub_1BC97FAC4();
  sub_1BC97FAE8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_1BC97FA7C();
  swift_release();
  v16 = v54;
  v17 = v55;
  __swift_project_boxed_opaque_existential_1(&v51, v54);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 48))(v16, v17);
  v19 = sub_1BC97A1D4(v18);
  swift_bridgeObjectRelease();
  v20 = v54;
  v21 = v55;
  __swift_project_boxed_opaque_existential_1(&v51, v54);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  ArticleTapAnalyticsEvent.init(didTapArticle:associatedHKTypes:articleTitle:articleLocation:)(1, v19, (uint64_t)v9, v50);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  v22 = (void *)v50[0];
  v23 = v50[1];
  v24 = (void *)v50[2];
  v25 = (void *)v50[3];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
  sub_1BC97FB54();
  v26 = v22;
  swift_bridgeObjectRetain_n();
  v27 = v24;
  v28 = v25;
  v29 = v26;
  v30 = v27;
  v31 = v28;
  v48 = v4;
  v32 = sub_1BC97FB60();
  v33 = sub_1BC9800AC();
  v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    v35 = swift_slowAlloc();
    v45 = swift_slowAlloc();
    v50[0] = v45;
    *(_DWORD *)v35 = 136446466;
    v51 = v46;
    swift_getMetatypeMetadata();
    LODWORD(v46) = v34;
    v36 = sub_1BC97FF2C();
    v51 = sub_1BC9741D8(v36, v37, v50);
    sub_1BC98019C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    v44 = v35 + 14;
    v51 = (uint64_t)v29;
    v52 = v23;
    v53 = v30;
    v54 = (uint64_t)v31;
    v38 = v29;
    swift_bridgeObjectRetain();
    v39 = v30;
    v40 = v31;
    v41 = sub_1BC97FF2C();
    v51 = sub_1BC9741D8(v41, v42, v50);
    sub_1BC98019C();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC95E000, v32, (os_log_type_t)v46, "[%{public}s]: Submitting article tap analytics for: %s", (uint8_t *)v35, 0x16u);
    v43 = v45;
    swift_arrayDestroy();
    MEMORY[0x1BCCF9674](v43, -1, -1);
    MEMORY[0x1BCCF9674](v35, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v47);
  v51 = (uint64_t)v29;
  v52 = v23;
  v53 = v30;
  v54 = (uint64_t)v31;
  sub_1BC9700AC();
  sub_1BC97F9EC();

  swift_bridgeObjectRelease();
}

uint64_t ArticleContentConfigurationProvider.ActionHandler.__allocating_init(content:)(uint64_t a1)
{
  swift_allocObject();
  return ArticleContentConfigurationProvider.ActionHandler.init(content:)(a1);
}

uint64_t ArticleContentConfigurationProvider.ActionHandler.init(content:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_1BC97FB0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = sub_1BC97FAD0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v5;
}

uint64_t ArticleContentConfigurationProvider.ActionHandler.__deallocating_deinit()
{
  _s16HealthArticlesUI35ArticleContentConfigurationProviderC13ActionHandlerCfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_1BC96F6F0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x80000001BC982C30)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1BC980310();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1BC96F774()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

void sub_1BC96F7A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4761D0)
  {
    v0 = sub_1BC97FA4C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4761D0);
  }
}

void sub_1BC96F7F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A13A0)
  {
    type metadata accessor for ArticleTileView(255);
    sub_1BC96178C(&qword_1ED6A12C0, type metadata accessor for ArticleTileView, (uint64_t)&protocol conformance descriptor for ArticleTileView);
    v0 = sub_1BC97FCA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A13A0);
  }
}

void sub_1BC96F88C(uint64_t a1)
{
  sub_1BC963498(a1, &qword_1EF4761D8, (uint64_t (*)(uint64_t))sub_1BC96F8A8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

unint64_t sub_1BC96F8A8()
{
  unint64_t result;

  result = qword_1EF4761E0;
  if (!qword_1EF4761E0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF4761E0);
  }
  return result;
}

void sub_1BC96F904()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4761E8)
  {
    v0 = sub_1BC97FCA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4761E8);
  }
}

_OWORD *sub_1BC96F968(__int128 *a1, _OWORD *a2)
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

uint64_t sub_1BC96F980@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1BC96E384(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1BC96F988()
{
  swift_retain();
  swift_retain();
  return sub_1BC97FAA0();
}

void sub_1BC96F9CC()
{
  uint64_t (*v0)(uint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED6A1398)
  {
    type metadata accessor for ArticleTileView(255);
    sub_1BC97FAAC();
    v0 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2B448];
    sub_1BC96178C(&qword_1ED6A12C0, type metadata accessor for ArticleTileView, (uint64_t)&protocol conformance descriptor for ArticleTileView);
    sub_1BC96178C(&qword_1ED6A12E0, v0, MEMORY[0x1E0D2B438]);
    v1 = sub_1BC97FCA4();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED6A1398);
  }
}

unint64_t sub_1BC96FA98()
{
  unint64_t result;

  result = qword_1ED6A1630;
  if (!qword_1ED6A1630)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleContentConfigurationProviderViewModel, &type metadata for ArticleContentConfigurationProviderViewModel);
    atomic_store(result, (unint64_t *)&qword_1ED6A1630);
  }
  return result;
}

unint64_t sub_1BC96FAE0()
{
  unint64_t result;

  result = qword_1ED6A1640;
  if (!qword_1ED6A1640)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleContentConfigurationProviderViewModel, &type metadata for ArticleContentConfigurationProviderViewModel);
    atomic_store(result, (unint64_t *)&qword_1ED6A1640);
  }
  return result;
}

unint64_t sub_1BC96FB28()
{
  unint64_t result;

  result = qword_1ED6A1638;
  if (!qword_1ED6A1638)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleContentConfigurationProviderViewModel, &type metadata for ArticleContentConfigurationProviderViewModel);
    atomic_store(result, (unint64_t *)&qword_1ED6A1638);
  }
  return result;
}

void sub_1BC96FB6C()
{
  JUMPOUT(0x1BCCF95CCLL);
}

uint64_t sub_1BC96FB7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_1BC96F774();
  a1[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_1BC96FBA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = swift_unknownObjectRetain();
  return sub_1BC96DB24(v2, v1);
}

uint64_t sub_1BC96FBDC()
{
  return 16;
}

__n128 sub_1BC96FBE8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ArticleContentConfigurationProviderViewModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ArticleContentConfigurationProviderViewModel()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ArticleContentConfigurationProviderViewModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ArticleContentConfigurationProviderViewModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ArticleContentConfigurationProviderViewModel()
{
  return &type metadata for ArticleContentConfigurationProviderViewModel;
}

uint64_t sub_1BC96FD30()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ArticleContentConfigurationProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArticleContentConfigurationProvider);
}

uint64_t method lookup function for ArticleContentConfigurationProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.makeContentConfiguration(viewModelState:viewContext:cellState:actionHandlerContent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.makeBackgroundConfiguration(cellState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.makeAccessories()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_1BC96FDE8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ArticleContentConfigurationProvider.ActionHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArticleContentConfigurationProvider.ActionHandler);
}

uint64_t method lookup function for ArticleContentConfigurationProvider.ActionHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.ActionHandler.didSelect()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ArticleContentConfigurationProvider.ActionHandler
                              + *v0
                              + 24))();
}

uint64_t getEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BC96FEE8 + 4 * byte_1BC9817B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BC96FF08 + 4 * byte_1BC9817B5[v4]))();
}

_BYTE *sub_1BC96FEE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BC96FF08(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC96FF10(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC96FF18(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC96FF20(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC96FF28(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1BC96FF34()
{
  return 0;
}

ValueMetadata *type metadata accessor for ArticleContentConfigurationProviderViewModel.CodingKeys()
{
  return &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys;
}

unint64_t sub_1BC96FF50()
{
  unint64_t result;

  result = qword_1EF4761F8;
  if (!qword_1EF4761F8)
  {
    result = MEMORY[0x1BCCF95CC](&unk_1BC981A8C, &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF4761F8);
  }
  return result;
}

unint64_t sub_1BC96FF98()
{
  unint64_t result;

  result = qword_1ED6A1620;
  if (!qword_1ED6A1620)
  {
    result = MEMORY[0x1BCCF95CC](&unk_1BC9819FC, &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6A1620);
  }
  return result;
}

unint64_t sub_1BC96FFE0()
{
  unint64_t result;

  result = qword_1ED6A1618;
  if (!qword_1ED6A1618)
  {
    result = MEMORY[0x1BCCF95CC](&unk_1BC981A24, &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6A1618);
  }
  return result;
}

unint64_t sub_1BC970024()
{
  unint64_t result;

  result = qword_1ED6A1628;
  if (!qword_1ED6A1628)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleContentConfigurationProviderViewModel, &type metadata for ArticleContentConfigurationProviderViewModel);
    atomic_store(result, (unint64_t *)&qword_1ED6A1628);
  }
  return result;
}

uint64_t sub_1BC970068(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1BC9700AC()
{
  unint64_t result;

  result = qword_1EF476200;
  if (!qword_1EF476200)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleTapAnalyticsEvent, &type metadata for ArticleTapAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1EF476200);
  }
  return result;
}

void sub_1BC9700F0(uint64_t a1)
{
  sub_1BC963498(a1, &qword_1EF476208, (uint64_t (*)(uint64_t))sub_1BC97010C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

unint64_t sub_1BC97010C()
{
  unint64_t result;

  result = qword_1EF476210;
  if (!qword_1EF476210)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF476210);
  }
  return result;
}

uint64_t sub_1BC970160(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ArticleTileView.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BC9701AC(uint64_t a1)
{
  sub_1BC963498(a1, &qword_1ED6A13A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC170], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1BC9701D4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  int v22;

  v3 = v2;
  v6 = objc_msgSend(v3, sel_constraints);
  sub_1BC961A94();
  v7 = sub_1BC97FFC8();

  swift_bridgeObjectRetain();
  v8 = sub_1BC97040C(v7, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    objc_msgSend(v8, sel_setActive_, 0);

  }
  v9 = objc_msgSend(v3, sel_image);
  if (v9)
  {
    v21 = v9;
    objc_msgSend(v9, sel_size);
    if (v11 == 0.0 && v10 == 0.0)
    {

    }
    else
    {
      objc_msgSend(v21, sel_size);
      v13 = v12;
      objc_msgSend(v21, sel_size);
      v15 = v13 / v14;
      v16 = objc_msgSend(v3, sel_widthAnchor);
      v17 = objc_msgSend(v3, sel_heightAnchor);
      v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_multiplier_, v17, v15);

      v19 = (void *)sub_1BC97FEFC();
      objc_msgSend(v18, sel_setIdentifier_, v19);

      type metadata accessor for UILayoutPriority(0);
      sub_1BC97059C();
      sub_1BC97FB84();
      LODWORD(v20) = v22;
      objc_msgSend(v18, sel_setPriority_, v20);
      objc_msgSend(v18, sel_setActive_, 1);

    }
  }
}

void *sub_1BC97040C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1BC980298())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1BCCF8FE4](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_identifier);
      if (v10)
      {
        v11 = v10;
        v12 = sub_1BC97FF20();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        v16 = sub_1BC980310();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_18;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1BC97059C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A1448;
  if (!qword_1ED6A1448)
  {
    type metadata accessor for UILayoutPriority(255);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DC2B88], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A1448);
  }
  return result;
}

uint64_t static NSLayoutConstraint.constraintsPinning(_:toMarginsOf:withHeight:)(void *a1, void *a2, uint64_t a3, char a4)
{
  return sub_1BC9705FC(a1, a2, a3, a4 & 1);
}

uint64_t static NSLayoutConstraint.constraintsPinning(_:toEdgesOf:withHeight:)(void *a1, void *a2, uint64_t a3, char a4)
{
  return sub_1BC970C04(a1, a2, a3, a4 & 1);
}

uint64_t static NSLayoutConstraint.constraintsPinning(_:toHorizontalMarginsOf:withHeight:)(void *a1, void *a2, uint64_t a3, char a4)
{
  return sub_1BC970918(a1, a2, a3, a4 & 1);
}

uint64_t sub_1BC9705FC(void *a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t result;
  id v26;
  id v27;
  double v28;
  uint64_t v29;

  sub_1BC96D3CC();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BC981B70;
  v9 = objc_msgSend(a1, sel_topAnchor);
  v10 = objc_msgSend(a2, sel_layoutMarginsGuide);
  v11 = objc_msgSend(v10, sel_topAnchor);

  v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
  *(_QWORD *)(v8 + 32) = v12;
  v13 = objc_msgSend(a1, sel_leftAnchor);
  v14 = objc_msgSend(a2, sel_layoutMarginsGuide);
  v15 = objc_msgSend(v14, sel_leftAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v8 + 40) = v16;
  v17 = objc_msgSend(a1, sel_bottomAnchor);
  v18 = objc_msgSend(a2, sel_layoutMarginsGuide);
  v19 = objc_msgSend(v18, sel_bottomAnchor);

  v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(_QWORD *)(v8 + 48) = v20;
  v21 = objc_msgSend(a1, sel_rightAnchor);
  v22 = objc_msgSend(a2, sel_layoutMarginsGuide);
  v23 = objc_msgSend(v22, sel_rightAnchor);

  v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(_QWORD *)(v8 + 56) = v24;
  v29 = v8;
  sub_1BC97FFD4();
  result = v8;
  if ((a4 & 1) == 0)
  {
    v26 = objc_msgSend(a1, sel_heightAnchor);
    v27 = objc_msgSend(v26, sel_constraintEqualToConstant_, *(double *)&a3);

    LODWORD(v28) = 1144750080;
    MEMORY[0x1BCCF8D68](objc_msgSend(v27, sel_setPriority_, v28));
    if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1BC97FFE0();
    sub_1BC97FFEC();
    sub_1BC97FFD4();
    return v29;
  }
  return result;
}

uint64_t sub_1BC970918(void *a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t result;
  id v24;
  id v25;
  double v26;
  uint64_t v27;

  sub_1BC96D3CC();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BC981B70;
  v9 = objc_msgSend(a1, sel_topAnchor);
  v10 = objc_msgSend(a2, sel_topAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v8 + 32) = v11;
  v12 = objc_msgSend(a1, sel_leftAnchor);
  v13 = objc_msgSend(a2, sel_layoutMarginsGuide);
  v14 = objc_msgSend(v13, sel_leftAnchor);

  v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(_QWORD *)(v8 + 40) = v15;
  v16 = objc_msgSend(a1, sel_bottomAnchor);
  v17 = objc_msgSend(a2, sel_bottomAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

  *(_QWORD *)(v8 + 48) = v18;
  v19 = objc_msgSend(a1, sel_rightAnchor);
  v20 = objc_msgSend(a2, sel_layoutMarginsGuide);
  v21 = objc_msgSend(v20, sel_rightAnchor);

  v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v21);
  *(_QWORD *)(v8 + 56) = v22;
  v27 = v8;
  sub_1BC97FFD4();
  result = v8;
  if ((a4 & 1) == 0)
  {
    v24 = objc_msgSend(a1, sel_heightAnchor);
    v25 = objc_msgSend(v24, sel_constraintEqualToConstant_, *(double *)&a3);

    LODWORD(v26) = 1144750080;
    MEMORY[0x1BCCF8D68](objc_msgSend(v25, sel_setPriority_, v26));
    if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1BC97FFE0();
    sub_1BC97FFEC();
    sub_1BC97FFD4();
    return v27;
  }
  return result;
}

uint64_t sub_1BC970C04(void *a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t result;
  id v22;
  id v23;
  double v24;
  uint64_t v25;

  sub_1BC96D3CC();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BC981B70;
  v9 = objc_msgSend(a1, sel_topAnchor);
  v10 = objc_msgSend(a2, sel_topAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v8 + 32) = v11;
  v12 = objc_msgSend(a1, sel_leftAnchor);
  v13 = objc_msgSend(a2, sel_leftAnchor);
  v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(_QWORD *)(v8 + 40) = v14;
  v15 = objc_msgSend(a1, sel_bottomAnchor);
  v16 = objc_msgSend(a2, sel_bottomAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v8 + 48) = v17;
  v18 = objc_msgSend(a1, sel_rightAnchor);
  v19 = objc_msgSend(a2, sel_rightAnchor);
  v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(_QWORD *)(v8 + 56) = v20;
  v25 = v8;
  sub_1BC97FFD4();
  result = v8;
  if ((a4 & 1) == 0)
  {
    v22 = objc_msgSend(a1, sel_heightAnchor);
    v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, *(double *)&a3);

    LODWORD(v24) = 1144750080;
    MEMORY[0x1BCCF8D68](objc_msgSend(v23, sel_setPriority_, v24));
    if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1BC97FFE0();
    sub_1BC97FFEC();
    sub_1BC97FFD4();
    return v25;
  }
  return result;
}

uint64_t MovementVisibilityState.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

HealthArticlesUI::MovementVisibilityState __swiftcall MovementVisibilityState.init(rawValue:)(HealthArticlesUI::MovementVisibilityState rawValue)
{
  HealthArticlesUI::MovementVisibilityState *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static MovementVisibilityState.viewIsMoving.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static MovementVisibilityState.viewIsVisible.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

unint64_t sub_1BC970EE8()
{
  unint64_t result;

  result = qword_1EF476218;
  if (!qword_1EF476218)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for MovementVisibilityState, &type metadata for MovementVisibilityState);
    atomic_store(result, (unint64_t *)&qword_1EF476218);
  }
  return result;
}

unint64_t sub_1BC970F30()
{
  unint64_t result;

  result = qword_1EF476220;
  if (!qword_1EF476220)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for MovementVisibilityState, &type metadata for MovementVisibilityState);
    atomic_store(result, (unint64_t *)&qword_1EF476220);
  }
  return result;
}

_QWORD *sub_1BC970F74@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_1BC970F84()
{
  unint64_t result;

  result = qword_1EF476228;
  if (!qword_1EF476228)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for MovementVisibilityState, &type metadata for MovementVisibilityState);
    atomic_store(result, (unint64_t *)&qword_1EF476228);
  }
  return result;
}

unint64_t sub_1BC970FCC()
{
  unint64_t result;

  result = qword_1EF476230;
  if (!qword_1EF476230)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for MovementVisibilityState, &type metadata for MovementVisibilityState);
    atomic_store(result, (unint64_t *)&qword_1EF476230);
  }
  return result;
}

void sub_1BC971010(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1BC971018@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1BC97102C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1BC971040@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1BC971054(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_1BC971084@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_1BC9710B0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_1BC9710D4(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1BC9710E8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1BC9710FC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1BC971110@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1BC971124(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1BC971138(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1BC97114C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1BC971160()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1BC971170()
{
  return sub_1BC9801CC();
}

_QWORD *sub_1BC971188(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

ValueMetadata *type metadata accessor for MovementVisibilityState()
{
  return &type metadata for MovementVisibilityState;
}

uint64_t dispatch thunk of MovementVisibilityTracking.viewStateChanged(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MovementVisibilityTracking.viewVisibilityChanged(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id sub_1BC971274()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SectionHeaderView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SectionHeaderView()
{
  return objc_opt_self();
}

char *sub_1BC9712C4(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;
  id v13;
  char *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  id v18;
  uint64_t v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v27;

  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_insetConstraints] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_edgeToEdgeConstraints] = v9;
  v10 = OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView;
  v11 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v12 = v4;
  v13 = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setContentMode_, 1);
  objc_msgSend(v13, sel_setClipsToBounds_, 1);
  objc_msgSend(v13, sel_setImage_, 0);
  *(_QWORD *)&v4[v10] = v13;

  v27.receiver = v12;
  v27.super_class = (Class)type metadata accessor for ImageView();
  v14 = (char *)objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v14, sel_setPreservesSuperviewLayoutMargins_, 1);
  v15 = OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView;
  v16 = *(void **)&v14[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView];
  objc_msgSend(v14, sel_addSubview_, v16);
  v17 = v14;
  v18 = v16;
  v19 = sub_1BC9705FC(v18, v17, 0, 1);

  *(_QWORD *)&v17[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_insetConstraints] = v19;
  swift_bridgeObjectRelease();
  v20 = *(void **)&v14[v15];
  v21 = v17;
  v22 = v20;
  v23 = sub_1BC970C04(v22, v21, 0, 1);

  *(_QWORD *)&v21[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_edgeToEdgeConstraints] = v23;
  swift_bridgeObjectRelease();
  v24 = (void *)objc_opt_self();
  sub_1BC961A94();
  swift_bridgeObjectRetain();
  v25 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_activateConstraints_, v25);

  return v21;
}

void sub_1BC971548(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v4 = *(void **)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView);
  objc_msgSend(v4, sel_setImage_, a1);
  sub_1BC9701D4(0xD000000000000043, 0x80000001BC982CF0);
  v5 = (void *)objc_opt_self();
  sub_1BC961A94();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_deactivateConstraints_, v6);

  swift_bridgeObjectRetain();
  v7 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_activateConstraints_, v7);

  v8 = objc_msgSend(v4, sel_layer);
  if ((a2 & 1) != 0)
    v9 = 3.0;
  else
    v9 = 0.0;
  v10 = v8;
  objc_msgSend(v8, sel_setCornerRadius_, v9);

}

id sub_1BC971734()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ImageView()
{
  return objc_opt_self();
}

void sub_1BC9717CC()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_insetConstraints] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_edgeToEdgeConstraints] = v1;
  v2 = OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setContentMode_, 1);
  objc_msgSend(v3, sel_setClipsToBounds_, 1);
  objc_msgSend(v3, sel_setImage_, 0);
  *(_QWORD *)&v0[v2] = v3;

  sub_1BC98028C();
  __break(1u);
}

id sub_1BC9718D4()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView];
  }
  else
  {
    v4 = sub_1BC971B6C(v0);
    v5 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

unint64_t sub_1BC971934()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t result;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes);
    if (v2 != 7)
    {
      v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text);
      v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes);
      swift_bridgeObjectRetain();
      sub_1BC961A84(v2);
      sub_1BC9719BC(v3, v1, &v5);
      swift_bridgeObjectRelease();
      return sub_1BC961808(v2);
    }
  }
  return result;
}

void sub_1BC9719BC(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  char *v3;
  char *v4;
  unint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = v3;
  v5 = *a3;
  v6 = &v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes];
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes] = v5;
  sub_1BC9617F8(v5);
  sub_1BC961808(v7);
  swift_bridgeObjectRetain();
  v8 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1BC972B7C(v8);
  swift_bridgeObjectRelease();
  v9 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v10 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BC963450();
  v11 = (void *)sub_1BC97FECC();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v9, sel_initWithString_attributes_, v10, v11);

  v12 = sub_1BC9718D4();
  objc_msgSend(v12, sel_setAttributedText_, v13);

  objc_msgSend(v4, sel_setNeedsLayout);
}

double sub_1BC971B20()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(v0, sel_layoutMargins);
  v2 = v1;
  objc_msgSend(v0, sel_layoutMargins);
  return v2;
}

id sub_1BC971B6C(void *a1)
{
  id v2;
  id v3;
  double v4;
  double v5;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3E50]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v2, sel_setBackgroundColor_, 0);
  objc_msgSend(v2, sel_setScrollEnabled_, 0);
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v2, sel_setEditable_, 0);
  v3 = objc_msgSend(a1, sel_effectiveUserInterfaceLayoutDirection);
  if (v3 == (id)1)
    v4 = 5.0;
  else
    v4 = -5.0;
  if (v3 == (id)1)
    v5 = -5.0;
  else
    v5 = 5.0;
  objc_msgSend(v2, sel_setContentInset_, 0.0, v4, 0.0, v5);
  objc_msgSend(v2, sel_setTextContainerInset_, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v2, sel_setAccessibilityTraits_, *MEMORY[0x1E0DC46C0]);
  return v2;
}

_QWORD *sub_1BC971CA4(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  _QWORD *v10;
  void (*v11)(void);
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  objc_super v24;

  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView] = 0;
  v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes] = 7;
  v24.receiver = v4;
  v24.super_class = (Class)type metadata accessor for DynamicHeightTextView();
  v10 = objc_msgSendSuper2(&v24, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v10, sel_setPreservesSuperviewLayoutMargins_, 1);
  v11 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v10) + 0xC8);
  v12 = v10;
  v11();
  objc_msgSend(v12, sel_setLayoutMargins_);

  v13 = v12;
  v14 = sub_1BC9718D4();
  objc_msgSend(v13, sel_addSubview_, v14);

  v15 = (void *)objc_opt_self();
  v16 = sub_1BC9718D4();
  v17 = v13;
  sub_1BC9705FC(v16, v17, 0, 1);

  sub_1BC961A94();
  v18 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_activateConstraints_, v18);

  sub_1BC961AD0();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1BC980D10;
  v20 = sub_1BC97FB9C();
  v21 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 40) = v21;
  v22 = v17;
  MEMORY[0x1BCCF8EDC](v19, sel_preferredContentSizeCategoryDidChange);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v22;
}

id sub_1BC971F8C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicHeightTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DynamicHeightTextView()
{
  return objc_opt_self();
}

HealthArticlesUI::HealthArticleView __swiftcall HealthArticleView.init(title:components:)(Swift::String title, Swift::OpaquePointer components)
{
  uint64_t v2;
  HealthArticlesUI::HealthArticleView result;

  *(Swift::String *)v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = components;
  result.title = title;
  result.components = components;
  return result;
}

uint64_t HealthArticleView.init(articleProvider:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1[3];
  v5 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  v8 = v7;
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v11;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

id HealthArticleView.makeUIViewController(context:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = objc_allocWithZone((Class)type metadata accessor for HealthArticleViewController());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = HealthArticleViewController.init(title:components:)(v1, v2, v3);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B0]), sel_initWithRootViewController_, v5);

  return v6;
}

unint64_t sub_1BC972158()
{
  unint64_t result;

  result = qword_1EF476290;
  if (!qword_1EF476290)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for HealthArticleView, &type metadata for HealthArticleView);
    atomic_store(result, (unint64_t *)&qword_1EF476290);
  }
  return result;
}

id sub_1BC97219C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = objc_allocWithZone((Class)type metadata accessor for HealthArticleViewController());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = HealthArticleViewController.init(title:components:)(v1, v2, v3);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B0]), sel_initWithRootViewController_, v5);

  return v6;
}

uint64_t sub_1BC972230()
{
  return sub_1BC97FCEC();
}

uint64_t sub_1BC972268()
{
  return MEMORY[0x1E0CE0788];
}

uint64_t sub_1BC972274()
{
  sub_1BC9724F8();
  return sub_1BC97FD28();
}

uint64_t sub_1BC9722C4()
{
  sub_1BC9724F8();
  return sub_1BC97FCF8();
}

uint64_t sub_1BC972314()
{
  return sub_1BC97FDE8();
}

void sub_1BC97232C()
{
  sub_1BC9724F8();
  sub_1BC97FD1C();
  __break(1u);
}

uint64_t destroy for HealthArticleView()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16HealthArticlesUI17HealthArticleViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HealthArticleView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HealthArticleView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthArticleView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthArticleView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthArticleView()
{
  return &type metadata for HealthArticleView;
}

unint64_t sub_1BC9724F8()
{
  unint64_t result;

  result = qword_1EF476298;
  if (!qword_1EF476298)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for HealthArticleView, &type metadata for HealthArticleView);
    atomic_store(result, (unint64_t *)&qword_1EF476298);
  }
  return result;
}

unint64_t HealthArticleTextAttributes.textAttributes.getter()
{
  unint64_t *v0;
  unint64_t v1;
  id v2;
  double v3;
  uint64_t inited;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;

  v1 = *v0;
  switch(*v0)
  {
    case 0uLL:
      v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
      LODWORD(v3) = 1045220557;
      objc_msgSend(v2, sel_setHyphenationFactor_, v3);
      objc_msgSend(v2, sel_setLineBreakStrategy_, 2);
      sub_1BC972B14();
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1BC981EA0;
      v5 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
      sub_1BC96A1C0(0, &qword_1ED6A1460);
      v6 = v5;
      v7 = sub_1BC980118();
      v8 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(inited + 40) = v7;
      *(_QWORD *)(inited + 48) = v8;
      v9 = (void *)objc_opt_self();
      v10 = v8;
      v11 = objc_msgSend(v9, sel_labelColor);
      v12 = (void *)*MEMORY[0x1E0DC1178];
      *(_QWORD *)(inited + 56) = v11;
      *(_QWORD *)(inited + 64) = v12;
      *(_QWORD *)(inited + 72) = v2;
      v13 = v12;
      v14 = inited;
      goto LABEL_10;
    case 1uLL:
    case 2uLL:
      sub_1BC972B14();
      v16 = swift_initStackObject();
      *(_OWORD *)(v16 + 16) = xmmword_1BC9816E0;
      v17 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(v16 + 32) = *MEMORY[0x1E0DC1138];
      sub_1BC96A1C0(0, &qword_1ED6A1460);
      v18 = v17;
      v19 = sub_1BC980118();
      v20 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(v16 + 40) = v19;
      *(_QWORD *)(v16 + 48) = v20;
      v21 = (void *)objc_opt_self();
      v22 = v20;
      *(_QWORD *)(v16 + 56) = objc_msgSend(v21, sel_labelColor);
      v14 = v16;
      goto LABEL_10;
    case 3uLL:
      sub_1BC972B14();
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1BC9816E0;
      v24 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(v23 + 32) = *MEMORY[0x1E0DC1138];
      v25 = (void *)objc_opt_self();
      v26 = *MEMORY[0x1E0DC4A88];
      v27 = v24;
      v28 = objc_msgSend(v25, sel_preferredFontForTextStyle_, v26);
      v29 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(v23 + 40) = v28;
      *(_QWORD *)(v23 + 48) = v29;
      v30 = (void *)objc_opt_self();
      v31 = v29;
      v32 = objc_msgSend(v30, sel_labelColor);
      goto LABEL_9;
    case 4uLL:
      sub_1BC972B14();
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1BC9816E0;
      v33 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(v23 + 32) = *MEMORY[0x1E0DC1138];
      v34 = (void *)objc_opt_self();
      v35 = *MEMORY[0x1E0DC4A88];
      v36 = v33;
      v37 = objc_msgSend(v34, sel_preferredFontForTextStyle_, v35);
      v38 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(v23 + 40) = v37;
      *(_QWORD *)(v23 + 48) = v38;
      v39 = (void *)objc_opt_self();
      v40 = v38;
      v32 = objc_msgSend(v39, sel_whiteColor);
      goto LABEL_9;
    case 5uLL:
      sub_1BC972B14();
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1BC9816E0;
      v41 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(v23 + 32) = *MEMORY[0x1E0DC1138];
      v42 = (void *)objc_opt_self();
      v43 = *MEMORY[0x1E0DC4A98];
      v44 = v41;
      v45 = objc_msgSend(v42, sel_preferredFontForTextStyle_, v43);
      v46 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(v23 + 40) = v45;
      *(_QWORD *)(v23 + 48) = v46;
      v47 = (void *)objc_opt_self();
      v48 = v46;
      v32 = objc_msgSend(v47, sel_secondaryLabelColor);
      goto LABEL_9;
    case 6uLL:
      sub_1BC972B14();
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1BC9816E0;
      v49 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(v23 + 32) = *MEMORY[0x1E0DC1138];
      v50 = (void *)objc_opt_self();
      v51 = *MEMORY[0x1E0DC4A88];
      v52 = v49;
      v53 = objc_msgSend(v50, sel_preferredFontForTextStyle_, v51);
      v54 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(v23 + 40) = v53;
      *(_QWORD *)(v23 + 48) = v54;
      v55 = (void *)objc_opt_self();
      v56 = v54;
      v32 = objc_msgSend(v55, sel_systemBlueColor);
LABEL_9:
      *(_QWORD *)(v23 + 56) = v32;
      v14 = v23;
LABEL_10:
      v15 = sub_1BC973698(v14);
      break;
    default:
      v15 = *v0;
      break;
  }
  sub_1BC9617F8(v1);
  return v15;
}

void sub_1BC972B14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF475FE8)
  {
    sub_1BC974C58(255, (unint64_t *)&qword_1EF475FF0);
    v0 = sub_1BC980304();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF475FE8);
  }
}

uint64_t sub_1BC972B7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  _OWORD v29[4];
  _OWORD v30[2];
  _OWORD v31[3];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_1BC974B80(0, &qword_1EF4762C8);
    v2 = sub_1BC9802BC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v28 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v28 << 6);
      goto LABEL_28;
    }
    v11 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v26)
      goto LABEL_37;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    v13 = v28 + 1;
    if (!v12)
    {
      v13 = v28 + 2;
      if (v28 + 2 >= v26)
        goto LABEL_37;
      v12 = *(_QWORD *)(v27 + 8 * v13);
      if (!v12)
      {
        v13 = v28 + 3;
        if (v28 + 3 >= v26)
          goto LABEL_37;
        v12 = *(_QWORD *)(v27 + 8 * v13);
        if (!v12)
        {
          v13 = v28 + 4;
          if (v28 + 4 >= v26)
            goto LABEL_37;
          v12 = *(_QWORD *)(v27 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v28 = v13;
LABEL_28:
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v31[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    *(_QWORD *)&v30[0] = v15;
    v16 = *(id *)&v31[0];
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v17 = *(_QWORD *)&v31[0];
    sub_1BC974B1C((_OWORD *)((char *)v31 + 8), v29);
    sub_1BC974B1C(v29, v31);
    sub_1BC974B1C(v31, v30);
    sub_1BC97FF20();
    sub_1BC980340();
    sub_1BC97FF5C();
    v18 = sub_1BC980364();
    result = swift_bridgeObjectRelease();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = v18 & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v8 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v17;
    result = (uint64_t)sub_1BC974B1C(v30, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v8));
    ++*(_QWORD *)(v2 + 16);
  }
  v14 = v28 + 5;
  if (v28 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1BC974B2C();
    return v2;
  }
  v12 = *(_QWORD *)(v27 + 8 * v14);
  if (v12)
  {
    v13 = v28 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v26)
      goto LABEL_37;
    v12 = *(_QWORD *)(v27 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1BC972F24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  _OWORD v30[4];
  _OWORD v31[2];
  _OWORD v32[3];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_1BC974CBC();
    v2 = sub_1BC9802BC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v29 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v29 << 6);
      goto LABEL_28;
    }
    v11 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v27)
      goto LABEL_37;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    v13 = v29 + 1;
    if (!v12)
    {
      v13 = v29 + 2;
      if (v29 + 2 >= v27)
        goto LABEL_37;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v29 + 3;
        if (v29 + 3 >= v27)
          goto LABEL_37;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v13 = v29 + 4;
          if (v29 + 4 >= v27)
            goto LABEL_37;
          v12 = *(_QWORD *)(v28 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v29 = v13;
LABEL_28:
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v32[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    v15 = *(void **)&v32[0];
    *(_QWORD *)&v31[0] = v16;
    sub_1BC974D40();
    v17 = v15;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    v18 = *(_QWORD *)&v32[0];
    sub_1BC974B1C((_OWORD *)((char *)v32 + 8), v30);
    sub_1BC974B1C(v30, v32);
    sub_1BC974B1C(v32, v31);
    sub_1BC97FF20();
    sub_1BC980340();
    sub_1BC97FF5C();
    v19 = sub_1BC980364();
    result = swift_bridgeObjectRelease();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v8 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v18;
    result = (uint64_t)sub_1BC974B1C(v31, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v8));
    ++*(_QWORD *)(v2 + 16);
  }
  v14 = v29 + 5;
  if (v29 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1BC974B2C();
    return v2;
  }
  v12 = *(_QWORD *)(v28 + 8 * v14);
  if (v12)
  {
    v13 = v29 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v27)
      goto LABEL_37;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1BC9732C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_1BC974B34(0, &qword_1EF4762B8);
    v2 = sub_1BC9802BC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_1BC974B1C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_1BC974B1C(v35, v36);
    sub_1BC974B1C(v36, &v32);
    result = sub_1BC980208();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_1BC974B1C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1BC974B2C();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_1BC973698(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC974B80(0, (unint64_t *)&qword_1EF4761B8);
  v2 = (_QWORD *)sub_1BC9802BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    result = sub_1BC96C1DC((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BC9737B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC974B34(0, &qword_1EF4762A8);
  v2 = sub_1BC9802BC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1BC974A70(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1BC96C25C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1BC974B1C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BC9738F8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC974E28();
  v2 = (_QWORD *)sub_1BC9802BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_1BC96C2C0();
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BC9739F0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC974D94();
  v2 = (_QWORD *)sub_1BC9802BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    result = sub_1BC96C2C0(v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BC973AF4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC974B80(0, &qword_1EF4762C8);
  v2 = sub_1BC9802BC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1BC974C00(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_1BC96C1DC(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_1BC974B1C(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BC973C1C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC96D2E4();
  v2 = (_QWORD *)sub_1BC9802BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_1BC96C350((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BC973D14(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC974B34(0, &qword_1EF4762C0);
  v2 = (_QWORD *)sub_1BC9802BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1BC96C25C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t HealthArticleTextAttributes.attributeContainer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = sub_1BC97FB6C();
  MEMORY[0x1E0C80A78](v3);
  v7 = *v1;
  v4 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1BC972B7C(v4);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_1BC97F8CC();
  sub_1BC96178C(&qword_1EF475FE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DC1A00], MEMORY[0x1E0DC19F8]);
  sub_1BC97F95C();
  v5 = sub_1BC97F950();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
}

uint64_t sub_1BC974180@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_1BC97F8D8();
  result = sub_1BC97F8CC();
  *a1 = result;
  return result;
}

uint64_t sub_1BC9741AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_1BC97F8D8();
  result = sub_1BC97F8CC();
  *a1 = result;
  return result;
}

uint64_t sub_1BC9741D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1BC9742A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BC974EA8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1BC974EA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1BC9742A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BC9801A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1BC974460(a5, a6);
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
  v8 = sub_1BC980238();
  if (!v8)
  {
    sub_1BC980280();
    __break(1u);
LABEL_17:
    result = sub_1BC9802D4();
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

uint64_t sub_1BC974460(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BC9744F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BC9746C8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1BC9746C8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BC9744F4(uint64_t a1, unint64_t a2)
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
      v3 = sub_1BC974668(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1BC980220();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1BC980280();
      __break(1u);
LABEL_10:
      v2 = sub_1BC97FF80();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1BC9802D4();
    __break(1u);
LABEL_14:
    result = sub_1BC980280();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1BC974668(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1BC974EE4();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BC9746C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1BC974EE4();
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1BC9802D4();
  __break(1u);
  return result;
}

unint64_t sub_1BC974810()
{
  unint64_t result;

  result = qword_1EF4762A0;
  if (!qword_1EF4762A0)
  {
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF4762A0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for HealthArticleTextAttributes(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_bridgeObjectRetain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for HealthArticleTextAttributes(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t *assignWithCopy for HealthArticleTextAttributes(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_bridgeObjectRetain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for HealthArticleTextAttributes(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthArticleTextAttributes(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFF9 && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483641);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 6;
  if (v4 >= 8)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HealthArticleTextAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF9)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 6;
  }
  return result;
}

uint64_t sub_1BC974A28(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1BC974A40(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for HealthArticleTextAttributes()
{
  return &type metadata for HealthArticleTextAttributes;
}

uint64_t sub_1BC974A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC974AB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BC974AB4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF4762B0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF4762B0);
  }
}

_OWORD *sub_1BC974B1C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1BC974B2C()
{
  return swift_release();
}

void sub_1BC974B34(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BC9802C8();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_1BC974B80(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    type metadata accessor for Key(255);
    sub_1BC96178C((unint64_t *)&qword_1EF4761C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BC980E94);
    v3 = sub_1BC9802C8();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1BC974C00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC974C58(0, &qword_1EF476038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BC974C58(uint64_t a1, unint64_t *a2)
{
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!*a2)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

void sub_1BC974CBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4762D0)
  {
    type metadata accessor for AttributeName(255);
    sub_1BC96178C(&qword_1EF475D38, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC9813C0);
    v0 = sub_1BC9802C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4762D0);
  }
}

void sub_1BC974D40()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF476070)
  {
    sub_1BC96A058();
    v0 = sub_1BC97FFF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF476070);
  }
}

void sub_1BC974D94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4762D8)
  {
    type metadata accessor for AttributeName(255);
    sub_1BC974D40();
    sub_1BC96178C(&qword_1EF475D38, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1BC9813C0);
    v0 = sub_1BC9802C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4762D8);
  }
}

void sub_1BC974E28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4762E0)
  {
    type metadata accessor for FeatureKey(255);
    sub_1BC96178C(&qword_1EF475D48, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_1BC981404);
    v0 = sub_1BC9802C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4762E0);
  }
}

uint64_t sub_1BC974EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1BC974EE4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4762E8)
  {
    v0 = sub_1BC980304();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4762E8);
  }
}

void __swiftcall UIView.init(frame:useAutoLayout:)(UIView *__return_ptr retstr, CGRect frame, Swift::Bool useAutoLayout)
{
  objc_msgSend(objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height), sel_setTranslatesAutoresizingMaskIntoConstraints_, !useAutoLayout);
}

Swift::Void __swiftcall UIView.addSubviews(_:)(Swift::OpaquePointer a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  id v5;
  uint64_t i;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = v1;
  if (!((unint64_t)a1._rawValue >> 62))
  {
    v4 = *(_QWORD *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    v5 = v2;
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();

    return;
  }
  v9 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1BC980298();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if (((unint64_t)a1._rawValue & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1BCCF8FE4](i, a1._rawValue);
      else
        v7 = *((id *)a1._rawValue + i + 4);
      v8 = v7;
      objc_msgSend(v10, sel_addSubview_, v7);

    }
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t static ArticleMutualExclusionPolicy.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!a2)
    return !a4;
  if (a2 == 1)
    return a4 == 1;
  if (a4 < 2)
    return 0;
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_1BC980310();
}

uint64_t sub_1BC975114(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (!v3)
    return !v4;
  if (v3 == 1)
    return v4 == 1;
  if (v4 < 2)
    return 0;
  if (*a1 != *a2 || v3 != v4)
    return sub_1BC980310();
  return 1;
}

uint64_t HealthArticleInformationProviding.mutualExclusionPolicy.getter()
{
  return 0;
}

double sub_1BC975180()
{
  return 1209600.0;
}

double HealthArticleInformationProviding.rampDownDurationAfterFirstRead.getter()
{
  return 1209600.0;
}

uint64_t HealthArticleInformationProviding.articleAutomationIdentifier.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5;

  v5 = sub_1BC97FF20();
  sub_1BC97FF74();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_1BC97FF74();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t HealthArticleInformationProviding.feedItemIdentifier(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  sub_1BC97FF74();
  sub_1BC97F9E0();
  sub_1BC97FF74();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t destroy for ArticleMutualExclusionPolicy(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16HealthArticlesUI28ArticleMutualExclusionPolicyOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for ArticleMutualExclusionPolicy(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ArticleMutualExclusionPolicy(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleMutualExclusionPolicy(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ArticleMutualExclusionPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_1BC9754B4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1BC9754CC(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleMutualExclusionPolicy()
{
  return &type metadata for ArticleMutualExclusionPolicy;
}

uint64_t dispatch thunk of HealthArticleInformationProviding.uniqueIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.viewTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleHeroImage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.associatedHKTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.mutualExclusionPolicy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.rampDownDurationAfterFirstRead.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleAutomationIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of HealthArticleComponentsProviding.articleComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t ArticleTileView.ViewModel.init(title:description:backgroundImage:presentation:cellState:automationIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  int *v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  v14 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  v15 = (char *)a9 + v14[7];
  v16 = sub_1BC97FA34();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15, a6, v16);
  *(_QWORD *)((char *)a9 + v14[8]) = a7;
  v18 = (_QWORD *)((char *)a9 + v14[9]);
  *v18 = a8;
  v18[1] = a10;
  return result;
}

uint64_t type metadata accessor for ArticleTileView.ViewModel(uint64_t a1)
{
  return sub_1BC965804(a1, (uint64_t *)&unk_1ED6A12B0);
}

uint64_t ArticleTileView.init(_:cellState:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v4)(uint64_t, uint64_t);
  int *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  *a2 = swift_getKeyPath();
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CD87D0];
  sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
  swift_storeEnumTagMultiPayload();
  v5 = (int *)type metadata accessor for ArticleTileView(0);
  v6 = (uint64_t *)((char *)a2 + v5[5]);
  *v6 = swift_getKeyPath();
  sub_1BC963498(0, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], v4);
  swift_storeEnumTagMultiPayload();
  sub_1BC978F74(a1, (uint64_t)a2 + v5[6], type metadata accessor for ArticleTileView.ViewModel);
  v7 = (uint64_t *)((char *)a2 + v5[7]);
  sub_1BC97FA70();
  sub_1BC96178C(&qword_1ED6A12D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2AEC0], MEMORY[0x1E0D2AEA0]);
  v8 = sub_1BC97FBD8();
  v10 = v9;
  result = sub_1BC966420(a1, type metadata accessor for ArticleTileView.ViewModel);
  *v7 = v8;
  v7[1] = v10;
  return result;
}

uint64_t ArticleTileView.ViewModel.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArticleTileView.ViewModel.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

id ArticleTileView.ViewModel.backgroundImage.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t ArticleTileView.ViewModel.presentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 28);
  v4 = sub_1BC97FA34();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ArticleTileView.ViewModel.cellState.getter()
{
  type metadata accessor for ArticleTileView.ViewModel(0);
  return swift_retain();
}

uint64_t ArticleTileView.ViewModel.baseIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArticleTileView.ViewModel.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ArticleTileView.ViewModel.baseIdentifier.modify())()
{
  type metadata accessor for ArticleTileView.ViewModel(0);
  return nullsub_1;
}

uint64_t ArticleTileView.viewModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ArticleTileView(0);
  return sub_1BC978F74(v1 + *(int *)(v3 + 24), a1, type metadata accessor for ArticleTileView.ViewModel);
}

double sub_1BC9758E0()
{
  double result;
  double v1;

  type metadata accessor for ArticleTileView(0);
  sub_1BC97FA70();
  sub_1BC96178C(&qword_1ED6A12D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2AEC0], MEMORY[0x1E0D2AEA0]);
  sub_1BC97FBE4();
  swift_getKeyPath();
  sub_1BC97FBF0();
  swift_release();
  swift_release();
  sub_1BC96A31C(0, &qword_1ED6A1400, MEMORY[0x1E0DEF040], MEMORY[0x1E0CDFDB8]);
  MEMORY[0x1BCCF8C0C](&v1);
  swift_release();
  swift_release();
  result = v1 * 0.6;
  if (v1 * 0.6 > 319.0)
    return 319.0;
  return result;
}

uint64_t ArticleTileView.body.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17[4];

  v17[1] = a1;
  v1 = sub_1BC97FCC8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC9771BC(0, &qword_1ED6A13F8, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0, &qword_1ED6A1420);
  v6 = v5;
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v17 - v7;
  sub_1BC977590(0);
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_1BC97FC74();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  sub_1BC979034(0, &qword_1ED6A1310, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0);
  sub_1BC975BC4(v17[0], (uint64_t)&v8[*(int *)(v14 + 44)]);
  v15 = sub_1BC977624();
  sub_1BC97FDC4();
  sub_1BC97768C((uint64_t)v8);
  sub_1BC97FCBC();
  v17[2] = v6;
  v17[3] = v15;
  swift_getOpaqueTypeConformance2();
  sub_1BC97FDF4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1BC975BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
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
  unsigned __int8 v42;
  unsigned __int8 v43;
  char v44;
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
  unsigned __int8 v55;
  unsigned __int8 v56;
  char v57;
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
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;

  v87 = a2;
  sub_1BC977198(0);
  v4 = MEMORY[0x1E0C80A78](v3);
  v80 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v75 - v6;
  sub_1BC97709C();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC977080(0);
  v81 = v11;
  MEMORY[0x1E0C80A78](v11);
  v84 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC977008(0);
  v83 = v13;
  v14 = MEMORY[0x1E0C80A78](v13);
  v86 = (uint64_t)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v82 = (uint64_t)&v75 - v17;
  MEMORY[0x1E0C80A78](v16);
  v85 = (uint64_t)&v75 - v18;
  sub_1BC976E8C(0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC976E70(0);
  v77 = v22;
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC976E54(0);
  v78 = v25;
  v26 = MEMORY[0x1E0C80A78](v25);
  v28 = (char *)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  v76 = (char *)&v75 - v29;
  v79 = (_QWORD *)(a1 + *(int *)(type metadata accessor for ArticleTileView(0) + 24));
  sub_1BC976300((uint64_t)v79);
  sub_1BC97FA70();
  sub_1BC96178C(&qword_1ED6A12D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2AEC0], MEMORY[0x1E0D2AEA0]);
  sub_1BC97FBE4();
  swift_getKeyPath();
  sub_1BC97FBF0();
  swift_release();
  swift_release();
  v91 = v89;
  *(_QWORD *)&v92 = v90;
  sub_1BC96A31C(0, &qword_1ED6A1400, MEMORY[0x1E0DEF040], MEMORY[0x1E0CDFDB8]);
  MEMORY[0x1BCCF8C0C](&v88);
  swift_release();
  swift_release();
  sub_1BC9758E0();
  sub_1BC97FE6C();
  sub_1BC97FBC0();
  sub_1BC978F74((uint64_t)v21, (uint64_t)v24, (uint64_t (*)(_QWORD))sub_1BC976E8C);
  v30 = &v24[*(int *)(v77 + 36)];
  v31 = v92;
  *(_OWORD *)v30 = v91;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v93;
  v32 = (uint64_t)v21;
  v33 = (uint64_t)v28;
  sub_1BC966420(v32, (uint64_t (*)(_QWORD))sub_1BC976E8C);
  sub_1BC978F74((uint64_t)v24, (uint64_t)v28, (uint64_t (*)(_QWORD))sub_1BC976E70);
  *(_WORD *)&v28[*(int *)(v78 + 36)] = 0;
  v34 = (uint64_t)v24;
  v35 = (uint64_t)v76;
  sub_1BC966420(v34, (uint64_t (*)(_QWORD))sub_1BC976E70);
  sub_1BC9790A4((uint64_t)v28, v35, (uint64_t (*)(_QWORD))sub_1BC976E54);
  *(_QWORD *)v10 = sub_1BC97FC68();
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  sub_1BC978FB8();
  v37 = (uint64_t)&v10[*(int *)(v36 + 44)];
  *(_QWORD *)v7 = sub_1BC97FC74();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 0;
  sub_1BC979034(0, &qword_1ED6A1308, &qword_1ED6A1418, (uint64_t (*)(uint64_t))sub_1BC97724C);
  sub_1BC9764D4(v79, a1, (uint64_t)&v7[*(int *)(v38 + 44)]);
  v39 = v80;
  sub_1BC978F74((uint64_t)v7, v80, (uint64_t (*)(_QWORD))sub_1BC977198);
  sub_1BC978F74(v39, v37, (uint64_t (*)(_QWORD))sub_1BC977198);
  sub_1BC977134();
  v41 = v37 + *(int *)(v40 + 48);
  *(_QWORD *)v41 = 0;
  *(_BYTE *)(v41 + 8) = 1;
  sub_1BC966420((uint64_t)v7, (uint64_t (*)(_QWORD))sub_1BC977198);
  sub_1BC966420(v39, (uint64_t (*)(_QWORD))sub_1BC977198);
  v42 = sub_1BC97FD64();
  v43 = sub_1BC97FD70();
  v44 = sub_1BC97FD88();
  sub_1BC97FD88();
  if (sub_1BC97FD88() != v42)
    v44 = sub_1BC97FD88();
  sub_1BC97FD88();
  if (sub_1BC97FD88() != v43)
    v44 = sub_1BC97FD88();
  v45 = (uint64_t)v84;
  sub_1BC97FBA8();
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  sub_1BC978F74((uint64_t)v10, v45, (uint64_t (*)(_QWORD))sub_1BC97709C);
  v54 = v45 + *(int *)(v81 + 36);
  *(_BYTE *)v54 = v44;
  *(_QWORD *)(v54 + 8) = v47;
  *(_QWORD *)(v54 + 16) = v49;
  *(_QWORD *)(v54 + 24) = v51;
  *(_QWORD *)(v54 + 32) = v53;
  *(_BYTE *)(v54 + 40) = 0;
  sub_1BC966420((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1BC97709C);
  v55 = sub_1BC97FD7C();
  v56 = sub_1BC97FD94();
  v57 = sub_1BC97FD88();
  sub_1BC97FD88();
  if (sub_1BC97FD88() != v55)
    v57 = sub_1BC97FD88();
  sub_1BC97FD88();
  if (sub_1BC97FD88() != v56)
    v57 = sub_1BC97FD88();
  sub_1BC97FBA8();
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = v82;
  sub_1BC978F74(v45, v82, (uint64_t (*)(_QWORD))sub_1BC977080);
  v67 = v66 + *(int *)(v83 + 36);
  *(_BYTE *)v67 = v57;
  *(_QWORD *)(v67 + 8) = v59;
  *(_QWORD *)(v67 + 16) = v61;
  *(_QWORD *)(v67 + 24) = v63;
  *(_QWORD *)(v67 + 32) = v65;
  *(_BYTE *)(v67 + 40) = 0;
  sub_1BC966420(v45, (uint64_t (*)(_QWORD))sub_1BC977080);
  v68 = v85;
  sub_1BC9790A4(v66, v85, (uint64_t (*)(_QWORD))sub_1BC977008);
  sub_1BC978F74(v35, v33, (uint64_t (*)(_QWORD))sub_1BC976E54);
  v69 = v86;
  sub_1BC978F74(v68, v86, (uint64_t (*)(_QWORD))sub_1BC977008);
  v70 = v87;
  sub_1BC978F74(v33, v87, (uint64_t (*)(_QWORD))sub_1BC976E54);
  sub_1BC976DE0();
  v72 = v71;
  sub_1BC978F74(v69, v70 + *(int *)(v71 + 48), (uint64_t (*)(_QWORD))sub_1BC977008);
  v73 = v70 + *(int *)(v72 + 64);
  *(_QWORD *)v73 = 0;
  *(_BYTE *)(v73 + 8) = 1;
  sub_1BC966420(v68, (uint64_t (*)(_QWORD))sub_1BC977008);
  sub_1BC966420(v35, (uint64_t (*)(_QWORD))sub_1BC976E54);
  sub_1BC966420(v69, (uint64_t (*)(_QWORD))sub_1BC977008);
  return sub_1BC966420(v33, (uint64_t (*)(_QWORD))sub_1BC976E54);
}

uint64_t sub_1BC976300(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v16[5];
  __int16 v17;

  v3 = sub_1BC97FE24();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC976E8C(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(id *)(a1 + 32);
  sub_1BC97FE18();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CDF6F8], v3);
  v11 = sub_1BC97FE30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v16[3] = v11;
  v16[4] = 0;
  v17 = 257;
  v12 = v1 + *(int *)(type metadata accessor for ArticleTileView(0) + 24);
  v13 = (_QWORD *)(v12 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  v14 = v13[1];
  v16[1] = *v13;
  v16[2] = v14;
  swift_bridgeObjectRetain();
  sub_1BC97FF74();
  sub_1BC976F10();
  sub_1BC979148();
  sub_1BC97FE00();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BC97FC08();
  return sub_1BC966420((uint64_t)v9, (uint64_t (*)(_QWORD))sub_1BC976E8C);
}

uint64_t sub_1BC9764D4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t *v35;
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
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  _OWORD *v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  _QWORD *v70;
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
  __int128 v81;
  __int128 v82;
  __int128 v83;

  v76 = a3;
  sub_1BC97752C(0);
  v75 = v5;
  v6 = MEMORY[0x1E0C80A78](v5);
  v73 = (uint64_t)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v74 = (uint64_t)&v66 - v8;
  sub_1BC977364();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC977348(0);
  v77 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC9772D4(0);
  v71 = *(_QWORD *)(v15 - 8);
  v72 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC9772B8(0);
  v69 = v18;
  v19 = MEMORY[0x1E0C80A78](v18);
  v67 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v78 = (uint64_t)&v66 - v21;
  v70 = a1;
  v22 = *a1;
  v23 = a1[1];
  *(_QWORD *)&v81 = v22;
  *((_QWORD *)&v81 + 1) = v23;
  v68 = sub_1BC969450();
  swift_bridgeObjectRetain();
  v24 = sub_1BC97FDB8();
  v26 = v25;
  *(_QWORD *)&v81 = v24;
  *((_QWORD *)&v81 + 1) = v25;
  v28 = v27 & 1;
  LOBYTE(v82) = v27 & 1;
  *((_QWORD *)&v82 + 1) = v29;
  v30 = a2 + *(int *)(type metadata accessor for ArticleTileView(0) + 24);
  v31 = (uint64_t *)(v30 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  v32 = v31[1];
  v79 = *v31;
  v80 = v32;
  swift_bridgeObjectRetain();
  sub_1BC97FF74();
  sub_1BC97FE00();
  swift_bridgeObjectRelease();
  sub_1BC9790E8(v24, v26, v28);
  swift_bridgeObjectRelease();
  v33 = sub_1BC97FDAC();
  KeyPath = swift_getKeyPath();
  sub_1BC978F74((uint64_t)v11, (uint64_t)v14, (uint64_t (*)(_QWORD))sub_1BC977364);
  v35 = (uint64_t *)&v14[*(int *)(v77 + 36)];
  *v35 = KeyPath;
  v35[1] = v33;
  sub_1BC966420((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BC977364);
  sub_1BC97742C();
  sub_1BC97FE0C();
  sub_1BC966420((uint64_t)v14, (uint64_t (*)(_QWORD))sub_1BC977348);
  LOBYTE(v33) = sub_1BC97FD70();
  sub_1BC97FBA8();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v71;
  v44 = v72;
  v46 = (uint64_t)v67;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v67, v17, v72);
  v47 = v46 + *(int *)(v69 + 36);
  *(_BYTE *)v47 = v33;
  *(_QWORD *)(v47 + 8) = v37;
  *(_QWORD *)(v47 + 16) = v39;
  *(_QWORD *)(v47 + 24) = v41;
  *(_QWORD *)(v47 + 32) = v43;
  *(_BYTE *)(v47 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v17, v44);
  sub_1BC9790A4(v46, v78, (uint64_t (*)(_QWORD))sub_1BC9772B8);
  v48 = v70[3];
  *(_QWORD *)&v81 = v70[2];
  *((_QWORD *)&v81 + 1) = v48;
  swift_bridgeObjectRetain();
  v49 = sub_1BC97FDB8();
  v51 = v50;
  LOBYTE(v26) = v52 & 1;
  *(_QWORD *)&v81 = v49;
  *((_QWORD *)&v81 + 1) = v50;
  LOBYTE(v82) = v52 & 1;
  *((_QWORD *)&v82 + 1) = v53;
  v54 = v31[1];
  v79 = *v31;
  v80 = v54;
  swift_bridgeObjectRetain();
  sub_1BC97FF74();
  sub_1BC97FE00();
  swift_bridgeObjectRelease();
  sub_1BC9790E8(v49, v51, v26);
  swift_bridgeObjectRelease();
  v55 = sub_1BC97FDA0();
  v56 = swift_getKeyPath();
  sub_1BC978F74((uint64_t)v11, (uint64_t)v14, (uint64_t (*)(_QWORD))sub_1BC977364);
  v57 = (uint64_t *)&v14[*(int *)(v77 + 36)];
  *v57 = v56;
  v57[1] = v55;
  sub_1BC966420((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BC977364);
  sub_1BC97FE60();
  sub_1BC97FBC0();
  v58 = v73;
  sub_1BC978F74((uint64_t)v14, v73, (uint64_t (*)(_QWORD))sub_1BC977348);
  v59 = (_OWORD *)(v58 + *(int *)(v75 + 36));
  v60 = v82;
  *v59 = v81;
  v59[1] = v60;
  v59[2] = v83;
  sub_1BC966420((uint64_t)v14, (uint64_t (*)(_QWORD))sub_1BC977348);
  v61 = v74;
  sub_1BC9790A4(v58, v74, (uint64_t (*)(_QWORD))sub_1BC97752C);
  v62 = v78;
  sub_1BC978F74(v78, v46, (uint64_t (*)(_QWORD))sub_1BC9772B8);
  sub_1BC978F74(v61, v58, (uint64_t (*)(_QWORD))sub_1BC97752C);
  v63 = v76;
  sub_1BC978F74(v46, v76, (uint64_t (*)(_QWORD))sub_1BC9772B8);
  sub_1BC97724C();
  sub_1BC978F74(v58, v63 + *(int *)(v64 + 48), (uint64_t (*)(_QWORD))sub_1BC97752C);
  sub_1BC966420(v61, (uint64_t (*)(_QWORD))sub_1BC97752C);
  sub_1BC966420(v62, (uint64_t (*)(_QWORD))sub_1BC9772B8);
  sub_1BC966420(v58, (uint64_t (*)(_QWORD))sub_1BC97752C);
  return sub_1BC966420(v46, (uint64_t (*)(_QWORD))sub_1BC9772B8);
}

uint64_t sub_1BC976A8C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17[4];

  v17[1] = a1;
  v1 = sub_1BC97FCC8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC9771BC(0, &qword_1ED6A13F8, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0, &qword_1ED6A1420);
  v6 = v5;
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v17 - v7;
  sub_1BC977590(0);
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_1BC97FC74();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  sub_1BC979034(0, &qword_1ED6A1310, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0);
  sub_1BC975BC4(v17[0], (uint64_t)&v8[*(int *)(v14 + 44)]);
  v15 = sub_1BC977624();
  sub_1BC97FDC4();
  sub_1BC97768C((uint64_t)v8);
  sub_1BC97FCBC();
  v17[2] = v6;
  v17[3] = v15;
  swift_getOpaqueTypeConformance2();
  sub_1BC97FDF4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1BC976C4C()
{
  return sub_1BC97FC38();
}

uint64_t sub_1BC976C6C()
{
  return sub_1BC97FC38();
}

uint64_t sub_1BC976C8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  sub_1BC9701AC(0);
  MEMORY[0x1E0C80A78](v2);
  sub_1BC978F74(a1, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  return sub_1BC97FC44();
}

uint64_t type metadata accessor for ArticleTileView(uint64_t a1)
{
  return sub_1BC965804(a1, (uint64_t *)&unk_1ED6A12C8);
}

uint64_t sub_1BC976D20()
{
  return sub_1BC97FC20();
}

uint64_t sub_1BC976D40()
{
  return sub_1BC97FC20();
}

uint64_t sub_1BC976D60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1BC97FBFC();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1BC97FC2C();
}

void sub_1BC976DE0()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_1ED6A1388)
  {
    sub_1BC976E54(255);
    sub_1BC977008(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1ED6A1388);
  }
}

void sub_1BC976E54(uint64_t a1)
{
  sub_1BC976EA8(a1, &qword_1ED6A1380, sub_1BC976E70, (void (*)(uint64_t))sub_1BC976F6C);
}

void sub_1BC976E70(uint64_t a1)
{
  sub_1BC977024(a1, &qword_1ED6A1378, sub_1BC976E8C);
}

void sub_1BC976E8C(uint64_t a1)
{
  sub_1BC976EA8(a1, &qword_1ED6A1360, (void (*)(uint64_t))sub_1BC976F10, (void (*)(uint64_t))MEMORY[0x1E0CDCFD0]);
}

void sub_1BC976EA8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a3(255);
    a4(255);
    v6 = sub_1BC97FC14();
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_1BC976F10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A1340)
  {
    v0 = sub_1BC97FC14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A1340);
  }
}

void sub_1BC976F6C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A12F8)
  {
    sub_1BC976FC4();
    v0 = sub_1BC97FBB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A12F8);
  }
}

unint64_t sub_1BC976FC4()
{
  unint64_t result;

  result = qword_1ED6A1408;
  if (!qword_1ED6A1408)
  {
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CE0560], MEMORY[0x1E0CE0580]);
    atomic_store(result, (unint64_t *)&qword_1ED6A1408);
  }
  return result;
}

void sub_1BC977008(uint64_t a1)
{
  sub_1BC977024(a1, &qword_1ED6A1368, sub_1BC977080);
}

void sub_1BC977024(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1BC97FC14();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1BC977080(uint64_t a1)
{
  sub_1BC977024(a1, &qword_1ED6A1348, (void (*)(uint64_t))sub_1BC97709C);
}

void sub_1BC97709C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A13D8)
  {
    sub_1BC963498(255, &qword_1ED6A1438, (uint64_t (*)(uint64_t))sub_1BC977134, MEMORY[0x1E0CE0648]);
    sub_1BC977548(&qword_1ED6A1430, &qword_1ED6A1438, (uint64_t (*)(uint64_t))sub_1BC977134);
    v0 = sub_1BC97FE3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A13D8);
  }
}

void sub_1BC977134()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED6A13E8)
  {
    sub_1BC977198(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6A13E8);
  }
}

void sub_1BC977198(uint64_t a1)
{
  sub_1BC9771BC(a1, &qword_1ED6A13E0, &qword_1ED6A1418, (uint64_t (*)(uint64_t))sub_1BC97724C, &qword_1ED6A1410);
}

void sub_1BC9771BC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1BC963498(255, a3, a4, MEMORY[0x1E0CE0648]);
    sub_1BC977548(a5, a3, a4);
    v9 = sub_1BC97FE48();
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_1BC97724C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED6A1330)
  {
    sub_1BC9772B8(255);
    sub_1BC97752C(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6A1330);
  }
}

void sub_1BC9772B8(uint64_t a1)
{
  sub_1BC977024(a1, &qword_1ED6A1328, sub_1BC9772D4);
}

void sub_1BC9772D4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_1ED6A13D0)
  {
    sub_1BC977348(255);
    v5[0] = v2;
    v5[1] = sub_1BC97742C();
    v3 = MEMORY[0x1BCCF956C](a1, v5, MEMORY[0x1E0CDEE40], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1ED6A13D0);
  }
}

void sub_1BC977348(uint64_t a1)
{
  sub_1BC976EA8(a1, &qword_1ED6A1358, (void (*)(uint64_t))sub_1BC977364, (void (*)(uint64_t))sub_1BC9773C0);
}

void sub_1BC977364()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A1320)
  {
    sub_1BC97FD4C();
    v0 = sub_1BC97FC14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A1320);
  }
}

void sub_1BC9773C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A13B8)
  {
    sub_1BC96A31C(255, &qword_1ED6A13C0, MEMORY[0x1E0CDD840], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
    v0 = sub_1BC97FD40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A13B8);
  }
}

unint64_t sub_1BC97742C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED6A1350;
  if (!qword_1ED6A1350)
  {
    sub_1BC977348(255);
    v2 = v1;
    v3[0] = sub_1BC9774AC();
    v3[1] = sub_1BC96178C(&qword_1ED6A13B0, (uint64_t (*)(uint64_t))sub_1BC9773C0, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CD9C20], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1ED6A1350);
  }
  return result;
}

unint64_t sub_1BC9774AC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED6A1318;
  if (!qword_1ED6A1318)
  {
    sub_1BC977364();
    v2 = v1;
    v3 = sub_1BC96178C(&qword_1EF4762F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDCFD0], MEMORY[0x1E0CDCFB8]);
    v4[0] = MEMORY[0x1E0CDDD58];
    v4[1] = v3;
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CD9C20], v2, v4);
    atomic_store(result, (unint64_t *)&qword_1ED6A1318);
  }
  return result;
}

void sub_1BC97752C(uint64_t a1)
{
  sub_1BC977024(a1, &qword_1ED6A1370, sub_1BC977348);
}

uint64_t sub_1BC977548(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1BC963498(255, a2, a3, MEMORY[0x1E0CE0648]);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CE0680], v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BC977590(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_1ED6A13C8)
  {
    sub_1BC9771BC(255, &qword_1ED6A13F8, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0, &qword_1ED6A1420);
    v5[0] = v2;
    v5[1] = sub_1BC977624();
    v3 = MEMORY[0x1BCCF956C](a1, v5, MEMORY[0x1E0D2BAD8], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1ED6A13C8);
  }
}

unint64_t sub_1BC977624()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A13F0;
  if (!qword_1ED6A13F0)
  {
    sub_1BC9771BC(255, &qword_1ED6A13F8, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0, &qword_1ED6A1420);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CDFCC0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A13F0);
  }
  return result;
}

uint64_t sub_1BC97768C(uint64_t a1)
{
  uint64_t v2;

  sub_1BC9771BC(0, &qword_1ED6A13F8, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0, &qword_1ED6A1420);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BC9776E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ArticleTileView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  id v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v36;
  uint64_t *v37;
  uint64_t v38;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_1BC97FCB0();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        sub_1BC9701AC(0);
        memcpy(v4, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = *(int *)(a3 + 20);
    v12 = (uint64_t *)((char *)v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    sub_1BC963498(0, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87D0]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_1BC97FBFC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v15 = *(int *)(a3 + 24);
    v16 = (uint64_t *)((char *)v4 + v15);
    v37 = a2;
    v38 = a3;
    v17 = (char *)a2 + v15;
    v18 = *(uint64_t *)((char *)a2 + v15 + 8);
    *v16 = *(uint64_t *)((char *)a2 + v15);
    v16[1] = v18;
    v19 = *(uint64_t *)((char *)a2 + v15 + 24);
    v16[2] = *(uint64_t *)((char *)a2 + v15 + 16);
    v16[3] = v19;
    v20 = *(void **)((char *)a2 + v15 + 32);
    v16[4] = v20;
    v21 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
    v22 = v21[7];
    v36 = (char *)v16 + v22;
    v23 = &v17[v22];
    v24 = sub_1BC97FA34();
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26 = v20;
    v25(v36, v23, v24);
    *(_QWORD *)((char *)v16 + v21[8]) = *(_QWORD *)&v17[v21[8]];
    v27 = v21[9];
    v28 = (_QWORD *)((char *)v16 + v27);
    v29 = &v17[v27];
    v30 = *((_QWORD *)v29 + 1);
    *v28 = *(_QWORD *)v29;
    v28[1] = v30;
    v31 = *(int *)(v38 + 28);
    v32 = (uint64_t *)((char *)v4 + v31);
    v33 = (uint64_t *)((char *)v37 + v31);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for ArticleTileView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_1BC97FCB0();
    v5 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + *(int *)(a2 + 20);
  sub_1BC963498(0, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87D0]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_1BC97FBFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  v8 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v9 = v8 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 28);
  v10 = sub_1BC97FA34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for ArticleTileView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  id v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1BC97FCB0();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      sub_1BC9701AC(0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v9 = *(int *)(a3 + 20);
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  sub_1BC963498(0, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87D0]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_1BC97FBFC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    *v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v13 = *(int *)(a3 + 24);
  v14 = (_QWORD *)((char *)a1 + v13);
  v36 = a2;
  v37 = a3;
  v15 = (char *)a2 + v13;
  v16 = *(_QWORD *)((char *)a2 + v13 + 8);
  *v14 = *(_QWORD *)((char *)a2 + v13);
  v14[1] = v16;
  v17 = *(_QWORD *)((char *)a2 + v13 + 24);
  v14[2] = *(_QWORD *)((char *)a2 + v13 + 16);
  v14[3] = v17;
  v18 = *(void **)((char *)a2 + v13 + 32);
  v14[4] = v18;
  v19 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  v20 = v19[7];
  v21 = (char *)v14 + v20;
  v22 = &v15[v20];
  v23 = sub_1BC97FA34();
  v35 = a1;
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25 = v18;
  v24(v21, v22, v23);
  *(_QWORD *)((char *)v14 + v19[8]) = *(_QWORD *)&v15[v19[8]];
  v26 = v19[9];
  v27 = (_QWORD *)((char *)v14 + v26);
  v28 = &v15[v26];
  v29 = *((_QWORD *)v28 + 1);
  *v27 = *(_QWORD *)v28;
  v27[1] = v29;
  v30 = *(int *)(v37 + 28);
  v31 = (_QWORD *)((char *)v35 + v30);
  v32 = (_QWORD *)((char *)v36 + v30);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return v35;
}

_QWORD *assignWithCopy for ArticleTileView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  if (a1 != a2)
  {
    sub_1BC978094((uint64_t)a1, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC);
    sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_1BC97FCB0();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        sub_1BC9701AC(0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958];
    sub_1BC978094((uint64_t)a1 + v9, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958]);
    sub_1BC963498(0, &qword_1ED6A12E8, v12, MEMORY[0x1E0CD87D0]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_1BC97FBFC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = a3[6];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *(_QWORD *)((char *)a2 + v14);
  v15[1] = *(_QWORD *)((char *)a2 + v14 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15[2] = v16[2];
  v15[3] = v16[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = (void *)v16[4];
  v18 = (void *)v15[4];
  v15[4] = v17;
  v19 = v17;

  v20 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  v21 = v20[7];
  v22 = (char *)v15 + v21;
  v23 = (char *)v16 + v21;
  v24 = sub_1BC97FA34();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  *(_QWORD *)((char *)v15 + v20[8]) = *(_QWORD *)((char *)v16 + v20[8]);
  swift_retain();
  swift_release();
  v25 = v20[9];
  v26 = (_QWORD *)((char *)v15 + v25);
  v27 = (_QWORD *)((char *)v16 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = a3[7];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BC978094(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1BC963498(0, a2, a3, MEMORY[0x1E0CD87D0]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *initializeWithTake for ArticleTileView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  int *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_1BC97FCB0();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      sub_1BC9701AC(0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  sub_1BC963498(0, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87D0]);
  v15 = v14;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_1BC97FBFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v12, v13, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  v17 = a3[6];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(_OWORD *)&a2[v17 + 16];
  *(_OWORD *)v18 = *(_OWORD *)&a2[v17];
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v18 + 4) = *(_QWORD *)&a2[v17 + 32];
  v21 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  v22 = v21[7];
  v23 = &v18[v22];
  v24 = &v19[v22];
  v25 = sub_1BC97FA34();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
  *(_QWORD *)&v18[v21[8]] = *(_QWORD *)&v19[v21[8]];
  *(_OWORD *)&v18[v21[9]] = *(_OWORD *)&v19[v21[9]];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *assignWithTake for ArticleTileView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;

  if (a1 != a2)
  {
    sub_1BC978094((uint64_t)a1, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC);
    sub_1BC963498(0, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
    v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_1BC97FCB0();
      v9 = *(_QWORD *)(v8 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        sub_1BC9701AC(0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(a1, a2, v8);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    v11 = a3[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958];
    sub_1BC978094((uint64_t)&a1[v11], &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958]);
    sub_1BC963498(0, &qword_1ED6A12E8, v14, MEMORY[0x1E0CD87D0]);
    v16 = v15;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_1BC97FBFC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v12, v13, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  v18 = a3[6];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = *(_QWORD *)&a2[v18 + 8];
  *(_QWORD *)v19 = *(_QWORD *)&a2[v18];
  *((_QWORD *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  v22 = *((_QWORD *)v20 + 3);
  *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
  *((_QWORD *)v19 + 3) = v22;
  swift_bridgeObjectRelease();
  v23 = (void *)*((_QWORD *)v19 + 4);
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);

  v24 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  v25 = v24[7];
  v26 = &v19[v25];
  v27 = &v20[v25];
  v28 = sub_1BC97FA34();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  *(_QWORD *)&v19[v24[8]] = *(_QWORD *)&v20[v24[8]];
  swift_release();
  v29 = v24[9];
  v30 = &v19[v29];
  v31 = &v20[v29];
  v33 = *(_QWORD *)v31;
  v32 = *((_QWORD *)v31 + 1);
  *(_QWORD *)v30 = v33;
  *((_QWORD *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  v34 = a3[7];
  v35 = &a1[v34];
  v36 = &a2[v34];
  v38 = *(_QWORD *)v36;
  v37 = *((_QWORD *)v36 + 1);
  *(_QWORD *)v35 = v38;
  *((_QWORD *)v35 + 1) = v37;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleTileView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC978594(uint64_t a1, uint64_t a2, int *a3)
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
  unint64_t v16;

  sub_1BC963498(0, &qword_1EF4762F8, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87E8]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  sub_1BC963498(0, &qword_1EF476300, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87E8]);
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
  v14 = type metadata accessor for ArticleTileView.ViewModel(0);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticleTileView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC9786A0(uint64_t a1, uint64_t a2, int a3, int *a4)
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

  sub_1BC963498(0, &qword_1EF4762F8, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87E8]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  sub_1BC963498(0, &qword_1EF476300, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87E8]);
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
  result = type metadata accessor for ArticleTileView.ViewModel(0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[7] + 8) = (a2 - 1);
  return result;
}

void sub_1BC97879C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1BC963498(319, &qword_1ED6A12F0, (uint64_t (*)(uint64_t))sub_1BC9701AC, MEMORY[0x1E0CD87D0]);
  if (v0 <= 0x3F)
  {
    sub_1BC963498(319, &qword_1ED6A12E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958], MEMORY[0x1E0CD87D0]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for ArticleTileView.ViewModel(319);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ArticleTileView.ViewModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (void *)a2[4];
    v10 = a3[7];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    a1[4] = (uint64_t)v9;
    v13 = sub_1BC97FA34();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = v9;
    v14(v11, v12, v13);
    v16 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ArticleTileView.ViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_1BC97FA34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ArticleTileView.ViewModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = (void *)a2[4];
  a1[4] = v8;
  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1BC97FA34();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = v8;
  v13(v10, v11, v12);
  v15 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ArticleTileView.ViewModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[4];
  v7 = (void *)a1[4];
  a1[4] = v6;
  v8 = v6;

  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1BC97FA34();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  v13 = a3[9];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ArticleTileView.ViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1BC97FA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

_QWORD *assignWithTake for ArticleTileView.ViewModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = (void *)a1[4];
  a1[4] = a2[4];

  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1BC97FA34();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_release();
  v13 = a3[9];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleTileView.ViewModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC978D0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_1BC97FA34();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ArticleTileView.ViewModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC978D94(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1BC97FA34();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1BC978E08()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC97FA34();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BC978E9C()
{
  sub_1BC977590(255);
  sub_1BC9771BC(255, &qword_1ED6A13F8, &qword_1ED6A1428, (uint64_t (*)(uint64_t))sub_1BC976DE0, &qword_1ED6A1420);
  sub_1BC977624();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1BC978F28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1BC97FA58();
  *a1 = v3;
  return result;
}

uint64_t sub_1BC978F50()
{
  return sub_1BC97FA64();
}

uint64_t sub_1BC978F74(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1BC978FB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A1300)
  {
    sub_1BC963498(255, &qword_1ED6A1438, (uint64_t (*)(uint64_t))sub_1BC977134, MEMORY[0x1E0CE0648]);
    v0 = sub_1BC97FBCC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A1300);
  }
}

void sub_1BC979034(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_1BC963498(255, a3, a4, MEMORY[0x1E0CE0648]);
    v5 = sub_1BC97FBCC();
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_1BC9790A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BC9790E8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_1BC9790F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1BC97FC50();
  *a1 = result;
  return result;
}

uint64_t sub_1BC979120()
{
  swift_retain();
  return sub_1BC97FC5C();
}

unint64_t sub_1BC979148()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1ED6A1338;
  if (!qword_1ED6A1338)
  {
    sub_1BC976F10();
    v2[0] = MEMORY[0x1E0CDF820];
    v2[1] = MEMORY[0x1E0CDB158];
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1ED6A1338);
  }
  return result;
}

uint64_t PluginArticleTileDataController.makeArticleComponents(articleIdentifier:viewContext:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28[3];
  uint64_t v29;
  uint64_t v30;

  v10 = sub_1BC97FB6C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(__int128 *__return_ptr, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(&v26, a1, a2, a3, a4, a5);
  if (v27)
  {
    sub_1BC96F968(&v26, v28);
    v14 = v29;
    v15 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  else
  {
    sub_1BC979438((uint64_t)&v26);
    sub_1BC97FB3C();
    swift_bridgeObjectRetain_n();
    v17 = sub_1BC97FB60();
    v18 = sub_1BC980094();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      *(_QWORD *)&v26 = a4;
      v28[0] = v25;
      *(_DWORD *)v19 = 136446466;
      v24 = v19 + 4;
      swift_getMetatypeMetadata();
      v20 = sub_1BC97FF2C();
      *(_QWORD *)&v26 = sub_1BC9741D8(v20, v21, v28);
      sub_1BC98019C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v26 = sub_1BC9741D8(a1, a2, v28);
      sub_1BC98019C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BC95E000, v17, v18, "[%{public}s] Unable to find data provider for article with identifier %s.", (uint8_t *)v19, 0x16u);
      v22 = v25;
      swift_arrayDestroy();
      MEMORY[0x1BCCF9674](v22, -1, -1);
      MEMORY[0x1BCCF9674](v19, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return 0;
  }
  return v16;
}

uint64_t sub_1BC979438(uint64_t a1)
{
  uint64_t v2;

  sub_1BC963498(0, &qword_1EF4761D8, (uint64_t (*)(uint64_t))sub_1BC96F8A8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BC979494(_QWORD *a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  sub_1BC963498(0, &qword_1EF476308, (uint64_t (*)(uint64_t))sub_1BC979610, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BC980D10;
  *(_QWORD *)(inited + 32) = 0xD000000000000015;
  *(_QWORD *)(inited + 40) = 0x80000001BC982BE0;
  v3 = a1[3];
  v4 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  *(_QWORD *)(inited + 48) = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  *(_QWORD *)(inited + 56) = v5;
  v6 = sub_1BC973D14(inited);
  if (qword_1ED6A1650 != -1)
    swift_once();
  v7 = (id)qword_1ED6A1648;
  sub_1BC9732C4(v6);
  swift_bridgeObjectRelease();
  v8 = objc_allocWithZone((Class)sub_1BC97FA1C());
  v9 = (void *)sub_1BC97FA10();
  sub_1BC979670();
  v10 = (void *)sub_1BC9800B8();
  objc_msgSend(v10, sel_addOperation_, v9);

}

uint64_t dispatch thunk of PluginArticleTileDataController.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PluginArticleTileDataController.makeArticleDataProvider(articleIdentifier:viewContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of PluginArticleTileDataController.makeArticleComponents(articleIdentifier:viewContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of PluginArticleTileDataController.notifyPluginThatUserStartedReadingArticle(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void sub_1BC979610()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF476310)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF476310);
  }
}

unint64_t sub_1BC979670()
{
  unint64_t result;

  result = qword_1EF476318;
  if (!qword_1EF476318)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF476318);
  }
  return result;
}

id sub_1BC9796AC()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v1 = (void *)objc_opt_self();
  v2 = v0;
  v3 = objc_msgSend(v1, sel_systemBlueColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v3);

  v4 = objc_msgSend(v2, sel_titleLabel);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setAdjustsFontForContentSizeCategory_, 1);

  }
  v6 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v6, sel_setCornerRadius_, 14.0);

  v7 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v7, sel_setMasksToBounds_, 1);

  return v2;
}

char *sub_1BC9797EC(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  objc_super v21;

  v9 = OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button;
  v10 = v4;
  *(_QWORD *)&v4[v9] = sub_1BC9796AC();
  v11 = &v10[OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;

  v21.receiver = v10;
  v21.super_class = (Class)type metadata accessor for ButtonView();
  v12 = (char *)objc_msgSendSuper2(&v21, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_setPreservesSuperviewLayoutMargins_, 1);
  v13 = OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button;
  v14 = *(void **)&v12[OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button];
  objc_msgSend(v12, sel_addSubview_, v14);
  v15 = (void *)objc_opt_self();
  v16 = v12;
  v17 = v14;
  sub_1BC9705FC(v17, v16, 0x4049000000000000, 0);

  sub_1BC961A94();
  v18 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_activateConstraints_, v18);

  v19 = *(id *)&v12[v13];
  objc_msgSend(v19, sel_addTarget_action_forControlEvents_, v16, sel_performActionWithSender_, 64);

  return v16;
}

id sub_1BC979AA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ButtonView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ButtonView()
{
  return objc_opt_self();
}

uint64_t sub_1BC979B34(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t ArticleTapAnalyticsEvent.init(article:articleLocation:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _OWORD v18[2];

  v6 = sub_1BC97FA34();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v11 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 48))(v10, v11);
  v13 = sub_1BC97A1D4(v12);
  swift_bridgeObjectRelease();
  v14 = a1[3];
  v15 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  ArticleTapAnalyticsEvent.init(didTapArticle:associatedHKTypes:articleTitle:articleLocation:)(1, v13, (uint64_t)v9, v18);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  v16 = v18[1];
  *a3 = v18[0];
  a3[1] = v16;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t static ArticleTapAnalyticsEvent.eventName.getter()
{
  return 0xD000000000000026;
}

id ArticleTapAnalyticsEvent.articleDidClick.getter()
{
  id *v0;

  return *v0;
}

uint64_t ArticleTapAnalyticsEvent.articleHKDataTypes.getter()
{
  return swift_bridgeObjectRetain();
}

id ArticleTapAnalyticsEvent.articleTitle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

id ArticleTapAnalyticsEvent.articleLocation.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

HealthArticlesUI::ArticleTapAnalyticsEvent __swiftcall ArticleTapAnalyticsEvent.init(articleDidClick:articleHKDataTypes:articleTitle:articleLocation:)(NSNumber articleDidClick, Swift::OpaquePointer articleHKDataTypes, NSString articleTitle, NSString articleLocation)
{
  uint64_t v4;
  HealthArticlesUI::ArticleTapAnalyticsEvent result;

  *(NSNumber *)v4 = articleDidClick;
  *(Swift::OpaquePointer *)(v4 + 8) = articleHKDataTypes;
  *(_QWORD *)(v4 + 16) = articleTitle;
  *(_QWORD *)(v4 + 24) = articleLocation;
  result.articleLocation = articleLocation;
  result.articleTitle = articleTitle;
  result.articleHKDataTypes = articleHKDataTypes;
  result.articleDidClick = articleDidClick;
  return result;
}

id ArticleTapAnalyticsEvent.init(didTapArticle:associatedHKTypes:articleTitle:articleLocation:)@<X0>(char a1@<W0>, unint64_t a2@<X1>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  id result;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  LOBYTE(v6) = a1;
  if (a2 >> 62)
    goto LABEL_13;
  v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v8)
  {
    while (1)
    {
      v19 = MEMORY[0x1E0DEE9D8];
      result = (id)sub_1BC98025C();
      if (v8 < 0)
        break;
      v17 = v6;
      v18 = a3;
      a3 = 0;
      while (v8 != a3)
      {
        if ((a2 & 0xC000000000000001) != 0)
          v10 = (id)MEMORY[0x1BCCF8FE4](a3, a2);
        else
          v10 = *(id *)(a2 + 8 * a3 + 32);
        v11 = v10;
        result = objc_msgSend(v10, sel_identifier);
        if (!result)
          goto LABEL_17;
        ++a3;

        sub_1BC980244();
        v6 = *(_QWORD *)(v19 + 16);
        sub_1BC980268();
        sub_1BC980274();
        sub_1BC980250();
        if (v8 == a3)
        {
          v12 = v19;
          swift_bridgeObjectRelease();
          a3 = v18;
          LOBYTE(v6) = v17;
          goto LABEL_15;
        }
      }
      __break(1u);
LABEL_13:
      v8 = sub_1BC980298();
      if (!v8)
        goto LABEL_14;
    }
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x1E0DEE9D8];
LABEL_15:
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, v6 & 1);
    v14 = sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    sub_1BC97A2C8();
    sub_1BC97F9F8();
    v15 = sub_1BC97FEFC();
    swift_bridgeObjectRelease();
    v16 = sub_1BC97FA34();
    result = (id)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a3, v16);
    *a4 = v13;
    a4[1] = v12;
    a4[2] = v14;
    a4[3] = v15;
  }
  return result;
}

unint64_t sub_1BC979ED0()
{
  return 0xD000000000000026;
}

_QWORD *sub_1BC979EEC(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_1BC9801E4();
    sub_1BC97A58C();
    sub_1BC97A5C8();
    result = (_QWORD *)sub_1BC98007C();
    v4 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
    v11 = v31;
    v24 = v7;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
LABEL_46:
    *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (_QWORD *)v12;
  }
  v10 = 0;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 56;
  v9 = ~v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v11 = v22 & *(_QWORD *)(a4 + 56);
  v24 = result;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0)
    goto LABEL_48;
  v12 = 0;
  v25 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_1BC9801FC())
        goto LABEL_45;
      sub_1BC97A58C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_45;
      goto LABEL_8;
    }
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v16 >= v25)
    {
      v11 = 0;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    if (v17)
      goto LABEL_23;
    v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25)
        goto LABEL_42;
      v17 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        v16 = v10 + 3;
        goto LABEL_23;
      }
      v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          v11 = 0;
          v10 = v18;
          goto LABEL_45;
        }
        v17 = *(_QWORD *)(v8 + 8 * v16);
        if (!v17)
        {
          v19 = v10 + 6;
          while (v25 != v19)
          {
            v17 = *(_QWORD *)(v8 + 8 * v19++);
            if (v17)
            {
              v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          v11 = 0;
          v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    v16 = v18;
LABEL_23:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
LABEL_7:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_45;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      v12 = a3;
LABEL_45:
      v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1BC97A1D4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_1BC9801F0();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x1E0DEE9D8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    sub_1BC96D3CC();
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_1BC979EEC(&v8, v3 + 4, v2, a1);
  result = sub_1BC974B2C();
  if (v6 == (_QWORD *)v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

unint64_t sub_1BC97A2C8()
{
  unint64_t result;

  result = qword_1EF476358;
  if (!qword_1EF476358)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleTapAnalyticsEvent, &type metadata for ArticleTapAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1EF476358);
  }
  return result;
}

unint64_t sub_1BC97A310()
{
  unint64_t result;

  result = qword_1EF476360;
  if (!qword_1EF476360)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleTapAnalyticsEvent, &type metadata for ArticleTapAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1EF476360);
  }
  return result;
}

unint64_t sub_1BC97A358()
{
  unint64_t result;

  result = qword_1EF476368;
  if (!qword_1EF476368)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for ArticleTapAnalyticsEvent, &type metadata for ArticleTapAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1EF476368);
  }
  return result;
}

void destroy for ArticleTapAnalyticsEvent(id *a1)
{

  swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ArticleTapAnalyticsEvent(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  v7 = v3;
  swift_bridgeObjectRetain();
  v8 = v5;
  v9 = v6;
  return a1;
}

uint64_t assignWithCopy for ArticleTapAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a2 + 16);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 24);
  v11 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10;
  v12 = v10;

  return a1;
}

uint64_t assignWithTake for ArticleTapAnalyticsEvent(uint64_t a1, _OWORD *a2)
{
  void *v4;

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();

  v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleTapAnalyticsEvent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleTapAnalyticsEvent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ArticleTapAnalyticsEvent()
{
  return &type metadata for ArticleTapAnalyticsEvent;
}

unint64_t sub_1BC97A58C()
{
  unint64_t result;

  result = qword_1EF476370;
  if (!qword_1EF476370)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF476370);
  }
  return result;
}

unint64_t sub_1BC97A5C8()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1EF476378;
  if (!qword_1EF476378)
  {
    v1 = sub_1BC97A58C();
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF476378);
  }
  return result;
}

void sub_1BC97A6BC(void *a1, char a2)
{
  char *v2;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = *(void **)&v2[OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView];
  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView] = a1;
  v5 = a1;

  objc_msgSend(v2, sel_setPreservesSuperviewLayoutMargins_, 1);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_addSubview_, v5);
  v6 = (void *)objc_opt_self();
  v7 = OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_currentConstraints;
  sub_1BC961A94();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_deactivateConstraints_, v8);

  if ((a2 & 1) != 0)
    v9 = sub_1BC970918(v5, v2, 0, 1);
  else
    v9 = sub_1BC970C04(v5, v2, 0, 1);
  *(_QWORD *)&v2[v7] = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v10 = (id)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_activateConstraints_, v10);

}

id sub_1BC97A814()
{
  return sub_1BC968390(type metadata accessor for CustomContentView);
}

uint64_t type metadata accessor for CustomContentView()
{
  return objc_opt_self();
}

void sub_1BC97A930(char *a1, uint64_t a2, void *a3, _QWORD *a4, _QWORD *a5, uint64_t a6)
{
  id v7;

  *(_QWORD *)&a1[*a4] = 0;
  *(_QWORD *)&a1[*a5] = a6;
  v7 = a3;

  sub_1BC98028C();
  __break(1u);
}

void sub_1BC97A9A8(void *a1)
{
  char *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = *(void **)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController] = a1;
  v3 = a1;

  v4 = objc_msgSend(v3, sel_view);
  if (v4)
  {
    v5 = *(void **)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView];
    *(_QWORD *)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView] = v4;
    v6 = v4;

    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v1, sel_addSubview_, v6);
    v7 = (void *)objc_opt_self();
    sub_1BC970918(v6, v1, 0, 1);
    sub_1BC961A94();
    v8 = (id)sub_1BC97FFBC();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_activateConstraints_, v8);

  }
}

id sub_1BC97AAC4()
{
  return sub_1BC968390(type metadata accessor for CustomContentViewControllerView);
}

uint64_t type metadata accessor for CustomContentViewControllerView()
{
  return objc_opt_self();
}

uint64_t sub_1BC97AB2C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t VideoViewOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

HealthArticlesUI::VideoViewOptions __swiftcall VideoViewOptions.init(rawValue:)(HealthArticlesUI::VideoViewOptions rawValue)
{
  HealthArticlesUI::VideoViewOptions *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static VideoViewOptions.noControls.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static VideoViewOptions.noLooping.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static VideoViewOptions.noAutoplay.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1BC97ABB4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1BC97AB2C(a1, a2);
}

uint64_t sub_1BC97AC40()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BC97AD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC97AD68(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BC97ADD0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1BC97AE14()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel);
  }
  else
  {
    v4 = sub_1BC97AE70();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1BC97AE70()
{
  id v0;
  id v1;
  id v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  v1 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4A98]);
  objc_msgSend(v0, sel_setFont_, v1);

  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  v2 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  objc_msgSend(v0, sel_setTextColor_, v2);

  return v0;
}

id sub_1BC97AF74(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  char *v9;
  char *v10;
  _QWORD *v11;
  id v12;
  objc_super v14;

  v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v10 = &v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper] = 0;
  v11 = &v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription];
  *v11 = 0;
  v11[1] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel] = 0;
  v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible] = 1;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for VideoView();
  v12 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_setPreservesSuperviewLayoutMargins_, 1);
  return v12;
}

uint64_t sub_1BC97B0B4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  void *v41;
  id v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  _QWORD aBlock[7];

  v60 = a4;
  v57 = a8;
  v55 = a5;
  v56 = a7;
  v59 = a6;
  v54 = a3;
  v58 = sub_1BC97FE78();
  v66 = *(_QWORD *)(v58 - 8);
  MEMORY[0x1E0C80A78](v58);
  v65 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BC97FE90();
  v63 = *(_QWORD *)(v11 - 8);
  v64 = v11;
  MEMORY[0x1E0C80A78](v11);
  v62 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1BC97FEA8();
  v13 = *(_QWORD *)(v68 - 8);
  v14 = MEMORY[0x1E0C80A78](v68);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v67 = (char *)&v48 - v17;
  sub_1BC963498(0, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v48 - v19;
  v21 = sub_1BC97F98C();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  v24 = MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v48 - v26;
  v28 = *a2;
  sub_1BC97B564(a1, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
    return sub_1BC969494((uint64_t)v20, (uint64_t)&qword_1EF475F00, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC963498);
  v49 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v50 = v28;
  v52 = v27;
  v49(v27, v20, v21);
  sub_1BC96A1C0(0, &qword_1EF4763D0);
  v51 = sub_1BC9800DC();
  sub_1BC97FE9C();
  MEMORY[0x1BCCF8C6C](v16, 0.1);
  v53 = *(void (**)(char *, uint64_t))(v13 + 8);
  v53(v16, v68);
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v25, v27, v21);
  v30 = (*(unsigned __int8 *)(v22 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v31 = (v23 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  v33 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  v34 = swift_allocObject();
  v35 = v61;
  *(_QWORD *)(v34 + 16) = v61;
  v49((char *)(v34 + v30), v25, v21);
  *(_QWORD *)(v34 + v31) = v50;
  v36 = (_QWORD *)(v34 + v32);
  v38 = v59;
  v37 = v60;
  *v36 = v54;
  v36[1] = v37;
  v39 = (_QWORD *)(v34 + v33);
  *v39 = v55;
  v39[1] = v38;
  v40 = v34 + ((v33 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v40 = v56;
  *(_BYTE *)(v40 + 8) = v57 & 1;
  aBlock[4] = sub_1BC97B890;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC963D80;
  aBlock[3] = &block_descriptor_1;
  v41 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v42 = v35;
  swift_bridgeObjectRetain();
  swift_release();
  v43 = v62;
  sub_1BC97FE84();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1BC97B918();
  sub_1BC963498(0, &qword_1EF4763E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC97B960();
  v44 = v65;
  v45 = v58;
  sub_1BC9801D8();
  v46 = v67;
  v47 = (void *)v51;
  MEMORY[0x1BCCF8E88](v67, v43, v44, v41);
  _Block_release(v41);

  (*(void (**)(char *, uint64_t))(v66 + 8))(v44, v45);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v43, v64);
  v53(v46, v68);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v52, v21);
}

uint64_t sub_1BC97B564(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC963498(0, &qword_1EF475F00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC97B5C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;

  v41 = a6;
  v42 = a8;
  v36 = a7;
  v34 = a5;
  v38 = a3;
  v39 = a4;
  v40 = a9;
  v11 = sub_1BC97F98C();
  v12 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC963498(0, &qword_1EF4764C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v33 - v15;
  v17 = sub_1BC980034();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v11);
  sub_1BC98001C();
  swift_bridgeObjectRetain();
  v18 = a1;
  swift_bridgeObjectRetain();
  v19 = sub_1BC980010();
  v20 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject();
  v25 = MEMORY[0x1E0DF06E8];
  *((_QWORD *)v24 + 2) = v19;
  *((_QWORD *)v24 + 3) = v25;
  *((_QWORD *)v24 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v24[v20], v37, v35);
  v26 = v39;
  *(_QWORD *)&v24[v21] = v38;
  v27 = &v24[v22];
  v28 = v34;
  *(_QWORD *)v27 = v26;
  *((_QWORD *)v27 + 1) = v28;
  v29 = &v24[v23];
  v30 = v36;
  *(_QWORD *)v29 = v41;
  *((_QWORD *)v29 + 1) = v30;
  v31 = &v24[(v23 + 23) & 0xFFFFFFFFFFFFFFF8];
  *(_QWORD *)v31 = v42;
  v31[8] = v40 & 1;
  sub_1BC97BB2C((uint64_t)v16, (uint64_t)&unk_1EF4764D0, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_1BC97B7D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1BC97F98C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC97B890()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(sub_1BC97F98C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BC97B5C0(*(void **)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8), *(_QWORD *)(v0 + v5), *(_QWORD *)(v0 + v5 + 8), *(_QWORD *)(v0 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_BYTE *)(v0 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

unint64_t sub_1BC97B918()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF4763D8;
  if (!qword_1EF4763D8)
  {
    v1 = sub_1BC97FE78();
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EF4763D8);
  }
  return result;
}

unint64_t sub_1BC97B960()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF4763E8;
  if (!qword_1EF4763E8)
  {
    sub_1BC963498(255, &qword_1EF4763E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCF95CC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EF4763E8);
  }
  return result;
}

uint64_t sub_1BC97B9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v8[3] = sub_1BC98001C();
  v8[4] = sub_1BC980010();
  v8[2] = a6;
  v13 = (_QWORD *)swift_task_alloc();
  v8[5] = (uint64_t)v13;
  *v13 = v8;
  v13[1] = sub_1BC97BA8C;
  return sub_1BC97BC88(a5, v8 + 2, a7, a8, v15, v16, v17, v18 & 1);
}

uint64_t sub_1BC97BA8C()
{
  swift_task_dealloc();
  sub_1BC980004();
  return swift_task_switch();
}

uint64_t sub_1BC97BAFC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BC97BB2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1BC980034();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1BC980028();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1BC969494(a1, (uint64_t)&unk_1EF4764C0, (uint64_t)MEMORY[0x1E0DF0750], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC963498);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1BC980004();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1BC97BC88(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v9 + 272) = a8;
  *(_QWORD *)(v9 + 200) = a6;
  *(_QWORD *)(v9 + 208) = a7;
  *(_QWORD *)(v9 + 184) = a4;
  *(_QWORD *)(v9 + 192) = a5;
  *(_QWORD *)(v9 + 168) = a1;
  *(_QWORD *)(v9 + 176) = a3;
  v10 = *a2;
  *(_QWORD *)(v9 + 216) = v8;
  *(_QWORD *)(v9 + 224) = v10;
  sub_1BC98001C();
  *(_QWORD *)(v9 + 232) = sub_1BC980010();
  *(_QWORD *)(v9 + 240) = sub_1BC980004();
  *(_QWORD *)(v9 + 248) = v11;
  return swift_task_switch();
}

uint64_t sub_1BC97BD08()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  _BOOL8 v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v1 = *(void **)(v0 + 184);
  v2 = sub_1BC97AE14();
  if (v1)
    v1 = (void *)sub_1BC97FEFC();
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_BYTE *)(v0 + 272);
  v7 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 200);
  objc_msgSend(v2, sel_setText_, v1);

  v8 = (_QWORD *)(v3 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  v9 = 1;
  swift_beginAccess();
  *v8 = v7;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible) = (v4 & 5) != 4;
  if ((v5 & 1) != 0)
  {
    v13 = 0.0;
  }
  else
  {
    v10 = *(double *)(v0 + 208);
    v11 = 1.0;
    if (v10 <= 1.0)
      v11 = *(double *)(v0 + 208);
    v12 = v10 <= 0.0;
    if (v10 > 0.0)
      v13 = v11;
    else
      v13 = 0.0;
    v9 = v12;
  }
  v14 = *(_QWORD *)(v0 + 224);
  v15 = *(_QWORD *)(v0 + 216) + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode;
  *(double *)v15 = v13;
  *(_BYTE *)(v15 + 8) = v9;
  if ((v4 & 1) != 0)
  {
    v19 = (v14 & 2) == 0;
    v20 = *(_QWORD *)(v0 + 216);
    swift_release();
    v21 = (void *)sub_1BC97F974();
    v22 = objc_msgSend((id)objc_opt_self(), sel_playerViewWithURL_looping_, v21, v19);

    v23 = sub_1BC97AE14();
    sub_1BC97C0C0(v22, v23);

    *(_QWORD *)(v0 + 80) = sub_1BC96A1C0(0, &qword_1EF4764B8);
    *(_QWORD *)(v0 + 88) = &off_1E753EFC8;
    *(_QWORD *)(v0 + 56) = v22;
    v24 = v20 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    v25 = v22;
    sub_1BC97E850(v0 + 56, v24);
    swift_endAccess();
    if ((v4 & 4) == 0)
      objc_msgSend(v25, sel_play);

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v16 = (v14 & 2) == 0;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v17;
    *v17 = v0;
    v17[1] = sub_1BC97BF7C;
    return sub_1BC97C55C(*(_QWORD *)(v0 + 168), v16);
  }
}

uint64_t sub_1BC97BF7C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

id sub_1BC97BFD4()
{
  uint64_t v0;
  void *v1;
  id result;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v1 = *(void **)(v0 + 264);
  swift_release();
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v3 = result;
    v4 = *(void **)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 216);
    v6 = sub_1BC97AE14();
    sub_1BC97C0C0(v3, v6);

    *(_QWORD *)(v0 + 40) = type metadata accessor for HKAVPlayerViewController();
    *(_QWORD *)(v0 + 48) = &off_1E753F0B0;
    *(_QWORD *)(v0 + 16) = v4;
    v7 = v5 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    v8 = v4;
    sub_1BC97E850(v0 + 16, v7);
    swift_endAccess();

    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1BC97C0C0(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
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
  id v33;
  void *v34;
  double v35;
  id v37;

  v3 = v2;
  objc_msgSend(v2, sel_addSubview_, a2);
  objc_msgSend(v2, sel_addSubview_, a1);
  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(a1, sel_hk_maskAllCornersWithRadius_, 4.0);
  v37 = (id)objc_opt_self();
  sub_1BC96A31C(0, (unint64_t *)&qword_1EF4761B0, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1BC9822A0;
  v7 = objc_msgSend(a1, sel_topAnchor);
  v8 = objc_msgSend(v3, sel_layoutMarginsGuide);
  v9 = objc_msgSend(v8, sel_topAnchor);

  v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v9);
  *(_QWORD *)(v6 + 32) = v10;
  v11 = objc_msgSend(a1, sel_leftAnchor);
  v12 = objc_msgSend(v3, sel_layoutMarginsGuide);
  v13 = objc_msgSend(v12, sel_leftAnchor);

  v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(_QWORD *)(v6 + 40) = v14;
  v15 = objc_msgSend(a1, sel_rightAnchor);
  v16 = objc_msgSend(v3, sel_layoutMarginsGuide);
  v17 = objc_msgSend(v16, sel_rightAnchor);

  v18 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v17);
  *(_QWORD *)(v6 + 48) = v18;
  v19 = objc_msgSend(a2, sel_topAnchor);
  v20 = objc_msgSend(a1, sel_bottomAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToSystemSpacingBelowAnchor_multiplier_, v20, 1.0);

  *(_QWORD *)(v6 + 56) = v21;
  v22 = objc_msgSend(a2, sel_leadingAnchor);
  v23 = objc_msgSend(v3, sel_layoutMarginsGuide);
  v24 = objc_msgSend(v23, sel_leadingAnchor);

  v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v24);
  *(_QWORD *)(v6 + 64) = v25;
  v26 = objc_msgSend(a2, sel_trailingAnchor);
  v27 = objc_msgSend(v3, sel_layoutMarginsGuide);
  v28 = objc_msgSend(v27, sel_trailingAnchor);

  v29 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v28);
  *(_QWORD *)(v6 + 72) = v29;
  v30 = objc_msgSend(a2, sel_bottomAnchor);
  v31 = objc_msgSend(v3, sel_layoutMarginsGuide);
  v32 = objc_msgSend(v31, sel_bottomAnchor);

  v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v32);
  *(_QWORD *)(v6 + 80) = v33;
  sub_1BC97FFD4();
  sub_1BC96A1C0(0, (unint64_t *)&qword_1ED6A1458);
  v34 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_activateConstraints_, v34);

  LODWORD(v35) = 1148846080;
  objc_msgSend(a2, sel_setContentCompressionResistancePriority_forAxis_, 1, v35);
  return objc_msgSend(v3, sel_setLayoutMargins_, 8.0, 20.0, 8.0, 16.0);
}

uint64_t sub_1BC97C55C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 512) = a2;
  *(_QWORD *)(v3 + 288) = a1;
  *(_QWORD *)(v3 + 296) = v2;
  *(_QWORD *)(v3 + 304) = swift_getObjectType();
  v4 = sub_1BC97FB6C();
  *(_QWORD *)(v3 + 312) = v4;
  *(_QWORD *)(v3 + 320) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 328) = swift_task_alloc();
  *(_QWORD *)(v3 + 336) = sub_1BC98001C();
  *(_QWORD *)(v3 + 344) = sub_1BC980010();
  *(_QWORD *)(v3 + 352) = sub_1BC980004();
  *(_QWORD *)(v3 + 360) = v5;
  return swift_task_switch();
}

uint64_t sub_1BC97C604()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v1 = *(unsigned __int8 *)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = objc_allocWithZone(MEMORY[0x1E0C8B3C0]);
  v4 = (void *)sub_1BC97F974();
  v5 = objc_msgSend(v3, sel_initWithURL_options_, v4, 0);
  *(_QWORD *)(v0 + 368) = v5;

  v6 = *(void **)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset) = v5;
  v7 = v5;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B300]), sel_initWithAsset_, v7);
  *(_QWORD *)(v0 + 376) = v8;
  v9 = *(void **)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem) = v8;
  v10 = v8;

  sub_1BC96A31C(0, (unint64_t *)&qword_1EF4761B0, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BC9822B0;
  *(_QWORD *)(v11 + 32) = v10;
  sub_1BC97FFD4();
  v12 = objc_allocWithZone(MEMORY[0x1E0C8B350]);
  sub_1BC96A1C0(0, &qword_1EF476498);
  v13 = v10;
  v14 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v12, sel_initWithItems_, v14);
  *(_QWORD *)(v0 + 384) = v15;

  objc_msgSend(v15, sel_setPreventsDisplaySleepDuringVideoPlayback_, 0);
  v16 = *(_QWORD *)(v0 + 296);
  if (v1 == 1)
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_playerLooperWithPlayer_templateItem_, v15, v13);
    v18 = *(void **)(v16 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper);
    *(_QWORD *)(v16 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper) = v17;
  }
  else
  {
    v19 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v18 = (void *)sub_1BC97FEFC();
    objc_msgSend(v19, sel_addObserver_selector_name_object_, v16, sel_nonLoopingEndOfPlay_, v18, 0);

  }
  v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HKAVPlayerViewController()), sel_init);
  *(_QWORD *)(v0 + 392) = v20;
  objc_msgSend(v20, sel_setPlayer_, v15);
  objc_msgSend(v20, sel_setShowsMinimalPlaybackControlsWhenEmbeddedInline_, 1);
  v21 = v7;
  *(_QWORD *)(v0 + 400) = sub_1BC980010();
  *(_QWORD *)(v0 + 408) = sub_1BC980004();
  *(_QWORD *)(v0 + 416) = v22;
  return swift_task_switch();
}

uint64_t sub_1BC97C8EC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[46];
  v2 = *MEMORY[0x1E0C8A808];
  v0[7] = v0 + 35;
  v0[2] = v0;
  v0[3] = sub_1BC97C998;
  v3 = swift_continuation_init();
  v0[22] = MEMORY[0x1E0C809B0];
  v4 = v0 + 22;
  v4[1] = 0x40000000;
  v4[2] = sub_1BC97D5F0;
  v4[3] = &block_descriptor_1;
  v4[4] = v3;
  objc_msgSend(v1, sel_loadTracksWithMediaType_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1BC97C998()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 424) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1BC97C9F4()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 432) = *(_QWORD *)(v0 + 280);
  return swift_task_switch();
}

void sub_1BC97CA34()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = *(_QWORD *)(v0 + 432);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1BC980298();
    swift_bridgeObjectRelease();
    if (v4)
      goto LABEL_3;
LABEL_8:
    v6 = *(void **)(v0 + 376);
    v5 = *(void **)(v0 + 384);
    v7 = *(void **)(v0 + 368);
    swift_bridgeObjectRelease();

    swift_release();
    swift_task_dealloc();
    (*(void (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392));
    return;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x1BCCF8FE4](0, *(_QWORD *)(v0 + 432));
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(*(_QWORD *)(v0 + 432) + 32);
LABEL_6:
    *(_QWORD *)(v0 + 440) = v2;
    swift_bridgeObjectRelease();
    sub_1BC97E7D8(0, &qword_1EF4764A0, type metadata accessor for CGSize);
    *(_QWORD *)(v0 + 448) = sub_1BC97F9C8();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 456) = v3;
    *v3 = v0;
    v3[1] = sub_1BC97CE6C;
    sub_1BC98010C();
    return;
  }
  __break(1u);
}

uint64_t sub_1BC97CBA0()
{
  swift_release();
  swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_1BC97CBE8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 368);
  swift_release();

  v2 = *(void **)(v0 + 424);
  sub_1BC97FB48();
  v3 = v2;
  v4 = v2;
  v5 = sub_1BC97FB60();
  v6 = sub_1BC980094();
  if (os_log_type_enabled(v5, v6))
  {
    v19 = *(void **)(v0 + 384);
    v20 = *(void **)(v0 + 376);
    v21 = *(_QWORD *)(v0 + 320);
    v22 = *(void **)(v0 + 368);
    v23 = *(_QWORD *)(v0 + 312);
    v24 = *(_QWORD *)(v0 + 328);
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v25 = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = sub_1BC9803A0();
    *(_QWORD *)(v0 + 272) = sub_1BC9741D8(v9, v10, &v25);
    sub_1BC98019C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    v11 = sub_1BC980328();
    *(_QWORD *)(v0 + 264) = sub_1BC9741D8(v11, v12, &v25);
    sub_1BC98019C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC95E000, v5, v6, "[%s]: Did receive error when loading track from AVAsset: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCF9674](v8, -1, -1);
    MEMORY[0x1BCCF9674](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v23);
  }
  else
  {
    v14 = *(void **)(v0 + 376);
    v13 = *(void **)(v0 + 384);
    v16 = *(_QWORD *)(v0 + 320);
    v15 = *(_QWORD *)(v0 + 328);
    v17 = *(_QWORD *)(v0 + 312);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392));
}

uint64_t sub_1BC97CE6C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 464) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1BC97CED8()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(v0 + 472) = *(_OWORD *)(v0 + 240);
  sub_1BC97E7D8(0, &qword_1EF4764B0, type metadata accessor for CGAffineTransform);
  *(_QWORD *)(v0 + 488) = sub_1BC97F9D4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 496) = v1;
  *v1 = v0;
  v1[1] = sub_1BC97CF70;
  return sub_1BC98010C();
}

uint64_t sub_1BC97CF70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 504) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

id sub_1BC97CFDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  CGSize v6;
  id result;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)(v0 + 472);
  v1 = *(_QWORD *)(v0 + 480);
  v3 = *(void **)(v0 + 392);
  swift_release();
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 128);
  v4 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 112) = v4;
  v5 = v2;
  *(_QWORD *)&v4 = v1;
  v6 = CGSizeApplyAffineTransform(*(CGSize *)((char *)&v4 - 8), (CGAffineTransform *)(v0 + 80));
  result = objc_msgSend(v3, sel_view);
  if (result)
  {
    v8 = result;
    v9 = *(void **)(v0 + 440);
    v11 = *(void **)(v0 + 376);
    v10 = *(void **)(v0 + 384);
    v12 = *(void **)(v0 + 368);
    objc_msgSend(result, sel_hk_constraintAspectRatioFromSize_, v6.width, v6.height);

    swift_task_dealloc();
    return (id)(*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BC97D0BC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 368);

  swift_release();
  swift_release();
  v2 = *(void **)(v0 + 464);
  sub_1BC97FB48();
  v3 = v2;
  v4 = v2;
  v5 = sub_1BC97FB60();
  v6 = sub_1BC980094();
  if (os_log_type_enabled(v5, v6))
  {
    v19 = *(void **)(v0 + 384);
    v20 = *(void **)(v0 + 376);
    v21 = *(_QWORD *)(v0 + 320);
    v22 = *(void **)(v0 + 368);
    v23 = *(_QWORD *)(v0 + 312);
    v24 = *(_QWORD *)(v0 + 328);
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v25 = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = sub_1BC9803A0();
    *(_QWORD *)(v0 + 272) = sub_1BC9741D8(v9, v10, &v25);
    sub_1BC98019C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    v11 = sub_1BC980328();
    *(_QWORD *)(v0 + 264) = sub_1BC9741D8(v11, v12, &v25);
    sub_1BC98019C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC95E000, v5, v6, "[%s]: Did receive error when loading track from AVAsset: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCF9674](v8, -1, -1);
    MEMORY[0x1BCCF9674](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v23);
  }
  else
  {
    v14 = *(void **)(v0 + 376);
    v13 = *(void **)(v0 + 384);
    v16 = *(_QWORD *)(v0 + 320);
    v15 = *(_QWORD *)(v0 + 328);
    v17 = *(_QWORD *)(v0 + 312);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392));
}

uint64_t sub_1BC97D354()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 368);

  swift_release();
  swift_release();
  v2 = *(void **)(v0 + 504);
  sub_1BC97FB48();
  v3 = v2;
  v4 = v2;
  v5 = sub_1BC97FB60();
  v6 = sub_1BC980094();
  if (os_log_type_enabled(v5, v6))
  {
    v19 = *(void **)(v0 + 384);
    v20 = *(void **)(v0 + 376);
    v21 = *(_QWORD *)(v0 + 320);
    v22 = *(void **)(v0 + 368);
    v23 = *(_QWORD *)(v0 + 312);
    v24 = *(_QWORD *)(v0 + 328);
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v25 = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = sub_1BC9803A0();
    *(_QWORD *)(v0 + 272) = sub_1BC9741D8(v9, v10, &v25);
    sub_1BC98019C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    v11 = sub_1BC980328();
    *(_QWORD *)(v0 + 264) = sub_1BC9741D8(v11, v12, &v25);
    sub_1BC98019C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC95E000, v5, v6, "[%s]: Did receive error when loading track from AVAsset: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCF9674](v8, -1, -1);
    MEMORY[0x1BCCF9674](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v23);
  }
  else
  {
    v14 = *(void **)(v0 + 376);
    v13 = *(void **)(v0 + 384);
    v16 = *(_QWORD *)(v0 + 320);
    v15 = *(_QWORD *)(v0 + 328);
    v17 = *(_QWORD *)(v0 + 312);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392));
}

uint64_t sub_1BC97D5F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    sub_1BC96D234(0, (unint64_t *)&qword_1EF475FD0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_1BC96A1C0(0, &qword_1EF4764A8);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_1BC97FFC8();
    return swift_continuation_throwingResume();
  }
}

void sub_1BC97D6A4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22[3];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset);
  if (v2)
  {
    v3 = v2;
    sub_1BC97F8B4();
    if (v26)
    {
      sub_1BC96A1C0(0, &qword_1EF476498);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v4 = OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem;
        v5 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem);
        if (v5)
        {
          v6 = v22[0];
          v7 = v5;
          v8 = sub_1BC980148();

          if ((v8 & 1) != 0)
          {
            v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B300]), sel_initWithAsset_, v3);
            v10 = *(void **)(v1 + v4);
            *(_QWORD *)(v1 + v4) = v9;
            v11 = v9;

            sub_1BC96A31C(0, (unint64_t *)&qword_1EF4761B0, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
            v12 = swift_allocObject();
            *(_OWORD *)(v12 + 16) = xmmword_1BC9822B0;
            *(_QWORD *)(v12 + 32) = v11;
            v25[0] = v12;
            sub_1BC97FFD4();
            v13 = objc_allocWithZone(MEMORY[0x1E0C8B350]);
            v14 = v11;
            v15 = (void *)sub_1BC97FFBC();
            swift_bridgeObjectRelease();
            v16 = objc_msgSend(v13, sel_initWithItems_, v15);

            objc_msgSend(v16, sel_setPreventsDisplaySleepDuringVideoPlayback_, 0);
            v17 = v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
            swift_beginAccess();
            sub_1BC97DC10(v17, (uint64_t)v25);
            if (v26)
            {
              sub_1BC97E6E4((uint64_t)v25, (uint64_t)v22);
              sub_1BC97DCB8((uint64_t)v25);
              v18 = v23;
              v19 = v24;
              __swift_project_boxed_opaque_existential_1(v22, v23);
              (*(void (**)(id, uint64_t, uint64_t))(v19 + 24))(v16, v18, v19);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
            }
            else
            {
              sub_1BC97DCB8((uint64_t)v25);
            }
            v20 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
            v21 = (void *)sub_1BC97FEFC();
            objc_msgSend(v20, sel_addObserver_selector_name_object_, v1, sel_nonLoopingEndOfPlay_, v21, 0);

          }
          else
          {

          }
        }
        else
        {

        }
      }
      else
      {

      }
    }
    else
    {

      sub_1BC969494((uint64_t)v25, (uint64_t)&qword_1EF476028, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC96A31C);
    }
  }
}

id VideoView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoView()
{
  return objc_opt_self();
}

Swift::Void __swiftcall VideoView.viewStateChanged(_:)(HealthArticlesUI::MovementVisibilityState a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode + 8) == 1
    && *(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible) == 1)
  {
    v2 = *(_QWORD *)a1.rawValue;
    v3 = v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    sub_1BC97DC10(v3, (uint64_t)&v8);
    if (v9)
    {
      sub_1BC96D3B4(&v8, (uint64_t)v10);
      v4 = v2 & 3;
      v5 = v11;
      v6 = v12;
      __swift_project_boxed_opaque_existential_1(v10, v11);
      v7 = 16;
      if (v4 == 2)
        v7 = 8;
      (*(void (**)(uint64_t, uint64_t))(v6 + v7))(v5, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    }
    else
    {
      sub_1BC97DCB8((uint64_t)&v8);
    }
  }
}

uint64_t sub_1BC97DC10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC97DC54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BC97DC54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF476408)
  {
    sub_1BC96D234(255, &qword_1EF476410);
    v0 = sub_1BC980160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF476408);
  }
}

uint64_t sub_1BC97DCB8(uint64_t a1)
{
  uint64_t v2;

  sub_1BC97DC54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall VideoView.viewVisibilityChanged(_:)(Swift::Double a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode + 8) & 1) == 0
    && *(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible) == 1)
  {
    v3 = *(double *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode);
    v4 = v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    sub_1BC97DC10(v4, (uint64_t)&v7);
    if (v8)
    {
      sub_1BC96D3B4(&v7, (uint64_t)v9);
      v5 = v10;
      v6 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      if (v3 <= a1)
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      else
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    else
    {
      sub_1BC97DCB8((uint64_t)&v7);
    }
  }
}

unint64_t sub_1BC97DDE0()
{
  unint64_t result;

  result = qword_1EF476418;
  if (!qword_1EF476418)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for VideoViewOptions, &type metadata for VideoViewOptions);
    atomic_store(result, (unint64_t *)&qword_1EF476418);
  }
  return result;
}

unint64_t sub_1BC97DE28()
{
  unint64_t result;

  result = qword_1EF476420;
  if (!qword_1EF476420)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for VideoViewOptions, &type metadata for VideoViewOptions);
    atomic_store(result, (unint64_t *)&qword_1EF476420);
  }
  return result;
}

unint64_t sub_1BC97DE70()
{
  unint64_t result;

  result = qword_1EF476428;
  if (!qword_1EF476428)
  {
    result = MEMORY[0x1BCCF95CC]("1λ*|\x1B", &type metadata for VideoViewOptions);
    atomic_store(result, (unint64_t *)&qword_1EF476428);
  }
  return result;
}

unint64_t sub_1BC97DEB8()
{
  unint64_t result;

  result = qword_1EF476430;
  if (!qword_1EF476430)
  {
    result = MEMORY[0x1BCCF95CC](&protocol conformance descriptor for VideoViewOptions, &type metadata for VideoViewOptions);
    atomic_store(result, (unint64_t *)&qword_1EF476430);
  }
  return result;
}

void sub_1BC97DEFC(HealthArticlesUI::MovementVisibilityState a1)
{
  VideoView.viewStateChanged(_:)(a1);
}

void sub_1BC97DF1C(Swift::Double a1)
{
  VideoView.viewVisibilityChanged(_:)(a1);
}

id sub_1BC97DF3C()
{
  id *v0;

  return objc_msgSend(*v0, sel_play);
}

id sub_1BC97DF4C()
{
  id *v0;

  return objc_msgSend(*v0, sel_pause);
}

uint64_t sub_1BC97DF5C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for VideoViewOptions()
{
  return &type metadata for VideoViewOptions;
}

uint64_t method lookup function for VideoView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VideoView.accessibilityVideoDescription.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of VideoView.accessibilityVideoDescription.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of VideoView.accessibilityVideoDescription.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of VideoView.update(maybeURL:options:caption:accessibilityDescription:playVisibilityPercentage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  _QWORD *v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x150))(a1, a2, a3, a4, a5, a6, a7, a8 & 1);
}

id sub_1BC97E1E0()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for HKAVPlayerViewController();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_1BC97E2DC()
{
  char *v0;
  char *v1;
  id v2;

  v1 = &v0[OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground];
  if ((v0[OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground
         + 8] & 1) == 0)
  {
    if (*(_QWORD *)v1 == 2)
    {
      v2 = objc_msgSend(v0, sel_player);
      objc_msgSend(v2, sel_play);

    }
    *(_QWORD *)v1 = 0;
    v1[8] = 1;
  }
}

void sub_1BC97E388()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  char *v4;
  id v5;

  v1 = objc_msgSend(v0, sel_player);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_timeControlStatus);

    v4 = &v0[OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground];
    *(_QWORD *)v4 = v3;
    v4[8] = 0;
    if (v3 == (id)2)
    {
      v5 = objc_msgSend(v0, sel_player);
      objc_msgSend(v5, sel_pause);

    }
  }
}

uint64_t type metadata accessor for HKAVPlayerViewController()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for VideoView.PlayMode(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for VideoView.PlayMode(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1BC97E540(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BC97E55C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoView.PlayMode()
{
  return &type metadata for VideoView.PlayMode;
}

void sub_1BC97E58C()
{
  id *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_player);
  if (!v2 || (v3 = v2, v4 = objc_msgSend(v2, sel_timeControlStatus), v3, v4 != (id)2))
  {
    v5 = objc_msgSend(v1, sel_player);
    objc_msgSend(v5, sel_play);

  }
}

void sub_1BC97E630()
{
  id *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_player);
  if (!v2 || (v3 = v2, v4 = objc_msgSend(v2, sel_timeControlStatus), v3, v4))
  {
    v5 = objc_msgSend(v1, sel_player);
    objc_msgSend(v5, sel_pause);

  }
}

id sub_1BC97E6D0(uint64_t a1)
{
  id *v1;

  return objc_msgSend(*v1, sel_setPlayer_, a1);
}

uint64_t sub_1BC97E6E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BC97E728(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1BC97E78C;
  return v6(a1);
}

uint64_t sub_1BC97E78C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_1BC97E7D8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_1BC96A1C0(255, &qword_1EF4764A8);
    a3(255);
    v5 = sub_1BC97F9BC();
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_1BC97E850(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC97DC54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1BC97E894()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;

  v1 = &v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_QWORD *)v1 + 4) = 0;
  v2 = &v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode];
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper] = 0;
  v3 = &v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel] = 0;

  sub_1BC98028C();
  __break(1u);
}

uint64_t sub_1BC97E960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1BC97F98C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC97EA20(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(sub_1BC97F98C() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = v1[4];
  v14 = v1[3];
  v15 = v1[2];
  v8 = *(_QWORD *)((char *)v1 + v5);
  v9 = (uint64_t)v1 + v4;
  v10 = *(_QWORD *)((char *)v1 + v6);
  v11 = *(_QWORD *)((char *)v1 + v6 + 8);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_1BC97EB24;
  return sub_1BC97B9C0(a1, v15, v14, v7, v9, v8, v10, v11);
}

uint64_t sub_1BC97EB24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BC97EB6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC97EB90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BC97EB24;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF4764D8 + dword_1EF4764D8))(a1, v4);
}

id sub_1BC97EC00()
{
  return sub_1BC97EC18(&OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel);
}

id sub_1BC97EC0C()
{
  return sub_1BC97EC18(&OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel);
}

id sub_1BC97EC18(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = *a1;
  v3 = *(void **)(v1 + *a1);
  if (v3)
  {
    v4 = *(id *)(v1 + *a1);
  }
  else
  {
    sub_1BC96A1C0(0, &qword_1ED6A1470);
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_setNumberOfLines_, 0);
    v6 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    objc_msgSend(v5, sel_setTextColor_, v6);

    v7 = *(void **)(v1 + v2);
    *(_QWORD *)(v1 + v2) = v5;
    v4 = v5;

    v3 = 0;
  }
  v8 = v3;
  return v4;
}

id sub_1BC97ED0C(double a1, double a2, double a3, double a4)
{
  char *v4;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  objc_super v22;

  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel] = 0;
  v22.receiver = v4;
  v22.super_class = (Class)type metadata accessor for TileSashView();
  v9 = objc_msgSendSuper2(&v22, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setPreservesSuperviewLayoutMargins_, 1);
  v10 = sub_1BC97EC00();
  v11 = sub_1BC97EC0C();
  v12 = v9;
  objc_msgSend(v12, sel_addSubview_, v10);
  objc_msgSend(v12, sel_addSubview_, v11);

  sub_1BC97F3B0();
  v13 = sub_1BC97EC00();
  sub_1BC96A1C0(0, &qword_1ED6A1460);
  v14 = (void *)sub_1BC980118();
  objc_msgSend(v13, sel_setFont_, v14);

  v15 = sub_1BC97EC0C();
  v16 = (void *)sub_1BC980118();
  objc_msgSend(v15, sel_setFont_, v16);

  sub_1BC961AD0();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1BC980D10;
  v18 = sub_1BC97FB9C();
  v19 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v17 + 32) = v18;
  *(_QWORD *)(v17 + 40) = v19;
  v20 = v12;
  MEMORY[0x1BCCF8EDC](v17, sel_preferredContentSizeCategoryDidChange);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v20;
}

id sub_1BC97EF5C(void *a1)
{
  char *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  objc_super v14;

  *(_QWORD *)&v1[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel] = 0;
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for TileSashView();
  v3 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = sub_1BC97EC00();
    v7 = sub_1BC97EC0C();
    v8 = v5;
    objc_msgSend(v8, sel_addSubview_, v6);
    objc_msgSend(v8, sel_addSubview_, v7);

    sub_1BC97F3B0();
    v9 = sub_1BC97EC00();
    sub_1BC96A1C0(0, &qword_1ED6A1460);
    v10 = (void *)sub_1BC980118();
    objc_msgSend(v9, sel_setFont_, v10);

    v11 = sub_1BC97EC0C();
    v12 = sub_1BC980118();
    objc_msgSend(v11, sel_setFont_, v12);

    a1 = (void *)v12;
  }

  return v4;
}

uint64_t type metadata accessor for TileSashView()
{
  return objc_opt_self();
}

void sub_1BC97F208()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = sub_1BC97EC00();
  sub_1BC96A1C0(0, &qword_1ED6A1460);
  v1 = (void *)sub_1BC980118();
  objc_msgSend(v0, sel_setFont_, v1);

  v2 = sub_1BC97EC0C();
  v3 = (id)sub_1BC980118();
  objc_msgSend(v2, sel_setFont_, v3);

}

id TileSashView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TileSashView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TileSashView()
{
  return swift_lookUpClassMethod();
}

void sub_1BC97F3B0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
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
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  double v40;
  id v41;
  double v42;
  id v43;

  v1 = v0;
  v43 = (id)objc_opt_self();
  sub_1BC96D3CC();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BC9822A0;
  v3 = sub_1BC97EC00();
  v4 = objc_msgSend(v3, sel_topAnchor);

  v5 = objc_msgSend(v1, sel_layoutMarginsGuide);
  v6 = objc_msgSend(v5, sel_topAnchor);

  v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v6);
  *(_QWORD *)(v2 + 32) = v7;
  v8 = sub_1BC97EC00();
  v9 = objc_msgSend(v8, sel_leadingAnchor);

  v10 = objc_msgSend(v1, sel_layoutMarginsGuide);
  v11 = objc_msgSend(v10, sel_leadingAnchor);

  v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
  *(_QWORD *)(v2 + 40) = v12;
  v13 = sub_1BC97EC00();
  v14 = objc_msgSend(v13, sel_trailingAnchor);

  v15 = objc_msgSend(v1, sel_layoutMarginsGuide);
  v16 = objc_msgSend(v15, sel_trailingAnchor);

  v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(_QWORD *)(v2 + 48) = v17;
  v18 = sub_1BC97EC0C();
  v19 = objc_msgSend(v18, sel_topAnchor);

  v20 = sub_1BC97EC00();
  v21 = objc_msgSend(v20, sel_bottomAnchor);

  v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v21, 4.0);
  *(_QWORD *)(v2 + 56) = v22;
  v23 = sub_1BC97EC0C();
  v24 = objc_msgSend(v23, sel_leadingAnchor);

  v25 = objc_msgSend(v1, sel_layoutMarginsGuide);
  v26 = objc_msgSend(v25, sel_leadingAnchor);

  v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v26);
  *(_QWORD *)(v2 + 64) = v27;
  v28 = sub_1BC97EC0C();
  v29 = objc_msgSend(v28, sel_trailingAnchor);

  v30 = objc_msgSend(v1, sel_layoutMarginsGuide);
  v31 = objc_msgSend(v30, sel_trailingAnchor);

  v32 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v31);
  *(_QWORD *)(v2 + 72) = v32;
  v33 = sub_1BC97EC0C();
  v34 = objc_msgSend(v33, sel_bottomAnchor);

  v35 = objc_msgSend(v1, sel_layoutMarginsGuide);
  v36 = objc_msgSend(v35, sel_bottomAnchor);

  v37 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v36);
  *(_QWORD *)(v2 + 80) = v37;
  sub_1BC97FFD4();
  sub_1BC96A1C0(0, (unint64_t *)&qword_1ED6A1458);
  v38 = (void *)sub_1BC97FFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v43, sel_activateConstraints_, v38);

  type metadata accessor for UILayoutPriority(0);
  sub_1BC97059C();
  sub_1BC97FB84();
  sub_1BC97FB78();
  v39 = sub_1BC97EC00();
  LODWORD(v40) = v2;
  objc_msgSend(v39, sel_setContentHuggingPriority_forAxis_, 1, v40);

  v41 = sub_1BC97EC00();
  LODWORD(v42) = v2;
  objc_msgSend(v41, sel_setContentCompressionResistancePriority_forAxis_, 1, v42);

}

uint64_t sub_1BC97F8A8()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1BC97F8B4()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_1BC97F8C0()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1BC97F8CC()
{
  return MEMORY[0x1E0DC1A00]();
}

uint64_t sub_1BC97F8D8()
{
  return MEMORY[0x1E0DC1A10]();
}

uint64_t sub_1BC97F8E4()
{
  return MEMORY[0x1E0CAEF78]();
}

uint64_t sub_1BC97F8F0()
{
  return MEMORY[0x1E0CAEFE8]();
}

uint64_t sub_1BC97F8FC()
{
  return MEMORY[0x1E0CAF030]();
}

uint64_t sub_1BC97F908()
{
  return MEMORY[0x1E0CAF060]();
}

uint64_t sub_1BC97F914()
{
  return MEMORY[0x1E0CAF070]();
}

uint64_t sub_1BC97F920()
{
  return MEMORY[0x1E0CAF078]();
}

uint64_t sub_1BC97F92C()
{
  return MEMORY[0x1E0CAF1F0]();
}

uint64_t sub_1BC97F938()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1BC97F944()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BC97F950()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1BC97F95C()
{
  return MEMORY[0x1E0CAF470]();
}

uint64_t sub_1BC97F968()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1BC97F974()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BC97F980()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BC97F98C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BC97F998()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1BC97F9A4()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1BC97F9B0()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1BC97F9BC()
{
  return MEMORY[0x1E0DE9450]();
}

uint64_t sub_1BC97F9C8()
{
  return MEMORY[0x1E0DE9460]();
}

uint64_t sub_1BC97F9D4()
{
  return MEMORY[0x1E0DE9470]();
}

uint64_t sub_1BC97F9E0()
{
  return MEMORY[0x1E0D2D6C0]();
}

uint64_t sub_1BC97F9EC()
{
  return MEMORY[0x1E0D29DA0]();
}

uint64_t sub_1BC97F9F8()
{
  return MEMORY[0x1E0D2A840]();
}

uint64_t sub_1BC97FA04()
{
  return MEMORY[0x1E0D2A2C0]();
}

uint64_t sub_1BC97FA10()
{
  return MEMORY[0x1E0D2ED78]();
}

uint64_t sub_1BC97FA1C()
{
  return MEMORY[0x1E0D2ED80]();
}

uint64_t sub_1BC97FA28()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t sub_1BC97FA34()
{
  return MEMORY[0x1E0D2A9F0]();
}

uint64_t sub_1BC97FA40()
{
  return MEMORY[0x1E0D2AAC8]();
}

uint64_t sub_1BC97FA4C()
{
  return MEMORY[0x1E0D2AAE8]();
}

uint64_t sub_1BC97FA58()
{
  return MEMORY[0x1E0D2AEA8]();
}

uint64_t sub_1BC97FA64()
{
  return MEMORY[0x1E0D2AEB8]();
}

uint64_t sub_1BC97FA70()
{
  return MEMORY[0x1E0D2AEC0]();
}

uint64_t sub_1BC97FA7C()
{
  return MEMORY[0x1E0D2AEE0]();
}

uint64_t sub_1BC97FA88()
{
  return MEMORY[0x1E0D2B0A0]();
}

uint64_t sub_1BC97FA94()
{
  return MEMORY[0x1E0D2B0A8]();
}

uint64_t sub_1BC97FAA0()
{
  return MEMORY[0x1E0D2B440]();
}

uint64_t sub_1BC97FAAC()
{
  return MEMORY[0x1E0D2B448]();
}

uint64_t sub_1BC97FAB8()
{
  return MEMORY[0x1E0D2B4F8]();
}

uint64_t sub_1BC97FAC4()
{
  return MEMORY[0x1E0D2B578]();
}

uint64_t sub_1BC97FAD0()
{
  return MEMORY[0x1E0D2B580]();
}

uint64_t _s16HealthArticlesUI35ArticleContentConfigurationProviderC13ActionHandlerCfd_0()
{
  return MEMORY[0x1E0D2B590]();
}

uint64_t sub_1BC97FAE8()
{
  return MEMORY[0x1E0D2B7B0]();
}

uint64_t sub_1BC97FAF4()
{
  return MEMORY[0x1E0D2B7C0]();
}

uint64_t sub_1BC97FB00()
{
  return MEMORY[0x1E0D2B7C8]();
}

uint64_t sub_1BC97FB0C()
{
  return MEMORY[0x1E0D2B7D0]();
}

uint64_t sub_1BC97FB18()
{
  return MEMORY[0x1E0D2B8D8]();
}

uint64_t sub_1BC97FB24()
{
  return MEMORY[0x1E0D2B8E0]();
}

uint64_t sub_1BC97FB30()
{
  return MEMORY[0x1E0D2B8E8]();
}

uint64_t sub_1BC97FB3C()
{
  return MEMORY[0x1E0D2E748]();
}

uint64_t sub_1BC97FB48()
{
  return MEMORY[0x1E0D2E788]();
}

uint64_t sub_1BC97FB54()
{
  return MEMORY[0x1E0D2E7C8]();
}

uint64_t sub_1BC97FB60()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BC97FB6C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BC97FB78()
{
  return MEMORY[0x1E0DC1A68]();
}

uint64_t sub_1BC97FB84()
{
  return MEMORY[0x1E0DC1A70]();
}

uint64_t sub_1BC97FB90()
{
  return MEMORY[0x1E0DC2130]();
}

uint64_t sub_1BC97FB9C()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1BC97FBA8()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1BC97FBB4()
{
  return MEMORY[0x1E0CD89D8]();
}

uint64_t sub_1BC97FBC0()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1BC97FBCC()
{
  return MEMORY[0x1E0CD91C0]();
}

uint64_t sub_1BC97FBD8()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1BC97FBE4()
{
  return MEMORY[0x1E0CD94F8]();
}

uint64_t sub_1BC97FBF0()
{
  return MEMORY[0x1E0CD9500]();
}

uint64_t sub_1BC97FBFC()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_1BC97FC08()
{
  return MEMORY[0x1E0CD9B90]();
}

uint64_t sub_1BC97FC14()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1BC97FC20()
{
  return MEMORY[0x1E0CDA618]();
}

uint64_t sub_1BC97FC2C()
{
  return MEMORY[0x1E0CDA620]();
}

uint64_t sub_1BC97FC38()
{
  return MEMORY[0x1E0CDA768]();
}

uint64_t sub_1BC97FC44()
{
  return MEMORY[0x1E0CDA780]();
}

uint64_t sub_1BC97FC50()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1BC97FC5C()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1BC97FC68()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1BC97FC74()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1BC97FC80()
{
  return MEMORY[0x1E0CDC0E8]();
}

uint64_t sub_1BC97FC8C()
{
  return MEMORY[0x1E0CDC100]();
}

uint64_t sub_1BC97FC98()
{
  return MEMORY[0x1E0CDC108]();
}

uint64_t sub_1BC97FCA4()
{
  return MEMORY[0x1E0CDC110]();
}

uint64_t sub_1BC97FCB0()
{
  return MEMORY[0x1E0CDC170]();
}

uint64_t sub_1BC97FCBC()
{
  return MEMORY[0x1E0CDC978]();
}

uint64_t sub_1BC97FCC8()
{
  return MEMORY[0x1E0CDC990]();
}

uint64_t sub_1BC97FCD4()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1BC97FCE0()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1BC97FCEC()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1BC97FCF8()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1BC97FD04()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1BC97FD10()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1BC97FD1C()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1BC97FD28()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1BC97FD34()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_1BC97FD40()
{
  return MEMORY[0x1E0CDCF68]();
}

uint64_t sub_1BC97FD4C()
{
  return MEMORY[0x1E0CDCFD0]();
}

uint64_t sub_1BC97FD58()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1BC97FD64()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1BC97FD70()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1BC97FD7C()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1BC97FD88()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_1BC97FD94()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1BC97FDA0()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_1BC97FDAC()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_1BC97FDB8()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1BC97FDC4()
{
  return MEMORY[0x1E0D2BAD0]();
}

uint64_t sub_1BC97FDD0()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1BC97FDDC()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1BC97FDE8()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1BC97FDF4()
{
  return MEMORY[0x1E0CDEA88]();
}

uint64_t sub_1BC97FE00()
{
  return MEMORY[0x1E0CDEC40]();
}

uint64_t sub_1BC97FE0C()
{
  return MEMORY[0x1E0CDEE28]();
}

uint64_t sub_1BC97FE18()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t sub_1BC97FE24()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_1BC97FE30()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_1BC97FE3C()
{
  return MEMORY[0x1E0CDFAF0]();
}

uint64_t sub_1BC97FE48()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_1BC97FE54()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1BC97FE60()
{
  return MEMORY[0x1E0CE0200]();
}

uint64_t sub_1BC97FE6C()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1BC97FE78()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BC97FE84()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BC97FE90()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BC97FE9C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1BC97FEA8()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1BC97FEB4()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1BC97FEC0()
{
  return MEMORY[0x1E0D2F348]();
}

uint64_t sub_1BC97FECC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BC97FED8()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BC97FEE4()
{
  return MEMORY[0x1E0DF1F78]();
}

uint64_t sub_1BC97FEF0()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BC97FEFC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BC97FF08()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BC97FF14()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BC97FF20()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BC97FF2C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BC97FF38()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1BC97FF44()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_1BC97FF50()
{
  return MEMORY[0x1E0DEA680]();
}

uint64_t sub_1BC97FF5C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BC97FF68()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1BC97FF74()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BC97FF80()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BC97FF8C()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1BC97FF98()
{
  return MEMORY[0x1E0DEA920]();
}

uint64_t sub_1BC97FFA4()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1BC97FFB0()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BC97FFBC()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BC97FFC8()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BC97FFD4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BC97FFE0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BC97FFEC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BC97FFF8()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BC980004()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1BC980010()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1BC98001C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1BC980028()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1BC980034()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1BC980040()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1BC98004C()
{
  return MEMORY[0x1E0CB1B90]();
}

uint64_t sub_1BC980058()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1BC980064()
{
  return MEMORY[0x1E0CB1BA0]();
}

uint64_t sub_1BC980070()
{
  return MEMORY[0x1E0DEB178]();
}

uint64_t sub_1BC98007C()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1BC980088()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1BC980094()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BC9800A0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1BC9800AC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BC9800B8()
{
  return MEMORY[0x1E0D2E918]();
}

uint64_t sub_1BC9800C4()
{
  return MEMORY[0x1E0DC2BF8]();
}

uint64_t sub_1BC9800D0()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1BC9800DC()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1BC9800E8()
{
  return MEMORY[0x1E0D2F378]();
}

uint64_t sub_1BC9800F4()
{
  return MEMORY[0x1E0CB1EB8]();
}

uint64_t sub_1BC980100()
{
  return MEMORY[0x1E0D2BC18]();
}

uint64_t sub_1BC98010C()
{
  return MEMORY[0x1E0DE94F0]();
}

uint64_t sub_1BC980118()
{
  return MEMORY[0x1E0D2BC38]();
}

uint64_t sub_1BC980124()
{
  return MEMORY[0x1E0DC2FB0]();
}

uint64_t sub_1BC980130()
{
  return MEMORY[0x1E0D2BC68]();
}

uint64_t sub_1BC98013C()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1BC980148()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BC980154()
{
  return MEMORY[0x1E0CB2148]();
}

uint64_t sub_1BC980160()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BC98016C()
{
  return MEMORY[0x1E0DEBA70]();
}

uint64_t sub_1BC980178()
{
  return MEMORY[0x1E0DEBA88]();
}

uint64_t sub_1BC980184()
{
  return MEMORY[0x1E0DEBB48]();
}

uint64_t sub_1BC980190()
{
  return MEMORY[0x1E0DEBB58]();
}

uint64_t sub_1BC98019C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BC9801A8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BC9801B4()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1BC9801C0()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1BC9801CC()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BC9801D8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BC9801E4()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1BC9801F0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1BC9801FC()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1BC980208()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1BC980214()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BC980220()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BC98022C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BC980238()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BC980244()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BC980250()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BC98025C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BC980268()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BC980274()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BC980280()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BC98028C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BC980298()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BC9802A4()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BC9802B0()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BC9802BC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BC9802C8()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BC9802D4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BC9802E0()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BC9802EC()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BC9802F8()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1BC980304()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BC980310()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BC98031C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BC980328()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BC980334()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1BC980340()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BC98034C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BC980358()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1BC980364()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BC980370()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BC98037C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BC980388()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BC980394()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1BC9803A0()
{
  return MEMORY[0x1E0DEE978]();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x1E0C9D7F8](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1E0DEED00]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

