id sub_21E23D0C0()
{
  void *v0;
  id v1;
  id result;
  void *v3;
  id v4;

  sub_21E23F074(0, &qword_2553D05F8);
  if (qword_2553D0500 != -1)
    swift_once();
  v0 = (void *)qword_2553D0508;
  v1 = (id)qword_2553D0508;
  result = sub_21E23D178(0x6B726170735F5047, 0xEA0000000000656CLL, v0);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, sel_imageWithRenderingMode_, 2);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_21E23D178(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  if (a2)
  {
    v4 = (void *)sub_21E257B20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_, v4, a3);

  return v5;
}

void sub_21E23D1F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView) = a1;

}

id sub_21E23D208(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  objc_super v19;

  OUTLINED_FUNCTION_2(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_defaultImageOpacity);
  OUTLINED_FUNCTION_6(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeImageOpacity);
  v9 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage;
  v10 = v4;
  *(_QWORD *)&v4[v9] = sub_21E23D0C0();
  *(_QWORD *)&v10[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView] = 0;
  v11 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonBGColor;
  *(_QWORD *)&v10[v11] = objc_msgSend(OUTLINED_FUNCTION_0(), sel_initWithWhite_alpha_, 0.4, 0.9);
  v12 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonTintColor;
  v13 = OUTLINED_FUNCTION_0();
  *(_QWORD *)&v10[v12] = OUTLINED_FUNCTION_5(v13, sel_initWithWhite_alpha_);
  v14 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonBGColor;
  *(_QWORD *)&v10[v14] = objc_msgSend(OUTLINED_FUNCTION_0(), sel_initWithRed_green_blue_alpha_, 0.05, 0.64, 1.0, 0.9);
  v15 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonTintColor;
  v16 = OUTLINED_FUNCTION_0();
  *(_QWORD *)&v10[v15] = OUTLINED_FUNCTION_5(v16, sel_initWithWhite_alpha_);
  v10[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance] = 0;

  v19.receiver = v10;
  v19.super_class = (Class)type metadata accessor for AEGenerativePlaygroundButton();
  v17 = objc_msgSendSuper2(&v19, sel_initWithFrame_, a1, a2, a3, a4);
  sub_21E23D798();

  return v17;
}

id sub_21E23D3A8(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;

  OUTLINED_FUNCTION_2(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_defaultImageOpacity);
  OUTLINED_FUNCTION_6(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeImageOpacity);
  v3 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage;
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_21E23D0C0();
  *(_QWORD *)&v4[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView] = 0;
  v5 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonBGColor;
  *(_QWORD *)&v4[v5] = objc_msgSend(OUTLINED_FUNCTION_0(), sel_initWithWhite_alpha_, 0.4, 0.9);
  v6 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonTintColor;
  v7 = OUTLINED_FUNCTION_0();
  *(_QWORD *)&v4[v6] = OUTLINED_FUNCTION_5(v7, sel_initWithWhite_alpha_);
  v8 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonBGColor;
  *(_QWORD *)&v4[v8] = objc_msgSend(OUTLINED_FUNCTION_0(), sel_initWithRed_green_blue_alpha_, 0.05, 0.64, 1.0, 0.9);
  v9 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonTintColor;
  v10 = OUTLINED_FUNCTION_0();
  *(_QWORD *)&v4[v9] = OUTLINED_FUNCTION_5(v10, sel_initWithWhite_alpha_);
  v4[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance] = 0;

  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for AEGenerativePlaygroundButton();
  v11 = objc_msgSendSuper2(&v15, sel_initWithCoder_, a1);
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    sub_21E23D798();

  }
  return v12;
}

uint64_t sub_21E23D55C()
{
  unsigned __int8 *v0;

  OUTLINED_FUNCTION_1();
  return *v0;
}

void sub_21E23D5CC(char a1)
{
  uint64_t v1;
  char *v3;
  char v4;

  v3 = (char *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  sub_21E23D674(v4);
}

uint64_t sub_21E23D624@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21E23D55C();
  *a1 = result & 1;
  return result;
}

void sub_21E23D650(char *a1)
{
  sub_21E23D5CC(*a1);
}

void sub_21E23D674(char a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned __int8 *v4;
  int v5;
  void *v6;
  id v7;

  v2 = v1;
  v3 = a1 & 1;
  v4 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance);
  swift_beginAccess();
  v5 = *v4;
  if (v5 != v3)
  {
    v6 = *(void **)(v2 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView);
    if (v6)
    {
      v7 = v6;
      sub_21E23DEA4(v5);

    }
    sub_21E23DB24();
  }
}

void (*sub_21E23D700(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance);
  swift_beginAccess();
  *((_BYTE *)v3 + 32) = *v4;
  return sub_21E23D76C;
}

void sub_21E23D76C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  sub_21E23D5CC(*(_BYTE *)(*(_QWORD *)a1 + 32));
  free(v1);
}

uint64_t sub_21E23D798()
{
  char *v0;
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
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void (*v19)(_BYTE *, _QWORD);
  uint64_t v20;
  id v21;
  id v22;
  _BYTE v24[32];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D0600);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3();
  v3 = v2 - v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D0608);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3();
  v6 = v5 - v4;
  v7 = sub_21E257BA4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3();
  v11 = v10 - v9;
  objc_msgSend(v0, sel_setUserInteractionEnabled_, 1);
  objc_msgSend(v0, sel_bounds);
  v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ButtonBackground()), sel_initWithFrame_, v12, v13, v14, v15);
  sub_21E257B98();
  v17 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  sub_21E257B74();
  v18 = v16;
  v19 = (void (*)(_BYTE *, _QWORD))sub_21E257B68();
  sub_21E257AFC();
  v19(v24, 0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_21E257B14();
  v20 = sub_21E257B08();
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v20);
  sub_21E257B80();
  v21 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage];
  sub_21E257B8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v11, v7);
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v7);
  sub_21E257BB0();
  v22 = v18;
  sub_21E23D1F4((uint64_t)v16);
  sub_21E23DB24();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

id sub_21E23DA10(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  double v6;
  id v7;
  double v10[5];

  v10[4] = *(double *)MEMORY[0x24BDAC8D0];
  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2207AD0B8](v2);
  if (!v3)
    return a1;
  v4 = (void *)v3;
  v10[0] = 0.0;
  objc_msgSend(a1, sel_getRed_green_blue_alpha_, 0, 0, 0, v10);
  v5 = objc_msgSend(v4, sel_isHighlighted);
  v6 = v10[0];
  if (v5)
    v6 = v10[0] * 0.4;
  v7 = objc_msgSend(a1, sel_colorWithAlphaComponent_, v6, a1);

  return v7;
}

void sub_21E23DB24()
{
  _BYTE *v0;
  void *v1;
  double v2;
  id v3;

  OUTLINED_FUNCTION_1();
  if (*v0)
    v2 = 0.98;
  else
    v2 = 0.54;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, v2);
  objc_msgSend(v1, sel_setTintColor_, v3);

}

void sub_21E23DBB0()
{
  char *v0;
  void *v1;
  id v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AEGenerativePlaygroundButton();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView];
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v2, sel_setFrame_);

  }
}

uint64_t type metadata accessor for AEGenerativePlaygroundButton()
{
  return objc_opt_self();
}

BOOL sub_21E23DC78(CGFloat a1, CGFloat a2)
{
  void *v2;
  CGPoint v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(v2, sel_bounds);
  v8 = CGRectInset(v7, -18.0, -18.0);
  v6.x = a1;
  v6.y = a2;
  return CGRectContainsPoint(v8, v6);
}

id AEGenerativePlaygroundButton.__deallocating_deinit(uint64_t a1)
{
  return sub_21E23ED68(a1, type metadata accessor for AEGenerativePlaygroundButton);
}

uint64_t method lookup function for AEGenerativePlaygroundButton()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AEGenerativePlaygroundButton.isGenerativeAssetAppearance.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AEGenerativePlaygroundButton.isGenerativeAssetAppearance.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AEGenerativePlaygroundButton.isGenerativeAssetAppearance.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

void sub_21E23DDF4()
{
  qword_2553D04C8 = (uint64_t)&unk_24E23B2D0;
}

void sub_21E23DE08()
{
  qword_2553D04D8 = (uint64_t)&unk_24E23B300;
}

CGColorRef sub_21E23DE1C()
{
  CGColorRef result;

  result = CGColorCreateGenericRGB(0.0509803922, 0.639215686, 1.0, 1.0);
  qword_2553D04E8 = (uint64_t)result;
  return result;
}

CGColorRef sub_21E23DE50()
{
  CGColorRef result;

  result = CGColorCreateGenericRGB(0.125490196, 0.647058824, 1.0, 1.0);
  qword_2553D04F8 = (uint64_t)result;
  return result;
}

id sub_21E23DE84(id result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated) != (result & 1))
    return sub_21E23E894();
  return result;
}

id sub_21E23DEA4(char a1)
{
  uint64_t v1;
  void *v2;

  v2 = (void *)*(unsigned __int8 *)(v1
                                  + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated) = a1;
  return sub_21E23DE84(v2);
}

uint64_t sub_21E23DEBC()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  sub_21E23F074(0, &qword_2553D05E0);
  sub_21E257B2C();
  v0 = sub_21E23E184();
  if (qword_2553D04C0 != -1)
    swift_once();
  v1 = (void *)sub_21E257B38();
  objc_msgSend(v0, sel_setValue_forKey_, v1, *MEMORY[0x24BDE5B40]);

  v2 = (void *)sub_21E257B5C();
  v3 = *MEMORY[0x24BDE5AA8];
  objc_msgSend(v0, sel_setValue_forKey_, v2, *MEMORY[0x24BDE5AA8]);

  sub_21E257B2C();
  v4 = sub_21E23E184();
  v5 = (void *)sub_21E257B5C();
  objc_msgSend(v4, sel_setValue_forKey_, v5, v3);

  sub_21E257B2C();
  v6 = sub_21E23E184();
  v7 = (void *)sub_21E257B5C();
  objc_msgSend(v6, sel_setValue_forKey_, v7, v3);

  sub_21E257B2C();
  v8 = sub_21E23E184();
  v9 = (void *)sub_21E257B5C();
  objc_msgSend(v8, sel_setValue_forKey_, v9, *MEMORY[0x24BDE5B18]);

  v10 = (void *)sub_21E257B50();
  objc_msgSend(v8, sel_setValue_forKey_, v10, *MEMORY[0x24BDE5B00]);

  v11 = (void *)sub_21E257B50();
  objc_msgSend(v8, sel_setValue_forKey_, v11, *MEMORY[0x24BDE5AF0]);

  v12 = (void *)sub_21E257B20();
  objc_msgSend(v8, sel_setValue_forKey_, v12, *MEMORY[0x24BDE5B10]);

  v13 = (void *)sub_21E257B50();
  objc_msgSend(v8, sel_setValue_forKey_, v13, *MEMORY[0x24BDE5AE0]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D05F0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_21E259FF0;
  *(_QWORD *)(v14 + 32) = v0;
  *(_QWORD *)(v14 + 40) = v4;
  *(_QWORD *)(v14 + 48) = v6;
  *(_QWORD *)(v14 + 56) = v8;
  v16 = v14;
  sub_21E257B44();
  return v16;
}

id sub_21E23E184()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_21E257B20();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithType_, v1);

  return v2;
}

uint64_t sub_21E23E1F4()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  sub_21E23F074(0, &qword_2553D05E0);
  sub_21E257B2C();
  v0 = sub_21E23E184();
  if (qword_2553D04D0 != -1)
    swift_once();
  v1 = (void *)sub_21E257B38();
  objc_msgSend(v0, sel_setValue_forKey_, v1, *MEMORY[0x24BDE5B40]);

  v2 = (void *)sub_21E257B5C();
  objc_msgSend(v0, sel_setValue_forKey_, v2, *MEMORY[0x24BDE5AA8]);

  sub_21E257B2C();
  v3 = sub_21E23E184();
  v4 = (void *)sub_21E257B5C();
  objc_msgSend(v3, sel_setValue_forKey_, v4, *MEMORY[0x24BDE5B18]);

  v5 = (void *)sub_21E257B50();
  objc_msgSend(v3, sel_setValue_forKey_, v5, *MEMORY[0x24BDE5B00]);

  v6 = (void *)sub_21E257B50();
  objc_msgSend(v3, sel_setValue_forKey_, v6, *MEMORY[0x24BDE5AF0]);

  v7 = (void *)sub_21E257B20();
  objc_msgSend(v3, sel_setValue_forKey_, v7, *MEMORY[0x24BDE5B10]);

  v8 = (void *)sub_21E257B50();
  objc_msgSend(v3, sel_setValue_forKey_, v8, *MEMORY[0x24BDE5AE0]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D05F0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21E25A000;
  *(_QWORD *)(v9 + 32) = v0;
  *(_QWORD *)(v9 + 40) = v3;
  v11 = v9;
  sub_21E257B44();
  return v11;
}

id sub_21E23E41C(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
  if (*a1 != -1)
    swift_once();
  objc_msgSend(v6, sel_setBackgroundColor_, *a2);
  objc_msgSend(v6, sel_setCompositingFilter_, *a3);
  return v6;
}

char *sub_21E23E4B8(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  char *result;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v4[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated] = 0;
  v9 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_defaultBackdropFilters;
  v10 = v4;
  *(_QWORD *)&v4[v9] = sub_21E23DEBC();
  v11 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedBackdropFilters;
  *(_QWORD *)&v10[v11] = sub_21E23E1F4();
  v12 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer;
  *(_QWORD *)&v10[v12] = sub_21E23E41C(&qword_2553D04E0, &qword_2553D04E8, MEMORY[0x24BDE5BD8]);
  v13 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer;
  *(_QWORD *)&v10[v13] = sub_21E23E41C(&qword_2553D04F0, &qword_2553D04F8, MEMORY[0x24BDE5BD0]);
  sub_21E23F074(0, &qword_2553D05F8);
  if (qword_2553D0500 != -1)
    swift_once();
  v14 = (void *)qword_2553D0508;
  v15 = (id)qword_2553D0508;
  result = (char *)sub_21E23D178(0x62726F5F5047, 0xE600000000000000, v14);
  if (result)
  {
    v17 = result;
    v18 = objc_msgSend(result, sel_imageWithRenderingMode_, 2);

    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5640]), sel_init);
    *(_QWORD *)&v10[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer] = v19;
    v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
    *(_QWORD *)&v10[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer] = v20;
    v21 = v20;
    v22 = objc_msgSend(v18, sel_CGImage);
    objc_msgSend(v21, sel_setContents_, v22);

    v38.receiver = v10;
    v38.super_class = (Class)type metadata accessor for ButtonBackground();
    v23 = (char *)objc_msgSendSuper2(&v38, sel_initWithFrame_, a1, a2, a3, a4);
    v24 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer;
    v25 = *(void **)&v23[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer];
    v26 = v23;
    v27 = v25;
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v27, sel_setFrame_);

    v28 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer;
    v29 = *(id *)&v26[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer];
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v29, sel_setFrame_);

    v30 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer;
    v31 = *(id *)&v26[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer];
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v31, sel_setFrame_);

    v32 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer;
    v33 = *(id *)&v26[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer];
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v33, sel_setFrame_);

    v34 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v34, sel_addSublayer_, *(_QWORD *)&v23[v24]);

    v35 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v35, sel_addSublayer_, *(_QWORD *)&v26[v30]);

    v36 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v36, sel_addSublayer_, *(_QWORD *)&v26[v32]);

    v37 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v37, sel_setMask_, *(_QWORD *)&v26[v28]);

    sub_21E23E894();
    return v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_21E23E894()
{
  unsigned __int8 *v0;
  uint64_t v1;
  id v2;
  unint64_t v3;
  char *v4;

  v1 = v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated] ^ 1u;
  v2 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer];
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21E23E968(v3);
  swift_bridgeObjectRelease();
  sub_21E23EFC4((uint64_t)v4, v2);

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer], sel_setHidden_, v1);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer], sel_setHidden_, v1);
  return objc_msgSend(v0, sel_setNeedsLayout);
}

char *sub_21E23E968(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t i;
  id v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_21E257BD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return (char *)v3;
  v10 = MEMORY[0x24BEE4AF8];
  result = sub_21E23EEA8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x2207AC9E0](i, a1);
      else
        v6 = *(id *)(a1 + 8 * i + 32);
      sub_21E23F074(0, &qword_2553D05E0);
      swift_dynamicCast();
      v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E23EEA8(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v10;
      }
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_21E23EEA8((char *)(v7 > 1), v8 + 1, 1);
        v3 = v10;
      }
      *(_QWORD *)(v3 + 16) = v8 + 1;
      sub_21E23F020(&v9, (_OWORD *)(v3 + 32 * v8 + 32));
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

void sub_21E23EB08()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated] = 0;
  v1 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_defaultBackdropFilters;
  *(_QWORD *)&v0[v1] = sub_21E23DEBC();
  v2 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedBackdropFilters;
  *(_QWORD *)&v0[v2] = sub_21E23E1F4();
  v3 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer;
  *(_QWORD *)&v0[v3] = sub_21E23E41C(&qword_2553D04E0, &qword_2553D04E8, MEMORY[0x24BDE5BD8]);
  v4 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer;
  *(_QWORD *)&v0[v4] = sub_21E23E41C(&qword_2553D04F0, &qword_2553D04F8, MEMORY[0x24BDE5BD0]);

  sub_21E257BC8();
  __break(1u);
}

void sub_21E23EC18()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ButtonBackground();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  v1 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  v2 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  v3 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);

  v4 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

id sub_21E23ED58()
{
  return sub_21E23ED68(0, type metadata accessor for ButtonBackground);
}

id sub_21E23ED68(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ButtonBackground()
{
  return objc_opt_self();
}

void sub_21E23EE30()
{
  NSString *v0;
  Class v1;

  v0 = (NSString *)sub_21E257B20();
  v1 = NSClassFromString(v0);

  if (v1)
    qword_2553D0508 = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v1);
  else
    __break(1u);
}

char *sub_21E23EEA8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21E23EEC4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21E23EEC4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D05E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12)
      memmove(v12, v13, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void sub_21E23EFC4(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_21E257B38();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setFilters_, v3);

}

_OWORD *sub_21E23F020(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207AD064]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E23F074(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21E23F0AC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_21E23F0D0(void *a1)
{
  uint64_t v1;

  return sub_21E23DA10(a1, v1);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

id OUTLINED_FUNCTION_0()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 1208));
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0x3FE147AE147AE148;
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

}

id OUTLINED_FUNCTION_5(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 1.0);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0x3FEF5C28F5C28F5CLL;
}

uint64_t sub_21E23F154()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_21E24129C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E24137C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E24146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E24154C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E24162C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E241814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id _UnsuppressedURLs(void *a1, _QWORD *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          if (objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.asset-explorer-package.suppressed.")))
          {
            objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.asset-explorer-package.suppressed."), &stru_24E23C028);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary ae_moveObjectFromKey:toKey:](v5, v12, v13);
            objc_msgSend(v4, "addObject:", v13);
            v12 = v13;
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (a2)
    *a2 = objc_retainAutorelease(v4);

  return v5;
}

void sub_21E242CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E243B00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E2448F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

id AssetExplorerBundle()
{
  if (AssetExplorerBundle_onceToken != -1)
    dispatch_once(&AssetExplorerBundle_onceToken, &__block_literal_global_834);
  return (id)__AssetExplorerBundle;
}

void AEChatKitSendAnalyticsEventAssetSentFromSource(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a1 > 6)
    v1 = 0;
  else
    v1 = off_24E23B7C0[a1];
  v3 = CFSTR("sendSource");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

void AEChatKitSendAnalyticsEventAssetsSentCount(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("itemsCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

void sub_21E24E840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21E24EFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__981(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__982(uint64_t a1)
{

}

void sub_21E24FF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_21E2526B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21E252C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E252F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1115(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1116(uint64_t a1)
{

}

void sub_21E254F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E256084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1308(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1309(uint64_t a1)
{

}

uint64_t sub_21E257AFC()
{
  return MEMORY[0x24BEBC388]();
}

uint64_t sub_21E257B08()
{
  return MEMORY[0x24BEBC8E0]();
}

uint64_t sub_21E257B14()
{
  return MEMORY[0x24BEBC8F0]();
}

uint64_t sub_21E257B20()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21E257B2C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21E257B38()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21E257B44()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21E257B50()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_21E257B5C()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_21E257B68()
{
  return MEMORY[0x24BEBD040]();
}

uint64_t sub_21E257B74()
{
  return MEMORY[0x24BEBD130]();
}

uint64_t sub_21E257B80()
{
  return MEMORY[0x24BEBD138]();
}

uint64_t sub_21E257B8C()
{
  return MEMORY[0x24BEBD1A8]();
}

uint64_t sub_21E257B98()
{
  return MEMORY[0x24BEBD1B0]();
}

uint64_t sub_21E257BA4()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_21E257BB0()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_21E257BBC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21E257BC8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21E257BD4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9140](isrc, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

uint64_t DCIM_MakeUniqueDirectoryWithPath()
{
  return MEMORY[0x24BE72220]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PFSharedFigDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x24BE72550]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x24BE71C10]();
}

uint64_t PLAssetExplorerGetLog()
{
  return MEMORY[0x24BE72278]();
}

uint64_t PLIsLockdownMode()
{
  return MEMORY[0x24BE722B0]();
}

uint64_t PLPickerGetLog()
{
  return MEMORY[0x24BE72318]();
}

uint64_t PUActivityItemSharingPreferencesMake()
{
  return MEMORY[0x24BE72DA8]();
}

uint64_t PULocalizedString()
{
  return MEMORY[0x24BE72DD0]();
}

uint64_t PXAssertGetLog()
{
  return MEMORY[0x24BE727D8]();
}

uint64_t PXEdgeInsetsEqualToEdgeInsets()
{
  return MEMORY[0x24BE72808]();
}

uint64_t PXEdgeInsetsInsetSize()
{
  return MEMORY[0x24BE72810]();
}

uint64_t PXFloatGreaterThanFloat()
{
  return MEMORY[0x24BE72820]();
}

uint64_t PXIndexPathFromSimpleIndexPath()
{
  return MEMORY[0x24BE72830]();
}

uint64_t PXLocalizedString()
{
  return MEMORY[0x24BE72838]();
}

uint64_t PXLocalizedVideoDuration()
{
  return MEMORY[0x24BE72840]();
}

uint64_t PXRectGetCenter()
{
  return MEMORY[0x24BE72848]();
}

uint64_t PXSimpleIndexPathFromIndexPath()
{
  return MEMORY[0x24BE72858]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t px_dispatch_queue_create_serial()
{
  return MEMORY[0x24BE72868]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
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

