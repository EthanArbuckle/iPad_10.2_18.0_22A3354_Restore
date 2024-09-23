void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id HTUILocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("HTUITaggedColor")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24DD23560, CFSTR("Accessibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id HTUIParameterizedLocString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v9 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("HTUITaggedColor")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24DD23560, CFSTR("Accessibility"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasSuffix:", CFSTR("%"));
    if (v13)
    {
      objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 1);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v12, &a9);

    if (v13)
    {
      objc_msgSend(v15, "stringByAppendingString:", CFSTR("%"));
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t HTDisplayIDForWindow(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayID");

  return v3;
}

void _axEventHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;

  v8 = (void *)MEMORY[0x220749074]();
  if (a5)
  {
    objc_msgSend(a5, "handler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, a3, a4);

  }
  else
  {
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      _axEventHandler_cold_1(a3, v10);

  }
  objc_autoreleasePoolPop(v8);
}

uint64_t sub_21A78AF58()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21A78AFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 96) = a2;
  *(_QWORD *)(a1 + 104) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A78B024()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 112);
}

uint64_t sub_21A78B0A8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 112);
  return result;
}

uint64_t sub_21A78B134()
{
  return sub_21A78BCA8();
}

uint64_t sub_21A78B148()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 113);
}

uint64_t sub_21A78B1CC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 113);
  return result;
}

uint64_t sub_21A78B258()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

double sub_21A78B300()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 120);
}

__n128 sub_21A78B384@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3;
  __n128 result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  result = *(__n128 *)(v3 + 120);
  *a2 = result;
  return result;
}

uint64_t sub_21A78B410()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A78B4C0()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A78B548(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 136) = a2;
  swift_retain();
  return swift_release();
}

uint64_t sub_21A78B580()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t sub_21A78B604@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 144);
  return result;
}

uint64_t sub_21A78B690()
{
  return sub_21A78BCA8();
}

uint64_t sub_21A78B6A4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 145);
}

uint64_t sub_21A78B728@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 145);
  return result;
}

uint64_t sub_21A78B7B4()
{
  return sub_21A78BCA8();
}

uint64_t sub_21A78B7C8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v0 + 152);
}

uint64_t sub_21A78B84C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 152) = a2;
  return result;
}

uint64_t sub_21A78B854()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v1 = *(_QWORD *)(v0 + 160);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21A78B8E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v4 = *(_QWORD *)(v3 + 168);
  *a2 = *(_QWORD *)(v3 + 160);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21A78B978()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  swift_bridgeObjectRetain();
  sub_21A7CF6C0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A78BA34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  v4 = sub_21A7CF57C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_21A78BAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  v4 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

uint64_t sub_21A78BB74()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible);
}

uint64_t sub_21A78BC00@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible);
  return result;
}

uint64_t sub_21A78BC94()
{
  return sub_21A78BCA8();
}

uint64_t sub_21A78BCA8()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

double sub_21A78BD4C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
}

__n128 sub_21A78BDE0@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  result = *(__n128 *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
  v5 = *(_OWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect + 16);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_21A78BE78()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A78BF38()
{
  return sub_21A78BFC4();
}

uint64_t sub_21A78BF4C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A78C060(a1, &OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor, a2);
}

uint64_t sub_21A78BF60()
{
  return sub_21A78C110();
}

uint64_t sub_21A78BF74()
{
  return sub_21A78BFC4();
}

uint64_t sub_21A78BF88@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A78C060(a1, &OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__borderColor, a2);
}

uint64_t sub_21A78BF9C()
{
  return sub_21A78C110();
}

uint64_t sub_21A78BFB0()
{
  return sub_21A78BFC4();
}

uint64_t sub_21A78BFC4()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A78C04C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A78C060(a1, &OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__backgroundColor, a2);
}

uint64_t sub_21A78C060@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;

  v5 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  *a3 = *(_QWORD *)(v5 + *a2);
  return swift_retain();
}

uint64_t sub_21A78C0FC()
{
  return sub_21A78C110();
}

uint64_t sub_21A78C110()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  swift_retain();
  sub_21A7CF6C0();
  swift_release();
  return swift_release();
}

uint64_t sub_21A78C1CC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
}

uint64_t sub_21A78C258@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
  return result;
}

uint64_t sub_21A78C2EC()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

id sub_21A78C390()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(id *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
}

void sub_21A78C41C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont) = a2;
  v3 = a2;

}

uint64_t sub_21A78C454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[24];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v1 = v0;
  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21A7D02F0();
  swift_getKeyPath();
  *(_QWORD *)&v14 = v0;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v6 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_21A7CF564();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  sub_21A7D02B4();
  swift_getKeyPath();
  *(_QWORD *)&v14 = v1;
  sub_21A7CF6CC();
  swift_release();
  if (*(_QWORD *)(v1 + 104))
  {
    swift_bridgeObjectRetain();
    sub_21A7CFE70();
    swift_bridgeObjectRelease();
    sub_21A7D02B4();
  }
  v16 = v11;
  v17 = v12;
  v18 = v13;
  v14 = v9;
  v15 = v10;
  return sub_21A7D02D8();
}

uint64_t sub_21A78C620(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  __objc2_ivar *v10;
  id v11;
  id v12;
  _OWORD *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  char *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD aBlock[6];

  v69 = a1;
  v70 = a2;
  v3 = sub_21A7CF750();
  v72 = *(_QWORD *)(v3 - 8);
  v73 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v71 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21A7CF57C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_WORD *)(v2 + 112) = 512;
  *(_QWORD *)(v2 + 128) = 0;
  *(_QWORD *)(v2 + 136) = 0;
  *(_QWORD *)(v2 + 120) = 0;
  *(_WORD *)(v2 + 144) = 0;
  v9 = (void *)objc_opt_self();
  swift_retain();
  v10 = &stru_24DD25000;
  v11 = objc_msgSend(v9, sel_sharedInstance);
  v12 = objc_msgSend(v11, sel_hoverTextScrollingSpeed);

  *(_QWORD *)(v2 + 152) = v12;
  sub_21A7CF510();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText, v8, v5);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible) = 0;
  v13 = (_OWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
  *v13 = 0u;
  v13[1] = 0u;
  v14 = objc_msgSend(v9, sel_sharedInstance);
  v15 = objc_msgSend(v14, sel_hoverTextTextColorData);

  if (v15)
  {
    v16 = sub_21A7CF63C();
    v18 = v17;

    v19 = (void *)sub_21A7CF630();
  }
  else
  {
    v19 = 0;
    v16 = 0;
    v18 = 0xF000000000000000;
  }
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_makeFromData_, v19);

  if (v21)
  {
    v22 = MEMORY[0x2207485E8](objc_msgSend(v21, sel_color));

  }
  else
  {
    v22 = sub_21A7CFBDC();
  }
  sub_21A7915AC(v16, v18);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor) = v22;
  v23 = objc_msgSend(v9, sel_sharedInstance);
  v24 = objc_msgSend(v23, sel_hoverTextBorderColorData);

  if (v24)
  {
    v25 = sub_21A7CF63C();
    v27 = v26;

    v28 = (void *)sub_21A7CF630();
  }
  else
  {
    v28 = 0;
    v25 = 0;
    v27 = 0xF000000000000000;
  }
  v29 = objc_msgSend(v20, sel_makeFromData_, v28, v69, v70);

  if (v29)
  {
    v30 = MEMORY[0x2207485E8](objc_msgSend(v29, sel_color));

  }
  else
  {
    v30 = sub_21A7CFBDC();
  }
  sub_21A7915AC(v25, v27);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__borderColor) = v30;
  v31 = objc_msgSend(v9, sel_sharedInstance);
  v32 = objc_msgSend(v31, sel_hoverTextBackgroundColorData);

  if (v32)
  {
    v33 = sub_21A7CF63C();
    v35 = v34;

    v36 = (void *)sub_21A7CF630();
  }
  else
  {
    v36 = 0;
    v33 = 0;
    v35 = 0xF000000000000000;
  }
  v37 = objc_msgSend(v20, sel_makeFromData_, v36);

  if (v37)
  {
    v38 = MEMORY[0x2207485E8](objc_msgSend(v37, sel_color));

  }
  else
  {
    v39 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    MEMORY[0x220748648](v39);
    v40 = objc_msgSend(v9, sel_sharedInstance);
    objc_msgSend(v40, sel_hoverTextBackgroundOpacity);

    v38 = sub_21A7CFBD0();
    swift_release();
  }
  v41 = v71;
  sub_21A7915AC(v33, v35);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__backgroundColor) = v38;
  v42 = objc_msgSend(v9, sel_sharedInstance);
  v43 = objc_msgSend(v42, sel_hoverTextDisplayMode);

  *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode) = v43;
  v44 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, 10.0);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont) = v44;
  sub_21A7CF6F0();
  v45 = v70;
  *(_QWORD *)(v2 + 160) = v69;
  *(_QWORD *)(v2 + 168) = v45;
  swift_release();
  v46 = sub_21A79FECC();
  swift_retain();
  sub_21A78F11C();
  v47 = sub_21A7CF738();
  swift_beginAccess();
  v49 = v72;
  v48 = v73;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v41, v47, v73);
  swift_retain_n();
  v50 = sub_21A7CF744();
  v51 = sub_21A7CFF90();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = swift_slowAlloc();
    *(_DWORD *)v52 = 134218240;
    swift_getKeyPath();
    aBlock[0] = v46;
    sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
    sub_21A7CF6CC();
    swift_release();
    v53 = *(_QWORD *)(v46 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
    swift_release();
    aBlock[0] = v53;
    sub_21A7D0074();
    swift_release();
    *(_WORD *)(v52 + 12) = 2048;
    swift_getKeyPath();
    aBlock[0] = v46;
    sub_21A7CF6CC();
    v41 = v71;
    swift_release();
    v54 = *(_QWORD *)(v46 + 152);
    swift_release();
    aBlock[0] = v54;
    v10 = &stru_24DD25000;
    v49 = v72;
    sub_21A7D0074();
    swift_release();
    _os_log_impl(&dword_21A787000, v50, v51, "Using initial UI properties: displayMode: %ld. Scrolling speed: %ld", (uint8_t *)v52, 0x16u);
    v55 = v52;
    v48 = v73;
    MEMORY[0x22074950C](v55, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v48);
  v56 = (void *)*MEMORY[0x24BED26D0];
  swift_retain();
  sub_21A7A0254(v56, (uint64_t)sub_21A78CFB0, 0);
  swift_release();
  v57 = (void *)*MEMORY[0x24BED2808];
  swift_retain();
  sub_21A7A0254(v57, (uint64_t)sub_21A78CFB0, 0);
  swift_release();
  v58 = (void *)*MEMORY[0x24BED27E8];
  swift_retain();
  sub_21A7A0254(v58, (uint64_t)sub_21A78CFB8, 0);
  swift_release();
  v59 = (void *)*MEMORY[0x24BED2800];
  swift_retain();
  sub_21A7A0254(v59, (uint64_t)sub_21A78CFC0, 0);
  swift_release();
  v60 = (void *)*MEMORY[0x24BED2810];
  swift_retain();
  sub_21A7A0254(v60, (uint64_t)sub_21A78CFC8, 0);
  swift_release();
  v61 = (void *)*MEMORY[0x24BED27D0];
  swift_retain();
  sub_21A7A0254(v61, (uint64_t)sub_21A78CFD0, 0);
  swift_release();
  v62 = (void *)*MEMORY[0x24BED27E0];
  swift_retain();
  sub_21A7A0254(v62, (uint64_t)sub_21A78CFD8, 0);
  swift_release();
  v63 = (void *)*MEMORY[0x24BED27D8];
  swift_retain();
  sub_21A7A0254(v63, (uint64_t)sub_21A78CFE0, 0);
  swift_release();
  v64 = (void *)*MEMORY[0x24BED27F0];
  swift_retain();
  sub_21A7A0254(v64, (uint64_t)sub_21A78CFE8, 0);
  swift_release();
  v65 = objc_msgSend(v9, *(SEL *)&v10[20].align);
  v66 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_21A79189C;
  aBlock[5] = v66;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21A7A6A18;
  aBlock[3] = &block_descriptor;
  v67 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v65, sel_registerUpdateBlock_forRetrieveSelector_withListener_, v67, sub_21A7CF6B4(), v46);
  swift_release();
  _Block_release(v67);

  return v46;
}

uint64_t sub_21A78CFB0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFB8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFC0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFC8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFD0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFD8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFE0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFE8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A78CFF0()
{
  swift_retain();
  sub_21A7CF75C();
  return swift_release();
}

uint64_t sub_21A78D030()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    sub_21A7CF75C();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_21A78D0A4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  NSObject *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t KeyPath;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(_QWORD, _QWORD);
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  int v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  void (*v85)(char *, uint64_t, uint64_t);
  uint64_t v86;
  __int128 v87;
  uint8_t *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92[3];
  _QWORD *v93;
  unint64_t v94;
  id v95;

  v2 = v1;
  v82 = sub_21A7CF57C();
  v81 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v80 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = type metadata accessor for HoverTextPresentationEvent();
  v5 = MEMORY[0x24BDAC7A8](v83);
  v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v77 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v77 - v11;
  v13 = sub_21A7CF750();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v77 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v77 - v20;
  v22 = sub_21A7CF738();
  swift_beginAccess();
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v86 = v22;
  v85 = v23;
  v23(v21, v22, v13);
  v88 = (uint8_t *)a1;
  sub_21A791748(a1, (uint64_t)v12);
  swift_retain_n();
  v24 = sub_21A7CF744();
  v25 = sub_21A7CFF6C();
  if (os_log_type_enabled(v24, (os_log_type_t)v25))
  {
    v78 = v25;
    v84 = v17;
    v89 = v7;
    *(_QWORD *)&v87 = v13;
    v26 = swift_slowAlloc();
    v77 = swift_slowAlloc();
    v92[0] = v77;
    *(_DWORD *)v26 = 136315394;
    swift_getKeyPath();
    v93 = v2;
    sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
    sub_21A7CF6CC();
    swift_release();
    v27 = v2[20];
    v28 = v2[21];
    swift_bridgeObjectRetain();
    v93 = (_QWORD *)sub_21A79C3E4(v27, v28, v92);
    sub_21A7D0074();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    sub_21A791748((uint64_t)v12, (uint64_t)v10);
    __asm { BR              X12 }
  }
  swift_release_n();
  sub_21A79178C((uint64_t)v12);

  v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v21, v13);
  sub_21A791748((uint64_t)v88, (uint64_t)v7);
  HoverTextPresentationEvent.processEvent()();
  if (!v30)
  {
    sub_21A78DEC8();
    v43 = v42;
    v44 = swift_allocObject();
    v89 = v7;
    v45 = v44;
    swift_weakInit();
    type metadata accessor for HoverTextTimer();
    swift_allocObject();
    v46 = sub_21A791D6C((uint64_t)sub_21A791800, v45, v43);
    swift_release();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v77 - 2) = (uint64_t)v2;
    *(&v77 - 1) = v46;
    v92[0] = (uint64_t)v2;
    v48 = sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
    sub_21A7CF6C0();
    swift_release();
    swift_release();
    v49 = v80;
    v50 = v89;
    sub_21A78E670((uint64_t)v89, v80);
    v51 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v51);
    *(&v77 - 2) = (uint64_t)v2;
    *(&v77 - 1) = v49;
    v92[0] = (uint64_t)v2;
    v88 = (uint8_t *)v48;
    sub_21A7CF6C0();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v49, v82);
    v52 = sub_21A78E0A0();
    v53 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v53);
    *(&v77 - 2) = (uint64_t)v2;
    *((_BYTE *)&v77 - 8) = v52 & 1;
    v92[0] = (uint64_t)v2;
    sub_21A7CF6C0();
    swift_release();
    v54 = v83;
    v55 = (uint64_t *)&v50[*(int *)(v83 + 32)];
    v57 = *v55;
    v56 = v55[1];
    v58 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v58);
    *(&v77 - 4) = (uint64_t)v2;
    *(&v77 - 3) = v57;
    *(&v77 - 2) = v56;
    v92[0] = (uint64_t)v2;
    swift_bridgeObjectRetain();
    sub_21A7CF6C0();
    swift_release();
    swift_bridgeObjectRelease();
    v59 = *(int *)(v54 + 36);
    v60 = (void (*)(_QWORD, _QWORD))v89;
    v61 = &v89[v59];
    v87 = *(_OWORD *)v61;
    v62 = *((_QWORD *)v61 + 2);
    v63 = *((_QWORD *)v61 + 3);
    v64 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v64);
    *(&v77 - 6) = (uint64_t)v2;
    *(_OWORD *)(&v77 - 5) = v87;
    *(&v77 - 3) = v62;
    *(&v77 - 2) = v63;
    v92[0] = (uint64_t)v2;
    sub_21A7CF6C0();
    swift_release();
    sub_21A79178C((uint64_t)v60);
    return;
  }
  sub_21A79178C((uint64_t)v7);
  v95 = v30;
  v31 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5DE0);
  if (!swift_dynamicCast())
    goto LABEL_10;
  if (v94 != 1)
  {
    sub_21A7917C8((uint64_t)v93, v94);
LABEL_10:

    v65 = v86;
    swift_beginAccess();
    v85(v17, v65, v13);
    swift_retain();
    v66 = v30;
    swift_retain();
    v67 = v30;
    v68 = sub_21A7CF744();
    v69 = sub_21A7CFF60();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = swift_slowAlloc();
      v84 = v17;
      v71 = v70;
      v72 = swift_slowAlloc();
      v93 = (_QWORD *)v72;
      *(_DWORD *)v71 = 136315394;
      *(_QWORD *)&v87 = v13;
      swift_getKeyPath();
      v95 = v2;
      sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
      v89 = (char *)v29;
      sub_21A7CF6CC();
      swift_release();
      v73 = v2[20];
      v74 = v2[21];
      swift_bridgeObjectRetain();
      v95 = (id)sub_21A79C3E4(v73, v74, (uint64_t *)&v93);
      sub_21A7D0074();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v71 + 12) = 2080;
      swift_getErrorValue();
      v75 = sub_21A7D0260();
      v95 = (id)sub_21A79C3E4(v75, v76, (uint64_t *)&v93);
      sub_21A7D0074();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21A787000, v68, v69, "Store:%s - Will not update display text: %s", (uint8_t *)v71, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22074950C](v72, -1, -1);
      MEMORY[0x22074950C](v71, -1, -1);

      ((void (*)(char *, _QWORD))v89)(v84, v87);
    }
    else
    {

      swift_release_n();
      v29(v17, v13);
    }
    return;
  }

  v32 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v32);
  *(&v77 - 2) = (uint64_t)v2;
  *((_BYTE *)&v77 - 8) = 0;
  v92[0] = (uint64_t)v2;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  swift_release();
  v33 = v86;
  swift_beginAccess();
  v34 = v79;
  v85(v79, v33, v13);
  swift_retain_n();
  v35 = sub_21A7CF744();
  v36 = sub_21A7CFF60();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    *(_QWORD *)&v87 = v13;
    v39 = v38;
    v91 = v38;
    *(_DWORD *)v37 = 136315138;
    v88 = v37 + 4;
    swift_getKeyPath();
    v89 = (char *)v29;
    v90 = (uint64_t)v2;
    sub_21A7CF6CC();
    swift_release();
    v40 = v2[20];
    v41 = v2[21];
    swift_bridgeObjectRetain();
    v90 = sub_21A79C3E4(v40, v41, &v91);
    sub_21A7D0074();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v35, v36, "Store:%s - No display text to show", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v39, -1, -1);
    MEMORY[0x22074950C](v37, -1, -1);

    ((void (*)(char *, _QWORD))v89)(v79, v87);
  }
  else
  {

    swift_release_n();
    v29(v34, v13);
  }

}

uint64_t sub_21A78DEC8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  unsigned int v3;
  uint64_t result;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_hoverTextActivationLockEnabled);

  if (!v3
    || (swift_getKeyPath(),
        sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C), sub_21A7CF6CC(), result = swift_release(), (*(_BYTE *)(v1 + 145) & 1) == 0))
  {
    swift_getKeyPath();
    sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
    sub_21A7CF6CC();
    result = swift_release();
    if ((*(_BYTE *)(v1 + 144) & 1) == 0)
    {
      swift_getKeyPath();
      sub_21A7CF6CC();
      swift_release();
      swift_getKeyPath();
      sub_21A7CF6CC();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_21A78E0A0()
{
  uint64_t v0;
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  id v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v1 = v0;
  v2 = sub_21A7CF750();
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v44 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21A7CF540();
  v41 = *(_QWORD *)(v4 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v39 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - v7;
  v9 = sub_21A7CF504();
  v40 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21A7CF57C();
  v13 = *(_QWORD *)(v12 - 8);
  v38 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v16 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  v50 = v1;
  v42 = sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  v43 = v16;
  sub_21A7CF6CC();
  swift_release();
  v17 = v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  sub_21A7CF4C8();
  sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
  sub_21A7CFF30();
  v18 = v39;
  sub_21A7CFF3C();
  sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
  LOBYTE(v17) = sub_21A7CFDD4();
  v19 = *(void (**)(char *, uint64_t))(v41 + 8);
  v19(v18, v4);
  v19(v8, v4);
  v20 = v1;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v38);
  if ((v17 & 1) == 0)
    goto LABEL_23;
  swift_getKeyPath();
  v49 = v1;
  sub_21A7CF6CC();
  swift_release();
  if (!*(_QWORD *)(v1 + 104))
    goto LABEL_13;
  swift_getKeyPath();
  v49 = v1;
  sub_21A7CF6CC();
  result = swift_release();
  v22 = *(_QWORD *)(v1 + 104);
  if (!v22)
  {
    __break(1u);
    return result;
  }
  if ((v22 & 0x2000000000000000) != 0 ? HIBYTE(v22) & 0xF : *(_QWORD *)(v1 + 96) & 0xFFFFFFFFFFFFLL)
  {
LABEL_23:
    if (GSEventIsHardwareKeyboardAttached())
    {
      v24 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v25 = objc_msgSend(v24, sel_hoverTextActivationLockEnabled);

      v26 = v45;
      v27 = v46;
      v28 = v44;
      if (v25 && (swift_getKeyPath(), v49 = v1, sub_21A7CF6CC(), swift_release(), (*(_BYTE *)(v1 + 145) & 1) != 0))
      {
        v29 = 1;
      }
      else
      {
        swift_getKeyPath();
        v49 = v1;
        sub_21A7CF6CC();
        swift_release();
        v29 = *(unsigned __int8 *)(v1 + 144);
      }
      goto LABEL_16;
    }
    v29 = 1;
  }
  else
  {
LABEL_13:
    v29 = 0;
  }
  v26 = v45;
  v27 = v46;
  v28 = v44;
LABEL_16:
  v30 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v28, v30, v27);
  swift_retain_n();
  v31 = sub_21A7CF744();
  v32 = sub_21A7CFF6C();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc();
    v34 = swift_slowAlloc();
    v48 = v34;
    *(_DWORD *)v33 = 136315394;
    swift_getKeyPath();
    v47 = v20;
    sub_21A7CF6CC();
    swift_release();
    v35 = *(_QWORD *)(v20 + 160);
    v36 = *(_QWORD *)(v20 + 168);
    swift_bridgeObjectRetain();
    v47 = sub_21A79C3E4(v35, v36, &v48);
    sub_21A7D0074();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 1024;
    LODWORD(v47) = v29;
    sub_21A7D0074();
    _os_log_impl(&dword_21A787000, v31, v32, "Store:%s - determineVisibility=%{BOOL}d", (uint8_t *)v33, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v34, -1, -1);
    MEMORY[0x22074950C](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v27);
  }
  return v29;
}

uint64_t sub_21A78E670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;

  v3 = v2;
  v6 = sub_21A7CF534();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21A7CF5E8();
  v29 = *(_QWORD *)(v11 - 8);
  v30 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 28);
  v15 = sub_21A7CF57C();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  v28 = a2;
  v16(a2, v14, v15);
  swift_getKeyPath();
  v26[1] = v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  v33 = v3;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor);
  swift_retain();
  sub_21A7CF5DC();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v33 = v17;
  sub_21A791668();
  swift_retain();
  sub_21A7CF5D0();
  v18 = *MEMORY[0x24BDCC380];
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  v26[0] = v8;
  v27(v10, v18, v8);
  sub_21A7CF528();
  swift_release();
  v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v10, v8);
  v20 = v30;
  v21 = *(void (**)(char *, uint64_t))(v29 + 8);
  v21(v13, v30);
  swift_getKeyPath();
  v33 = v3;
  sub_21A7CF6CC();
  swift_release();
  v22 = *(id *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  v23 = sub_21A7CFA68();
  sub_21A7CF5DC();
  v31 = swift_getKeyPath();
  swift_getKeyPath();
  v33 = v23;
  sub_21A7916EC();
  swift_retain();
  sub_21A7CF5D0();
  v24 = v26[0];
  v27(v10, v18, v26[0]);
  sub_21A7CF528();
  swift_release();
  v19(v10, v24);
  return ((uint64_t (*)(char *, uint64_t))v21)(v13, v20);
}

void sub_21A78E974(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  unint64_t v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  _BYTE v33[16];
  uint64_t v34;

  v2 = v1;
  v4 = sub_21A7CF750();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_21A7CF744();
  v10 = sub_21A7CFF90();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21A787000, v9, v10, "Will update UI properties", v11, 2u);
    MEMORY[0x22074950C](v11, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      sub_21A78F11C();
      return;
    case 3:
      v18 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v19 = objc_msgSend(v18, sel_hoverTextTextColorData);

      if (v19)
      {
        v15 = sub_21A7CF63C();
        v17 = v20;

        v19 = (id)sub_21A7CF630();
      }
      else
      {
        v15 = 0;
        v17 = 0xF000000000000000;
      }
      v32 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v19);

      if (v32)
        goto LABEL_23;
      v29 = sub_21A7A0CF4(3);
      goto LABEL_26;
    case 4:
      v21 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v22 = objc_msgSend(v21, sel_hoverTextBorderColorData);

      if (v22)
      {
        v15 = sub_21A7CF63C();
        v17 = v23;

        v22 = (id)sub_21A7CF630();
      }
      else
      {
        v15 = 0;
        v17 = 0xF000000000000000;
      }
      v32 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v22);

      if (v32)
      {
LABEL_23:
        v29 = MEMORY[0x2207485E8](objc_msgSend(v32, sel_color));

      }
      else
      {
        v29 = sub_21A7A0CF4(4);
      }
      goto LABEL_26;
    case 5:
    case 6:
      v12 = (void *)objc_opt_self();
      v13 = objc_msgSend(v12, sel_sharedInstance);
      v14 = objc_msgSend(v13, sel_hoverTextBackgroundColorData);

      if (v14)
      {
        v15 = sub_21A7CF63C();
        v17 = v16;

        v14 = (id)sub_21A7CF630();
      }
      else
      {
        v15 = 0;
        v17 = 0xF000000000000000;
      }
      v28 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v14);

      if (v28)
      {
        v29 = MEMORY[0x2207485E8](objc_msgSend(v28, sel_color));

      }
      else
      {
        v30 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
        MEMORY[0x220748648](v30);
        v31 = objc_msgSend(v12, sel_sharedInstance);
        objc_msgSend(v31, sel_hoverTextBackgroundOpacity);

        v29 = sub_21A7CFBD0();
        swift_release();
      }
LABEL_26:
      sub_21A7915AC(v15, v17);
      swift_getKeyPath();
      MEMORY[0x24BDAC7A8]();
      *(_QWORD *)&v33[-16] = v2;
      *(_QWORD *)&v33[-8] = v29;
      v34 = v2;
      sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
      sub_21A7CF6C0();
      swift_release();
      goto LABEL_27;
    case 7:
      v24 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v25 = objc_msgSend(v24, sel_hoverTextDisplayMode);

      swift_getKeyPath();
      MEMORY[0x24BDAC7A8]();
      *(_QWORD *)&v33[-16] = v2;
      *(_QWORD *)&v33[-8] = v25;
      v34 = v2;
      sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
      goto LABEL_13;
    case 9:
      v26 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v27 = objc_msgSend(v26, sel_hoverTextScrollingSpeed);

      swift_getKeyPath();
      MEMORY[0x24BDAC7A8]();
      *(_QWORD *)&v33[-16] = v2;
      *(_QWORD *)&v33[-8] = v27;
      v34 = v2;
      sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
LABEL_13:
      sub_21A7CF6C0();
LABEL_27:
      swift_release();
      break;
    default:
      return;
  }
}

void sub_21A78F11C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  os_log_type_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;

  v1 = v0;
  v2 = sub_21A7CF750();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_sharedInstance);
  v8 = objc_msgSend(v7, sel_hoverTextContentSize);

  sub_21A7CFE04();
  if (v8)

  v9 = (void *)sub_21A7CFDE0();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, v9);

  v11 = (void *)objc_opt_self();
  v12 = *MEMORY[0x24BEBE1D0];
  v50 = v10;
  v13 = objc_msgSend(v11, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, v12, v10);
  v14 = objc_msgSend(v6, sel_sharedInstance);
  v15 = objc_msgSend(v14, sel_hoverTextFontName);

  if (!v15)
    goto LABEL_5;
  sub_21A7CFE04();

  objc_msgSend(v13, sel_pointSize);
  v17 = v16;
  v18 = (void *)sub_21A7CFDE0();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v11, sel_fontWithName_size_, v18, v17);

  if (!v19)
LABEL_5:
    v19 = v13;
  v49 = v13;
  v20 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v20, v2);
  v21 = v19;
  v22 = v2;
  v23 = v3;
  v24 = sub_21A7CF744();
  v25 = v5;
  v26 = sub_21A7CFF6C();
  if (os_log_type_enabled(v24, v26))
  {
    v45 = v25;
    v46 = v23;
    v47 = v22;
    v48 = v1;
    v27 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v52 = v44;
    *(_DWORD *)v27 = 136315906;
    v28 = objc_msgSend(v6, sel_sharedInstance);
    v29 = objc_msgSend(v28, sel_hoverTextContentSize);

    if (v29)
    {
      v30 = sub_21A7CFE04();
      v32 = v31;

    }
    else
    {
      v32 = 0xEB00000000646569;
      v30 = 0x6669636570736E75;
    }
    v51 = sub_21A79C3E4(v30, v32, &v52);
    sub_21A7D0074();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2048;
    objc_msgSend(v21, sel_pointSize);
    v51 = v33;
    sub_21A7D0074();

    *(_WORD *)(v27 + 22) = 2080;
    v34 = objc_msgSend(v21, sel_fontName);
    v35 = sub_21A7CFE04();
    v37 = v36;

    v51 = sub_21A79C3E4(v35, v37, &v52);
    sub_21A7D0074();

    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 32) = 2080;
    v38 = objc_msgSend(v21, sel_familyName);
    v39 = sub_21A7CFE04();
    v41 = v40;

    v51 = sub_21A79C3E4(v39, v41, &v52);
    sub_21A7D0074();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v24, v26, "Using font. ContentSize=%s PointSize=%f Name=%s Family=%s", (uint8_t *)v27, 0x2Au);
    v42 = v44;
    swift_arrayDestroy();
    MEMORY[0x22074950C](v42, -1, -1);
    MEMORY[0x22074950C](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
    v1 = v48;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  }
  swift_getKeyPath();
  MEMORY[0x24BDAC7A8]();
  *(&v43 - 2) = v1;
  *(&v43 - 1) = (uint64_t)v21;
  v52 = v1;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();

  swift_release();
}

uint64_t sub_21A78F714()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  swift_getKeyPath();
  sub_21A7CF6E4();
  swift_release();
  *(_BYTE *)(v0 + 145) = (*(_BYTE *)(v0 + 145) & 1) == 0;
  swift_getKeyPath();
  sub_21A7CF6D8();
  swift_release();
  sub_21A78E0A0();
  swift_getKeyPath();
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A78F86C()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  swift_release();
  sub_21A78E0A0();
  swift_getKeyPath();
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A78F988()
{
  uint64_t KeyPath;

  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A78FA84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  v2 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();

  v3 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  v4 = sub_21A7CF6FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t sub_21A78FB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_21A7A0688();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  v2 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();

  v3 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  v4 = sub_21A7CF6FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_21A78FC20()
{
  sub_21A78FB40();
  return swift_deallocClassInstance();
}

uint64_t sub_21A78FC44()
{
  return sub_21A78C454();
}

uint64_t sub_21A78FC64()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible);
}

uint64_t sub_21A78FCF0()
{
  return sub_21A78FD18();
}

uint64_t sub_21A78FD04()
{
  return sub_21A78FD18();
}

uint64_t sub_21A78FD18()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A78FDA4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
}

double sub_21A78FE30()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
}

uint64_t sub_21A78FEC4()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v0, sel_hoverTextDisplayMode);

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

void sub_21A78FF9C(char a1)
{
  sub_21A78E974(a1);
}

void sub_21A78FFBC(uint64_t a1)
{
  sub_21A78D0A4(a1);
}

uint64_t sub_21A78FFDC()
{
  return sub_21A78F714();
}

uint64_t sub_21A78FFFC()
{
  return sub_21A78F86C();
}

uint64_t sub_21A79001C()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7900D0()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A790178()
{
  return sub_21A78F988();
}

uint64_t sub_21A7901AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = sub_21A7CF750();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    v6 = sub_21A7CF738();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
    swift_retain_n();
    v7 = sub_21A7CF744();
    v8 = sub_21A7CFF60();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17 = v15;
      *(_DWORD *)v9 = 136315138;
      v14[1] = v9 + 4;
      swift_getKeyPath();
      v16 = v5;
      sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
      sub_21A7CF6CC();
      swift_release();
      v10 = *(_QWORD *)(v5 + 160);
      v11 = *(_QWORD *)(v5 + 168);
      swift_bridgeObjectRetain();
      v16 = sub_21A79C3E4(v10, v11, &v17);
      sub_21A7D0074();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21A787000, v7, v8, "Store:%s - Idle timer fired. Hiding HoverText HUD", v9, 0xCu);
      v12 = v15;
      swift_arrayDestroy();
      MEMORY[0x22074950C](v12, -1, -1);
      MEMORY[0x22074950C](v9, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v14[-2] = v5;
    LOBYTE(v14[-1]) = 0;
    v17 = v5;
    sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
    sub_21A7CF6C0();
    swift_release();
    return swift_release();
  }
  return result;
}

id variable initialization expression of HoverTextTimer.timer()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF40]), sel_init);
}

uint64_t variable initialization expression of HoverTextRootViewController.elementVisualUpdatedTimer()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextRootViewController.showStatusAlertForActivationLockDidChange()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.valueChangeEventType()
{
  return 12;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.displayText()
{
  return sub_21A7CF510();
}

uint64_t variable initialization expression of HoverTextPresentationEvent.secondaryText()
{
  return 0;
}

double variable initialization expression of HoverTextPresentationEvent.anchorRect()
{
  return 0.0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.displayMode()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.selectedTextRange()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.paragraphIndex()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.axAttributedString()
{
  return 0;
}

double variable initialization expression of HoverTextMarqueeingContentView.feathering()
{
  return 12.0;
}

uint64_t variable initialization expression of HoverTextMarqueeingContentView._direction@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  return swift_storeEnumTagMultiPayload();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074944C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double variable initialization expression of HoverTextMarqueeingContentView._contentSize()
{
  return 0.0;
}

double variable initialization expression of HoverTextMarqueeingContentView._needsScrolling()
{
  return 0.0;
}

uint64_t variable initialization expression of HoverTextMarqueeingContentView._resetScrollingID()
{
  return 0;
}

id variable initialization expression of HoverTextCoordinator.axRuntimeClient()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v8;

  v0 = sub_21A7CF750();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v6 = objc_allocWithZone((Class)type metadata accessor for AXRuntimeClient());
  return AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)((uint64_t)v3, (uint64_t)&unk_24DD20A88, (uint64_t)v5);
}

id variable initialization expression of HoverTextCoordinator.eventHandler()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HoverTextEventHandler()), sel_init);
}

uint64_t variable initialization expression of HoverTextCoordinator.service()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextCoordinator.$__lazy_storage_$_displayManager()
{
  return 0;
}

unint64_t variable initialization expression of HoverTextCoordinator.externalViewControllers()
{
  return sub_21A7A5610(MEMORY[0x24BEE4AF8]);
}

uint64_t variable initialization expression of HoverTextCoordinator.knownExternalDisplayScenes()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of HoverTextCoordinator.mainDisplayViewController()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextCoordinator.currentStatusAlertID()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextCoordinator.isRunning()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.nativeFocusItemDidChange()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.valueChanged()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.elementVisualsUpdated()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.focusedApplicationsDidChange()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.didReceiveAnnouncement()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.keyboardWillHide()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.currentInputModeDidChange()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.keyboardWillChangeFrame()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.loupeStateChanged()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.updateTypingDisplayMode()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.didReceiveNotification()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient._isEnabled()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.axObserver()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.pasteOccurred()
{
  return 0;
}

uint64_t sub_21A7907E4()
{
  return type metadata accessor for HoverTextStore();
}

uint64_t type metadata accessor for HoverTextStore()
{
  uint64_t result;

  result = qword_2550F5680;
  if (!qword_2550F5680)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A790828()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21A7CF57C();
  if (v1 <= 0x3F)
  {
    result = sub_21A7CF6FC();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

void type metadata accessor for AXEventKeyModifierState(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5CF0);
}

void type metadata accessor for AXSHoverTextPreferredActivatorKey(uint64_t a1)
{
  sub_21A7918D0(a1, (unint64_t *)&unk_2550F5CF8);
}

void type metadata accessor for AXNotification(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_253F22ED0);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D08);
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D10);
}

uint64_t initializeBufferWithCopyOfBuffer for FocusChange(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_21A7909D4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21A7909F4(uint64_t result, int a2, int a3)
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
  sub_21A7918D0(a1, &qword_2550F5D18);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D20);
}

void type metadata accessor for AXHoverTextDisplayMode(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D28);
}

void type metadata accessor for AXSHoverTextScrollingSpeed(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D30);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D38);
}

void type metadata accessor for AXError(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D40);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D48);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5D50);
}

uint64_t sub_21A790ACC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21A790AEC(uint64_t result, int a2, int a3)
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
  sub_21A7918D0(a1, &qword_2550F5D58);
}

BOOL sub_21A790B28(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_21A790B3C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21A790B4C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21A790B58(uint64_t a1)
{
  MEMORY[0x220749464](&unk_21A7D133C, a1);
  return sub_21A7CF720();
}

uint64_t sub_21A790B94()
{
  MEMORY[0x220749464](&unk_21A7D133C);
  return sub_21A7CF714();
}

uint64_t sub_21A790BDC(uint64_t a1, uint64_t a2)
{
  sub_21A7D02A8();
  MEMORY[0x220749464](&unk_21A7D133C, a2);
  sub_21A7CF714();
  return sub_21A7D02E4();
}

uint64_t sub_21A790C34(uint64_t a1, uint64_t a2)
{
  return sub_21A790D7C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_21A790C40(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21A7CFDEC();
  *a2 = 0;
  return result;
}

uint64_t sub_21A790CB4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21A7CFDF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21A790D30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_21A7CFE04();
  v2 = sub_21A7CFDE0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21A790D70(uint64_t a1, uint64_t a2)
{
  return sub_21A790D7C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0CD8]);
}

uint64_t sub_21A790D7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21A7CFE04();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21A790DB8()
{
  sub_21A7CFE04();
  sub_21A7CFE1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A790DF8()
{
  uint64_t v0;

  sub_21A7CFE04();
  sub_21A7D02A8();
  sub_21A7CFE1C();
  v0 = sub_21A7D02E4();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_21A790E68(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_21A790E70@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_DWORD *sub_21A790E84@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_DWORD *sub_21A790E98@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_21A790EAC(_DWORD *a1, int *a2)
{
  _DWORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_21A790EDC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v3 == 0;
  return result;
}

int *sub_21A790F08@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *sub_21A790F2C(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *sub_21A790F40(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

_DWORD *sub_21A790F54(_DWORD *result)
{
  _DWORD *v1;

  *v1 ^= *result;
  return result;
}

_DWORD *sub_21A790F68@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_21A790F7C(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_21A790F90(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_21A790FA4(_DWORD *a1)
{
  _DWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_21A790FB8()
{
  _DWORD *v0;

  return *v0 == 0;
}

uint64_t sub_21A790FC8()
{
  return sub_21A7D00B0();
}

_DWORD *sub_21A790FE0(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= ~*result;
  return result;
}

_DWORD *sub_21A790FF4@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21A791000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x220749464](&unk_21A7D133C, a3);
  return sub_21A7CF708();
}

uint64_t sub_21A79104C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_21A7CFE04();
  v2 = v1;
  if (v0 == sub_21A7CFE04() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21A7D023C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_21A7910D4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21A7910E8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3;
  uint64_t result;

  v3 = sub_21A7914A0(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_DWORD *sub_21A791124@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_21A791134(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21A791140@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21A7CFDE0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21A791184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_21A7CFE04();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21A7911AC()
{
  sub_21A791288(&qword_2550F5DB0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D1558);
  sub_21A791288(&qword_2550F5DB8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D11B0);
  return sub_21A7D020C();
}

uint64_t sub_21A791230()
{
  return sub_21A791288(&qword_2550F5D60, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D1174);
}

uint64_t sub_21A79125C()
{
  return sub_21A791288(&qword_2550F5D68, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D1148);
}

uint64_t sub_21A791288(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220749464](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A7912C8()
{
  return sub_21A791288(&qword_2550F5D70, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21A7D12CC);
}

uint64_t sub_21A7912F4()
{
  return sub_21A791288(&qword_2550F5D78, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21A7D12F8);
}

uint64_t sub_21A791320()
{
  return sub_21A791288(&qword_2550F5D80, (uint64_t (*)(uint64_t))type metadata accessor for AXEventKeyModifierState, (uint64_t)&unk_21A7D13BC);
}

uint64_t sub_21A79134C()
{
  return sub_21A791288(&qword_2550F5D88, (uint64_t (*)(uint64_t))type metadata accessor for AXEventKeyModifierState, (uint64_t)&unk_21A7D1388);
}

uint64_t sub_21A791378()
{
  return sub_21A791288(&qword_2550F5D90, (uint64_t (*)(uint64_t))type metadata accessor for AXEventKeyModifierState, (uint64_t)&unk_21A7D13E8);
}

uint64_t sub_21A7913A4()
{
  return sub_21A791288(&qword_2550F5D98, (uint64_t (*)(uint64_t))type metadata accessor for AXEventKeyModifierState, (uint64_t)&unk_21A7D1424);
}

uint64_t sub_21A7913D0()
{
  return sub_21A791288(&qword_2550F5DA0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D11E4);
}

void sub_21A7913FC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 112) = *(_BYTE *)(v0 + 24);
}

__n128 sub_21A79140C()
{
  uint64_t v0;
  __n128 result;

  result = *(__n128 *)(v0 + 24);
  *(__n128 *)(*(_QWORD *)(v0 + 16) + 120) = result;
  return result;
}

void sub_21A79141C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode) = *(_QWORD *)(v0 + 24);
}

__n128 sub_21A791430()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect;
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_21A791450()
{
  return sub_21A791620(&OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__backgroundColor);
}

uint64_t sub_21A79146C()
{
  return sub_21A791620(&OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__borderColor);
}

void sub_21A791488()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_21A7914A0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = (int *)(v2 + 32);
  do
  {
    v5 = *v3++;
    v4 = v5;
    if ((v5 & ~(_DWORD)result) == 0)
      v4 = 0;
    result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

void sub_21A7914D8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 113) = *(_BYTE *)(v0 + 24);
}

void sub_21A7914E8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 144) = *(_BYTE *)(v0 + 24);
}

void sub_21A791508()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 145) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_21A791518()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[4];
  *(_QWORD *)(v1 + 160) = v0[3];
  *(_QWORD *)(v1 + 168) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_21A79155C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont) = v2;
  v4 = v2;

}

void sub_21A7915A0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 152) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_21A7915AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21A7915C0(a1, a2);
  return a1;
}

uint64_t sub_21A7915C0(uint64_t a1, unint64_t a2)
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

uint64_t sub_21A791604()
{
  return sub_21A791620(&OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor);
}

uint64_t sub_21A791620(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v1 + 16) + *a1) = *(_QWORD *)(v1 + 24);
  swift_retain();
  return swift_release();
}

unint64_t sub_21A791668()
{
  unint64_t result;

  result = qword_2550F5DD0;
  if (!qword_2550F5DD0)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BDEACB8], MEMORY[0x24BDEACC8]);
    atomic_store(result, (unint64_t *)&qword_2550F5DD0);
  }
  return result;
}

uint64_t sub_21A7916B0()
{
  return 8;
}

uint64_t sub_21A7916BC()
{
  return swift_release();
}

uint64_t sub_21A7916C4(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_21A7916D8(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_21A7916EC()
{
  unint64_t result;

  result = qword_2550F5DD8;
  if (!qword_2550F5DD8)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BDEACD0], MEMORY[0x24BDEACE0]);
    atomic_store(result, (unint64_t *)&qword_2550F5DD8);
  }
  return result;
}

uint64_t sub_21A791734()
{
  return 8;
}

uint64_t sub_21A791748(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A79178C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A7917C8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 4)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_21A7917DC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A791800()
{
  return sub_21A7901AC();
}

uint64_t sub_21A791810()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 136) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_21A791848()
{
  uint64_t v0;

  return sub_21A78BAF8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21A791860()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[4];
  *(_QWORD *)(v1 + 96) = v0[3];
  *(_QWORD *)(v1 + 104) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A79189C()
{
  return sub_21A78D030();
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

void type metadata accessor for AXUIElementRef(uint64_t a1)
{
  sub_21A7918D0(a1, &qword_2550F5DE8);
}

void sub_21A7918D0(uint64_t a1, unint64_t *a2)
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

void sub_21A791914()
{
  sub_21A791488();
}

void sub_21A791928()
{
  sub_21A7914D8();
}

double sub_21A791958()
{
  double result;

  *(_QWORD *)&result = sub_21A79140C().n128_u64[0];
  return result;
}

void sub_21A79196C()
{
  sub_21A79141C();
}

double sub_21A791984()
{
  double result;

  *(_QWORD *)&result = sub_21A791430().n128_u64[0];
  return result;
}

void sub_21A79199C()
{
  sub_21A7913FC();
}

void sub_21A7919B0()
{
  sub_21A7914E8();
}

uint64_t HoverTextTimer.deinit()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = v1;
    if (objc_msgSend(v2, sel_isValid))
      objc_msgSend(v2, sel_invalidate);

  }
  swift_release();
  return v0;
}

uint64_t HoverTextTimer.__deallocating_deinit()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = v1;
    if (objc_msgSend(v2, sel_isValid))
      objc_msgSend(v2, sel_invalidate);

  }
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HoverTextTimer()
{
  return objc_opt_self();
}

uint64_t sub_21A791AAC()
{
  uint64_t result;
  void (*v1)(uint64_t);
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(void (**)(uint64_t))(result + 24);
    swift_retain();
    v2 = swift_release();
    v1(v2);
    return swift_release();
  }
  return result;
}

void sub_21A791B1C()
{
  uint64_t v0;
  void *v1;
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[6];

  v1 = *(void **)(v0 + 16);
  if (v1 && (objc_msgSend(v1, sel_isValid) & 1) == 0)
  {
    v2 = *(double *)(v0 + 40);
    if (v2 > 0.0)
    {
      v3 = (void *)objc_opt_self();
      v4 = swift_allocObject();
      swift_weakInit();
      v8[4] = sub_21A791D4C;
      v8[5] = v4;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 1107296256;
      v8[2] = sub_21A795378;
      v8[3] = &block_descriptor_0;
      v5 = _Block_copy(v8);
      swift_release();
      v6 = objc_msgSend(v3, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v5, v2);
      _Block_release(v5);
      v7 = *(void **)(v0 + 16);
      *(_QWORD *)(v0 + 16) = v6;

    }
  }
}

void sub_21A791C2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  v1 = sub_21A7CF66C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v0 + 16);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v6, sel_isValid))
    {
      v7 = objc_msgSend(v6, sel_fireDate);
      sub_21A7CF654();

      sub_21A7CF648();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    else
    {

    }
  }
}

uint64_t sub_21A791D28()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A791D4C()
{
  return sub_21A791AAC();
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

uint64_t sub_21A791D6C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];

  *(_QWORD *)(v3 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF40]), sel_init);
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  v7 = (void *)objc_opt_self();
  v8 = swift_allocObject();
  swift_weakInit();
  v13[4] = sub_21A791D4C;
  v13[5] = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_21A795378;
  v13[3] = &block_descriptor_5;
  v9 = _Block_copy(v13);
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v9, a3);
  _Block_release(v9);
  v11 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v10;

  return v3;
}

uint64_t sub_21A791EA4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F60);
  v43 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F70);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v10);
  v44 = (char *)&v36 - v13;
  v14 = sub_21A7CF57C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v46 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v37 = (char *)&v36 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v36 - v20;
  swift_bridgeObjectRetain();
  v39 = v21;
  sub_21A7CF510();
  v45 = a2;
  sub_21A7CF570();
  v22 = *(_QWORD *)(a1 + 16);
  v40 = a1;
  v41 = v22 - 1;
  result = swift_bridgeObjectRetain();
  v24 = 0;
  v25 = 0;
  v42 = v22;
  while (1)
  {
    v47 = v24;
    if (v25 == v22)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v8, 1, 1, v14);
      v25 = v22;
LABEL_7:
      sub_21A792438((uint64_t)v8);
      v26 = 1;
      v27 = v44;
      goto LABEL_10;
    }
    if (v25 >= v22)
      break;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v8, v40+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v25++, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v8, 0, 1, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) == 1)
      goto LABEL_7;
    v28 = v25;
    v29 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v30 = v37;
    v29(v37, v8, v14);
    v31 = &v38[*(int *)(v4 + 48)];
    result = ((uint64_t (*)(char *, char *, uint64_t))v29)(v31, v30, v14);
    v32 = v47 + 1;
    if (__OFADD__(v47, 1))
      goto LABEL_15;
    v33 = (char *)v12 + *(int *)(v4 + 48);
    *v12 = v47;
    v29(v33, v31, v14);
    v26 = 0;
    v47 = v32;
    v27 = v44;
    v25 = v28;
LABEL_10:
    v34 = v43;
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v12, v26, 1, v4);
    sub_21A792478((uint64_t)v12, (uint64_t)v27);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v27, 1, v4) == 1)
    {
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v39, v14);
    }
    v35 = *(_QWORD *)v27;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v46, &v27[*(int *)(v4 + 48)], v14);
    sub_21A7924C0();
    sub_21A7CF54C();
    if (v35 != v41)
      sub_21A7CF54C();
    result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v46, v14);
    v22 = v42;
    v24 = v47;
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

void sub_21A792278(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;

  v3 = sub_21A7CF57C();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  v6 = sub_21A7CFABC();
  v8 = v7;
  v10 = v9 & 1;
  v11 = a1;
  sub_21A7CFA68();
  v12 = sub_21A7CFA74();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  swift_release();
  sub_21A792428(v6, v8, v10);
  swift_bridgeObjectRelease();
  v25[1] = v12;
  v25[2] = v14;
  v26 = v16 & 1;
  v27 = v18;
  v19 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F58));
  v20 = (void *)sub_21A7CF9CC();
  v21 = objc_msgSend(v20, sel_view);
  if (v21)
  {
    v22 = v21;
    objc_msgSend(v21, sel_setNeedsLayout);

    v23 = objc_msgSend(v20, sel_view);
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v23, sel_layoutIfNeeded);

      sub_21A7CF9C0();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_21A792428(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_21A792438(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A792478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21A7924C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550F5F78;
  if (!qword_2550F5F78)
  {
    v1 = sub_21A7CF57C();
    result = MEMORY[0x220749464](MEMORY[0x24BDCC588], v1);
    atomic_store(result, (unint64_t *)&qword_2550F5F78);
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTypingHUDView()
{
  return &type metadata for HoverTypingHUDView;
}

uint64_t sub_21A792518()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A792528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v19;
  uint64_t v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  const __CTFont *v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  const __CTFont *v35;
  char *v36;
  __int128 v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGRect v48;

  v44 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F80);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F88);
  v6 = MEMORY[0x24BDAC7A8](v43);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v39 - v9;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F90);
  MEMORY[0x24BDAC7A8](v40);
  v42 = (uint64_t)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F98);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5FA0);
  v15 = MEMORY[0x24BDAC7A8](v41);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v39 - v18;
  swift_getKeyPath();
  *(_QWORD *)&v45 = a1;
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  if (*(_BYTE *)(a1 + 128) == 1)
  {
    *(_QWORD *)v14 = sub_21A7CF96C();
    *((_QWORD *)v14 + 1) = 0;
    v14[16] = 1;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6030);
    sub_21A794208(a1, (uint64_t)&v14[*(int *)(v20 + 44)]);
    v21 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v21, sel_bounds);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v48.origin.x = UIEdgeInsetsInsetRect(v23, v25, v27, v29, *(double *)(a1 + 32), *(double *)(a1 + 40));
    CGRectGetWidth(v48);
    swift_getKeyPath();
    *(_QWORD *)&v45 = a1;
    sub_21A7CF6CC();
    swift_release();
    v30 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    CTFontGetAscent(v30);
    CTFontGetDescent(v30);
    CTFontGetLeading(v30);

    sub_21A7CFCA8();
    sub_21A7CF840();
    sub_21A795080((uint64_t)v14, (uint64_t)v17, &qword_2550F5F98);
    v31 = &v17[*(int *)(v41 + 36)];
    v32 = v46;
    *(_OWORD *)v31 = v45;
    *((_OWORD *)v31 + 1) = v32;
    *((_OWORD *)v31 + 2) = v47;
    sub_21A7950C4((uint64_t)v14, &qword_2550F5F98);
    sub_21A795014((uint64_t)v17, (uint64_t)v19, &qword_2550F5FA0);
    sub_21A795080((uint64_t)v19, v42, &qword_2550F5FA0);
    swift_storeEnumTagMultiPayload();
    sub_21A794EA4(&qword_2550F5FB0, &qword_2550F5FA0, &qword_2550F5FB8, &qword_2550F5F98);
    sub_21A7951D8(&qword_2550F5FC0, &qword_2550F5F88, (uint64_t (*)(void))sub_21A794D10, MEMORY[0x24BDEBEE0]);
    sub_21A7CF9F0();
    v33 = (uint64_t)v19;
    v34 = &qword_2550F5FA0;
  }
  else
  {
    sub_21A792ACC((double *)a1, (uint64_t)v5);
    swift_getKeyPath();
    *(_QWORD *)&v45 = a1;
    sub_21A7CF6CC();
    swift_release();
    v35 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    CTFontGetAscent(v35);
    CTFontGetDescent(v35);
    CTFontGetLeading(v35);

    sub_21A7CFCA8();
    sub_21A7CF840();
    sub_21A795080((uint64_t)v5, (uint64_t)v8, &qword_2550F5F80);
    v36 = &v8[*(int *)(v43 + 36)];
    v37 = v46;
    *(_OWORD *)v36 = v45;
    *((_OWORD *)v36 + 1) = v37;
    *((_OWORD *)v36 + 2) = v47;
    sub_21A7950C4((uint64_t)v5, &qword_2550F5F80);
    sub_21A795014((uint64_t)v8, (uint64_t)v10, &qword_2550F5F88);
    sub_21A795080((uint64_t)v10, v42, &qword_2550F5F88);
    swift_storeEnumTagMultiPayload();
    sub_21A794EA4(&qword_2550F5FB0, &qword_2550F5FA0, &qword_2550F5FB8, &qword_2550F5F98);
    sub_21A7951D8(&qword_2550F5FC0, &qword_2550F5F88, (uint64_t (*)(void))sub_21A794D10, MEMORY[0x24BDEBEE0]);
    sub_21A7CF9F0();
    v33 = (uint64_t)v10;
    v34 = &qword_2550F5F88;
  }
  return sub_21A7950C4(v33, v34);
}

uint64_t sub_21A792ACC@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
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
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  char *v28;
  uint64_t v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGRect v34;

  v30[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6008);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5FF8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5FE8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_21A7CF96C();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60A8);
  sub_21A792DA4(a1, &v5[*(int *)(v12 + 44)]);
  v13 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v13, sel_bounds);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v34.origin.x = UIEdgeInsetsInsetRect(v15, v17, v19, v21, a1[4], a1[5]);
  CGRectGetWidth(v34);
  sub_21A79369C((uint64_t)a1);
  sub_21A7CF840();
  sub_21A795080((uint64_t)v5, (uint64_t)v8, &qword_2550F6008);
  v22 = &v8[*(int *)(v6 + 36)];
  v23 = v32;
  *(_OWORD *)v22 = v31;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v33;
  sub_21A7950C4((uint64_t)v5, &qword_2550F6008);
  v24 = sub_21A7CFCA8();
  v26 = v25;
  swift_getKeyPath();
  v30[1] = (uint64_t)a1;
  sub_21A7948B8();
  swift_retain();
  sub_21A7CF6CC();
  swift_release();
  if (a1[15] == 0.0)
    v27 = 1.0;
  else
    v27 = 0.0;
  sub_21A795080((uint64_t)v8, (uint64_t)v11, &qword_2550F5FF8);
  v28 = &v11[*(int *)(v9 + 36)];
  *(_QWORD *)v28 = a1;
  *((double *)v28 + 1) = v27;
  *((_QWORD *)v28 + 2) = v24;
  *((_QWORD *)v28 + 3) = v26;
  sub_21A7950C4((uint64_t)v8, &qword_2550F5FF8);
  sub_21A794020((uint64_t (*)(uint64_t))sub_21A795070, (uint64_t)sub_21A795078, v30[0]);
  return sub_21A7950C4((uint64_t)v11, &qword_2550F5FE8);
}

uint64_t sub_21A792DA4@<X0>(double *a1@<X0>, _QWORD *a2@<X8>)
{
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
  char *v15;
  _QWORD *v16;
  BOOL v17;
  char *v18;
  char *v19;
  id v20;
  double v21;
  double v22;
  char *v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char *v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  int v38;
  uint64_t v39;
  double v40;
  const __CTFont *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  id v57;
  double v58;
  double v59;
  double v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  char v70;
  char v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  _QWORD *v74;
  uint64_t v75;
  char *v76;
  void (*v77)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  char *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  double v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  CGRect v123;
  CGRect v124;

  v100 = a2;
  v95 = sub_21A7CFA08();
  v94 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v93 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60C8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v97 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v92 = (char *)&v79 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v79 - v10;
  v12 = sub_21A7CF57C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v102 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v15 = (char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v103 = (uint64_t)a1;
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  v89 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL;
  v16 = &unk_2550F6000;
  v17 = *((_BYTE *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) == 1;
  v101 = v15;
  v99 = v4;
  v98 = v5;
  v96 = v11;
  if (!v17)
    goto LABEL_5;
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  v18 = (char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v19 = v102;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v102, v18, v12);
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  v20 = *(id *)((char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_21A792278(v20);
  v22 = v21;

  v23 = v19;
  v16 = (_QWORD *)&unk_2550F6000;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v23, v12);
  v24 = v22 + 2.0;
  v25 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v25, sel_bounds);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v123.origin.x = UIEdgeInsetsInsetRect(v27, v29, v31, v33, a1[4], a1[5]);
  if (v24 < CGRectGetWidth(v123) * 0.85)
  {
    v91 = 0;
    v34 = (char *)&v117;
  }
  else
  {
LABEL_5:
    v90 = 0;
    v34 = (char *)&v117 + 4;
  }
  *((_DWORD *)v34 - 64) = 1;
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  v35 = (char *)a1 + v16[360];
  swift_beginAccess();
  v36 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v84 = v35;
  v83 = v36;
  v36(v102, v35, v12);
  v87 = sub_21A7CFABC();
  v86 = v37;
  v85 = v38;
  v88 = v39;
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  if (a1[15] == 0.0)
    v40 = 1.0;
  else
    v40 = 0.0;
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  v82 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  v41 = (const __CTFont *)*(id *)((char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  CTFontGetAscent(v41);
  CTFontGetDescent(v41);
  CTFontGetLeading(v41);

  sub_21A7CFCA8();
  v81 = v12;
  sub_21A7CF840();
  v42 = v117;
  v43 = v118;
  v44 = v119;
  v45 = v120;
  v80 = v13;
  v46 = v121;
  v47 = v122;
  sub_21A7B9454();
  v103 = v87;
  v104 = v86;
  v105 = v85 & 1;
  v106 = v88;
  v107 = v40;
  v108 = v42;
  v109 = v43;
  v110 = v44;
  v111 = v45;
  v112 = v46;
  v113 = v47;
  v114 = 1;
  v115 = v48;
  v116 = 0;
  v49 = v93;
  sub_21A7CFA20();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60D0);
  sub_21A7951D8(&qword_2550F60D8, &qword_2550F60D0, sub_21A7951B4, MEMORY[0x24BDEC438]);
  v50 = v92;
  v51 = v95;
  sub_21A7CFAEC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v49, v51);
  sub_21A792428(v103, v104, v105);
  swift_bridgeObjectRelease();
  v52 = v98;
  v53 = v96;
  v54 = v99;
  (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v96, v50, v99);
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  if ((*((_BYTE *)a1 + v89) & 1) != 0)
    goto LABEL_12;
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  v55 = v102;
  v56 = v81;
  v83(v102, v84, v81);
  swift_getKeyPath();
  v103 = (uint64_t)a1;
  sub_21A7CF6CC();
  swift_release();
  v57 = *(id *)((char *)a1 + v82);
  sub_21A792278(v57);
  v59 = v58;

  (*(void (**)(char *, uint64_t))(v80 + 8))(v55, v56);
  v60 = v59 + 2.0;
  v61 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v61, sel_bounds);
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;

  v124.origin.x = UIEdgeInsetsInsetRect(v63, v65, v67, v69, a1[4], a1[5]);
  if (v60 >= CGRectGetWidth(v124) * 0.85)
  {
LABEL_12:
    v71 = 0;
    v70 = 1;
  }
  else
  {
    v70 = 0;
    v71 = 1;
  }
  v72 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  v73 = v97;
  v72(v97, v53, v54);
  v74 = v100;
  *v100 = 0;
  *((_BYTE *)v74 + 8) = v90;
  *((_BYTE *)v74 + 9) = v91;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6110);
  v72((char *)v74 + *(int *)(v75 + 48), v73, v54);
  v76 = (char *)v74 + *(int *)(v75 + 64);
  *(_QWORD *)v76 = 0;
  v76[8] = v71;
  v76[9] = v70;
  v77 = *(void (**)(char *, uint64_t))(v52 + 8);
  v77(v53, v54);
  return ((uint64_t (*)(char *, uint64_t))v77)(v73, v54);
}

uint64_t sub_21A79369C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  CGFloat v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  _QWORD v22[4];
  CGRect v23;

  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v22[1] = a1;
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  v6 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_getKeyPath();
  v22[0] = a1;
  sub_21A7CF6CC();
  swift_release();
  v7 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_21A792278(v7);
  v9 = v8;

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v9 + 2.0;
  v11 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v11, sel_bounds);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v23.origin.x = UIEdgeInsetsInsetRect(v13, v15, v17, v19, *(double *)(a1 + 32), *(double *)(a1 + 40));
  v20 = CGRectGetWidth(v23) * 0.85;
  swift_getKeyPath();
  if (v20 <= v10)
  {
    v22[0] = a1;
    sub_21A7CF6CC();
    swift_release();
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) == 1)
      return sub_21A7CFCB4();
  }
  else
  {
    v22[0] = a1;
    sub_21A7CF6CC();
    swift_release();
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) != 1)
      return sub_21A7CFCB4();
  }
  return sub_21A7CFCC0();
}

BOOL sub_21A79390C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v21[4];
  CGRect v22;

  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v21[1] = a1;
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  v6 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_getKeyPath();
  v21[0] = a1;
  sub_21A7CF6CC();
  swift_release();
  v7 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_21A792278(v7);
  v9 = v8;

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v9 + 2.0;
  v11 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v11, sel_bounds);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v22.origin.x = UIEdgeInsetsInsetRect(v13, v15, v17, v19, *(double *)(a1 + 32), *(double *)(a1 + 40));
  return CGRectGetWidth(v22) * 0.85 <= v10;
}

__n128 sub_21A793AF0@<Q0>(uint64_t a1@<X0>, double a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  __n128 result;
  __n128 v13;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;
  char v17;

  v6 = sub_21A7CFCA8();
  v8 = v7;
  sub_21A793B98(a2, (uint64_t)v15);
  v13 = (__n128)v15[1];
  v14 = v15[0];
  v9 = v16;
  v10 = v17;
  sub_21A795080(a1, a3, &qword_2550F5FE8);
  v11 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F5FD8) + 36);
  *(_QWORD *)v11 = v6;
  *(_QWORD *)(v11 + 8) = v8;
  result = v13;
  *(_OWORD *)(v11 + 16) = v14;
  *(__n128 *)(v11 + 32) = v13;
  *(_QWORD *)(v11 + 48) = v9;
  *(_BYTE *)(v11 + 56) = v10;
  return result;
}

double sub_21A793B98@<D0>(double a1@<X0>, uint64_t a2@<X8>)
{
  char v4;
  uint64_t v5;
  double result;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  swift_getKeyPath();
  *(double *)&v7 = a1;
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  v4 = *(_BYTE *)(*(_QWORD *)&a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL);
  v5 = sub_21A793D28(*(uint64_t *)&a1);
  if ((v4 & 1) != 0)
  {
    sub_21A7CFD44();
    sub_21A7CFD38();
  }
  else
  {
    sub_21A7CFD38();
    sub_21A7CFD44();
  }
  MEMORY[0x2207486FC](v5);
  sub_21A7CF8E8();
  sub_21A795108();
  sub_21A7CF9F0();
  result = a1;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 32) = v9;
  *(_BYTE *)(a2 + 40) = v10;
  return result;
}

uint64_t sub_21A793D28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  CGRect v27;

  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60C0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21A7D19B0;
  *(_QWORD *)(v6 + 32) = sub_21A7CFBB8();
  *(_QWORD *)(v6 + 40) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 48) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 56) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 64) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 72) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 80) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 88) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 96) = sub_21A7CFBAC();
  *(_QWORD *)(v6 + 104) = sub_21A7CFBAC();
  v25 = v6;
  sub_21A7CFEC4();
  v26 = v25;
  sub_21A7B9454();
  if (v7 == 0.0)
    goto LABEL_4;
  sub_21A7CFBB8();
  MEMORY[0x2207488F4]();
  if (*(_QWORD *)(v26 + 16) >= *(_QWORD *)(v26 + 24) >> 1)
    goto LABEL_9;
  while (1)
  {
    sub_21A7CFEDC();
    sub_21A7CFEC4();
LABEL_4:
    swift_getKeyPath();
    v25 = a1;
    sub_21A7948B8();
    sub_21A7CF6CC();
    swift_release();
    v8 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    swift_getKeyPath();
    v24[1] = a1;
    sub_21A7CF6CC();
    swift_release();
    v9 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_21A792278(v9);
    v11 = v10;

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_21A7B9454();
    v13 = v11 + 2.0 - v12;
    v14 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v14, sel_bounds);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v27.origin.x = UIEdgeInsetsInsetRect(v16, v18, v20, v22, *(double *)(a1 + 32), *(double *)(a1 + 40));
    if (v13 > CGRectGetWidth(v27) * 0.85)
      break;
    if (*(_QWORD *)(v26 + 16))
    {
      sub_21A7B0EA8(0, 1);
      return v26;
    }
    __break(1u);
LABEL_9:
    sub_21A7CFED0();
  }
  return v26;
}

uint64_t sub_21A794020@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v16;
  uint64_t v17;
  _QWORD v19[2];

  v4 = v3;
  v19[0] = a2;
  v19[1] = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5FE8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60B0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5FD8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1(v13) & 1) != 0)
  {
    ((void (*)(uint64_t))v19[0])(v3);
    v16 = &qword_2550F5FD8;
    sub_21A795080((uint64_t)v15, (uint64_t)v11, &qword_2550F5FD8);
    swift_storeEnumTagMultiPayload();
    sub_21A794D7C();
    sub_21A794E00();
    sub_21A7CF9F0();
    v17 = (uint64_t)v15;
  }
  else
  {
    v16 = &qword_2550F5FE8;
    sub_21A795080(v4, (uint64_t)v8, &qword_2550F5FE8);
    sub_21A795080((uint64_t)v8, (uint64_t)v11, &qword_2550F5FE8);
    swift_storeEnumTagMultiPayload();
    sub_21A794D7C();
    sub_21A794E00();
    sub_21A7CF9F0();
    v17 = (uint64_t)v8;
  }
  return sub_21A7950C4(v17, v16);
}

uint64_t sub_21A794208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v51 = a2;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6038);
  MEMORY[0x24BDAC7A8](v50);
  v43 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6040);
  MEMORY[0x24BDAC7A8](v46);
  v49 = (uint64_t)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6048);
  MEMORY[0x24BDAC7A8](v48);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6050);
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A7CF8F4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6058);
  v13 = *(_QWORD *)(v44 - 8);
  v14 = MEMORY[0x24BDAC7A8](v44);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v45 = (char *)&v42 - v17;
  swift_getKeyPath();
  v52 = a1;
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  if (*(double *)(a1 + 120) < 0.0)
  {
    v18 = sub_21A7CFBF4();
    swift_getKeyPath();
    v43 = v6;
    v52 = a1;
    sub_21A7CF6CC();
    swift_release();
    v19 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
    v52 = v18;
    v53 = v19;
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDECF10], v9);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6068);
    sub_21A794F50();
    sub_21A7CFB10();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
    swift_release();
    v20 = v44;
    v21 = v45;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v45, v16, v44);
    v22 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v22(v16, v21, v20);
    v23 = (uint64_t)v43;
    *(_QWORD *)v43 = 0;
    *(_BYTE *)(v23 + 8) = 1;
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60A0);
    v22((char *)(v23 + *(int *)(v24 + 48)), v16, v20);
    v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    v25(v16, v20);
    sub_21A795080(v23, v49, &qword_2550F6048);
    swift_storeEnumTagMultiPayload();
    v26 = MEMORY[0x24BDF5428];
    sub_21A794FD4(&qword_2550F6090, &qword_2550F6048, MEMORY[0x24BDF5428]);
    sub_21A794FD4(&qword_2550F6098, &qword_2550F6038, v26);
    v27 = (uint64_t)v47;
    sub_21A7CF9F0();
    sub_21A7950C4(v23, &qword_2550F6048);
    v25(v21, v20);
LABEL_5:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6060);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v27, 0, 1, v39);
    return sub_21A795014(v27, v51, &qword_2550F6050);
  }
  v28 = v13;
  swift_getKeyPath();
  v52 = a1;
  sub_21A7CF6CC();
  swift_release();
  if (*(double *)(a1 + 120) > 0.0)
  {
    v29 = sub_21A7CFBF4();
    swift_getKeyPath();
    v52 = a1;
    sub_21A7CF6CC();
    swift_release();
    v30 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
    v52 = v29;
    v53 = v30;
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDECF10], v9);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6068);
    sub_21A794F50();
    v31 = v16;
    sub_21A7CFB10();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
    swift_release();
    v32 = v44;
    v33 = v45;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v45, v16, v44);
    v34 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
    v34(v16, v33, v32);
    v35 = (uint64_t)v43;
    v34(v43, v31, v32);
    v36 = v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F6088) + 48);
    *(_QWORD *)v36 = 0;
    *(_BYTE *)(v36 + 8) = 1;
    v37 = *(void (**)(char *, uint64_t))(v28 + 8);
    v37(v31, v32);
    sub_21A795080(v35, v49, &qword_2550F6038);
    swift_storeEnumTagMultiPayload();
    v38 = MEMORY[0x24BDF5428];
    sub_21A794FD4(&qword_2550F6090, &qword_2550F6048, MEMORY[0x24BDF5428]);
    sub_21A794FD4(&qword_2550F6098, &qword_2550F6038, v38);
    v27 = (uint64_t)v47;
    sub_21A7CF9F0();
    sub_21A7950C4(v35, &qword_2550F6038);
    v37(v33, v32);
    goto LABEL_5;
  }
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6060);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v51, 1, 1, v41);
}

uint64_t sub_21A794890()
{
  return sub_21A7CFB04();
}

uint64_t sub_21A7948A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21A792528(*v1, a1);
}

unint64_t sub_21A7948B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550F5FA8;
  if (!qword_2550F5FA8)
  {
    v1 = type metadata accessor for HoverTypingStore();
    result = MEMORY[0x220749464](&unk_21A7D29E0, v1);
    atomic_store(result, (unint64_t *)&qword_2550F5FA8);
  }
  return result;
}

uint64_t sub_21A794900@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A7948B8();
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL);
  return result;
}

uint64_t sub_21A79497C()
{
  swift_getKeyPath();
  sub_21A7948B8();
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A794A0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v5 = sub_21A7CF57C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A794AB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v4 = sub_21A7CF57C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2;
  swift_getKeyPath();
  v11 = v8;
  v12 = v7;
  v13 = v8;
  sub_21A7948B8();
  sub_21A7CF6C0();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_21A794BAC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A7948B8();
  sub_21A7CF6CC();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  *a2 = v4;
  return v4;
}

void sub_21A794C2C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_21A7948B8();
  v2 = v1;
  sub_21A7CF6C0();
  swift_release();

}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220749458](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21A794D10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F5FC8;
  if (!qword_2550F5FC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F5F80);
    v2[0] = sub_21A794D7C();
    v2[1] = sub_21A794E00();
    result = MEMORY[0x220749464](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F5FC8);
  }
  return result;
}

unint64_t sub_21A794D7C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F5FD0;
  if (!qword_2550F5FD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F5FD8);
    v2[0] = sub_21A794E00();
    v2[1] = sub_21A794FD4(&qword_2550F6020, &qword_2550F6028, MEMORY[0x24BDEF828]);
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F5FD0);
  }
  return result;
}

unint64_t sub_21A794E00()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F5FE0;
  if (!qword_2550F5FE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F5FE8);
    v2[0] = sub_21A794EA4(&qword_2550F5FF0, &qword_2550F5FF8, &qword_2550F6000, &qword_2550F6008);
    v2[1] = sub_21A794FD4(&qword_2550F6010, &qword_2550F6018, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F5FE0);
  }
  return result;
}

uint64_t sub_21A794EA4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_21A794FD4(a3, a4, MEMORY[0x24BDF4498]);
    v9[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

unint64_t sub_21A794F50()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2550F6070;
  if (!qword_2550F6070)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6068);
    v2 = sub_21A794FD4(&qword_2550F6078, &qword_2550F6080, MEMORY[0x24BDF0710]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2550F6070);
  }
  return result;
}

uint64_t sub_21A794FD4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x220749464](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A795014(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_21A795058()
{
  uint64_t v0;

  sub_21A7BCD14(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

BOOL sub_21A795070()
{
  uint64_t v0;

  return sub_21A79390C(v0);
}

double sub_21A795078@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v2;
  double result;

  *(_QWORD *)&result = sub_21A793AF0(a1, v2, a2).n128_u64[0];
  return result;
}

uint64_t sub_21A795080(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A7950C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21A795108()
{
  unint64_t result;

  result = qword_2550F60B8;
  if (!qword_2550F60B8)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_2550F60B8);
  }
  return result;
}

uint64_t sub_21A795154()
{
  uint64_t v0;

  return sub_21A7BCC0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21A79516C()
{
  uint64_t v0;

  return sub_21A7BC5F4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_21A795188(double a1)
{
  double v2;

  v2 = sub_21A7B9590();
  sub_21A7B9B7C(1, a1, v2);
}

uint64_t sub_21A7951B4()
{
  return sub_21A7951D8(&qword_2550F60E0, &qword_2550F60E8, sub_21A795240, MEMORY[0x24BDEDB80]);
}

uint64_t sub_21A7951D8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A795240()
{
  return sub_21A7951D8(&qword_2550F60F0, &qword_2550F60F8, (uint64_t (*)(void))sub_21A795264, MEMORY[0x24BDEBEE0]);
}

unint64_t sub_21A795264()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F6100;
  if (!qword_2550F6100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6108);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F6100);
  }
  return result;
}

unint64_t sub_21A7952CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F6118;
  if (!qword_2550F6118)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6120);
    v2[0] = sub_21A794EA4(&qword_2550F5FB0, &qword_2550F5FA0, &qword_2550F5FB8, &qword_2550F5F98);
    v2[1] = sub_21A7951D8(&qword_2550F5FC0, &qword_2550F5F88, (uint64_t (*)(void))sub_21A794D10, MEMORY[0x24BDEBEE0]);
    result = MEMORY[0x220749464](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F6118);
  }
  return result;
}

void sub_21A795378(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_21A7953C8(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  char *v4;
  char *v7;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  _UNKNOWN **v11;
  char *v12;
  uint64_t *v13;

  v4 = v3;
  *(_QWORD *)&v4[qword_2550F6138] = 0;
  v7 = &v4[direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = (uint64_t *)&v4[qword_2550F6140];
  *v8 = a1;
  v8[1] = a2;
  if ((a3 & 1) != 0)
  {
    type metadata accessor for HoverTextStore();
    swift_allocObject();
    v12 = v4;
    swift_bridgeObjectRetain();
    v10 = sub_21A78C620(a1, a2);
    v11 = &off_24DD20FB0;
  }
  else
  {
    type metadata accessor for HoverTypingStore();
    swift_allocObject();
    v9 = v4;
    swift_bridgeObjectRetain();
    v10 = sub_21A7BD32C(a1, a2);
    v11 = &off_24DD22710;
  }
  v13 = (uint64_t *)&v4[qword_2550F6128];
  *v13 = v10;
  v13[1] = (uint64_t)v11;

  return sub_21A7CF9CC();
}

void sub_21A7954C8(char *a1, uint64_t a2, void *a3)
{
  char *v4;
  id v5;

  *(_QWORD *)&a1[qword_2550F6138] = 0;
  v4 = &a1[direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  sub_21A7D01B8();
  __break(1u);
}

Swift::Void __swiftcall HoverTextRootViewController.startHoverText()()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  _QWORD v10[2];

  v1 = (int *)type metadata accessor for HoverTextPresentationEvent();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + qword_2550F6128 + 8);
  v5 = **(_QWORD **)(v0 + qword_2550F6128);
  v10[1] = *(_QWORD *)(v0 + qword_2550F6128);
  v3[50] = 12;
  swift_retain();
  sub_21A7CF510();
  v6 = &v3[v1[8]];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v3[v1[9]];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v8 = &v3[v1[10]];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v3[v1[11]];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v3[v1[12]] = 0;
  *(_QWORD *)&v3[v1[13]] = 0;
  *(_QWORD *)v3 = 2;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *((_QWORD *)v3 + 5) = 0;
  *((_WORD *)v3 + 24) = 352;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 280))(v3, v5, v4);
  sub_21A79178C((uint64_t)v3);
  swift_release();
}

Swift::Void __swiftcall HoverTextRootViewController.showAlert(_:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  int *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  _QWORD v13[2];

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = (int *)type metadata accessor for HoverTextPresentationEvent();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + qword_2550F6128 + 8);
  v8 = **(_QWORD **)(v1 + qword_2550F6128);
  v13[1] = *(_QWORD *)(v1 + qword_2550F6128);
  v6[50] = 12;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21A7CF510();
  v9 = &v6[v4[8]];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &v6[v4[9]];
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v11 = &v6[v4[10]];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = &v6[v4[11]];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  *(_QWORD *)&v6[v4[12]] = 0;
  *(_QWORD *)&v6[v4[13]] = 0;
  *(_QWORD *)v6 = countAndFlagsBits;
  *((_QWORD *)v6 + 1) = object;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_WORD *)v6 + 24) = 288;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 280))(v6, v8, v7);
  sub_21A79178C((uint64_t)v6);
  swift_release();
}

uint64_t HoverTextRootViewController.showStatusAlertForActivationLockDidChange.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);
  swift_beginAccess();
  v2 = *v1;
  sub_21A79581C(*v1);
  return v2;
}

uint64_t sub_21A79581C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t HoverTextRootViewController.showStatusAlertForActivationLockDidChange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_21A795888(v6);
}

uint64_t sub_21A795888(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*HoverTextRootViewController.showStatusAlertForActivationLockDidChange.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Void __swiftcall HoverTextRootViewController.handleElementVisualsUpdated()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[6];

  v1 = qword_2550F6138;
  objc_msgSend(*(id *)(v0 + qword_2550F6138), sel_invalidate);
  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_21A795B64;
  v7[5] = v3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_21A795378;
  v7[3] = &block_descriptor_1;
  v4 = _Block_copy(v7);
  swift_release();
  v5 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v4, 0.2);
  _Block_release(v4);
  v6 = *(void **)(v0 + v1);
  *(_QWORD *)(v0 + v1) = v5;

}

uint64_t sub_21A7959E0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A795A04(uint64_t a1, uint64_t a2)
{
  int *v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  _QWORD *v15;

  v3 = (int *)type metadata accessor for HoverTextPresentationEvent();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x22074959C](a2 + 16);
  if (result)
  {
    v7 = (void *)result;
    v8 = *(_QWORD **)(result + qword_2550F6128);
    v9 = *(_QWORD *)(result + qword_2550F6128 + 8);
    swift_retain();

    v10 = *v8;
    v15 = v8;
    v5[50] = 12;
    sub_21A7CF510();
    v11 = &v5[v3[8]];
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    v12 = &v5[v3[9]];
    *(_OWORD *)v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    v13 = &v5[v3[10]];
    *(_QWORD *)v13 = 0;
    v13[8] = 1;
    v14 = &v5[v3[11]];
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    *(_QWORD *)&v5[v3[12]] = 0;
    *(_QWORD *)&v5[v3[13]] = 0;
    *(_QWORD *)v5 = 1;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *((_QWORD *)v5 + 5) = 0;
    *((_WORD *)v5 + 24) = 352;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 280))(v5, v10, v9);
    sub_21A79178C((uint64_t)v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_21A795B64(uint64_t a1)
{
  uint64_t v1;

  return sub_21A795A04(a1, v1);
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

unint64_t HoverTextRootViewController.windowDisplayID.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unsigned int v4;
  unsigned __int8 v5;
  uint64_t v6;

  v1 = objc_msgSend(v0, sel_viewIfLoaded);
  if (v1 && (v2 = v1, v3 = objc_msgSend(v1, sel_window), v2, v3))
  {
    v4 = HTDisplayIDForWindow(v3);

    v5 = 0;
    v6 = v4;
  }
  else
  {
    v6 = 0;
    v5 = 1;
  }
  return v6 | ((unint64_t)v5 << 32);
}

id HoverTextRootViewController.viewWillTransition(to:with:)(void *a1, double a2, double a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD aBlock[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v3;
  aBlock[4] = sub_21A795D88;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21A795D90;
  aBlock[3] = &block_descriptor_6;
  v8 = _Block_copy(aBlock);
  v9 = v3;
  swift_release();
  objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v8, 0);
  _Block_release(v8);
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  return objc_msgSendSuper2(&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, a2, a3);
}

void sub_21A795D08(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  sub_21A7960EC();
  v3 = objc_msgSend(a2, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setNeedsLayout);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21A795D64()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21A795D88(uint64_t a1)
{
  uint64_t v1;

  sub_21A795D08(a1, *(void **)(v1 + 16));
}

uint64_t sub_21A795D90(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for HoverTextRootViewController()
{
  uint64_t result;

  result = qword_2550F6148;
  if (!qword_2550F6148)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21A795E14(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD aBlock[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  aBlock[4] = sub_21A7964C4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21A795D90;
  aBlock[3] = &block_descriptor_13;
  v10 = _Block_copy(aBlock);
  v11 = a1;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a5, sel_animateAlongsideTransition_completion_, v10, 0);
  _Block_release(v10);
  v12.receiver = v11;
  v12.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  objc_msgSendSuper2(&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a5, a2, a3);
  swift_unknownObjectRelease();

}

Swift::Void __swiftcall HoverTextRootViewController.viewDidLoad()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

    swift_retain();
    sub_21A7CF9D8();
  }
  else
  {
    __break(1u);
  }
}

void sub_21A795FEC(void *a1)
{
  id v1;

  v1 = a1;
  HoverTextRootViewController.viewDidLoad()();

}

Swift::Void __swiftcall HoverTextRootViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  objc_msgSendSuper2(&v3, sel_viewDidAppear_, a1);
  sub_21A7960EC();
}

void sub_21A796068(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  v4 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a3);
  sub_21A7960EC();

}

Swift::Bool __swiftcall HoverTextRootViewController._canShowWhileLocked()()
{
  return 1;
}

uint64_t sub_21A7960D4()
{
  return 1;
}

uint64_t sub_21A7960DC()
{
  return 30;
}

uint64_t HoverTextRootViewController.supportedInterfaceOrientations.getter()
{
  return 30;
}

id sub_21A7960EC()
{
  char *v0;
  void *v1;
  id result;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  char v24;

  v1 = v0;
  result = objc_msgSend(v0, sel_isViewLoaded);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)&v0[qword_2550F6128];
    result = objc_msgSend(v1, sel_view);
    if (result)
    {
      v4 = result;
      v5 = objc_msgSend(result, sel_window);

      if (v5)
      {
        v6 = objc_msgSend(v5, sel_interfaceOrientation);

      }
      else
      {
        v6 = 0;
      }
      result = objc_msgSend(v1, sel_view);
      if (result)
      {
        v7 = result;
        v8 = objc_msgSend(result, sel_window);

        if (v8)
        {
          v9 = objc_msgSend(v8, sel_screen);

          objc_msgSend(v9, sel_bounds);
          v11 = v10;
          v13 = v12;

        }
        else
        {
          v13 = 0.0;
          v11 = 0.0;
        }
        result = objc_msgSend(v1, sel_view);
        if (result)
        {
          v14 = result;
          objc_msgSend(result, sel_safeAreaInsets);
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;

          v23[0] = v16;
          v23[1] = v18;
          v23[2] = v20;
          v23[3] = v22;
          v24 = 0;
          return (id)(*(uint64_t (**)(id, _QWORD *, double, double))(*(_QWORD *)v3 + 280))(v6, v23, v11, v13);
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
  return result;
}

void HoverTextRootViewController.__allocating_init(rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void HoverTextRootViewController.__allocating_init(coder:rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_21A796308()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return sub_21A795888(*(_QWORD *)(v0
                                 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange));
}

id HoverTextRootViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21A796390()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21A7963EC(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  return sub_21A795888(*(_QWORD *)(a1
                                 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange));
}

void sub_21A79644C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_21A796478()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_21A7964A4()
{
  return type metadata accessor for HoverTextRootViewController();
}

void HoverTextRootViewController.init(coder:rootView:)()
{
  HoverTextRootViewController.__allocating_init(coder:rootView:)();
}

void HoverTextRootViewController.init(rootView:)()
{
  HoverTextRootViewController.__allocating_init(rootView:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextPresentationEvent.processEvent()()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_21A7CF5E8();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_21A7CF474();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_21A7CF750();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_21A7CF57C();
  MEMORY[0x24BDAC7A8](v4);
  __asm { BR              X10 }
}

void sub_21A796608()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;

  *(_QWORD *)(v7 - 200) = v4;
  if ((v5 & 0x80000000) != 0)
  {
    *(_QWORD *)(v7 - 136) = v2;
    *(_QWORD *)(v7 - 128) = v6;
    *(_QWORD *)(v7 - 120) = v1;
    *(_QWORD *)(v7 - 112) = v0;
    *(_QWORD *)(v7 - 104) = v4;
    *(_QWORD *)(v7 - 96) = v3;
    *(_BYTE *)(v7 - 88) = v5 & 1;
    v22 = v2;
    v23 = v1;
    v24 = (void *)v0;
    v25 = v3;
    sub_21A79C4B4(v2, v6, v1, v0, v4, v3, v5);
    sub_21A7990FC(v7 - 136);
    v16 = v22;
    v17 = v6;
    v18 = v23;
    v19 = v24;
    v20 = *(_QWORD *)(v7 - 200);
    v21 = v25;
  }
  else
  {
    v8 = v2;
    v9 = v1;
    v10 = (void *)v0;
    v11 = v4;
    v12 = v3;
    sub_21A79C4B4(v2, v6, v1, v0, v4, v3, v5);
    sub_21A79C4B4(v8, v6, v9, (uint64_t)v10, v11, v12, v5);
    v13 = *(_QWORD *)(v7 - 176);
    v14 = sub_21A798270(v8);
    if (v13)
    {
      v15 = *(_QWORD *)(v7 - 200);
      sub_21A79C4C4(v8, v6, v9, v10, v15, v12, v5);
      v16 = v8;
      v17 = v6;
      v18 = v9;
      v19 = v10;
      v20 = v15;
      v21 = v12;
    }
    else
    {
      *(_QWORD *)(v7 - 176) = v12;
      v26 = v14;
      sub_21A798630(v14, 0, 0);
      v27 = v9;
      v28 = v9;
      v29 = v10;
      v30 = v10;
      v31 = *(_QWORD *)(v7 - 200);
      v32 = *(_QWORD *)(v7 - 176);
      sub_21A79C4C4(v8, v6, v28, v30, v31, v32, v5);

      v16 = v8;
      v17 = v6;
      v18 = v27;
      v19 = v29;
      v20 = v31;
      v21 = v32;
    }
  }
  sub_21A79C4C4(v16, v17, v18, v19, v20, v21, v5);
}

unint64_t sub_21A796C40()
{
  unint64_t result;

  result = qword_2550F61C0;
  if (!qword_2550F61C0)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2550F61C0);
  }
  return result;
}

uint64_t type metadata accessor for HoverTextPresentationEvent()
{
  uint64_t result;

  result = qword_2550F6230;
  if (!qword_2550F6230)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_21A796CC0()
{
  unint64_t result;

  result = qword_2550F61C8;
  if (!qword_2550F61C8)
  {
    result = MEMORY[0x220749464](&protocol conformance descriptor for HoverTextPresentationEvent.Error, &type metadata for HoverTextPresentationEvent.Error);
    atomic_store(result, (unint64_t *)&qword_2550F61C8);
  }
  return result;
}

unint64_t sub_21A796D04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  unint64_t v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  char *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  void (*v90)(char *, char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;

  v5 = sub_21A7CF600();
  MEMORY[0x24BDAC7A8](v5);
  v83 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62A8);
  v7 = MEMORY[0x24BDAC7A8](v97);
  v94 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v96 = (char *)&v75 - v9;
  v10 = sub_21A7CF540();
  v82 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v98 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62B0);
  MEMORY[0x24BDAC7A8](v12);
  v88 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62B8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62C0);
  v87 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v78 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v93 = (char *)&v75 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v92 = (uint64_t)&v75 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v75 - v24;
  v26 = sub_21A7CF57C();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v77 = (char *)&v75 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v80 = (char *)&v75 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v102 = a1;
  v103 = a2;
  v32 = (char *)&v75 - v31;
  v84 = v33;
  v34 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v100 = v35;
  v76 = v34;
  ((void (*)(char *, uint64_t))v34)((char *)&v75 - v31, v2);
  v36 = sub_21A7CF6A8();
  v85 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
  v86 = v36;
  v99 = MEMORY[0x24BEE4AF8];
  v79 = v16;
  v95 = v32;
  v101 = v17;
  v81 = v25;
  while (1)
  {
    v37 = (uint64_t)v88;
    v85(v88, 1, 1, v86);
    sub_21A791288((unint64_t *)&qword_2550F5F78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC588]);
    sub_21A796C40();
    sub_21A7CF624();
    sub_21A7950C4(v37, &qword_2550F62B0);
    if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v87 + 48))(v16, 1, v17) == 1)
      break;
    sub_21A795014((uint64_t)v16, (uint64_t)v25, &qword_2550F62C0);
    v38 = v98;
    sub_21A7CF4D4();
    v39 = sub_21A791288(&qword_2550F62C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
    if ((sub_21A7CFDC8() & 1) == 0)
    {
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    v91 = v39;
    v40 = v96;
    v41 = v97;
    v42 = &v96[*(int *)(v97 + 48)];
    v43 = v25;
    v44 = v82;
    v45 = *(void (**)(char *, char *, uint64_t))(v82 + 32);
    v45(v96, v38, v10);
    v46 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
    v46(v42, v43, v10);
    v47 = v94;
    v48 = &v94[*(int *)(v41 + 48)];
    v46(v94, v40, v10);
    v90 = v46;
    v46(v48, v42, v10);
    v49 = (uint64_t)v93;
    v45(v93, v47, v10);
    v50 = *(void (**)(char *, uint64_t))(v44 + 8);
    v50(v48, v10);
    v51 = &v47[*(int *)(v41 + 48)];
    v45(v47, v40, v10);
    v45(v51, v42, v10);
    v45((char *)(v49 + *(int *)(v101 + 36)), v51, v10);
    v50(v47, v10);
    sub_21A795014(v49, v92, &qword_2550F62C0);
    v52 = v101;
    v89 = sub_21A794FD4(&qword_2550F62D0, &qword_2550F62C0, MEMORY[0x24BEE1BC0]);
    sub_21A7CF5AC();
    v32 = v80;
    sub_21A7CF5C4();
    v17 = v99;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v17 = sub_21A79BFCC(0, *(_QWORD *)(v17 + 16) + 1, 1, v17);
    v54 = *(_QWORD *)(v17 + 16);
    v53 = *(_QWORD *)(v17 + 24);
    v55 = v50;
    if (v54 >= v53 >> 1)
      v17 = sub_21A79BFCC(v53 > 1, v54 + 1, 1, v17);
    *(_QWORD *)(v17 + 16) = v54 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v84 + 32))(v17+ ((*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80))+ *(_QWORD *)(v84 + 72) * v54, v32, v100);
    v56 = v98;
    sub_21A7CF4D4();
    v25 = v81;
    v57 = &v81[*(int *)(v52 + 36)];
    if ((sub_21A7CFDC8() & 1) == 0)
      goto LABEL_15;
    v99 = v17;
    v59 = v96;
    v58 = v97;
    v60 = &v96[*(int *)(v97 + 48)];
    v45(v96, v56, v10);
    v61 = v90;
    v90(v60, v57, v10);
    v62 = v94;
    v63 = &v94[*(int *)(v58 + 48)];
    v61(v94, v59, v10);
    v61(v63, v60, v10);
    v64 = (uint64_t)v78;
    v45(v78, v62, v10);
    v55(v63, v10);
    v65 = &v62[*(int *)(v58 + 48)];
    v66 = v59;
    v32 = v95;
    v45(v62, v66, v10);
    v45(v65, v60, v10);
    v45((char *)(v64 + *(int *)(v101 + 36)), v65, v10);
    v67 = v62;
    v17 = v101;
    v55(v67, v10);
    v68 = (uint64_t)v93;
    sub_21A795014(v64, (uint64_t)v93, &qword_2550F62C0);
    sub_21A7CF51C();
    sub_21A7950C4(v68, &qword_2550F62C0);
    sub_21A7950C4(v92, &qword_2550F62C0);
    sub_21A7950C4((uint64_t)v25, &qword_2550F62C0);
    v16 = v79;
  }
  sub_21A7950C4((uint64_t)v16, &qword_2550F62B8);
  v17 = (unint64_t)v77;
  v76(v77, v32, v100);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    goto LABEL_11;
LABEL_16:
  v99 = sub_21A79BFCC(0, *(_QWORD *)(v99 + 16) + 1, 1, v99);
LABEL_11:
  v70 = *(_QWORD *)(v99 + 16);
  v69 = *(_QWORD *)(v99 + 24);
  if (v70 >= v69 >> 1)
    v99 = sub_21A79BFCC(v69 > 1, v70 + 1, 1, v99);
  v71 = v99;
  *(_QWORD *)(v99 + 16) = v70 + 1;
  v72 = v84;
  v73 = v100;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v84 + 32))(v71+ ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80))+ *(_QWORD *)(v84 + 72) * v70, v17, v100);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v32, v73);
  return v71;
}

double static HoverTextPresentationEvent.hoverTextDidStart.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_21A7981BC(2, a1);
}

double static HoverTextPresentationEvent.didReceiveAnnouncement(text:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  _QWORD *v7;
  _OWORD *v8;
  double result;
  uint64_t v10;
  _QWORD *v11;

  *(_BYTE *)(a3 + 50) = 12;
  v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  swift_bridgeObjectRetain();
  sub_21A7CF510();
  v7 = (_QWORD *)(a3 + v6[8]);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_OWORD *)(a3 + v6[9]);
  result = 0.0;
  *v8 = 0u;
  v8[1] = 0u;
  v10 = a3 + v6[10];
  *(_QWORD *)v10 = 0;
  *(_BYTE *)(v10 + 8) = 1;
  v11 = (_QWORD *)(a3 + v6[11]);
  *v11 = 0;
  v11[1] = 0;
  *(_QWORD *)(a3 + v6[12]) = 0;
  *(_QWORD *)(a3 + v6[13]) = 0;
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_WORD *)(a3 + 48) = 288;
  return result;
}

double static HoverTextPresentationEvent.elementVisualUpdated.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_21A7981BC(1, a1);
}

unint64_t HoverTextPresentationEvent.Error.errorDescription.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = 0xD000000000000018;
  switch(a2)
  {
    case 0:
      return v2;
    case 1:
      v2 = 0xD000000000000022;
      break;
    case 2:
      v2 = 0xD00000000000002DLL;
      break;
    case 3:
      v2 = 0xD000000000000029;
      break;
    default:
      sub_21A7D00F8();
      swift_bridgeObjectRelease();
      sub_21A7CFE40();
      v2 = 0xD00000000000001DLL;
      break;
  }
  return v2;
}

unint64_t sub_21A79770C()
{
  uint64_t *v0;

  return HoverTextPresentationEvent.Error.errorDescription.getter(*v0, v0[1]);
}

uint64_t HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21A797770 + 4 * byte_21A7D1BE8[a1]))(0xD000000000000017, 0x800000021A7D33A0);
}

uint64_t sub_21A797828(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_21A7D023C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21A7978B0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21A7D02A8();
  HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v1);
  sub_21A7CFE1C();
  swift_bridgeObjectRelease();
  return sub_21A7D02E4();
}

uint64_t sub_21A797910()
{
  unsigned __int8 *v0;

  HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*v0);
  sub_21A7CFE1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A797950()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21A7D02A8();
  HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v1);
  sub_21A7CFE1C();
  swift_bridgeObjectRelease();
  return sub_21A7D02E4();
}

uint64_t sub_21A7979AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s11HoverTextUI0aB17PresentationEventV011ValueChangeE4TypeO03rawF0AESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21A7979D8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t HoverTextPresentationEvent.eventType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21A79D1D8(v1, a1);
}

uint64_t HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 49) = result;
  return result;
}

uint64_t (*HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded.modify())()
{
  return CGPointMake;
}

uint64_t HoverTextPresentationEvent.valueChangeEventType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t HoverTextPresentationEvent.valueChangeEventType.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 50) = result;
  return result;
}

uint64_t (*HoverTextPresentationEvent.valueChangeEventType.modify())()
{
  return CGPointMake;
}

uint64_t HoverTextPresentationEvent.displayText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 28);
  v4 = sub_21A7CF57C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t HoverTextPresentationEvent.displayText.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 28);
  v4 = sub_21A7CF57C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

double (*HoverTextPresentationEvent.displayText.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

uint64_t HoverTextPresentationEvent.secondaryText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HoverTextPresentationEvent.secondaryText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

double (*HoverTextPresentationEvent.secondaryText.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

double HoverTextPresentationEvent.anchorRect.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 36));
}

uint64_t HoverTextPresentationEvent.anchorRect.setter(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t result;
  double *v10;

  result = type metadata accessor for HoverTextPresentationEvent();
  v10 = (double *)(v4 + *(int *)(result + 36));
  *v10 = a1;
  v10[1] = a2;
  v10[2] = a3;
  v10[3] = a4;
  return result;
}

double (*HoverTextPresentationEvent.anchorRect.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

uint64_t HoverTextPresentationEvent.displayMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 40));
}

uint64_t HoverTextPresentationEvent.displayMode.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for HoverTextPresentationEvent();
  v6 = v2 + *(int *)(result + 40);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

double (*HoverTextPresentationEvent.displayMode.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

uint64_t HoverTextPresentationEvent.selectedTextRange.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 44));
}

uint64_t HoverTextPresentationEvent.selectedTextRange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v6;

  result = type metadata accessor for HoverTextPresentationEvent();
  v6 = (_QWORD *)(v2 + *(int *)(result + 44));
  *v6 = a1;
  v6[1] = a2;
  return result;
}

double (*HoverTextPresentationEvent.selectedTextRange.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

uint64_t HoverTextPresentationEvent.paragraphIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 48));
}

uint64_t HoverTextPresentationEvent.paragraphIndex.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for HoverTextPresentationEvent();
  *(_QWORD *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

double (*HoverTextPresentationEvent.paragraphIndex.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

void *HoverTextPresentationEvent.axAttributedString.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 52));
  v2 = v1;
  return v1;
}

void HoverTextPresentationEvent.axAttributedString.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for HoverTextPresentationEvent() + 52);

  *(_QWORD *)(v1 + v3) = a1;
}

double (*HoverTextPresentationEvent.axAttributedString.modify())(__n128, __n128)
{
  type metadata accessor for HoverTextPresentationEvent();
  return CGPointMake;
}

void sub_21A797E6C()
{
  qword_2550F6198 = MEMORY[0x24BEE4AF8];
}

double sub_21A797E80()
{
  double result;

  result = 0.0;
  xmmword_2550F61A0 = 0u;
  *(_OWORD *)&qword_2550F61B0 = 0u;
  return result;
}

uint64_t HoverTextPresentationEvent.init(_:shouldFetchFocusedElementIfNeeded:)@<X0>(__int128 *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  int *v6;
  _QWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;

  *(_BYTE *)(a3 + 50) = 12;
  v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_21A7CF510();
  v7 = (_QWORD *)(a3 + v6[8]);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_OWORD *)(a3 + v6[9]);
  *v8 = 0u;
  v8[1] = 0u;
  v9 = a3 + v6[10];
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  v10 = (_QWORD *)(a3 + v6[11]);
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)(a3 + v6[12]) = 0;
  *(_QWORD *)(a3 + v6[13]) = 0;
  result = sub_21A79D20C(a1, a3);
  *(_BYTE *)(a3 + 49) = a2;
  return result;
}

__n128 static HoverTextPresentationEvent.focusDidChange(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  int *v7;
  _QWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  __n128 result;
  __n128 v13;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  char v18;

  sub_21A79D22C(a1, (uint64_t)v15);
  v13 = (__n128)v15[1];
  v14 = v15[0];
  v4 = v16;
  v5 = v17;
  v6 = v18;
  *(_BYTE *)(a2 + 50) = 12;
  v7 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_21A79D268(a1);
  sub_21A7CF510();
  v8 = (_QWORD *)(a2 + v7[8]);
  *v8 = 0;
  v8[1] = 0;
  v9 = (_OWORD *)(a2 + v7[9]);
  *v9 = 0u;
  v9[1] = 0u;
  v10 = a2 + v7[10];
  *(_QWORD *)v10 = 0;
  *(_BYTE *)(v10 + 8) = 1;
  v11 = (_QWORD *)(a2 + v7[11]);
  *v11 = 0;
  v11[1] = 0;
  *(_QWORD *)(a2 + v7[12]) = 0;
  *(_QWORD *)(a2 + v7[13]) = 0;
  result = v13;
  *(_OWORD *)a2 = v14;
  *(__n128 *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 40) = v5;
  *(_BYTE *)(a2 + 48) = v6;
  *(_BYTE *)(a2 + 49) = 1;
  return result;
}

double static HoverTextPresentationEvent.primaryAppsDidChange.getter@<D0>(uint64_t a1@<X8>)
{
  int *v2;
  _QWORD *v3;
  _OWORD *v4;
  double result;
  uint64_t v6;
  _QWORD *v7;

  *(_BYTE *)(a1 + 50) = 12;
  v2 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_21A7CF510();
  v3 = (_QWORD *)(a1 + v2[8]);
  *v3 = 0;
  v3[1] = 0;
  v4 = (_OWORD *)(a1 + v2[9]);
  result = 0.0;
  *v4 = 0u;
  v4[1] = 0u;
  v6 = a1 + v2[10];
  *(_QWORD *)v6 = 0;
  *(_BYTE *)(v6 + 8) = 1;
  v7 = (_QWORD *)(a1 + v2[11]);
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)(a1 + v2[12]) = 0;
  *(_QWORD *)(a1 + v2[13]) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_WORD *)(a1 + 48) = 352;
  return result;
}

double static HoverTextPresentationEvent.valueChanged(text:eventType:keyInputDelegate:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  int *v10;
  id v11;
  _QWORD *v12;
  _OWORD *v13;
  double result;
  uint64_t v15;
  _QWORD *v16;

  v9 = a3;
  *(_BYTE *)(a5 + 50) = 12;
  v10 = (int *)type metadata accessor for HoverTextPresentationEvent();
  v11 = a4;
  swift_bridgeObjectRetain();
  sub_21A7CF510();
  v12 = (_QWORD *)(a5 + v10[8]);
  *v12 = 0;
  v12[1] = 0;
  v13 = (_OWORD *)(a5 + v10[9]);
  result = 0.0;
  *v13 = 0u;
  v13[1] = 0u;
  v15 = a5 + v10[10];
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  v16 = (_QWORD *)(a5 + v10[11]);
  *v16 = 0;
  v16[1] = 0;
  *(_QWORD *)(a5 + v10[12]) = 0;
  *(_QWORD *)(a5 + v10[13]) = 0;
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = v9;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_WORD *)(a5 + 48) = 320;
  return result;
}

double static HoverTextPresentationEvent.hideForInactivePointerDisplay.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_21A7981BC(3, a1);
}

double sub_21A7981BC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  _QWORD *v5;
  _OWORD *v6;
  double result;
  uint64_t v8;
  _QWORD *v9;

  *(_BYTE *)(a2 + 50) = 12;
  v4 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_21A7CF510();
  v5 = (_QWORD *)(a2 + v4[8]);
  *v5 = 0;
  v5[1] = 0;
  v6 = (_OWORD *)(a2 + v4[9]);
  result = 0.0;
  *v6 = 0u;
  v6[1] = 0u;
  v8 = a2 + v4[10];
  *(_QWORD *)v8 = 0;
  *(_BYTE *)(v8 + 8) = 1;
  v9 = (_QWORD *)(a2 + v4[11]);
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)(a2 + v4[12]) = 0;
  *(_QWORD *)(a2 + v4[13]) = 0;
  *(_QWORD *)a2 = a1;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_QWORD *)(a2 + 40) = 0;
  *(_WORD *)(a2 + 48) = 352;
  return result;
}

_QWORD *sub_21A798270(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, _QWORD *);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint8_t *v20;
  uint8_t *v21;
  void (*v22)(char *, _QWORD *);
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  int v35;
  void *v36;
  id v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, _QWORD *);
  __int128 v40;
  __int128 v41;
  void *v42;

  v2 = v1;
  v4 = (_QWORD *)sub_21A7CF750();
  v5 = *(v4 - 1);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v38 - v9;
  v11 = type metadata accessor for HoverTextPresentationEvent();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A791748(v2, (uint64_t)v13);
  if (!a1)
  {
    v14 = v13[49];
    sub_21A79178C((uint64_t)v13);
    if ((v14 & 1) != 0)
    {
      v15 = sub_21A7CF738();
      swift_beginAccess();
      v16 = *(void (**)(char *, uint64_t, _QWORD *))(v5 + 16);
      v16(v10, v15, v4);
      v17 = sub_21A7CF744();
      v18 = sub_21A7CFF90();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        v39 = v16;
        v20 = v19;
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_21A787000, v17, v18, "Focus element given to us resolved to nil. reaching out to get focused element", v19, 2u);
        v21 = v20;
        v16 = v39;
        MEMORY[0x22074950C](v21, -1, -1);
      }

      v22 = *(void (**)(char *, _QWORD *))(v5 + 8);
      v22(v10, v4);
      v23 = (void *)AXUIElementSharedSystemApp();
      if (v23)
      {
        v24 = v23;
        v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFEA68]), sel_initWithAXUIElement_, v24);
        if (v25)
        {
          v26 = v25;
          v27 = objc_msgSend(v25, sel_currentApplications);
          if (v27)
          {
            v28 = v27;
            v29 = sub_21A7CFEAC();

            if (*(_QWORD *)(v29 + 16))
            {
              sub_21A79E24C(v29 + 32, (uint64_t)&v40);
            }
            else
            {
              v40 = 0u;
              v41 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((_QWORD *)&v41 + 1))
            {
              sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
              v35 = swift_dynamicCast();
              v36 = v42;
              if (!v35)
                v36 = 0;
LABEL_24:
              v37 = v36;
              v4 = objc_msgSend(v37, sel_nativeFocusPreferredElement);

              if (v4)
                return v4;
              goto LABEL_15;
            }
          }
          else
          {
            v40 = 0u;
            v41 = 0u;
          }
          sub_21A7950C4((uint64_t)&v40, &qword_2550F6930);
          v36 = 0;
          goto LABEL_24;
        }

      }
      swift_beginAccess();
      v16(v8, v15, v4);
      v30 = sub_21A7CF744();
      v31 = sub_21A7CFF90();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_21A787000, v30, v31, "Shared system app unexpectedly nil!", v32, 2u);
        MEMORY[0x22074950C](v32, -1, -1);
      }

      v22(v8, v4);
    }
LABEL_15:
    sub_21A796CC0();
    swift_allocError();
    *v33 = 0;
    v33[1] = 0;
    swift_willThrow();
    return v4;
  }
  v4 = a1;
  sub_21A79178C((uint64_t)v13);
  return v4;
}

uint64_t sub_21A798630(id a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, _QWORD, uint64_t, uint64_t);
  unsigned int v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t inited;
  unint64_t v51;
  id v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  unsigned __int8 v56;
  _BYTE *v57;
  unsigned int (*v58)(_BYTE *, uint64_t, uint64_t);
  unsigned int v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  char v66;
  void (*v67)(_BYTE *, uint64_t);
  _BYTE *v68;
  _BYTE *v69;
  unsigned int (*v70)(_BYTE *, uint64_t, uint64_t);
  unsigned int v71;
  unint64_t v72;
  _BYTE *v73;
  _BYTE *v74;
  _BYTE *v75;
  uint64_t v76;
  _BYTE *v77;
  uint64_t v78;
  char v79;
  void (*v80)(_BYTE *, uint64_t);
  uint64_t v81;
  _BYTE *v82;
  int *v83;
  uint64_t *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t result;
  _QWORD *v96;
  _OWORD *v97;
  _BYTE v98[16];
  _BYTE *v99;
  uint64_t v100;
  _BYTE *v101;
  _BYTE *v102;
  uint64_t v103;
  uint64_t v104;
  _BYTE *v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t v108;
  _BYTE *v109;
  _BYTE *v110;
  uint64_t v111;
  _BYTE *v112;
  uint64_t v113;
  void (*v114)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  id v117;
  unint64_t v118;
  _BYTE *v119;
  unsigned int (*v120)(_BYTE *, uint64_t, uint64_t);
  unint64_t v121;

  v4 = v3;
  v111 = a3;
  v100 = a2;
  v108 = sub_21A7CF540();
  v107 = *(_QWORD *)(v108 - 8);
  v6 = MEMORY[0x24BDAC7A8](v108);
  v106 = &v98[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v105 = &v98[-v8];
  v104 = sub_21A7CF504();
  v103 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v102 = &v98[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_21A7CF5E8();
  MEMORY[0x24BDAC7A8](v10);
  v101 = &v98[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v99 = &v98[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v109 = &v98[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v110 = &v98[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = &v98[-v20];
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = &v98[-v23];
  v25 = MEMORY[0x24BDAC7A8](v22);
  v112 = &v98[-v26];
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = &v98[-v28];
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = &v98[-v31];
  MEMORY[0x24BDAC7A8](v30);
  v34 = &v98[-v33];
  v35 = sub_21A7CF57C();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v36 + 56);
  v119 = v34;
  v114 = v37;
  v37(v34, 1, 1, v35);
  v38 = objc_msgSend(a1, sel_isKeyboardKey);
  v115 = 0;
  v116 = v4;
  v117 = a1;
  v118 = 0;
  v113 = v36;
  if (v38)
  {
    v39 = objc_msgSend(a1, sel_application);
    if (!v39)
    {
      __break(1u);
      goto LABEL_39;
    }
    v40 = v39;
    v41 = objc_msgSend(v39, sel_firstResponder);

    if (v41)
    {
      v42 = objc_msgSend(v41, sel_value);
      if (v42)
      {
        v43 = v42;
        sub_21A7CFE04();

      }
      sub_21A7CF5DC();
      sub_21A7CF588();
      v44 = (uint64_t)v119;
      sub_21A7950C4((uint64_t)v119, &qword_2550F5F68);
      v114(v32, 0, 1, v35);
      sub_21A795014((uint64_t)v32, v44, &qword_2550F5F68);
      a1 = v117;
      v45 = objc_msgSend(v117, sel_label);
      if (v45)
      {
        v46 = v45;
        v115 = sub_21A7CFE04();
        v118 = v47;

      }
      else
      {

        v118 = 0xE100000000000000;
        v115 = 32;
      }
      v4 = v116;
      v36 = v113;
    }
    else
    {
      v115 = 0;
      v118 = 0;
      a1 = v117;
    }
  }
  v48 = (uint64_t)v119;
  sub_21A79E28C((uint64_t)v119, (uint64_t)v29);
  v120 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v36 + 48);
  v49 = v120(v29, 1, v35);
  sub_21A7950C4((uint64_t)v29, &qword_2550F5F68);
  if (v49 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6298);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21A7D1BB0;
    *(_QWORD *)(inited + 32) = a1;
    v121 = inited;
    sub_21A7CFEC4();
    v51 = v121;
    v52 = objc_msgSend(a1, sel_elementsForAttribute_, 2026);
    if (v52)
    {
      v53 = v52;
      sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
      v54 = sub_21A7CFEAC();

    }
    else
    {
      v54 = MEMORY[0x24BEE4AF8];
    }
    if (qword_2550F55F0 != -1)
      swift_once();
    v55 = swift_bridgeObjectRetain();
    v56 = sub_21A79BCD8(v55, v54);
    swift_bridgeObjectRelease();
    if ((v56 & 1) == 0)
    {
      v121 = v54;
      swift_bridgeObjectRetain();
      sub_21A79CA94(v51);
      v51 = v121;
    }
    qword_2550F6198 = v54;
    swift_bridgeObjectRelease();
    v57 = v112;
    sub_21A79A6F4(v51, (uint64_t)v112);
    swift_bridgeObjectRelease();
    v48 = (uint64_t)v119;
    sub_21A7950C4((uint64_t)v119, &qword_2550F5F68);
    v114(v57, 0, 1, v35);
    sub_21A795014((uint64_t)v57, v48, &qword_2550F5F68);
    v4 = v116;
    a1 = v117;
  }
  sub_21A79E28C(v48, (uint64_t)v24);
  v58 = v120;
  v59 = v120(v24, 1, v35);
  sub_21A7950C4((uint64_t)v24, &qword_2550F5F68);
  if (v59 == 1)
  {
    v60 = v48;
    if (!v111)
      goto LABEL_27;
LABEL_26:
    swift_bridgeObjectRetain();
    sub_21A7CF5DC();
    v68 = v112;
    sub_21A7CF588();
    sub_21A7950C4(v60, &qword_2550F5F68);
    v114(v68, 0, 1, v35);
    sub_21A795014((uint64_t)v68, v60, &qword_2550F5F68);
    goto LABEL_27;
  }
  sub_21A79E28C(v48, (uint64_t)v21);
  if (v58(v21, 1, v35) == 1)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_40;
  }
  v61 = v102;
  sub_21A7CF4C8();
  sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
  v62 = v105;
  v63 = v104;
  sub_21A7CFF30();
  v64 = v106;
  sub_21A7CFF3C();
  sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
  v65 = v108;
  v66 = sub_21A7CFDD4();
  v67 = *(void (**)(_BYTE *, uint64_t))(v107 + 8);
  v67(v64, v65);
  v67(v62, v65);
  (*(void (**)(_BYTE *, uint64_t))(v103 + 8))(v61, v63);
  v36 = v113;
  (*(void (**)(_BYTE *, uint64_t))(v113 + 8))(v21, v35);
  v4 = v116;
  a1 = v117;
  v60 = (uint64_t)v119;
  if ((v66 & 1) != 0 && v111)
    goto LABEL_26;
LABEL_27:
  v69 = v110;
  sub_21A79E28C(v60, (uint64_t)v110);
  v70 = v120;
  v71 = v120(v69, 1, v35);
  sub_21A7950C4((uint64_t)v69, &qword_2550F5F68);
  v72 = v118;
  if (v71 != 1)
  {
    v73 = v109;
    sub_21A79E28C(v60, (uint64_t)v109);
    if (v70(v73, 1, v35) != 1)
    {
      v74 = v102;
      sub_21A7CF4C8();
      sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
      v75 = v105;
      v76 = v104;
      sub_21A7CFF30();
      v77 = v106;
      sub_21A7CFF3C();
      sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
      v78 = v108;
      v79 = sub_21A7CFDD4();
      v80 = *(void (**)(_BYTE *, uint64_t))(v107 + 8);
      v80(v77, v78);
      v80(v75, v78);
      (*(void (**)(_BYTE *, uint64_t))(v103 + 8))(v74, v76);
      v36 = v113;
      (*(void (**)(_BYTE *, uint64_t))(v113 + 8))(v109, v35);
      v4 = v116;
      a1 = v117;
      v72 = v118;
      v70 = v120;
      if ((v79 & 1) == 0)
        goto LABEL_34;
      goto LABEL_30;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_41;
  }
LABEL_30:
  if (!v72)
    goto LABEL_37;
  v81 = HIBYTE(v72) & 0xF;
  if ((v72 & 0x2000000000000000) == 0)
    v81 = v115 & 0xFFFFFFFFFFFFLL;
  if (!v81)
  {
LABEL_37:
    sub_21A796CC0();
    swift_allocError();
    *v97 = xmmword_21A7D1BA0;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return sub_21A7950C4(v60, &qword_2550F5F68);
  }
LABEL_34:
  v82 = v99;
  sub_21A79E28C(v60, (uint64_t)v99);
  if (v70(v82, 1, v35) != 1)
  {
    v83 = (int *)type metadata accessor for HoverTextPresentationEvent();
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v36 + 40))(v4 + v83[7], v82, v35);
    v84 = (uint64_t *)(v4 + v83[8]);
    *v84 = v115;
    v84[1] = v72;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v85 = objc_msgSend(a1, sel_uiElement);
    if (v85)
    {
      v86 = v85;
      objc_msgSend(v85, sel_rectWithAXAttribute_, 2057);
      v88 = v87;
      v90 = v89;
      v92 = v91;
      v94 = v93;
      swift_bridgeObjectRelease();

      result = sub_21A7950C4(v60, &qword_2550F5F68);
      v96 = (_QWORD *)(v4 + v83[9]);
      *v96 = v88;
      v96[1] = v90;
      v96[2] = v92;
      v96[3] = v94;
      return result;
    }
    goto LABEL_42;
  }
LABEL_41:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_42:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_21A7990FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  int *v10;
  _QWORD *v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;

  v3 = sub_21A7CF5E8();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_21A7CF57C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = *(_QWORD *)a1 & 0xFFFFFFFFFFFFLL;
  if (v9)
  {
    swift_bridgeObjectRetain();
    sub_21A7CF5DC();
    sub_21A7CF588();
    v10 = (int *)type metadata accessor for HoverTextPresentationEvent();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v1 + v10[7], v7, v4);
    v11 = (_QWORD *)(v1 + v10[8]);
    result = swift_bridgeObjectRelease();
    *v11 = 0;
    v11[1] = 0;
    v13 = 0uLL;
    v14 = 0uLL;
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
    {
      v13 = *(_OWORD *)(a1 + 16);
      v14 = *(_OWORD *)(a1 + 32);
    }
    v15 = (_OWORD *)(v1 + v10[9]);
    *v15 = v13;
    v15[1] = v14;
  }
  else
  {
    sub_21A796CC0();
    swift_allocError();
    *v16 = xmmword_21A7D1BA0;
    return swift_willThrow();
  }
  return result;
}

void sub_21A799274(int a1, void *a2)
{
  unint64_t v2;
  unint64_t v3;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  unint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(_QWORD, char *, uint64_t);
  uint64_t v20;
  char *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _OWORD *v32;
  _OWORD *v33;
  char v34;
  id v35;
  void *v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void (*v46)(char *, unint64_t, uint64_t);
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  int *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  AXValueRef v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  char *v83;
  NSObject *v84;
  os_log_type_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  unint64_t v99;
  double v100;
  double v101;
  CGFloat y;
  __n128 v103;
  __n128 v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  __n128 v108;
  __n128 v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(char *, unint64_t, uint64_t);
  char *v113;
  NSObject *v114;
  os_log_type_t v115;
  uint8_t *v116;
  uint64_t v117;
  NSString *v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  void (*v123)(char *, uint64_t);
  unint64_t v124;
  NSObject *v125;
  os_log_type_t v126;
  uint8_t *v127;
  uint8_t *v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD *v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unsigned int v139;
  double *v140;
  double *v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[2];
  void (*v146)(char *, unint64_t, uint64_t);
  unint64_t v147;
  uint64_t v148;
  _QWORD *v149;
  uint64_t v150;
  char *v151;
  int *v152;
  uint64_t v153;
  unint64_t v154;
  void (**v155)(_QWORD, char *, uint64_t);
  id v156;
  id v157;
  int v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  uint64_t v165;
  _OWORD v166[2];
  void *v167;
  uint64_t valuePtr[2];
  CGRect v169;
  uint64_t v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;

  v8 = v2;
  v170 = *MEMORY[0x24BDAC8D0];
  v11 = sub_21A7CF750();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v163 = (char *)v145 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v164 = (char *)v145 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v162 = (char *)v145 - v17;
  v18 = sub_21A7CF5E8();
  MEMORY[0x24BDAC7A8](v18);
  v161 = sub_21A7CF57C();
  v19 = *(void (***)(_QWORD, char *, uint64_t))(v161 - 8);
  MEMORY[0x24BDAC7A8](v161);
  v21 = (char *)v145 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = objc_msgSend((id)objc_opt_self(), sel_primaryApp);
  if (!v22)
    goto LABEL_11;
  v23 = v22;
  v24 = objc_msgSend(v22, sel_uiElement);
  if (!v24)
  {

LABEL_11:
    sub_21A796CC0();
    swift_allocError();
    *v32 = xmmword_21A7D1BD0;
    swift_willThrow();
    return;
  }
  v160 = v11;
  v159 = v24;
  v25 = a2;
  if (!a2)
  {
    v25 = objc_msgSend(v23, sel_firstResponder);
    if (!v25)
      goto LABEL_13;
  }
  v158 = a1;
  v26 = a2;
  v27 = v25;
  v155 = (void (**)(_QWORD, char *, uint64_t))objc_msgSend(v27, sel_uiElement);
  if (!v155)
  {

LABEL_13:
    sub_21A796CC0();
    swift_allocError();
    *v33 = xmmword_21A7D1BC0;
    swift_willThrow();

    return;
  }
  v157 = v23;
  v28 = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v158);
  v156 = v27;
  v153 = v12;
  if (v28 == 0xD000000000000026 && v29 == 0x800000021A7D34E0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    v30 = 0;
    v31 = 0xE000000000000000;
    goto LABEL_18;
  }
  v34 = sub_21A7D023C();
  swift_bridgeObjectRelease();
  if ((v34 & 1) != 0)
  {
    v30 = 0;
    v31 = 0xE000000000000000;
    v27 = v156;
  }
  else
  {
    v27 = v156;
    v35 = objc_msgSend(v156, sel_value);
    if (!v35)
      goto LABEL_9;
    v36 = v35;
    v30 = sub_21A7CFE04();
    v31 = v37;

  }
LABEL_18:
  v38 = objc_msgSend(v27, sel_selectedTextRange);
  v40 = v39;
  v41 = (int *)type metadata accessor for HoverTextPresentationEvent();
  v42 = (_QWORD *)(v8 + v41[11]);
  *v42 = v38;
  v42[1] = v40;
  v149 = v42;
  v154 = v31;
  v43 = sub_21A7CFF54();
  v152 = v41;
  if ((v45 & 1) != 0)
    goto LABEL_50;
  v46 = (void (*)(char *, unint64_t, uint64_t))v43;
  v147 = v44;
  v151 = (char *)v8;
  v8 = v154;
  swift_bridgeObjectRetain();
  v150 = 15;
  v146 = v46;
  v47 = sub_21A7CFE88();
  v49 = v48;
  swift_bridgeObjectRelease();
  sub_21A79A414(10, 0xE100000000000000, v47, v49);
  v51 = v50;
  swift_bridgeObjectRelease();
  v148 = v30;
  if ((v51 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_21A7CFE88();
    swift_bridgeObjectRelease();
    v30 = v148;
    v150 = sub_21A7D0044();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v52 = sub_21A79A3C8(v147, v30, v8);
  v54 = v53;
  v41 = v55;
  v57 = v56;
  swift_bridgeObjectRelease();
  v58 = sub_21A79A57C(10, 0xE100000000000000, v52, v54);
  LOBYTE(v52) = v59;
  swift_bridgeObjectRelease();
  if ((v52 & 1) != 0)
  {
    v61 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0)
      v61 = v148;
    v62 = v61 << 16;
    v60 = v150;
    if ((v8 & 0x1000000000000000) == 0 || (v148 & 0x800000000000000) != 0)
      v58 = v62 | 7;
    else
      v58 = v62 | 0xB;
  }
  else
  {
    v60 = v150;
  }
  v63 = sub_21A7CFE58();
  if (v58 >> 14 < v60 >> 14)
  {
    __break(1u);
    goto LABEL_77;
  }
  v57 = v63;
  v64 = sub_21A7CFE88();
  v66 = v65;
  v8 = v67;
  v58 = v68;
  swift_bridgeObjectRetain();
  sub_21A7CF5DC();
  v147 = v64;
  v148 = v66;
  v41 = (int *)v8;
  sub_21A7CF594();
  v60 = (unint64_t)v152;
  v69 = v151;
  ((void (**)(char *, char *, uint64_t))v19)[5](&v151[v152[7]], v21, v161);
  if (__OFSUB__(*v149, v57))
  {
LABEL_77:
    __break(1u);
LABEL_78:
    swift_once();
    goto LABEL_66;
  }
  *v149 -= v57;
  *(_QWORD *)&v69[*(int *)(v60 + 48)] = v57;
  v70 = sub_21A7CFE28();
  valuePtr[0] = 0;
  valuePtr[1] = v70;
  v71 = AXValueCreate(kAXValueTypeCFRange, valuePtr);
  v72 = v156;
  v73 = objc_msgSend(v156, sel_uiElement);
  if (!v73)
  {

    __break(1u);
    goto LABEL_81;
  }
  v74 = v73;
  v75 = objc_msgSend(v73, sel_objectWithAXAttribute_parameter_, 92508, v71);

  if (v75)
  {
    sub_21A7D00A4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v166, 0, sizeof(v166));
  }
  sub_21A795014((uint64_t)v166, (uint64_t)&v169, &qword_2550F6930);
  if (*(_QWORD *)&v169.size.height)
  {
    sub_21A79E2D4(0, &qword_2550F6290);
    if (swift_dynamicCast())
    {
      v76 = v167;
      goto LABEL_40;
    }
  }
  else
  {
    sub_21A7950C4((uint64_t)&v169, &qword_2550F6930);
  }
  v76 = 0;
LABEL_40:
  v77 = sub_21A7CFE58();
  v78 = sub_21A7D005C();
  swift_bridgeObjectRelease();
  v79 = v160;
  if (v76)
  {
    v80 = v76;
    v81 = v76;
    if (v77 != sub_21A7CF450())
    {
      if (__OFADD__(v77, v78))
        __break(1u);
      if ((uint64_t)objc_msgSend(v81, sel_length) >= v77 + v78)
      {
        v95 = objc_msgSend(v81, sel_substringWithRange_, v77, v78);

        v41 = v152;
        v96 = v152[13];

        *(_QWORD *)&v69[v96] = v95;
        v8 = (unint64_t)v69;
        goto LABEL_50;
      }
    }

    v76 = v80;
  }
  v149 = v76;
  v161 = (uint64_t)v71;
  sub_21A7CF738();
  swift_beginAccess();
  v82 = v153;
  v83 = v162;
  (*(void (**)(void))(v153 + 16))();
  v69 = (char *)v157;
  v84 = sub_21A7CF744();
  v85 = sub_21A7CFF78();
  if (os_log_type_enabled(v84, v85))
  {
    v86 = swift_slowAlloc();
    v150 = swift_slowAlloc();
    *(_QWORD *)&v169.origin.x = v150;
    *(_DWORD *)v86 = 136315394;
    v87 = sub_21A7D002C();
    *(_QWORD *)&v166[0] = sub_21A79C3E4(v87, v88, (uint64_t *)&v169);
    sub_21A7D0074();
    swift_bridgeObjectRelease();
    *(_WORD *)(v86 + 12) = 2080;
    v89 = objc_msgSend(v69, sel_label);
    if (v89)
    {
      v90 = v89;
      v91 = sub_21A7CFE04();
      v93 = v92;

      *(_QWORD *)&v166[0] = sub_21A79C3E4(v91, v93, (uint64_t *)&v169);
      sub_21A7D0074();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21A787000, v84, v85, "Invalid substring range %s %s", (uint8_t *)v86, 0x16u);
      v94 = v150;
      swift_arrayDestroy();
      MEMORY[0x22074950C](v94, -1, -1);
      MEMORY[0x22074950C](v86, -1, -1);

      (*(void (**)(char *, uint64_t))(v153 + 8))(v162, v160);
      v8 = (unint64_t)v151;
      v41 = v152;
      goto LABEL_50;
    }
LABEL_81:

    __break(1u);
    return;
  }

  (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v79);
  v41 = v152;
  v8 = (unint64_t)v151;
LABEL_50:
  v97 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v98 = objc_msgSend(v97, sel_hoverTextTypingDisplayMode);

  v21 = (char *)(v8 + v41[10]);
  *(_QWORD *)v21 = v98;
  v21[8] = 0;
  v58 = (unint64_t)v159;
  objc_msgSend(v159, sel_rectWithAXAttribute_, 2057);
  v3 = v99;
  v19 = v155;
  objc_msgSend(v155, sel_rectWithAXAttribute_, 2057);
  v101 = v100;
  objc_msgSend(v19, sel_rectWithAXAttribute_, 2236);
  y = v171.origin.y;
  v174.origin.x = 0.0;
  v174.origin.y = 0.0;
  v174.size.width = 0.0;
  v174.size.height = 0.0;
  if (CGRectEqualToRect(v171, v174))
  {
    objc_msgSend((id)v58, sel_rectWithAXAttribute_, 2236);
    y = v104.n128_f64[0];
  }
  v60 = (unint64_t)v157;
  v57 = (uint64_t)v156;
  v103.n128_u64[0] = v3;
  v104.n128_f64[0] = y;
  v161 = CGPointMake(v103, v104);
  v150 = v105;
  v149 = v106;
  v148 = v107;
  objc_msgSend(v19, sel_rectWithAXAttribute_, 2050);
  x = v172.origin.x;
  v7 = v172.origin.y;
  width = v172.size.width;
  height = v172.size.height;
  v169 = v172;
  if (CGRectIsNull(v172)
    || (v173.origin.x = x, v173.origin.y = v7,
                           v173.size.width = width,
                           v173.size.height = height,
                           CGRectIsInfinite(v173)))
  {
    v162 = v21;
    v110 = sub_21A7CF738();
    swift_beginAccess();
    v111 = v153;
    v112 = *(void (**)(char *, unint64_t, uint64_t))(v153 + 16);
    v113 = v164;
    v147 = v110;
    v146 = v112;
    v112(v164, v110, v160);
    v114 = sub_21A7CF744();
    v115 = sub_21A7CFF78();
    if (os_log_type_enabled(v114, v115))
    {
      v151 = (char *)v8;
      v116 = (uint8_t *)swift_slowAlloc();
      v117 = swift_slowAlloc();
      valuePtr[0] = v117;
      *(_DWORD *)v116 = 136315138;
      v145[1] = v116 + 4;
      swift_beginAccess();
      v118 = NSStringFromCGRect(v169);
      v119 = sub_21A7CFE04();
      v121 = v120;

      v58 = (unint64_t)v159;
      v19 = v155;
      v165 = sub_21A79C3E4(v119, v121, valuePtr);
      sub_21A7D0074();
      v8 = (unint64_t)v151;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21A787000, v114, v115, "Text cursor frame had infinite coordinates. %s. Falling back to cachedTextCursorFrame.", v116, 0xCu);
      swift_arrayDestroy();
      v122 = v117;
      v57 = (uint64_t)v156;
      MEMORY[0x22074950C](v122, -1, -1);
      MEMORY[0x22074950C](v116, -1, -1);

      v123 = *(void (**)(char *, uint64_t))(v153 + 8);
      v123(v164, v160);
    }
    else
    {

      v123 = *(void (**)(char *, uint64_t))(v111 + 8);
      v123(v113, v160);
    }
    v60 = (unint64_t)v157;
    v41 = v152;
    if (qword_2550F55F8 != -1)
      swift_once();
    v175.origin.x = 0.0;
    v175.origin.y = 0.0;
    v175.size.width = 0.0;
    v175.size.height = 0.0;
    if (CGRectEqualToRect(*(CGRect *)ymmword_2550F61A0, v175))
    {
      v124 = v147;
      swift_beginAccess();
      v146(v163, v124, v160);
      v125 = sub_21A7CF744();
      v126 = sub_21A7CFF90();
      if (os_log_type_enabled(v125, v126))
      {
        v127 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v127 = 0;
        _os_log_impl(&dword_21A787000, v125, v126, "cachedTextCursorFrame is zero. Falling back to first responder frame.", v127, 2u);
        v128 = v127;
        v19 = v155;
        MEMORY[0x22074950C](v128, -1, -1);
      }

      v123(v163, v160);
      v7 = v101;
      v60 = (unint64_t)v157;
    }
    else
    {
      v7 = *(double *)&ymmword_2550F61A0[8];
    }
    v21 = v162;
    goto LABEL_67;
  }
  if (qword_2550F55F8 != -1)
    goto LABEL_78;
LABEL_66:
  *(CGFloat *)ymmword_2550F61A0 = x;
  *(CGFloat *)&ymmword_2550F61A0[8] = v7;
  *(CGFloat *)&ymmword_2550F61A0[16] = width;
  *(CGFloat *)&ymmword_2550F61A0[24] = height;
LABEL_67:
  v108.n128_u64[0] = v3;
  v109.n128_f64[0] = v7;
  v129 = CGPointMake(v108, v109);
  if ((v21[8] & 1) != 0)
  {
    swift_bridgeObjectRelease();

  }
  else
  {
    v134 = v129;
    v135 = v130;
    v136 = v131;
    v137 = v132;
    v138 = *(_QWORD *)v21;
    if (*(_QWORD *)v21 == 2)
    {
      v139 = objc_msgSend((id)v57, sel_hoverTypingShouldAdjustDockedMode);

      swift_bridgeObjectRelease();
      if (v139)
      {
        *(_QWORD *)v21 = 3;
        v21[8] = 0;
        v140 = (double *)(v8 + v41[9]);
        *v140 = v134;
        *((_QWORD *)v140 + 1) = v135;
        *((_QWORD *)v140 + 2) = v136;
        *((_QWORD *)v140 + 3) = v137;
      }
      else
      {
        v142 = (uint64_t *)(v8 + v41[9]);
        v143 = v150;
        *v142 = v161;
        v142[1] = v143;
        v144 = v148;
        v142[2] = (uint64_t)v149;
        v142[3] = v144;
      }
    }
    else
    {
      swift_bridgeObjectRelease();

      if (v138 == 3)
      {
        v141 = (double *)(v8 + v41[9]);
        *v141 = v134;
        *((_QWORD *)v141 + 1) = v135;
        *((_QWORD *)v141 + 2) = v136;
        *((_QWORD *)v141 + 3) = v137;
      }
    }
  }
  v133 = (_QWORD *)(v8 + v41[8]);
  swift_bridgeObjectRelease();
  *v133 = 0;
  v133[1] = 0;
  *(_BYTE *)(v8 + 50) = v158;
}

unint64_t sub_21A79A3C8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_21A7CFE88();
  __break(1u);
  return result;
}

unint64_t sub_21A79A414(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v12;

  v4 = a3 >> 14;
  if (a3 >> 14 != a4 >> 14)
  {
    v5 = sub_21A7D0050();
    if (sub_21A7D0068() != a1 || v8 != a2)
    {
      v9 = sub_21A7D023C();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
        return v5;
      if (v4 == v5 >> 14)
        return 0;
      while (1)
      {
        v5 = sub_21A7D0050();
        if (sub_21A7D0068() == a1 && v10 == a2)
          break;
        v12 = sub_21A7D023C();
        swift_bridgeObjectRelease();
        if ((v12 & 1) != 0)
          return v5;
        if (v4 == v5 >> 14)
          return 0;
      }
    }
    swift_bridgeObjectRelease();
    return v5;
  }
  return 0;
}

unint64_t sub_21A79A57C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
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
  if (sub_21A7D0068() == a1 && v8 == a2)
  {
    v4 = a3;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_21A7D023C();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
    {
      return a3;
    }
    else
    {
      while (1)
      {
        v11 = sub_21A7D0044();
        if (v11 >> 14 == v14)
          return 0;
        v4 = v11;
        if (sub_21A7D0068() == a1 && v12 == a2)
          goto LABEL_6;
        v10 = sub_21A7D023C();
        swift_bridgeObjectRelease();
        if ((v10 & 1) != 0)
          return v4;
      }
    }
  }
  return v4;
}

uint64_t sub_21A79A6F4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char v40;
  void (*v41)(unint64_t, uint64_t);
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  uint64_t v62;
  uint64_t v63;

  v4 = sub_21A7CF540();
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v55 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v46 - v7;
  v8 = sub_21A7CF504();
  v52 = *(_QWORD *)(v8 - 8);
  v53 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21A7CF57C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v50 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v46 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (unint64_t)&v46 - v20;
  v62 = v14;
  if (a1 >> 62)
    goto LABEL_30;
  v22 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v23 = MEMORY[0x24BEE4AF8];
    v46 = a2;
    v58 = v12;
    if (v22)
    {
      v63 = MEMORY[0x24BEE4AF8];
      result = sub_21A7B8FEC(0, v22 & ~(v22 >> 63), 0);
      if (v22 < 0)
      {
        __break(1u);
        return result;
      }
      v61 = v19;
      v25 = 0;
      v26 = v63;
      v27 = a1 & 0xC000000000000001;
      v28 = a1;
      do
      {
        if (v27)
          v29 = (id)MEMORY[0x220748B70](v25, a1);
        else
          v29 = *(id *)(a1 + 8 * v25 + 32);
        v30 = v29;
        sub_21A79ADD8(v21);

        v63 = v26;
        v32 = *(_QWORD *)(v26 + 16);
        v31 = *(_QWORD *)(v26 + 24);
        a2 = v32 + 1;
        if (v32 >= v31 >> 1)
        {
          sub_21A7B8FEC(v31 > 1, v32 + 1, 1);
          v26 = v63;
        }
        ++v25;
        *(_QWORD *)(v26 + 16) = a2;
        v14 = v62;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v62 + 32))(v26+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v62 + 72) * v32, v21, v13);
        a1 = v28;
      }
      while (v22 != v25);
      v12 = v58;
      v19 = v61;
      v23 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v26 = MEMORY[0x24BEE4AF8];
    }
    v63 = v23;
    v49 = *(_QWORD *)(v26 + 16);
    if (!v49)
      break;
    v21 = 0;
    v48 = v13;
    while (v21 < *(_QWORD *)(v26 + 16))
    {
      v33 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      v34 = *(_QWORD *)(v14 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, v26 + v33 + v34 * v21, v13);
      v47 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
      v47(v12, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
        goto LABEL_28;
      v61 = (char *)v33;
      v35 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v59 = v34;
      v60 = v35;
      v35(v19, v12, v13);
      v36 = v51;
      sub_21A7CF4C8();
      sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
      v37 = v54;
      v38 = v19;
      v39 = v53;
      sub_21A7CFF30();
      a1 = (unint64_t)v55;
      sub_21A7CFF3C();
      sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
      a2 = v57;
      v40 = sub_21A7CFDD4();
      v41 = *(void (**)(unint64_t, uint64_t))(v56 + 8);
      v41(a1, a2);
      v41((unint64_t)v37, a2);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v36, v39);
      if ((v40 & 1) != 0)
      {
        v14 = v62;
        v13 = v48;
        (*(void (**)(char *, uint64_t))(v62 + 8))(v38, v48);
        v19 = v38;
      }
      else
      {
        v13 = v48;
        v42 = v60;
        v60(v50, v38, v48);
        v43 = v63;
        v19 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21A7B8FEC(0, *(_QWORD *)(v43 + 16) + 1, 1);
          v43 = v63;
        }
        v14 = v62;
        v44 = v59;
        a1 = *(_QWORD *)(v43 + 16);
        v45 = *(_QWORD *)(v43 + 24);
        a2 = a1 + 1;
        if (a1 >= v45 >> 1)
        {
          sub_21A7B8FEC(v45 > 1, a1 + 1, 1);
          v14 = v62;
          v43 = v63;
        }
        *(_QWORD *)(v43 + 16) = a2;
        v42(&v61[v43 + a1 * v44], v50, v13);
        v63 = v43;
      }
      ++v21;
      v12 = v58;
      if (v49 == v21)
      {
        v47(v58, 1, 1, v13);
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
    v14 = v62;
    v22 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_28:
  swift_bridgeObjectRelease();
  sub_21A7950C4((uint64_t)v12, &qword_2550F5F68);
  sub_21A791EA4(v63, v46);
  return swift_release();
}

uint64_t HoverTextPresentationEvent.description.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21A79ACC4
                                                                     + 4
                                                                     * byte_21A7D1BF4[(*(unsigned __int8 *)(v0 + 48) >> 5) & 3]))(0xD000000000000016, 0x800000021A7D3730);
}

uint64_t sub_21A79ACC4()
{
  return 0x6469447375636F46;
}

uint64_t sub_21A79ACE8()
{
  return 0x61684365756C6156;
}

unint64_t sub_21A79AD08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v9;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;

  v4 = v3[3];
  v5 = v3[4] | v3[5];
  v6 = v3[2] | v3[1];
  if (v2 == 96 && !(v5 | v1 | v4 | v6))
    return 0xD000000000000014;
  v7 = v5 | v4 | v6;
  if (v2 == 96 && v1 == 1 && !v7)
    return 0xD000000000000014;
  v9 = v2 == 96;
  v11 = v1 == 2 && v7 == 0;
  v12 = a1 - 3;
  v13 = a1 + 9;
  if (v9 && v11)
    return v12;
  else
    return v13;
}

BOOL HoverTextPresentationEvent.isTypingEvent.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 50) != 12;
}

void sub_21A79ADD8(uint64_t a1@<X8>)
{
  void *v1;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t *v80;
  void *v81;
  uint64_t v82;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(_QWORD, _QWORD, _QWORD);
  void (*v100)(char *, uint64_t, uint64_t);
  unint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  void (*v115)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char v119;
  void (*v120)(char *, char *, uint64_t);
  uint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  char *v132;
  id v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t *v137;
  void (*v138)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  _QWORD *v152;
  char *v153;
  uint64_t v154;
  char *v155;
  char *v156;
  _QWORD *v157;
  uint64_t v158;
  _OWORD v159[2];
  __int128 v160;
  __int128 v161;

  v140 = a1;
  v2 = sub_21A7CF540();
  v149 = *(_QWORD *)(v2 - 8);
  v150 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v148 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v147 = (char *)&v129 - v5;
  v146 = sub_21A7CF504();
  v145 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146);
  v144 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = (_QWORD *)sub_21A7CF474();
  v139 = *(v152 - 1);
  MEMORY[0x24BDAC7A8](v152);
  v8 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68);
  v141 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v153 = (char *)&v129 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v155 = (char *)&v129 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v157 = (uint64_t *)((char *)&v129 - v15);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v137 = (uint64_t *)((char *)&v129 - v17);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v129 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v136 = (char *)&v129 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v131 = (uint64_t)&v129 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v132 = (char *)&v129 - v25;
  v158 = sub_21A7CF57C();
  v154 = *(_QWORD *)(v158 - 8);
  v26 = MEMORY[0x24BDAC7A8](v158);
  v143 = (char *)&v129 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v129 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v138 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v129 - v32);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v156 = (char *)&v129 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v151 = (char *)&v129 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v130 = (char *)&v129 - v37;
  v38 = objc_msgSend(v1, sel_hasAnyTraits_, *MEMORY[0x24BDFEF88]);
  v39 = 0;
  v142 = 0;
  if (v38)
  {
    v40 = (void *)sub_21A7CFDE0();
    v41 = HTUILocString(v40);

    v39 = sub_21A7CFE04();
    v142 = v42;

  }
  v135 = v39;
  v43 = objc_msgSend(v1, sel_value);
  v44 = *MEMORY[0x24BDFF0C8];
  v45 = v43;
  v46 = v45;
  if (!objc_msgSend(v1, sel_hasAnyTraits_, v44))
  {
LABEL_6:

    goto LABEL_7;
  }
  if (v45)
  {
    objc_msgSend(v45, sel_intValue);
    v47 = (void *)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
    v46 = HTUILocString(v47);

    if (!v46)
    {
      __break(1u);
      return;
    }
    goto LABEL_6;
  }
  v46 = 0;
LABEL_7:
  v48 = objc_msgSend(v1, sel_uiElement);
  if (!v48)
  {
    v160 = 0u;
    v161 = 0u;
LABEL_19:
    sub_21A7950C4((uint64_t)&v160, &qword_2550F6930);
LABEL_20:
    v69 = objc_msgSend(v1, sel_label);
    if (!v69)
    {
      swift_bridgeObjectRelease();
      sub_21A7CF510();

      return;
    }
    v70 = v69;
    v71 = v46;
    v72 = sub_21A7CFE04();
    v74 = v73;

    *(_QWORD *)&v160 = v72;
    *((_QWORD *)&v160 + 1) = v74;
    sub_21A7CF468();
    sub_21A796C40();
    sub_21A7D008C();
    (*(void (**)(char *, _QWORD *))(v139 + 8))(v8, v152);
    swift_bridgeObjectRelease();
    v75 = (uint64_t)v136;
    sub_21A7CF510();
    v76 = *(_QWORD **)(v154 + 56);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v76)(v75, 0, 1, v158);
    v77 = sub_21A79C1D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v79 = *(_QWORD *)(v77 + 16);
    v78 = *(_QWORD *)(v77 + 24);
    v134 = v30;
    if (v79 >= v78 >> 1)
      v77 = sub_21A79C1D4(v78 > 1, v79 + 1, 1, v77);
    v80 = v137;
    *(_QWORD *)(v77 + 16) = v79 + 1;
    v68 = v77;
    sub_21A795014(v75, v77+ ((*(unsigned __int8 *)(v141 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80))+ *(_QWORD *)(v141 + 72) * v79, &qword_2550F5F68);
    v81 = v71;
    v51 = (uint64_t)v20;
    v59 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v76;
    if (!v81)
      goto LABEL_30;
    goto LABEL_24;
  }
  v49 = v48;
  v50 = objc_msgSend(v48, sel_objectWithAXAttribute_, 2001);

  if (v50)
  {
    sub_21A7D00A4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v159, 0, sizeof(v159));
  }
  v51 = (uint64_t)v20;
  sub_21A795014((uint64_t)v159, (uint64_t)&v160, &qword_2550F6930);
  if (!*((_QWORD *)&v161 + 1))
    goto LABEL_19;
  sub_21A79E2D4(0, &qword_2550F6290);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_20;
  v52 = v46;
  v53 = *(void **)&v159[0];
  sub_21A7CF468();
  v54 = (void *)sub_21A7CF45C();
  (*(void (**)(char *, _QWORD *))(v139 + 8))(v8, v152);
  v55 = objc_msgSend(v53, sel_stringByTrimmingCharactersInSet_, v54);

  v134 = v30;
  if (!v55)
  {
    v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v154 + 56);
    v57 = (uint64_t)v132;
    v59(v132, 1, 1, v158);
    goto LABEL_28;
  }
  v56 = objc_msgSend(v55, sel_attributedString);
  v57 = (uint64_t)v132;
  sub_21A7CF5B8();

  v58 = v154;
  v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v154 + 56);
  v60 = v158;
  v59((char *)v57, 0, 1, v158);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v57, 1, v60) == 1)
  {
LABEL_28:

    sub_21A7950C4(v57, &qword_2550F5F68);
    v68 = MEMORY[0x24BEE4AF8];
    goto LABEL_29;
  }
  v61 = v130;
  v62 = v57;
  v63 = v158;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v130, v62, v158);
  v64 = v131;
  (*(void (**)(uint64_t, char *, uint64_t))(v58 + 16))(v131, v61, v63);
  v59((char *)v64, 0, 1, v63);
  v65 = sub_21A79C1D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v66 = *(_QWORD *)(v65 + 16);
  v67 = *(_QWORD *)(v65 + 24);
  if (v66 >= v67 >> 1)
    v65 = sub_21A79C1D4(v67 > 1, v66 + 1, 1, v65);
  *(_QWORD *)(v65 + 16) = v66 + 1;
  v68 = v65;
  sub_21A795014(v131, v65+ ((*(unsigned __int8 *)(v141 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80))+ *(_QWORD *)(v141 + 72) * v66, &qword_2550F5F68);

  (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v158);
LABEL_29:
  v81 = v52;
  v80 = v137;
  if (!v81)
  {
LABEL_30:
    v82 = 1;
    goto LABEL_31;
  }
LABEL_24:
  sub_21A7CFE04();
  sub_21A7CF510();
  v82 = 0;
LABEL_31:
  v59((char *)v51, v82, 1, v158);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v133 = v81;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_66;
  while (1)
  {
    v85 = *(_QWORD *)(v68 + 16);
    v84 = *(_QWORD *)(v68 + 24);
    if (v85 >= v84 >> 1)
      v68 = sub_21A79C1D4(v84 > 1, v85 + 1, 1, v68);
    *(_QWORD *)(v68 + 16) = v85 + 1;
    v86 = (*(unsigned __int8 *)(v141 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80);
    v87 = v68;
    v88 = v68 + v86;
    v89 = *(_QWORD *)(v141 + 72);
    sub_21A795014(v51, v88 + v89 * v85, &qword_2550F5F68);
    if (v142)
    {
      sub_21A7CF510();
      v90 = 0;
    }
    else
    {
      v90 = 1;
    }
    v91 = v154;
    v59((char *)v80, v90, 1, v158);
    v92 = v87;
    v94 = *(_QWORD *)(v87 + 16);
    v93 = *(_QWORD *)(v87 + 24);
    v152 = v59;
    if (v94 >= v93 >> 1)
      v92 = sub_21A79C1D4(v93 > 1, v94 + 1, 1, v87);
    v141 = v92;
    *(_QWORD *)(v92 + 16) = v94 + 1;
    v95 = v92 + v86;
    sub_21A795014((uint64_t)v80, v92 + v86 + v94 * v89, &qword_2550F5F68);
    v96 = *(_QWORD *)(v141 + 16);
    v97 = MEMORY[0x24BEE4AF8];
    if (v96)
    {
      swift_bridgeObjectRetain();
      v51 = MEMORY[0x24BEE4AF8];
      v80 = &qword_2550F5F68;
      v98 = (uint64_t)v155;
      do
      {
        v99 = (void (*)(_QWORD, _QWORD, _QWORD))v157;
        sub_21A79E28C(v95, (uint64_t)v157);
        sub_21A795014((uint64_t)v99, v98, &qword_2550F5F68);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v98, 1, v158) == 1)
        {
          sub_21A7950C4(v98, &qword_2550F5F68);
        }
        else
        {
          v100 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 32);
          v101 = v51;
          v102 = v151;
          v103 = v98;
          v104 = v158;
          v100(v151, v103, v158);
          v100(v156, (uint64_t)v102, v104);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v101 = sub_21A79BFCC(0, *(_QWORD *)(v101 + 16) + 1, 1, v101);
          v106 = *(_QWORD *)(v101 + 16);
          v105 = *(_QWORD *)(v101 + 24);
          v107 = v101;
          if (v106 >= v105 >> 1)
            v107 = sub_21A79BFCC(v105 > 1, v106 + 1, 1, v101);
          *(_QWORD *)(v107 + 16) = v106 + 1;
          v51 = v107;
          v100((char *)(v107+ ((*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80))+ *(_QWORD *)(v91 + 72) * v106), (uint64_t)v156, v158);
          v98 = (uint64_t)v155;
        }
        v95 += v89;
        --v96;
      }
      while (v96);
      swift_bridgeObjectRelease();
      v97 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v51 = MEMORY[0x24BEE4AF8];
    }
    *(_QWORD *)&v160 = v97;
    v59 = v138;
    v108 = (uint64_t)v153;
    v151 = *(char **)(v51 + 16);
    if (!v151)
      break;
    v68 = 0;
    v142 = v51;
    while (v68 < *(_QWORD *)(v51 + 16))
    {
      v109 = (*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80);
      v110 = *(char **)(v91 + 72);
      v111 = v158;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v91 + 16))(v108, v51 + v109 + (_QWORD)v110 * v68, v158);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v152)(v108, 0, 1, v111);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v108, 1, v111) == 1)
        goto LABEL_64;
      v155 = v110;
      v156 = (char *)v109;
      v112 = v158;
      v157 = *(_QWORD **)(v91 + 32);
      ((void (*)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t, uint64_t))v157)(v59, v108, v158);
      v113 = v144;
      sub_21A7CF4C8();
      sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
      v114 = v147;
      v115 = v59;
      v116 = v146;
      sub_21A7CFF30();
      v117 = v148;
      sub_21A7CFF3C();
      sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
      v118 = v150;
      v119 = sub_21A7CFDD4();
      v80 = *(uint64_t **)(v149 + 8);
      ((void (*)(char *, uint64_t))v80)(v117, v118);
      ((void (*)(char *, uint64_t))v80)(v114, v118);
      (*(void (**)(char *, uint64_t))(v145 + 8))(v113, v116);
      if ((v119 & 1) != 0)
      {
        v91 = v154;
        (*(void (**)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))(v154 + 8))(v115, v112);
        v108 = (uint64_t)v153;
        v59 = v115;
      }
      else
      {
        v120 = (void (*)(char *, char *, uint64_t))v157;
        ((void (*)(char *, void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))v157)(v143, v115, v112);
        v121 = v160;
        v59 = v115;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21A7B8FEC(0, *(_QWORD *)(v121 + 16) + 1, 1);
          v121 = v160;
        }
        v122 = v153;
        v91 = v154;
        v124 = v155;
        v123 = v156;
        v126 = *(_QWORD *)(v121 + 16);
        v125 = *(_QWORD *)(v121 + 24);
        v80 = (uint64_t *)(v126 + 1);
        if (v126 >= v125 >> 1)
        {
          sub_21A7B8FEC(v125 > 1, v126 + 1, 1);
          v121 = v160;
        }
        *(_QWORD *)(v121 + 16) = v80;
        v120(&v123[v121 + v126 * (_QWORD)v124], v143, v158);
        *(_QWORD *)&v160 = v121;
        v108 = (uint64_t)v122;
      }
      ++v68;
      v51 = v142;
      if (v151 == (char *)v68)
        goto LABEL_63;
    }
    __break(1u);
LABEL_66:
    v68 = sub_21A79C1D4(0, *(_QWORD *)(v68 + 16) + 1, 1, v68);
  }
LABEL_63:
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v152)(v108, 1, 1, v158);
LABEL_64:
  swift_bridgeObjectRelease();
  sub_21A7950C4(v108, &qword_2550F5F68);
  swift_bridgeObjectRelease();
  v127 = (uint64_t)v134;
  sub_21A791EA4(v160, (uint64_t)v134);
  swift_release();
  v128 = sub_21A796D04(10, 0xE100000000000000);
  sub_21A791EA4(v128, v140);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v127, v158);
}

id sub_21A79BCD8(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_21A7D01C4();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x220748B70](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x220748B70](0, v2);
LABEL_21:
    v14 = v13;
    sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
    v15 = sub_21A7D0020();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x220748B70](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x220748B70](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_21A7D0020();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_21A7D0020();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A79BFCC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
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
        goto LABEL_29;
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62A0);
  v10 = *(_QWORD *)(sub_21A7CF57C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21A7D01AC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_21A7CF57C() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21A79D078(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_21A79C1D4(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
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
        goto LABEL_29;
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62D8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21A7D01AC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21A79CF5C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_21A79C3E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21A79C524(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21A79E24C((uint64_t)v12, *a3);
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
      sub_21A79E24C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

id sub_21A79C4B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 < 0)
    return (id)swift_bridgeObjectRetain();
  else
    return a1;
}

void sub_21A79C4C4(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;

  v7 = (a7 >> 5) & 3;
  switch(v7)
  {
    case 2:
      swift_bridgeObjectRelease();

      break;
    case 1:
      swift_bridgeObjectRelease();
      break;
    case 0:
      sub_21A79C514(a1, a2, a3, (uint64_t)a4, a5, a6, a7);
      break;
  }
}

void sub_21A79C514(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 < 0)
    swift_bridgeObjectRelease();
  else

}

uint64_t sub_21A79C524(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21A7D0080();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21A79C6DC(a5, a6);
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
  v8 = sub_21A7D0128();
  if (!v8)
  {
    sub_21A7D01AC();
    __break(1u);
LABEL_17:
    result = sub_21A7D0200();
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

uint64_t sub_21A79C6DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21A79C770(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21A79C948(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21A79C948(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21A79C770(uint64_t a1, unint64_t a2)
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
      v3 = sub_21A79C8E4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21A7D0104();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21A7D01AC();
      __break(1u);
LABEL_10:
      v2 = sub_21A7CFE4C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21A7D0200();
    __break(1u);
LABEL_14:
    result = sub_21A7D01AC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21A79C8E4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6288);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21A79C948(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6288);
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
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t sub_21A79CA94(unint64_t a1)
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
    v3 = sub_21A7D01C4();
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
    v5 = sub_21A7D01C4();
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
    v4 = MEMORY[0x220748B7C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_21A79CC4C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_21A7D01C4();
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
    return sub_21A7CFEC4();
  }
  __break(1u);
  return result;
}

uint64_t sub_21A79CC4C(unint64_t a1, uint64_t a2, unint64_t a3)
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
    v7 = sub_21A7D01C4();
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
    v10 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_21A794FD4(&qword_2550F62E8, &qword_2550F62E0, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62E0);
          v12 = sub_21A79CE68(v16, i, a3);
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
    sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

void (*sub_21A79CE68(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21A79CEE8(v6, a2, a3);
  return sub_21A79CEBC;
}

void sub_21A79CEBC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21A79CEE8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x220748B70](a2, a3);
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
    return sub_21A79CF54;
  }
  __break(1u);
  return result;
}

void sub_21A79CF54(id *a1)
{

}

uint64_t sub_21A79CF5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t sub_21A79D078(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_21A7CF57C() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t _s11HoverTextUI0aB17PresentationEventV011ValueChangeE4TypeO03rawF0AESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21A7D0218();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC)
    return 12;
  else
    return v0;
}

uint64_t sub_21A79D1D8(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for HoverTextPresentationEvent.EventType(a2, a1);
  return a2;
}

uint64_t sub_21A79D20C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  *(_BYTE *)(a2 + 48) = *((_BYTE *)a1 + 48);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t sub_21A79D22C(uint64_t a1, uint64_t a2)
{
  __swift_memcpy49_8(a2, a1);
  return a2;
}

uint64_t sub_21A79D268(uint64_t a1)
{
  sub_21A79C4B4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  return a1;
}

unint64_t sub_21A79D2A8()
{
  unint64_t result;

  result = qword_2550F61D0;
  if (!qword_2550F61D0)
  {
    result = MEMORY[0x220749464](&protocol conformance descriptor for HoverTextPresentationEvent.ValueChangeEventType, &type metadata for HoverTextPresentationEvent.ValueChangeEventType);
    atomic_store(result, (unint64_t *)&qword_2550F61D0);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for HoverTextPresentationEvent(char *a1, char **a2, int *a3)
{
  int v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  _OWORD *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  char *v33;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v33 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v33[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = (uint64_t)a2[1];
    v9 = (uint64_t)a2[2];
    v10 = a2[3];
    v11 = (uint64_t)a2[4];
    v12 = (uint64_t)a2[5];
    v13 = *((_BYTE *)a2 + 48);
    sub_21A79D438(*a2, v8, v9, v10, v11, v12, v13);
    *(_QWORD *)a1 = v7;
    *((_QWORD *)a1 + 1) = v8;
    *((_QWORD *)a1 + 2) = v9;
    *((_QWORD *)a1 + 3) = v10;
    *((_QWORD *)a1 + 4) = v11;
    *((_QWORD *)a1 + 5) = v12;
    a1[48] = v13;
    *(_WORD *)(a1 + 49) = *(_WORD *)((char *)a2 + 49);
    v14 = a3[7];
    v15 = &a1[v14];
    v16 = (uint64_t)a2 + v14;
    v17 = sub_21A7CF57C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v18 = a3[8];
    v19 = a3[9];
    v20 = &a1[v18];
    v21 = (char **)((char *)a2 + v18);
    v22 = v21[1];
    *(_QWORD *)v20 = *v21;
    *((_QWORD *)v20 + 1) = v22;
    v23 = &a1[v19];
    v24 = (_OWORD *)((char *)a2 + v19);
    v25 = v24[1];
    *(_OWORD *)v23 = *v24;
    *((_OWORD *)v23 + 1) = v25;
    v26 = a3[10];
    v27 = a3[11];
    v28 = &a1[v26];
    v29 = (uint64_t)a2 + v26;
    *(_QWORD *)v28 = *(_QWORD *)v29;
    v28[8] = *(_BYTE *)(v29 + 8);
    *(_OWORD *)&a1[v27] = *(_OWORD *)((char *)a2 + v27);
    v30 = a3[13];
    *(_QWORD *)&a1[a3[12]] = *(char **)((char *)a2 + a3[12]);
    v31 = *(char **)((char *)a2 + v30);
    *(_QWORD *)&a1[v30] = v31;
    swift_bridgeObjectRetain();
    v32 = v31;
  }
  return a1;
}

id sub_21A79D438(id result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  id v8;

  v7 = (a7 >> 5) & 3;
  switch(v7)
  {
    case 2:
      v8 = a4;
      return (id)swift_bridgeObjectRetain();
    case 1:
      return (id)swift_bridgeObjectRetain();
    case 0:
      return sub_21A79C4B4(result, a2, a3, (uint64_t)a4, a5, a6, a7);
  }
  return result;
}

void destroy for HoverTextPresentationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_21A79C4C4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v6 = *(id *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(void **)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(unsigned __int8 *)(a2 + 48);
  sub_21A79D438(*(id *)a2, v7, v8, v9, v10, v11, v12);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  v17 = a3[8];
  v18 = a3[9];
  v19 = (_QWORD *)(a1 + v17);
  v20 = (_QWORD *)(a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (_OWORD *)(a1 + v18);
  v23 = (_OWORD *)(a2 + v18);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = a3[10];
  v26 = a3[11];
  v27 = a1 + v25;
  v28 = a2 + v25;
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *(_BYTE *)(v27 + 8) = *(_BYTE *)(v28 + 8);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  v29 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v30 = *(void **)(a2 + v29);
  *(_QWORD *)(a1 + v29) = v30;
  swift_bridgeObjectRetain();
  v31 = v30;
  return a1;
}

uint64_t assignWithCopy for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;

  v6 = *(id *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(void **)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(unsigned __int8 *)(a2 + 48);
  sub_21A79D438(*(id *)a2, v7, v8, v9, v10, v11, v12);
  v13 = *(void **)a1;
  v14 = *(_QWORD *)(a1 + 8);
  v15 = *(_QWORD *)(a1 + 16);
  v16 = *(void **)(a1 + 24);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  v19 = *(unsigned __int8 *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v12;
  sub_21A79C4C4(v13, v14, v15, v16, v17, v18, v19);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  v20 = a3[7];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  v24 = a3[8];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[9];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  v28[2] = v29[2];
  v28[3] = v29[3];
  v30 = a3[10];
  v31 = a1 + v30;
  v32 = (uint64_t *)(a2 + v30);
  v33 = *v32;
  *(_BYTE *)(v31 + 8) = *((_BYTE *)v32 + 8);
  *(_QWORD *)v31 = v33;
  v34 = a3[11];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v37 = a3[13];
  v38 = *(void **)(a1 + v37);
  v39 = *(void **)(a2 + v37);
  *(_QWORD *)(a1 + v37) = v39;
  v40 = v39;

  return a1;
}

uint64_t initializeWithTake for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  v12 = (_OWORD *)(a1 + v11);
  v13 = (_OWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[10];
  v16 = a3[11];
  v17 = a1 + v15;
  v18 = a2 + v15;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  v19 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v19) = *(_QWORD *)(a2 + v19);
  return a1;
}

uint64_t assignWithTake for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  _OWORD *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v6 = *(_BYTE *)(a2 + 48);
  v7 = *(void **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(void **)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v14 = *(unsigned __int8 *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v6;
  sub_21A79C4C4(v7, v8, v9, v10, v11, v12, v14);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  v19 = a3[8];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)(a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  v24 = a3[9];
  v25 = a3[10];
  v26 = (_OWORD *)(a1 + v24);
  v27 = (_OWORD *)(a2 + v24);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = a1 + v25;
  v30 = a2 + v25;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  *(_QWORD *)v29 = *(_QWORD *)v30;
  v31 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v31) = *(_QWORD *)(a2 + v31);
  v32 = a3[13];
  v33 = *(void **)(a1 + v32);
  *(_QWORD *)(a1 + v32) = *(_QWORD *)(a2 + v32);

  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A79D9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_21A7CF57C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 28), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A79DA4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21A7CF57C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 28), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32) + 8) = a2;
  return result;
}

uint64_t sub_21A79DACC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A7CF57C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t destroy for HoverTextPresentationEvent.Error(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s11HoverTextUI26HoverTextPresentationEventV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for HoverTextPresentationEvent.Error(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for HoverTextPresentationEvent.Error(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent.Error(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483644);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 3;
  if (v4 >= 5)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 3;
  }
  return result;
}

uint64_t sub_21A79DDA8(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_21A79DDC0(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for HoverTextPresentationEvent.Error()
{
  return &type metadata for HoverTextPresentationEvent.Error;
}

void destroy for HoverTextPresentationEvent.EventType(uint64_t a1)
{
  sub_21A79C4C4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t initializeWithCopy for HoverTextPresentationEvent.EventType(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(unsigned __int8 *)(a2 + 48);
  sub_21A79D438(*(id *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for HoverTextPresentationEvent.EventType(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(unsigned __int8 *)(a2 + 48);
  sub_21A79D438(*(id *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(void **)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(void **)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(unsigned __int8 *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_21A79C4C4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for HoverTextPresentationEvent.EventType(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unsigned int v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(unsigned __int8 *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_21A79C4C4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent.EventType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3D && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 61);
  v3 = ((2 * *(unsigned __int8 *)(a1 + 48)) & 0x3C | (*(unsigned __int8 *)(a1 + 48) >> 5) & 3) ^ 0x3F;
  if (v3 >= 0x3C)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent.EventType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3C)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 61;
    if (a3 >= 0x3D)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0x3D)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
    {
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)result = 0u;
      *(_BYTE *)(result + 48) = 2 * ((((-a2 >> 2) & 0xF) - 16 * a2) & 0x3F);
    }
  }
  return result;
}

uint64_t sub_21A79E03C(uint64_t a1)
{
  unsigned int v1;

  v1 = (*(unsigned __int8 *)(a1 + 48) >> 5) & 3;
  if (v1 == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return v1;
}

uint64_t sub_21A79E058(uint64_t result)
{
  *(_BYTE *)(result + 48) &= 0x9Fu;
  return result;
}

uint64_t sub_21A79E068(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(_BYTE *)(result + 48) = *(_BYTE *)(result + 48) & 0x81 | (32 * a2);
  }
  else
  {
    *(_QWORD *)result = a2 - 3;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0;
    *(_BYTE *)(result + 48) = 96;
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTextPresentationEvent.EventType()
{
  return &type metadata for HoverTextPresentationEvent.EventType;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent.ValueChangeEventType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent.ValueChangeEventType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_21A79E19C + 4 * byte_21A7D1BFD[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_21A79E1D0 + 4 * byte_21A7D1BF8[v4]))();
}

uint64_t sub_21A79E1D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A79E1D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A79E1E0);
  return result;
}

uint64_t sub_21A79E1EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A79E1F4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_21A79E1F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A79E200(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A79E20C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21A79E214(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HoverTextPresentationEvent.ValueChangeEventType()
{
  return &type metadata for HoverTextPresentationEvent.ValueChangeEventType;
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

uint64_t sub_21A79E24C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21A79E28C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A79E2D4(uint64_t a1, unint64_t *a2)
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

uint64_t destroy for HoverTextLayout()
{
  return swift_release();
}

uint64_t initializeWithCopy for HoverTextLayout(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for HoverTextLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = v5;
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for HoverTextLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  swift_release();
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextLayout(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverTextLayout(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTextLayout()
{
  return &type metadata for HoverTextLayout;
}

unint64_t sub_21A79E4E4()
{
  unint64_t result;

  result = qword_2550F62F0;
  if (!qword_2550F62F0)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_2550F62F0);
  }
  return result;
}

uint64_t sub_21A79E528@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  void (*v4)(_QWORD *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  sub_21A7CF8DC();
  sub_21A791288(&qword_2550F6308, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC7A0]);
  sub_21A7CFF30();
  sub_21A7CFF3C();
  if (v9[4] == v9[0])
  {
    v2 = sub_21A7CF888();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    v4 = (void (*)(_QWORD *, _QWORD))sub_21A7CFF48();
    v6 = v5;
    v7 = sub_21A7CF888();
    v8 = *(_QWORD *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

void sub_21A79E640()
{
  uint64_t **v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t *);
  uint64_t (*v5)(void);
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = **v0;
  v4 = (uint64_t (*)(uint64_t, uint64_t *))v2[18];
  if (v4(v3, v2))
  {
    if (v4(v3, v2) == 1)
    {
      v5 = *(uint64_t (**)(void))(*v1 + 128);
      v6 = v5();
      ((void (*)(uint64_t))v5)(v6);
      CGRectMake();
    }
  }
  else
  {
    (*(void (**)(void))(*v1 + 128))();
    CGRectMake();
  }
}

double sub_21A79E70C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MaxX;
  CGFloat v28;
  double v29;
  double MinY;
  double MaxY;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat rect;
  CGFloat width;
  CGFloat y;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat x;
  CGFloat v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v44 = CGRectUnion(*(CGRect *)&a1, *(CGRect *)&a5);
  x = v44.origin.x;
  v43 = a8;
  width = v44.size.width;
  y = v44.origin.y;
  v35 = a7;
  rect = v44.size.height;
  v33 = a5;
  v34 = a6;
  v44.origin.x = a5;
  v44.origin.y = a6;
  v44.size.width = a7;
  v44.size.height = a8;
  MinX = CGRectGetMinX(v44);
  v39 = a1;
  v40 = a2;
  v45.origin.x = a1;
  v45.origin.y = a2;
  v17 = a3;
  v45.size.width = a3;
  v18 = a4;
  v45.size.height = a4;
  if (MinX >= CGRectGetMinX(v45))
  {
    v26 = v33;
    v25 = v34;
    v48.origin.x = v33;
    v48.origin.y = v34;
    v24 = v35;
    v48.size.width = v35;
    v48.size.height = v43;
    MaxX = CGRectGetMaxX(v48);
    v49.origin.x = v39;
    v20 = v40;
    v49.origin.y = v40;
    v21 = v17;
    v22 = v39;
    v49.size.width = v21;
    v49.size.height = v18;
    v28 = CGRectGetMaxX(v49);
    v23 = 0.0;
    if (v28 < MaxX)
    {
      v50.origin.x = v33;
      v50.origin.y = v34;
      v50.size.width = v35;
      v50.size.height = v43;
      v29 = CGRectGetMaxX(v50);
      v51.origin.x = v39;
      v51.origin.y = v40;
      v51.size.width = v21;
      v51.size.height = v18;
      v23 = v29 - CGRectGetMaxX(v51);
    }
  }
  else
  {
    v46.origin.x = x;
    v46.size.width = width;
    v46.origin.y = y;
    v46.size.height = rect;
    v19 = CGRectGetMinX(v46);
    v47.origin.x = a1;
    v20 = v40;
    v47.origin.y = v40;
    v21 = v17;
    v22 = a1;
    v47.size.width = v21;
    v47.size.height = v18;
    v23 = v19 - CGRectGetMinX(v47);
    v25 = a6;
    v24 = v35;
    v26 = v33;
  }
  v41 = v23;
  v52.origin.x = v26;
  v52.origin.y = v25;
  v52.size.width = v24;
  v52.size.height = v43;
  MinY = CGRectGetMinY(v52);
  v53.origin.x = v22;
  v53.origin.y = v20;
  v53.size.width = v21;
  v53.size.height = v18;
  if (MinY >= CGRectGetMinY(v53))
  {
    v56.origin.x = v26;
    v56.origin.y = v25;
    v56.size.width = v24;
    v56.size.height = v43;
    MaxY = CGRectGetMaxY(v56);
    v57.origin.x = v22;
    v57.origin.y = v20;
    v57.size.width = v21;
    v57.size.height = v18;
    if (CGRectGetMaxY(v57) < MaxY)
    {
      v58.origin.x = v26;
      v58.origin.y = v25;
      v58.size.width = v24;
      v58.size.height = v43;
      CGRectGetMaxY(v58);
      v59.origin.x = v22;
      v59.origin.y = v20;
      v59.size.width = v21;
      v59.size.height = v18;
      CGRectGetMaxY(v59);
    }
  }
  else
  {
    v54.origin.x = x;
    v54.size.width = width;
    v54.origin.y = y;
    v54.size.height = rect;
    CGRectGetMinY(v54);
    v55.origin.x = v22;
    v55.origin.y = v20;
    v55.size.width = v21;
    v55.size.height = v18;
    CGRectGetMinY(v55);
  }
  return v41;
}

double sub_21A79E950(uint64_t a1, char a2)
{
  double result;

  result = *(double *)&a1;
  if ((a2 & 1) != 0)
    return 10.0;
  return result;
}

uint64_t sub_21A79E970(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_21A79EC4C(a1, a2 & 1, a3, a4 & 1);
}

uint64_t sub_21A79E9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_21A79EA18(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF44F8]);
}

uint64_t sub_21A79E9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_21A79EA18(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF4500]);
}

uint64_t sub_21A79EA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_21A79EA54(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_21A7CF798();
  return sub_21A79CEBC;
}

unint64_t sub_21A79EAB8()
{
  unint64_t result;

  result = qword_2550F62F8;
  if (!qword_2550F62F8)
  {
    result = MEMORY[0x220749464](&unk_21A7D1E7C, &type metadata for HoverTextLayout);
    atomic_store(result, (unint64_t *)&qword_2550F62F8);
  }
  return result;
}

__n128 sub_21A79EAFC@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(__n128 *)(v3 + 136);
  v5 = *(_OWORD *)(v3 + 152);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_21A79EB8C()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A79EC4C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  char v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  BOOL v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  _BOOL4 v83;
  double v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t KeyPath;
  uint64_t v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void (*v100)(void);
  double v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGFloat height;
  CGFloat v111;
  char v112;
  _QWORD *v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6300);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21A7CF888();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  *(_QWORD *)&v15 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A79E528((uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    return sub_21A79F318((uint64_t)v11);
  v17 = (*(uint64_t (**)(double, char *, uint64_t))(v13 + 32))(COERCE_DOUBLE(*(_QWORD *)&v15), v11, v12);
  if ((a2 & 1) != 0)
    v18 = 10.0;
  else
    v18 = *(double *)&a1;
  if ((a4 & 1) != 0)
    v19 = 10.0;
  else
    v19 = *(double *)&a3;
  v20 = *(uint64_t **)v4;
  v21 = *(_QWORD *)(v4 + 8);
  v22 = **(_QWORD **)v4;
  v23 = *(uint64_t (**)(uint64_t))(v22 + 152);
  v24 = v23(v17);
  v26 = v25;
  v27 = ((double (*)(uint64_t))v23)(v24);
  v28 = UIEdgeInsetsInsetRect(v26, v27, v18, v19, 10.0, 10.0);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  type metadata accessor for HoverTypingStore();
  v35 = swift_dynamicCastClass();
  v100 = (void (*)(void))v23;
  if (!v35)
  {
    v113 = v20;
    v36 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 144);
    if (v36(v22, v21))
    {
      v113 = v20;
      v36(v22, v21);
    }
  }
  LOBYTE(v113) = 0;
  v112 = 0;
  sub_21A7CF870();
  v38 = v37;
  v40 = v39;
  sub_21A79E640();
  v45 = UIEdgeInsetsInsetRect(v41, v42, v43, v44, -15.0, -15.0);
  v47 = v45;
  v49 = v48;
  v51 = v50;
  v52 = *(_BYTE *)(v4 + 64);
  v111 = v34;
  v104 = v32;
  v53 = v28;
  if ((v52 & 1) != 0)
  {
    v54 = v45;
    v55 = v46;
    sub_21A7CFD20();
    v46 = v55;
    v47 = v54;
  }
  else
  {
    v56 = *(double *)(v4 + 48);
    v57 = *(double *)(v4 + 56);
  }
  v121.size.height = v40;
  v102 = v46;
  v103 = v47;
  v58 = v47 + v46 * v56;
  v59 = 1.0 - v56;
  v60 = v38;
  v61 = v58 - v38 * (1.0 - v56);
  v108 = 1.0 - v57;
  v109 = v49 + v51 * v57;
  v105 = v51;
  v106 = v49;
  v62 = v121.size.height * (1.0 - v57);
  v63 = v109 - v62;
  v114.origin.x = v53;
  v107 = v53;
  v114.origin.y = v30;
  v64 = v104;
  v114.size.width = v104;
  v65 = v60;
  v114.size.height = v111;
  v121.origin.x = v61;
  v121.origin.y = v109 - v62;
  v121.size.width = v65;
  height = v121.size.height;
  if (CGRectContainsRect(v114, v121))
  {
    v66 = v63;
    v107 = v61;
    v67 = height;
    v68 = v65;
  }
  else
  {
    v101 = v62;
    v69 = height;
    v70 = sub_21A79E70C(v107, v30, v64, v111, v61, v63, v65, height);
    v97 = v71;
    v72 = -v70;
    v115.origin.x = v61;
    v115.origin.y = v63;
    v115.size.width = v65;
    v115.size.height = v69;
    v116 = CGRectOffset(v115, v72, 0.0);
    v73 = v102;
    v74 = v103;
    v122.origin.x = v103;
    v122.size.height = v105;
    v122.origin.y = v106;
    v122.size.width = v102;
    if (CGRectIntersectsRect(v116, v122))
    {
      v58 = v74 + v73 * v59;
      v59 = 1.0 - v59;
    }
    v99 = v59;
    v75 = v65 * v59;
    v76 = v58 - v65 * v59;
    v77 = v107;
    v117.origin.x = v107;
    v117.origin.y = v30;
    v117.size.width = v64;
    v123.size.height = height;
    v117.size.height = v111;
    v123.origin.x = v76;
    v123.origin.y = v63;
    v123.size.width = v65;
    v78 = CGRectContainsRect(v117, v123);
    v79 = v77;
    v80 = v63;
    v95 = v75;
    v96 = v30;
    if (v78)
    {
      v98 = v58;
      v81 = v79;
      v67 = height;
    }
    else
    {
      v82 = v30;
      v81 = v79;
      v67 = height;
      v98 = v58 - sub_21A79E70C(v79, v82, v64, v111, v76, v80, v65, height);
      v76 = v98 - v75;
      v109 = v109 + 0.0;
      v80 = v109 - v101;
    }
    v68 = v65;
    v118.origin.x = v76;
    v118.origin.y = v80;
    v118.size.width = v65;
    v118.size.height = v67;
    v119 = CGRectOffset(v118, 0.0, -v97);
    v124.size.width = v102;
    v124.origin.x = v103;
    v124.size.height = v105;
    v124.origin.y = v106;
    v83 = CGRectIntersectsRect(v119, v124);
    v107 = v76;
    if (v83)
    {
      if (swift_dynamicCastClass())
      {
        v100();
        v85 = v108;
      }
      else
      {
        v85 = v108;
        v84 = v106 + v105 * v108;
      }
      v86 = v96;
      v108 = 1.0 - v85;
      v109 = v84;
      v101 = v67 * (1.0 - v85);
      v80 = v84 - v101;
    }
    else
    {
      v86 = v96;
    }
    v120.origin.x = v81;
    v120.origin.y = v86;
    v120.size.width = v64;
    v87 = v111;
    v120.size.height = v111;
    v88 = v64;
    v89 = v107;
    v125.origin.x = v107;
    v125.origin.y = v80;
    v125.size.width = v68;
    v125.size.height = v67;
    if (CGRectContainsRect(v120, v125))
    {
      v66 = v80;
    }
    else
    {
      sub_21A79E70C(v81, v86, v88, v87, v89, v80, v68, v67);
      v107 = v98 + 0.0 - v95;
      v66 = v109 - v90 - v101;
    }
  }
  v91 = swift_dynamicCastClass();
  if (v91)
  {
    v92 = v91;
    KeyPath = swift_getKeyPath();
    v111 = v15;
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v94 - 6) = v92;
    *((double *)&v94 - 5) = v107;
    *((double *)&v94 - 4) = v66;
    *((CGFloat *)&v94 - 3) = v68;
    *((double *)&v94 - 2) = v67;
    v113 = (_QWORD *)v92;
    sub_21A79F374(v4);
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    sub_21A7CF6C0();
    swift_release();
    sub_21A79F39C(v4);
    v15 = v111;
  }
  LOBYTE(v113) = 0;
  v112 = 0;
  sub_21A7CF87C();
  return (*(uint64_t (**)(double, uint64_t))(v13 + 8))(COERCE_DOUBLE(*(_QWORD *)&v15), v12);
}

uint64_t sub_21A79F318(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6300);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double *sub_21A79F360()
{
  return sub_21A79F3C4();
}

uint64_t sub_21A79F374(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_21A79F39C(uint64_t a1)
{
  swift_release();
  return a1;
}

double *sub_21A79F3C4()
{
  uint64_t v0;

  return sub_21A7BB564(*(double **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

double CGRectMake()
{
  return 0.0;
}

ValueMetadata *type metadata accessor for HoverTypingCursorView()
{
  return &type metadata for HoverTypingCursorView;
}

uint64_t sub_21A79F408()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A79F418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[2];
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v46 = a2;
  v38 = sub_21A7CFA08();
  MEMORY[0x24BDAC7A8](v38);
  v37[1] = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21A7CF7EC();
  v5 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  v41 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6310);
  v9 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  v43 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6318);
  v13 = *(_QWORD *)(v12 - 8);
  v44 = v12;
  v45 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v39 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6320);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6328);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6330);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6338);
  MEMORY[0x24BDAC7A8](v37[0]);
  v25 = (char *)v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v17 = sub_21A7CF96C();
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6340);
  sub_21A79F964(a1, (uint64_t)&v17[*(int *)(v26 + 44)]);
  sub_21A795080((uint64_t)v17, (uint64_t)v20, &qword_2550F6320);
  v20[*(int *)(v18 + 36)] = 0;
  sub_21A7950C4((uint64_t)v17, &qword_2550F6320);
  swift_getKeyPath();
  *(_QWORD *)&v47 = a1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  CGRectGetHeight(*(CGRect *)(a1 + 136));
  sub_21A7CFCA8();
  sub_21A7CF840();
  sub_21A795080((uint64_t)v20, (uint64_t)v23, &qword_2550F6328);
  v27 = &v23[*(int *)(v21 + 36)];
  v28 = v48;
  *(_OWORD *)v27 = v47;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v49;
  sub_21A7950C4((uint64_t)v20, &qword_2550F6328);
  sub_21A7BA1F8();
  v30 = v29;
  sub_21A795080((uint64_t)v23, (uint64_t)v25, &qword_2550F6330);
  v31 = &v25[*(int *)(v37[0] + 36)];
  *(_QWORD *)v31 = v30;
  *((_QWORD *)v31 + 1) = 0;
  sub_21A7950C4((uint64_t)v23, &qword_2550F6330);
  sub_21A7CFA20();
  sub_21A7CF7C8();
  sub_21A791288(&qword_2550F6348, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB540], MEMORY[0x24BDEB530]);
  sub_21A791288(&qword_2550F6350, MEMORY[0x24BDEB500], MEMORY[0x24BDEB520]);
  swift_retain();
  v32 = v40;
  sub_21A7CFC90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v32);
  sub_21A794FD4(&qword_2550F6358, &qword_2550F6310, MEMORY[0x24BDED570]);
  swift_retain();
  v33 = v39;
  v34 = v42;
  sub_21A7CFC84();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v34);
  sub_21A7CF804();
  sub_21A7951D8(&qword_2550F6360, &qword_2550F6338, sub_21A79FC8C, MEMORY[0x24BDEC438]);
  sub_21A794FD4(&qword_2550F6390, &qword_2550F6318, MEMORY[0x24BDEC410]);
  v35 = v44;
  sub_21A7CFB58();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v35);
  return sub_21A7950C4((uint64_t)v25, &qword_2550F6338);
}

uint64_t sub_21A79F964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  const __CTFont *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = sub_21A7CFC78();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6398);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F63A0);
  v10 = MEMORY[0x24BDAC7A8](v24[0]);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v24 - v13;
  v15 = *MEMORY[0x24BDEEB68];
  v16 = sub_21A7CF990();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v6, v15, v16);
  swift_getKeyPath();
  *(_QWORD *)&v25 = a1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v17 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  CTFontGetAscent(v17);
  CTFontGetDescent(v17);
  CTFontGetLeading(v17);

  sub_21A7CFCA8();
  sub_21A7CF840();
  sub_21A79FD54((uint64_t)v6, (uint64_t)v9);
  v18 = &v9[*(int *)(v7 + 36)];
  v19 = v26;
  *(_OWORD *)v18 = v25;
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v27;
  sub_21A79FD98((uint64_t)v6);
  swift_getKeyPath();
  v24[1] = a1;
  sub_21A7CF6CC();
  swift_release();
  v20 = *(_QWORD *)(a1 + 96);
  sub_21A795080((uint64_t)v9, (uint64_t)v12, &qword_2550F6398);
  *(_QWORD *)&v12[*(int *)(v24[0] + 36)] = v20;
  swift_retain();
  sub_21A7950C4((uint64_t)v9, &qword_2550F6398);
  sub_21A79FDDC((uint64_t)v12, (uint64_t)v14);
  sub_21A795080((uint64_t)v14, (uint64_t)v12, &qword_2550F63A0);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F63A8);
  sub_21A795080((uint64_t)v12, a2 + *(int *)(v21 + 48), &qword_2550F63A0);
  v22 = a2 + *(int *)(v21 + 64);
  *(_QWORD *)v22 = 0;
  *(_BYTE *)(v22 + 8) = 1;
  sub_21A7950C4((uint64_t)v14, &qword_2550F63A0);
  return sub_21A7950C4((uint64_t)v12, &qword_2550F63A0);
}

uint64_t sub_21A79FC74@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21A79F418(*v1, a1);
}

uint64_t sub_21A79FC8C()
{
  return sub_21A7951D8(&qword_2550F6368, &qword_2550F6330, (uint64_t (*)(void))sub_21A79FCB0, MEMORY[0x24BDEBEE0]);
}

unint64_t sub_21A79FCB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F6370;
  if (!qword_2550F6370)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6328);
    v2[0] = sub_21A794FD4(&qword_2550F6378, &qword_2550F6320, MEMORY[0x24BDF4498]);
    v2[1] = sub_21A794FD4(&qword_2550F6380, &qword_2550F6388, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F6370);
  }
  return result;
}

uint64_t sub_21A79FD54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A7CFC78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A79FD98(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A7CFC78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A79FDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F63A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A79FE24()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6338);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6318);
  sub_21A7951D8(&qword_2550F6360, &qword_2550F6338, sub_21A79FC8C, MEMORY[0x24BDEC438]);
  sub_21A794FD4(&qword_2550F6390, &qword_2550F6318, MEMORY[0x24BDEC410]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A79FECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  __int128 v15;
  void *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6530);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21A7CFFCC();
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6538);
  v9 = *(_QWORD *)(v8 - 8);
  v27 = v8;
  v28 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6540);
  v13 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  v30 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v24 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  v15 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *(_OWORD *)(v0 + 32) = *MEMORY[0x24BEBE158];
  *(_OWORD *)(v0 + 48) = v15;
  *(_QWORD *)(v0 + 64) = 1;
  *(_QWORD *)(v0 + 72) = sub_21A7A53DC(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6548);
  swift_allocObject();
  v16 = (void *)sub_21A7CF768();
  *(_QWORD *)(v0 + 88) = v16;
  v32 = v16;
  swift_retain();
  sub_21A7CFFC0();
  sub_21A7A11F4();
  v31 = (id)sub_21A7CFFE4();
  v17 = sub_21A7CFFB4();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v23(v4, 1, 1, v17);
  sub_21A794FD4(&qword_2550F6550, &qword_2550F6548, MEMORY[0x24BDB9CB0]);
  sub_21A7A1230();
  sub_21A7CF780();
  sub_21A7950C4((uint64_t)v4, &qword_2550F6530);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
  swift_release();
  v32 = (id)sub_21A7CFFE4();
  v23(v4, 1, 1, v17);
  sub_21A794FD4(&qword_2550F6560, &qword_2550F6538, MEMORY[0x24BDB9920]);
  v18 = v24;
  v19 = v27;
  sub_21A7CF774();
  sub_21A7950C4((uint64_t)v4, &qword_2550F6530);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v19);
  swift_allocObject();
  swift_weakInit();
  sub_21A794FD4(&qword_2550F6568, &qword_2550F6540, MEMORY[0x24BDB9A08]);
  v20 = v29;
  v21 = sub_21A7CF78C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v20);
  *(_QWORD *)(v1 + 80) = v21;
  swift_release();
  return v1;
}

void sub_21A7A0254(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  __CFNotificationCenter *v15;
  __CFNotificationCenter *v16;
  uint64_t v17;
  id v18;
  __CFString *v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void *v29;
  uint64_t v30;

  v4 = v3;
  v8 = sub_21A7CF750();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  v15 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v15)
  {
    v16 = v15;
    if (a1)
    {
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = a2;
      *(_QWORD *)(v17 + 24) = a3;
      v18 = a1;
      swift_beginAccess();
      v19 = (__CFString *)v18;
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v30 = v4[9];
      v4[9] = 0x8000000000000000;
      sub_21A7CDF7C((uint64_t)sub_21A7A0E70, v17, v19, isUniquelyReferenced_nonNull_native);
      v4[9] = v30;

      swift_bridgeObjectRelease();
      swift_endAccess();
      CFNotificationCenterAddObserver(v16, v4, (CFNotificationCallback)sub_21A7A0B68, v19, 0, (CFNotificationSuspensionBehavior)HTSuspensionBehavior);

    }
    else
    {
      v25 = sub_21A7CF738();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v25, v8);
      v26 = sub_21A7CF744();
      v27 = sub_21A7CFF90();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_21A787000, v26, v27, "Notification name nil", v28, 2u);
        MEMORY[0x22074950C](v28, -1, -1);
        v29 = v16;
      }
      else
      {
        v29 = v26;
        v26 = v16;
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  else
  {
    v21 = sub_21A7CF738();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v21, v8);
    v22 = sub_21A7CF744();
    v23 = sub_21A7CFF90();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21A787000, v22, v23, "Darwin Center unavailable", v24, 2u);
      MEMORY[0x22074950C](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

double sub_21A7A0548()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double sub_21A7A0550()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

double sub_21A7A055C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  double result;
  __int128 v6;
  _OWORD v7[2];
  char v8;

  *(double *)(v4 + 16) = a3;
  *(double *)(v4 + 24) = a4;
  *(_QWORD *)(v4 + 64) = a1;
  sub_21A7A0E04(a2, (uint64_t)v7);
  if ((v8 & 1) == 0)
  {
    result = *(double *)v7;
    v6 = v7[1];
    *(_OWORD *)(v4 + 32) = v7[0];
    *(_OWORD *)(v4 + 48) = v6;
  }
  return result;
}

uint64_t sub_21A7A05A0(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v1 = *a1;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong
    && (v9[0] = Strong,
        type metadata accessor for HoverStoreCommon(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6578),
        (swift_dynamicCast() & 1) != 0))
  {
    if (*((_QWORD *)&v7 + 1))
    {
      sub_21A7A12A4(&v6, (uint64_t)v9);
      v3 = v10;
      v4 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 272))(v1, v3, v4);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
    }
  }
  else
  {
    v8 = 0;
    v6 = 0u;
    v7 = 0u;
  }
  return sub_21A7950C4((uint64_t)&v6, &qword_2550F6570);
}

void sub_21A7A0688()
{
  _QWORD *v0;
  __CFNotificationCenter *v1;
  __CFNotificationCenter *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;

  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  if (!v1)
    return;
  v2 = v1;
  swift_beginAccess();
  v3 = v0[9];
  v4 = v3 + 64;
  v5 = 1 << *(_BYTE *)(v3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v3 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_6;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v8)
      goto LABEL_22;
    v13 = *(_QWORD *)(v4 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v8)
        goto LABEL_22;
      v13 = *(_QWORD *)(v4 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v8)
          goto LABEL_22;
        v13 = *(_QWORD *)(v4 + 8 * v9);
        if (!v13)
          break;
      }
    }
LABEL_21:
    v7 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_6:
    CFNotificationCenterRemoveObserver(v2, v0, *(CFNotificationName *)(*(_QWORD *)(v3 + 48) + 8 * v11), 0);
  }
  v14 = v12 + 3;
  if (v14 >= v8)
  {
LABEL_22:
    swift_release();

    return;
  }
  v13 = *(_QWORD *)(v4 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v8)
      goto LABEL_22;
    v13 = *(_QWORD *)(v4 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_21;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_21A7A0804()
{
  sub_21A7A0688();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HoverStoreCommon()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for HoverStoreCommon.Feature(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HoverStoreCommon.Feature(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A7A0938 + 4 * byte_21A7D2065[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21A7A096C + 4 * byte_21A7D2060[v4]))();
}

uint64_t sub_21A7A096C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A7A0974(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A7A097CLL);
  return result;
}

uint64_t sub_21A7A0988(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A7A0990);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21A7A0994(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A7A099C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21A7A09A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HoverStoreCommon.Feature()
{
  return &type metadata for HoverStoreCommon.Feature;
}

uint64_t getEnumTagSinglePayload for HoverStoreCommon.StyleItem(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEE)
    goto LABEL_17;
  if (a2 + 18 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 18) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 18;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 18;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 18;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x13;
  v8 = v6 - 19;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverStoreCommon.StyleItem(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 18 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 18) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xED)
    return ((uint64_t (*)(void))((char *)&loc_21A7A0AA0 + 4 * byte_21A7D206F[v4]))();
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_21A7A0AD4 + 4 * byte_21A7D206A[v4]))();
}

uint64_t sub_21A7A0AD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A7A0ADC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A7A0AE4);
  return result;
}

uint64_t sub_21A7A0AF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A7A0AF8);
  *(_BYTE *)result = a2 + 18;
  return result;
}

uint64_t sub_21A7A0AFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A7A0B04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HoverStoreCommon.StyleItem()
{
  return &type metadata for HoverStoreCommon.StyleItem;
}

unint64_t sub_21A7A0B24()
{
  unint64_t result;

  result = qword_2550F6518;
  if (!qword_2550F6518)
  {
    result = MEMORY[0x220749464](&unk_21A7D2134, &type metadata for HoverStoreCommon.StyleItem);
    atomic_store(result, (unint64_t *)&qword_2550F6518);
  }
  return result;
}

void sub_21A7A0B68(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v8 = a1;
  v9 = a3;
  v10 = a5;
  sub_21A7A0E94(a2, a3);

}

BOOL sub_21A7A0BD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21A7A0BEC()
{
  sub_21A7D02A8();
  sub_21A7D02B4();
  return sub_21A7D02E4();
}

uint64_t sub_21A7A0C30()
{
  return sub_21A7D02B4();
}

uint64_t sub_21A7A0C58()
{
  sub_21A7D02A8();
  sub_21A7D02B4();
  return sub_21A7D02E4();
}

BOOL sub_21A7A0C98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_21A7A0CB0()
{
  unint64_t result;

  result = qword_2550F6520;
  if (!qword_2550F6520)
  {
    result = MEMORY[0x220749464](&unk_21A7D219C, &type metadata for HoverStoreCommon.Feature);
    atomic_store(result, (unint64_t *)&qword_2550F6520);
  }
  return result;
}

uint64_t sub_21A7A0CF4(char a1)
{
  uint64_t result;
  id v2;
  id v3;
  uint64_t v4;

  switch(a1)
  {
    case 3:
    case 4:
    case 10:
    case 11:
    case 12:
      result = sub_21A7CFBDC();
      break;
    case 5:
    case 13:
      v2 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
      MEMORY[0x220748648](v2);
      v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      objc_msgSend(v3, sel_hoverTextBackgroundOpacity);

      v4 = sub_21A7CFBD0();
      swift_release();
      result = v4;
      break;
    case 16:
      result = sub_21A7CFB94();
      break;
    case 17:
      result = sub_21A7CFBA0();
      break;
    default:
      result = sub_21A7CFBC4();
      break;
  }
  return result;
}

uint64_t sub_21A7A0E04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7A0E4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7A0E70(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_21A7A0E94(uint64_t a1, void *a2)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  char v18;
  void (*v19)(_QWORD *);
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  NSObject *v33;
  _QWORD v34[3];

  v4 = sub_21A7CF750();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v34 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v34 - v12;
  if (a1)
  {
    if (a2)
    {
      swift_retain();
      swift_beginAccess();
      v14 = *(_QWORD *)(a1 + 72);
      v15 = *(_QWORD *)(v14 + 16);
      v16 = a2;
      if (v15)
      {
        swift_bridgeObjectRetain();
        v17 = sub_21A7CCB5C((uint64_t)v16);
        if ((v18 & 1) != 0)
        {
          v19 = *(void (**)(_QWORD *))(*(_QWORD *)(v14 + 56) + 16 * v17);
          swift_retain();
          swift_bridgeObjectRelease();
          v34[0] = a1;
          v19(v34);

          swift_release();
          return swift_release();
        }
        swift_bridgeObjectRelease();
      }
      v29 = sub_21A7CF738();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v29, v4);
      v30 = sub_21A7CF744();
      v31 = sub_21A7CFF90();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_21A787000, v30, v31, "No handler found ", v32, 2u);
        MEMORY[0x22074950C](v32, -1, -1);
        v33 = v16;
      }
      else
      {
        v33 = v30;
        v30 = v16;
      }

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      v25 = sub_21A7CF738();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v25, v4);
      v26 = sub_21A7CF744();
      v27 = sub_21A7CFF90();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_21A787000, v26, v27, "cfNotificationName for darwin callback handler not found", v28, 2u);
        MEMORY[0x22074950C](v28, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    }
  }
  else
  {
    v21 = sub_21A7CF738();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v21, v4);
    v22 = sub_21A7CF744();
    v23 = sub_21A7CFF90();
    if (os_log_type_enabled(v22, (os_log_type_t)v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21A787000, v22, (os_log_type_t)v23, "Observer for darwin callback handler not found", v24, 2u);
      MEMORY[0x22074950C](v24, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
}

unint64_t sub_21A7A11F4()
{
  unint64_t result;

  result = qword_2550F6790;
  if (!qword_2550F6790)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2550F6790);
  }
  return result;
}

unint64_t sub_21A7A1230()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2550F6558;
  if (!qword_2550F6558)
  {
    v1 = sub_21A7A11F4();
    result = MEMORY[0x220749464](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_2550F6558);
  }
  return result;
}

uint64_t sub_21A7A1278()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A7A129C(unsigned __int8 *a1)
{
  return sub_21A7A05A0(a1);
}

uint64_t sub_21A7A12A4(__int128 *a1, uint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21A7A12E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v5;

  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  v5 = a3 & 1;
  *(_BYTE *)(a5 + 16) = v5;
  *(_QWORD *)(a5 + 24) = a4;
  sub_21A7A4658(a1, a2, v5);
  return swift_bridgeObjectRetain();
}

double HoverTextMarqueeingContentView.init(delay:rate:multiplier:startingPosition:marqueeBegan:marqueeCompleted:content:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, uint64_t a13)
{
  int *v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  double result;
  __int128 v33;

  *(_QWORD *)a9 = 0x4028000000000000;
  v24 = (int *)type metadata accessor for HoverTextMarqueeingContentView(0, a8, a13, a4);
  v25 = (uint64_t *)(a9 + v24[16]);
  *v25 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  swift_storeEnumTagMultiPayload();
  v26 = (_QWORD *)(a9 + v24[17]);
  v27 = property wrapper backing initializer of HoverTextMarqueeingContentView.contentSize();
  *v26 = v28;
  v26[1] = v29;
  v26[2] = v27;
  v30 = (_OWORD *)(a9 + v24[18]);
  sub_21A7CFC00();
  *v30 = v33;
  v31 = v24[19];
  sub_21A7CFC00();
  result = *(double *)&v33;
  *(_OWORD *)(a9 + v31) = v33;
  *(double *)(a9 + 8) = a10;
  *(double *)(a9 + 16) = a11;
  *(double *)(a9 + 24) = a12;
  *(_QWORD *)(a9 + 72) = a6;
  *(_QWORD *)(a9 + 80) = a7;
  *(_QWORD *)(a9 + 32) = a1;
  *(_QWORD *)(a9 + 40) = a2;
  *(_QWORD *)(a9 + 48) = a3;
  *(_QWORD *)(a9 + 56) = a4;
  *(_QWORD *)(a9 + 64) = a5;
  return result;
}

uint64_t type metadata accessor for HoverTextMarqueeingContentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HoverTextMarqueeingContentView);
}

double sub_21A7A1474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  double v7;
  double v8;
  void (*v9)(char *, uint64_t);
  double v10;
  double v11;
  uint64_t v13;

  v0 = sub_21A7CF960();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - v5;
  sub_21A7CF954();
  sub_21A7CF930();
  v8 = v7;
  v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v6, v0);
  sub_21A7CF954();
  sub_21A7CF930();
  v11 = v10;
  v9(v4, v0);
  return v8 + v11;
}

uint64_t sub_21A7A1538()
{
  return sub_21A7CF93C();
}

uint64_t sub_21A7A1558()
{
  return sub_21A7CF93C();
}

uint64_t sub_21A7A1578(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_21A7CF90C();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21A7CF948();
}

uint64_t property wrapper backing initializer of HoverTextMarqueeingContentView.contentSize()
{
  uint64_t v1;

  type metadata accessor for CGSize(0);
  sub_21A7CFC00();
  return v1;
}

uint64_t property wrapper backing initializer of HoverTextMarqueeingContentView.needsScrolling()
{
  uint64_t v1;

  sub_21A7CFC00();
  return v1;
}

uint64_t property wrapper backing initializer of HoverTextMarqueeingContentView.resetScrollingID()
{
  uint64_t v1;

  sub_21A7CFC00();
  return v1;
}

double sub_21A7A16A0()
{
  double v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66B0);
  sub_21A7CFC0C();
  return v1;
}

uint64_t HoverTextMarqueeingContentView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
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
  void (*v53)(uint64_t, uint64_t);
  char *v55;
  void (*v56)(uint64_t, char *, uint64_t);
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
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
  _OWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];

  v74 = a2;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6590);
  v3 = MEMORY[0x24BDAC7A8](v73);
  v72 = (_OWORD *)((char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(_QWORD *)(a1 - 8);
  v69 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = *(_QWORD *)(a1 + 16);
  v8 = a1;
  v67 = a1;
  v9 = sub_21A7CF918();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6598);
  v10 = sub_21A7CF918();
  type metadata accessor for CGSize(255);
  v12 = v11;
  v68 = *(_QWORD *)(v8 + 24);
  v85[0] = v68;
  v85[1] = MEMORY[0x24BDEDB80];
  v13 = MEMORY[0x24BDED308];
  v14 = MEMORY[0x220749464](MEMORY[0x24BDED308], v9, v85);
  v15 = sub_21A794FD4(&qword_2550F65A0, &qword_2550F6598, MEMORY[0x24BDEFF30]);
  v84[0] = v14;
  v84[1] = v15;
  v16 = MEMORY[0x220749464](v13, v10, v84);
  v17 = sub_21A791288(&qword_2550F65A8, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD858]);
  v80 = v10;
  v81 = v12;
  v82 = v16;
  v83 = v17;
  v18 = v17;
  v71 = v17;
  MEMORY[0x220749434](255, &v80, MEMORY[0x24BDF3908], 0);
  v19 = sub_21A7CF918();
  v80 = v10;
  v81 = v12;
  v82 = v16;
  v83 = v18;
  v79[0] = swift_getOpaqueTypeConformance2();
  v79[1] = MEMORY[0x24BDEC438];
  v20 = MEMORY[0x220749464](v13, v19, v79);
  v80 = v19;
  v81 = MEMORY[0x24BEE1768];
  v82 = v20;
  v83 = MEMORY[0x24BEE1778];
  v21 = sub_21A7CFC30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65B0);
  v22 = sub_21A7CF918();
  v23 = MEMORY[0x220749464](MEMORY[0x24BDF44C8], v21);
  v24 = sub_21A794FD4(&qword_2550F65B8, &qword_2550F65B0, (uint64_t)&protocol conformance descriptor for AnimationCompletionModifier<A>);
  v78[0] = v23;
  v78[1] = v24;
  v58 = MEMORY[0x220749464](v13, v22, v78);
  v59 = sub_21A7CF8D0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65C0);
  v25 = sub_21A7CF918();
  v65 = *(_QWORD *)(v25 - 8);
  v62 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v60 = (char *)&v55 - v26;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65C8);
  v63 = sub_21A7CF918();
  v66 = *(_QWORD *)(v63 - 8);
  v27 = MEMORY[0x24BDAC7A8](v63);
  v61 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v64 = (uint64_t)&v55 - v29;
  v57 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v30 = v7;
  v55 = v7;
  v31 = v7;
  v32 = v70;
  v33 = v67;
  v57(v31, v70, v67);
  v34 = *(unsigned __int8 *)(v5 + 80);
  v35 = (v34 + 32) & ~v34;
  v69 = v34 | 7;
  v36 = swift_allocObject();
  v37 = v68;
  *(_QWORD *)(v36 + 16) = v75;
  *(_QWORD *)(v36 + 24) = v37;
  v56 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v56(v36 + v35, v30, v33);
  v80 = sub_21A7CF8C4();
  v81 = v38;
  v39 = v72;
  v40 = v32;
  sub_21A7A2A84(v72);
  v41 = MEMORY[0x220749464](MEMORY[0x24BDEC6F8], v59);
  sub_21A7A2D9C();
  v42 = v60;
  sub_21A7CFB40();
  sub_21A7950C4((uint64_t)v39, &qword_2550F6590);
  swift_release();
  v43 = v55;
  v57(v55, v40, v33);
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = v75;
  *(_QWORD *)(v44 + 24) = v37;
  v56(v44 + v35, v43, v33);
  v45 = sub_21A794FD4(&qword_2550F6608, &qword_2550F65C0, MEMORY[0x24BDEB9D0]);
  v77[0] = v41;
  v77[1] = v45;
  v46 = MEMORY[0x24BDED308];
  v47 = v62;
  v48 = MEMORY[0x220749464](MEMORY[0x24BDED308], v62, v77);
  sub_21A7A2F78();
  v49 = (uint64_t)v61;
  sub_21A7CFB28();
  swift_release();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v42, v47);
  v50 = sub_21A794FD4(&qword_2550F6618, &qword_2550F65C8, MEMORY[0x24BDF09B0]);
  v76[0] = v48;
  v76[1] = v50;
  v51 = v63;
  MEMORY[0x220749464](v46, v63, v76);
  v52 = v64;
  sub_21A7A6A14(v49, v51, v64);
  v53 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
  v53(v49, v51);
  sub_21A7A4FDC(v52, v51, v74);
  return ((uint64_t (*)(uint64_t, uint64_t))v53)(v52, v51);
}

uint64_t sub_21A7A1D60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  __int128 *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, char *, uint64_t);
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t *v68;
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
  void (*v79)(uint64_t, uint64_t);
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t OpaqueTypeConformance2;
  char *v95;
  char *v96;
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
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[2];
  __int128 v122;
  _QWORD v123[2];
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD v127[2];
  _QWORD v128[2];

  v92 = a2;
  v117 = a1;
  v114 = a5;
  v120 = a3;
  v106 = type metadata accessor for HoverTextMarqueeingContentView(0, a3, a4, a4);
  v112 = *(_QWORD *)(v106 - 8);
  v113 = *(_QWORD *)(v112 + 64);
  MEMORY[0x24BDAC7A8](v106);
  v109 = (char *)&v81 - v7;
  v115 = sub_21A7CF858();
  v91 = *(_QWORD *)(v115 - 8);
  v119 = *(_QWORD *)(v91 + 64);
  v8 = MEMORY[0x24BDAC7A8](v115);
  v90 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21A7CF918();
  v99 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v82 = (char *)&v81 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6598);
  v84 = v12;
  v14 = sub_21A7CF918();
  v110 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v118 = (char *)&v81 - v15;
  type metadata accessor for CGSize(255);
  v17 = v16;
  v128[0] = a4;
  v128[1] = MEMORY[0x24BDEDB80];
  v116 = a4;
  v18 = MEMORY[0x24BDED308];
  v19 = MEMORY[0x220749464](MEMORY[0x24BDED308], v12, v128);
  v83 = v19;
  v20 = sub_21A794FD4(&qword_2550F65A0, &qword_2550F6598, MEMORY[0x24BDEFF30]);
  v127[0] = v19;
  v127[1] = v20;
  v21 = MEMORY[0x220749464](v18, v14, v127);
  v22 = sub_21A791288(&qword_2550F65A8, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD858]);
  *(_QWORD *)&v124 = v14;
  *((_QWORD *)&v124 + 1) = v17;
  v86 = v14;
  v89 = v17;
  v125 = v21;
  v126 = v22;
  v88 = v21;
  v87 = v22;
  v23 = MEMORY[0x220749434](0, &v124, MEMORY[0x24BDF3908], 0);
  v103 = *(_QWORD *)(v23 - 8);
  v100 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v95 = (char *)&v81 - v24;
  v25 = sub_21A7CF918();
  v104 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v96 = (char *)&v81 - v26;
  *(_QWORD *)&v124 = v14;
  *((_QWORD *)&v124 + 1) = v17;
  v125 = v21;
  v126 = v22;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v123[0] = OpaqueTypeConformance2;
  v123[1] = MEMORY[0x24BDEC438];
  v98 = v25;
  v97 = MEMORY[0x220749464](v18, v25, v123);
  *(_QWORD *)&v124 = v25;
  *((_QWORD *)&v124 + 1) = MEMORY[0x24BEE1768];
  v125 = v97;
  v126 = MEMORY[0x24BEE1778];
  v27 = sub_21A7CFC30();
  v108 = *(_QWORD *)(v27 - 8);
  v102 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v93 = (char *)&v81 - v28;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65B0);
  v107 = sub_21A7CF918();
  v111 = *(_QWORD *)(v107 - 8);
  v29 = MEMORY[0x24BDAC7A8](v107);
  v101 = (uint64_t)&v81 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v105 = (uint64_t)&v81 - v32;
  v33 = v92;
  (*(void (**)(uint64_t))(v92 + 72))(v31);
  v34 = v120;
  sub_21A7CFB7C();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v11, v34);
  sub_21A7CFC24();
  v35 = v91;
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 16);
  v37 = v90;
  v38 = v117;
  v39 = v115;
  v36(v90, v117, v115);
  v40 = *(unsigned __int8 *)(v35 + 80);
  v41 = swift_allocObject();
  v85 = *(_QWORD *)(v35 + 32);
  v42 = v37;
  ((void (*)(uint64_t, char *, uint64_t))v85)(v41 + ((v40 + 16) & ~v40), v37, v39);
  type metadata accessor for CGRect(0);
  sub_21A7A2F78();
  v43 = v84;
  v44 = v82;
  sub_21A7CFB1C();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v44, v43);
  v45 = v106;
  v46 = (__int128 *)(v33 + *(int *)(v106 + 68));
  v47 = *((_QWORD *)v46 + 2);
  v124 = *v46;
  v125 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66B0);
  sub_21A7CFC0C();
  v124 = v122;
  v48 = v112;
  v99 = *(_QWORD *)(v112 + 16);
  v49 = v109;
  ((void (*)(char *, uint64_t, uint64_t))v99)(v109, v33, v45);
  v50 = v42;
  v51 = v38;
  v52 = v115;
  v36(v42, v51, v115);
  v53 = *(unsigned __int8 *)(v48 + 80);
  v54 = v48;
  v55 = (v53 + 32) & ~v53;
  v113 += v55;
  v91 = v53 | 7;
  v56 = (v113 + v40) & ~v40;
  v57 = swift_allocObject();
  v58 = v116;
  *(_QWORD *)(v57 + 16) = v120;
  *(_QWORD *)(v57 + 24) = v58;
  v59 = *(void (**)(uint64_t, char *, uint64_t))(v54 + 32);
  v59(v57 + v55, v49, v45);
  ((void (*)(uint64_t, char *, uint64_t))v85)(v57 + v56, v50, v52);
  v60 = v95;
  v61 = v86;
  v62 = v118;
  sub_21A7CFB70();
  swift_release();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v62, v61);
  v63 = v45;
  sub_21A7A2884(v117, v45);
  v64 = v96;
  v65 = v100;
  sub_21A7CFB4C();
  (*(void (**)(char *, uint64_t))(v103 + 8))(v60, v65);
  v124 = *(_OWORD *)(v33 + *(int *)(v63 + 76));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66B8);
  sub_21A7CFC0C();
  v66 = v93;
  v67 = v98;
  sub_21A7CFB34();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v64, v67);
  v68 = (uint64_t *)(v33 + *(int *)(v63 + 72));
  v69 = *v68;
  v70 = v68[1];
  *(_QWORD *)&v124 = v69;
  *((_QWORD *)&v124 + 1) = v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66C0);
  sub_21A7CFC0C();
  ((void (*)(char *, uint64_t, uint64_t))v99)(v49, v33, v63);
  v71 = swift_allocObject();
  v72 = v116;
  *(_QWORD *)(v71 + 16) = v120;
  *(_QWORD *)(v71 + 24) = v72;
  v59(v71 + v55, v49, v63);
  v73 = v102;
  v74 = MEMORY[0x220749464](MEMORY[0x24BDF44C8], v102);
  sub_21A7A4AF8();
  v75 = v101;
  View.onAnimationCompletion<A>(for:completion:)((uint64_t)&v122, (uint64_t)sub_21A7A4AB0, v71, v73, MEMORY[0x24BEE50B0], v74, v101);
  swift_release();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v66, v73);
  v76 = sub_21A794FD4(&qword_2550F65B8, &qword_2550F65B0, (uint64_t)&protocol conformance descriptor for AnimationCompletionModifier<A>);
  v121[0] = v74;
  v121[1] = v76;
  v77 = v107;
  MEMORY[0x220749464](MEMORY[0x24BDED308], v107, v121);
  v78 = v105;
  sub_21A7A6A14(v75, v77, v105);
  v79 = *(void (**)(uint64_t, uint64_t))(v111 + 8);
  v79(v75, v77);
  sub_21A7A4FDC(v78, v77, v114);
  return ((uint64_t (*)(uint64_t, uint64_t))v79)(v78, v77);
}

uint64_t sub_21A7A2714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HoverTextMarqueeingContentView(0, v6, v7, a2) - 8)
                          + 80);
  return sub_21A7A1D60(a1, v3 + ((v8 + 32) & ~v8), v6, v7, a3);
}

void sub_21A7A277C(uint64_t a1, uint64_t a2, double a3)
{
  sub_21A7A36C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66C0);
  sub_21A7CFC18();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66B8);
  sub_21A7CFC0C();
  sub_21A7CFC18();
  swift_release();
  sub_21A7A3240(a3, a1, a2);
}

void sub_21A7A2884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void (*v17)(char *, uint64_t);
  _QWORD v18[4];

  v4 = sub_21A7CF90C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - v9;
  v11 = sub_21A7A16A0();
  sub_21A7CF84C();
  if (v12 + sub_21A7A1474() <= v11)
  {
    v13 = (uint64_t *)(v2 + *(int *)(a2 + 72));
    v14 = *v13;
    v15 = v13[1];
    v18[1] = v14;
    v18[2] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66C0);
    sub_21A7CFC0C();
    if (*(double *)&v18[3] == 0.0)
    {
      sub_21A7A4B3C((uint64_t)v10);
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BDED100], v4);
      v16 = sub_21A7CF900();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
      if ((v16 & 1) == 0)
        sub_21A7CF84C();
    }
    else
    {
      sub_21A7A16A0();
      sub_21A7CF84C();
    }
  }
  else
  {
    sub_21A7CF9A8();
    if ((sub_21A7CF99C() & 1) != 0 || (sub_21A7CF9B4(), (sub_21A7CF99C() & 1) != 0))
    {
      sub_21A7CF84C();
      sub_21A7A16A0();
    }
  }
}

uint64_t sub_21A7A2A84@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[11];
  uint64_t v27;
  _OWORD v28[12];
  char v29;
  __int128 v30;
  _OWORD v31[12];
  __int128 v32;
  _OWORD v33[2];

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6600);
  MEMORY[0x24BDAC7A8](v25);
  v3 = (uint64_t *)((char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = sub_21A7CF90C();
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_21A7CF96C();
  sub_21A7A2FF0((uint64_t)v26);
  *(_OWORD *)((char *)&v28[8] + 7) = v26[8];
  *(_OWORD *)((char *)&v28[9] + 7) = v26[9];
  *(_OWORD *)((char *)&v28[10] + 7) = v26[10];
  *(_OWORD *)((char *)&v28[4] + 7) = v26[4];
  *(_OWORD *)((char *)&v28[5] + 7) = v26[5];
  *(_OWORD *)((char *)&v28[6] + 7) = v26[6];
  *(_OWORD *)((char *)&v28[7] + 7) = v26[7];
  *(_OWORD *)((char *)v28 + 7) = v26[0];
  *(_OWORD *)((char *)&v28[1] + 7) = v26[1];
  *(_OWORD *)((char *)&v28[2] + 7) = v26[2];
  v29 = 0;
  *(_QWORD *)((char *)&v28[11] + 7) = v27;
  *(_OWORD *)((char *)&v28[3] + 7) = v26[3];
  v7 = sub_21A7CFA50();
  sub_21A7CF7BC();
  *(_OWORD *)((char *)&v31[8] + 1) = v28[8];
  *(_OWORD *)((char *)&v31[9] + 1) = v28[9];
  *(_OWORD *)((char *)&v31[10] + 1) = v28[10];
  v31[11] = *(_OWORD *)((char *)&v28[10] + 15);
  *(_OWORD *)((char *)&v31[4] + 1) = v28[4];
  *(_OWORD *)((char *)&v31[5] + 1) = v28[5];
  *(_OWORD *)((char *)&v31[6] + 1) = v28[6];
  *(_OWORD *)((char *)&v31[7] + 1) = v28[7];
  *(_OWORD *)((char *)v31 + 1) = v28[0];
  *(_OWORD *)((char *)&v31[1] + 1) = v28[1];
  *(_OWORD *)((char *)&v31[2] + 1) = v28[2];
  v30 = (unint64_t)v23;
  LOBYTE(v31[0]) = 0;
  *(_OWORD *)((char *)&v31[3] + 1) = v28[3];
  LOBYTE(v32) = v7;
  *((_QWORD *)&v32 + 1) = v8;
  *(_QWORD *)&v33[0] = v9;
  *((_QWORD *)&v33[0] + 1) = v10;
  *(_QWORD *)&v33[1] = v11;
  BYTE8(v33[1]) = 0;
  KeyPath = swift_getKeyPath();
  v13 = v24;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDED100], v24);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v3 + *(int *)(v25 + 28), v6, v13);
  *v3 = KeyPath;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6590);
  sub_21A795080((uint64_t)v3, (uint64_t)a1 + *(int *)(v14 + 36), &qword_2550F6600);
  v15 = v32;
  a1[12] = v31[11];
  a1[13] = v15;
  a1[14] = v33[0];
  *(_OWORD *)((char *)a1 + 233) = *(_OWORD *)((char *)v33 + 9);
  v16 = v31[8];
  a1[8] = v31[7];
  a1[9] = v16;
  v17 = v31[10];
  a1[10] = v31[9];
  a1[11] = v17;
  v18 = v31[4];
  a1[4] = v31[3];
  a1[5] = v18;
  v19 = v31[6];
  a1[6] = v31[5];
  a1[7] = v19;
  v20 = v31[0];
  *a1 = v30;
  a1[1] = v20;
  v21 = v31[2];
  a1[2] = v31[1];
  a1[3] = v21;
  sub_21A7A4668((uint64_t)&v30);
  sub_21A7950C4((uint64_t)v3, &qword_2550F6600);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  return sub_21A7A46AC((uint64_t)v26);
}

unint64_t sub_21A7A2D9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F65D0;
  if (!qword_2550F65D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6590);
    v2[0] = sub_21A7A2E20();
    v2[1] = sub_21A794FD4(&qword_2550F65F8, &qword_2550F6600, MEMORY[0x24BDF1028]);
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F65D0);
  }
  return result;
}

unint64_t sub_21A7A2E20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F65D8;
  if (!qword_2550F65D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65E0);
    v2[0] = sub_21A794FD4(&qword_2550F65E8, &qword_2550F65F0, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F65D8);
  }
  return result;
}

uint64_t sub_21A7A2EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for HoverTextMarqueeingContentView(0, a3, a4, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66B0);
  return sub_21A7CFC18();
}

uint64_t sub_21A7A2F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HoverTextMarqueeingContentView(0, v6, v7, a4) - 8)
                          + 80);
  return sub_21A7A2EA4(a1, v4 + ((v8 + 32) & ~v8), v6, v7);
}

unint64_t sub_21A7A2F78()
{
  unint64_t result;

  result = qword_2550F6610;
  if (!qword_2550F6610)
  {
    result = MEMORY[0x220749464](&unk_21A7D22F0, &type metadata for ContentSizeKey);
    atomic_store(result, (unint64_t *)&qword_2550F6610);
  }
  return result;
}

uint64_t sub_21A7A2FBC()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_21A7A2FF0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F60C0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21A7D21D0;
  *(_QWORD *)(v2 + 32) = sub_21A7CFBB8();
  *(_QWORD *)(v2 + 40) = sub_21A7CFBAC();
  sub_21A7CFEC4();
  MEMORY[0x2207486FC](v2);
  sub_21A7CFD38();
  sub_21A7CFD44();
  sub_21A7CF8E8();
  sub_21A7CFCA8();
  sub_21A7CF840();
  v3 = sub_21A7CFBAC();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21A7D21D0;
  *(_QWORD *)(v4 + 32) = sub_21A7CFBAC();
  *(_QWORD *)(v4 + 40) = sub_21A7CFBB8();
  sub_21A7CFEC4();
  MEMORY[0x2207486FC](v4);
  sub_21A7CFD38();
  sub_21A7CFD44();
  sub_21A7CF8E8();
  sub_21A7CFCA8();
  sub_21A7CF840();
  *(_QWORD *)a1 = v6;
  *(_OWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 56) = v12;
  *(_BYTE *)(a1 + 64) = v13;
  *(_QWORD *)(a1 + 72) = v14;
  *(_QWORD *)(a1 + 80) = v15;
  *(_QWORD *)(a1 + 88) = v3;
  *(_QWORD *)(a1 + 96) = v16;
  *(_OWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 120) = v18;
  *(_QWORD *)(a1 + 128) = v19;
  *(_QWORD *)(a1 + 136) = v4;
  *(_BYTE *)(a1 + 144) = v20;
  *(_QWORD *)(a1 + 152) = v21;
  *(_BYTE *)(a1 + 160) = v22;
  result = *(double *)&v23;
  *(_OWORD *)(a1 + 168) = v23;
  return result;
}

void sub_21A7A3240(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD aBlock[7];

  v6 = sub_21A7CFD50();
  v38 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21A7CFD74();
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v34 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a3 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v40 = sub_21A7CFD8C();
  v13 = *(_QWORD *)(v40 - 8);
  v14 = MEMORY[0x24BDAC7A8](v40);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v39 = (char *)&v29 - v17;
  v18 = sub_21A7A16A0();
  sub_21A7CF84C();
  v33 = *(_OWORD *)(a3 + 16);
  if (v19 + sub_21A7A1474() <= v18)
  {
    sub_21A7CF84C();
    sub_21A7A16A0();
    sub_21A7CFCE4();
    sub_21A7CFCCC();
    v32 = v6;
    swift_release();
    v20 = sub_21A7CFCD8();
    swift_release();
    sub_21A7A11F4();
    v30 = sub_21A7CFFE4();
    sub_21A7CFD80();
    MEMORY[0x2207487F8](v16, a1);
    v31 = *(void (**)(char *, uint64_t))(v13 + 8);
    v31(v16, v40);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a3);
    v21 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = v33;
    *(_QWORD *)(v22 + 32) = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v21, (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
    aBlock[4] = sub_21A7A4E9C;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21A7A6A18;
    aBlock[3] = &block_descriptor_2;
    v23 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v24 = v34;
    sub_21A7CFD5C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
    sub_21A794FD4((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0, MEMORY[0x24BEE12C8]);
    v25 = v37;
    v26 = v32;
    sub_21A7D00BC();
    v27 = v39;
    v28 = (void *)v30;
    MEMORY[0x220748A08](v39, v24, v25, v23);
    _Block_release(v23);
    swift_release();

    (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v26);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v36);
    v31(v27, v40);
  }
}

uint64_t sub_21A7A3620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v6)(void);

  v6 = *(void (**)(void))(a1 + 40);
  if (v6)
    v6();
  type metadata accessor for HoverTextMarqueeingContentView(0, a2, a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66C0);
  return sub_21A7CFC18();
}

uint64_t sub_21A7A36C0()
{
  sub_21A7CFCE4();
  sub_21A7CF8B8();
  return swift_release();
}

uint64_t sub_21A7A3730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for HoverTextMarqueeingContentView(0, a2, a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66C0);
  return sub_21A7CFC18();
}

uint64_t sub_21A7A37A0()
{
  return swift_allocateGenericValueMetadata();
}

void sub_21A7A37A8()
{
  unint64_t v0;

  sub_21A7A428C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *sub_21A7A384C(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = (_QWORD *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 32) = a2[4];
    v8 = a2[5];
    if (v8)
    {
      v9 = a2[6];
      v4[5] = v8;
      v4[6] = v9;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    }
    v11 = a2[7];
    if (v11)
    {
      v12 = a2[8];
      v4[7] = v11;
      v4[8] = v12;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(v4 + 7) = *(_OWORD *)(a2 + 7);
    }
    v13 = a2[10];
    v4[9] = a2[9];
    v4[10] = v13;
    v14 = a3[16];
    v15 = (_QWORD *)((char *)v4 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_21A7CF90C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = a3[17];
    v19 = a3[18];
    v20 = (char *)v4 + v18;
    v21 = (uint64_t)a2 + v18;
    *(_OWORD *)v20 = *(_OWORD *)v21;
    *((_QWORD *)v20 + 2) = *(_QWORD *)(v21 + 16);
    v22 = (_QWORD *)((char *)v4 + v19);
    v23 = (uint64_t *)((char *)a2 + v19);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = a3[19];
    v26 = (_QWORD *)((char *)v4 + v25);
    v27 = (uint64_t *)((char *)a2 + v25);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_21A7A39E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 40))
    swift_release();
  if (*(_QWORD *)(a1 + 56))
    swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_21A7CF90C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_21A7A3AAC(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  v9 = *(_QWORD *)(a2 + 56);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 64) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v11;
  v12 = a3[16];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_21A7CF90C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v16 = a3[17];
  v17 = a3[18];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v20 = (_QWORD *)(a1 + v17);
  v21 = (_QWORD *)(a2 + v17);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = a3[19];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_21A7A3C18(_QWORD *a1, _QWORD *a2, int *a3)
{
  _OWORD *v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  v6 = a1 + 5;
  v8 = a2 + 5;
  v7 = a2[5];
  if (a1[5])
  {
    if (v7)
    {
      v9 = a2[6];
      a1[5] = v7;
      a1[6] = v9;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v10 = a2[6];
    a1[5] = v7;
    a1[6] = v10;
    swift_retain();
    goto LABEL_8;
  }
  *v6 = *v8;
LABEL_8:
  v11 = a2[7];
  if (a1[7])
  {
    if (v11)
    {
      v12 = a2[8];
      a1[7] = v11;
      a1[8] = v12;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = a2[8];
    a1[7] = v11;
    a1[8] = v13;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
LABEL_15:
  v14 = a2[10];
  a1[9] = a2[9];
  a1[10] = v14;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v15 = a3[16];
    v16 = (_QWORD *)((char *)a1 + v15);
    v17 = (_QWORD *)((char *)a2 + v15);
    sub_21A7950C4((uint64_t)a1 + v15, &qword_2550F5608);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_21A7CF90C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v19 = a3[17];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  v20[2] = v21[2];
  swift_retain();
  swift_release();
  v22 = a3[18];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  v25 = a3[19];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21A7A3E58(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v8;
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  v9 = *(_QWORD *)(a2 + 56);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 64) = v10;
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v11 = a3[16];
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_21A7CF90C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v16 = a3[17];
  v17 = a3[18];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  return a1;
}

uint64_t sub_21A7A3F98(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  _OWORD *v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = (_OWORD *)(a1 + 40);
  v9 = (_OWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = v8;
      *(_QWORD *)(a1 + 48) = v10;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v8)
  {
    v11 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v11;
    goto LABEL_8;
  }
  *v7 = *v9;
LABEL_8:
  v12 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v12)
    {
      v13 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v12;
      *(_QWORD *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v12)
  {
    v14 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v12;
    *(_QWORD *)(a1 + 64) = v14;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
LABEL_15:
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  if (a1 != a2)
  {
    v15 = a3[16];
    v16 = (void *)(a1 + v15);
    v17 = (const void *)(a2 + v15);
    sub_21A7950C4(a1 + v15, &qword_2550F5608);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_21A7CF90C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
  }
  v20 = a3[17];
  v21 = a1 + v20;
  v22 = a2 + v20;
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
  swift_release();
  v23 = a3[18];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  swift_release();
  v26 = a3[19];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_release();
  return a1;
}

uint64_t sub_21A7A417C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A7A4188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2550F6620);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 64), a2, v8);
  }
}

uint64_t sub_21A7A4208()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A7A4214(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 72) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2550F6620);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 64), a2, a2, v7);
  }
  return result;
}

void sub_21A7A428C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550F66A8)
  {
    sub_21A7CF90C();
    v0 = sub_21A7CF7F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550F66A8);
  }
}

uint64_t sub_21A7A42E0(uint64_t a1)
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
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_21A7CF918();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6598);
  v3 = sub_21A7CF918();
  type metadata accessor for CGSize(255);
  v5 = v4;
  v26[0] = v1;
  v26[1] = MEMORY[0x24BDEDB80];
  v6 = MEMORY[0x24BDED308];
  v25[0] = MEMORY[0x220749464](MEMORY[0x24BDED308], v2, v26);
  v25[1] = sub_21A794FD4(&qword_2550F65A0, &qword_2550F6598, MEMORY[0x24BDEFF30]);
  v7 = MEMORY[0x220749464](v6, v3, v25);
  v8 = sub_21A791288(&qword_2550F65A8, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD858]);
  v21 = v3;
  v22 = v5;
  v23 = v7;
  v24 = v8;
  MEMORY[0x220749434](255, &v21, MEMORY[0x24BDF3908], 0);
  v9 = sub_21A7CF918();
  v21 = v3;
  v22 = v5;
  v23 = v7;
  v24 = v8;
  v20[0] = swift_getOpaqueTypeConformance2();
  v20[1] = MEMORY[0x24BDEC438];
  v10 = MEMORY[0x220749464](v6, v9, v20);
  v21 = v9;
  v22 = MEMORY[0x24BEE1768];
  v23 = v10;
  v24 = MEMORY[0x24BEE1778];
  v11 = sub_21A7CFC30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65B0);
  v12 = sub_21A7CF918();
  v19[0] = MEMORY[0x220749464](MEMORY[0x24BDF44C8], v11);
  v19[1] = sub_21A794FD4(&qword_2550F65B8, &qword_2550F65B0, (uint64_t)&protocol conformance descriptor for AnimationCompletionModifier<A>);
  MEMORY[0x220749464](v6, v12, v19);
  v13 = sub_21A7CF8D0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65C0);
  v14 = sub_21A7CF918();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F65C8);
  v15 = sub_21A7CF918();
  v18[0] = MEMORY[0x220749464](MEMORY[0x24BDEC6F8], v13);
  v18[1] = sub_21A794FD4(&qword_2550F6608, &qword_2550F65C0, MEMORY[0x24BDEB9D0]);
  v17[0] = MEMORY[0x220749464](v6, v14, v18);
  v17[1] = sub_21A794FD4(&qword_2550F6618, &qword_2550F65C8, MEMORY[0x24BDF09B0]);
  return MEMORY[0x220749464](v6, v15, v17);
}

ValueMetadata *type metadata accessor for ContentSizeKey()
{
  return &type metadata for ContentSizeKey;
}

void sub_21A7A45B4()
{
  xmmword_2550F6580 = 0uLL;
}

double sub_21A7A45C4@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2550F5600 != -1)
    swift_once();
  result = *(double *)&xmmword_2550F6580;
  *a1 = xmmword_2550F6580;
  return result;
}

double sub_21A7A4618(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_21A7A4658(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_21A7A4668(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21A7A46AC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21A7A46F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21A7CF858();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

double sub_21A7A4750@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_21A7CF858();
  type metadata accessor for CGRect(0);
  sub_21A7CF864();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_21A7A47BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v5 = type metadata accessor for HoverTextMarqueeingContentView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = *(_QWORD *)(v6 + 64);
  v8 = sub_21A7CF858();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v4 + v7;
  if (*(_QWORD *)(v4 + v7 + 40))
    swift_release();
  if (*(_QWORD *)(v11 + 56))
    swift_release();
  swift_release();
  v12 = v11 + *(int *)(v5 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = sub_21A7CF90C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v4 + ((v7 + v15 + v10) & ~v10), v8);
  return swift_deallocObject();
}

void sub_21A7A4920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for HoverTextMarqueeingContentView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_21A7CF858() - 8) + 80);
  sub_21A7A277C(v4 + ((v7 + v8 + v9) & ~v9), v5, *(double *)(v4 + v7 + 8));
}

uint64_t objectdestroyTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for HoverTextMarqueeingContentView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = v4 + ((v6 + 32) & ~v6);
  if (*(_QWORD *)(v7 + 40))
    swift_release();
  if (*(_QWORD *)(v7 + 56))
    swift_release();
  swift_release();
  v8 = v7 + *(int *)(v5 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_21A7CF90C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7A4AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t (*v7)(void);

  result = type metadata accessor for HoverTextMarqueeingContentView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v7 = *(uint64_t (**)(void))(v4 + ((v6 + 32) & ~v6) + 56);
  if (v7)
    return v7();
  return result;
}

unint64_t sub_21A7A4AF8()
{
  unint64_t result;

  result = qword_2550F66C8;
  if (!qword_2550F66C8)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BDEADB0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2550F66C8);
  }
  return result;
}

uint64_t sub_21A7A4B3C@<X0>(uint64_t a1@<X8>)
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
  v4 = sub_21A7CF960();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A795080(v2, (uint64_t)v10, &qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_21A7CF90C();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_21A7CFF84();
    v14 = sub_21A7CFA44();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_21A79C3E4(0x694474756F79614CLL, 0xEF6E6F6974636572, &v20);
      sub_21A7D0074();
      _os_log_impl(&dword_21A787000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22074950C](v18, -1, -1);
      MEMORY[0x22074950C](v16, -1, -1);
    }

    sub_21A7CF954();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_21A7A4D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for HoverTextMarqueeingContentView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  swift_release();
  v7 = v4 + ((v6 + 40) & ~v6);
  if (*(_QWORD *)(v7 + 40))
    swift_release();
  if (*(_QWORD *)(v7 + 56))
    swift_release();
  swift_release();
  v8 = v7 + *(int *)(v5 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_21A7CF90C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7A4E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for HoverTextMarqueeingContentView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_21A7CF8B8();
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

uint64_t sub_21A7A4F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_21A7A3620(v4[4], v4[2], v4[3], a4);
}

uint64_t sub_21A7A4F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_21A7A3730(v4[4], v4[2], v4[3], a4);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207493F8](a1, v6, a5);
}

void *Double.pixelsPerSecondPerPointSize.unsafeMutableAddressor()
{
  return &static Double.pixelsPerSecondPerPointSize;
}

double UIFont.hoverTextLineHeight.getter()
{
  const __CTFont *v0;
  double Ascent;
  double v2;

  Ascent = CTFontGetAscent(v0);
  v2 = Ascent + CTFontGetDescent(v0);
  return v2 + CTFontGetLeading(v0);
}

uint64_t sub_21A7A4FDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_21A7A4FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_21A7CF9E4();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_21A7CF9F0();
}

uint64_t sub_21A7A50B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_21A7CF9E4();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_21A7CF9F0();
}

uint64_t View.if<A>(_:transform:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  _QWORD v36[2];
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];

  v39 = a1;
  v43 = a8;
  v44 = a7;
  v42 = a6;
  v36[1] = a3;
  v37 = a2;
  v38 = *(_QWORD *)(a4 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v36 - v14;
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v13);
  v20 = (char *)v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v36 - v21;
  v23 = sub_21A7CF9FC();
  v41 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v36 - v25;
  if ((v39(v24) & 1) != 0)
  {
    v37(v40);
    v27 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v27(v22, v20, a5);
    v28 = *(void (**)(char *, uint64_t))(v17 + 8);
    v28(v20, a5);
    v27(v20, v22, a5);
    v29 = v42;
    sub_21A7A4FF4((uint64_t)v20, a5);
    v28(v20, a5);
    v30 = v22;
    v31 = a5;
  }
  else
  {
    v32 = v38;
    v33 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
    v33(v15, v40, a4);
    v33(v12, (uint64_t)v15, a4);
    v29 = v42;
    sub_21A7A50B8((uint64_t)v12, a5, a4);
    v28 = *(void (**)(char *, uint64_t))(v32 + 8);
    v28(v12, a4);
    v30 = v15;
    v31 = a4;
  }
  v28(v30, v31);
  v45[0] = v44;
  v45[1] = v29;
  MEMORY[0x220749464](MEMORY[0x24BDEF3E0], v23, v45);
  v34 = v41;
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 16))(v43, v26, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v26, v23);
}

unint64_t sub_21A7A53DC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  id v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F6780);
  v2 = (_QWORD *)sub_21A7D01F4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 40);
  while (1)
  {
    v11 = *v4;
    v5 = *((id *)v4 - 1);
    swift_retain();
    result = sub_21A7CCB5C((uint64_t)v5);
    if ((v7 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v5;
    *(_OWORD *)(v2[7] + 16 * result) = v11;
    v8 = v2[2];
    v9 = __OFADD__(v8, 1);
    v10 = v8 + 1;
    if (v9)
      goto LABEL_11;
    v2[2] = v10;
    v4 = (_OWORD *)((char *)v4 + 24);
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

unint64_t sub_21A7A54F8(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67B0);
  v2 = sub_21A7D01F4();
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
    sub_21A7A69BC(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_21A7CCBE4(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21A7A6A04(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_21A7A5610(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7650);
  v2 = (_QWORD *)sub_21A7D01F4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_21A7CCC64((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

unint64_t sub_21A7A5718(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6778);
  v2 = (_QWORD *)sub_21A7D01F4();
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
    v6 = *((unsigned int *)v4 - 6);
    v5 = *((unsigned int *)v4 - 5);
    v7 = *(v4 - 2);
    v8 = *(v4 - 1);
    v9 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_21A7CCC94(v6 | (v5 << 32), v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = v2[6] + 24 * result;
    *(_DWORD *)v12 = v6;
    *(_DWORD *)(v12 + 4) = v5;
    *(_QWORD *)(v12 + 8) = v7;
    *(_QWORD *)(v12 + 16) = v8;
    *(_QWORD *)(v2[7] + 8 * result) = v9;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 4;
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

uint64_t View.onAnimationCompletion<A>(for:completion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  char *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a6;
  v24 = a7;
  v25 = a4;
  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for AnimationCompletionModifier(0, v15, v16, v14);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v24 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v21(v13, a1, a5);
  v22 = &v20[*(int *)(v17 + 40)];
  *(_QWORD *)v22 = a2;
  *((_QWORD *)v22 + 1) = a3;
  v21(v20, (uint64_t)v13, a5);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v20[*(int *)(v17 + 36)], v13, a5);
  swift_retain();
  MEMORY[0x2207485C4](v20, v25, v17, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

uint64_t type metadata accessor for AnimationCompletionModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnimationCompletionModifier);
}

double static Double.pixelsPerSecondPerPointSize.getter()
{
  return 2.8125;
}

CGSize __swiftcall String.size(usingFont:)(UIFont usingFont)
{
  void *v2;
  uint64_t inited;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v2 = (void *)sub_21A7CFDE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21A7D2340;
  v4 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 64) = sub_21A79E2D4(0, qword_2550F66E8);
  *(UIFont *)(inited + 40) = usingFont;
  v5 = v4;
  v6 = usingFont.super.isa;
  sub_21A7A54F8(inited);
  type metadata accessor for Key(0);
  sub_21A791288(&qword_2550F5DB0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D1558);
  v7 = (void *)sub_21A7CFDA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_sizeWithAttributes_, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

uint64_t sub_21A7A5ACC(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v3 = sub_21A7CFD50();
  v24 = *(_QWORD *)(v3 - 8);
  v25 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21A7CFD74();
  v22 = *(_QWORD *)(v6 - 8);
  v23 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v13 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  result = sub_21A7CFDD4();
  if ((result & 1) != 0)
  {
    sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
    v21 = sub_21A7CFFE4();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
    v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v13;
    *(_QWORD *)(v16 + 24) = v12;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v15, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    aBlock[4] = sub_21A7A6910;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21A7A6A18;
    aBlock[3] = &block_descriptor_3;
    v17 = _Block_copy(aBlock);
    swift_release();
    sub_21A7CFD5C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
    sub_21A7A6970();
    v18 = v25;
    sub_21A7D00BC();
    v19 = (void *)v21;
    MEMORY[0x220748A50](0, v9, v5, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v9, v23);
  }
  return result;
}

uint64_t AnimationCompletionModifier.animatableData.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t AnimationCompletionModifier.animatableData.setter(uint64_t a1, uint64_t a2)
{
  sub_21A7A6040(a1, a2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(a1);
}

uint64_t *(*AnimationCompletionModifier.animatableData.modify(_QWORD *a1, uint64_t a2))(uint64_t *result, char a2)
{
  uint64_t v2;

  *a1 = a2;
  a1[1] = v2;
  return sub_21A7A5DB4;
}

uint64_t *sub_21A7A5DB4(uint64_t *result, char a2)
{
  if ((a2 & 1) == 0)
    return (uint64_t *)sub_21A7A5ACC(*result);
  return result;
}

uint64_t AnimationCompletionModifier.body(content:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v10;

  MEMORY[0x220749464](&protocol conformance descriptor for AnimationCompletionModifier<A>);
  v4 = sub_21A7CFA14();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - v6;
  MEMORY[0x220749464](MEMORY[0x24BDEFB78], v4);
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, a1, v4);
  v8(a2, (uint64_t)v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_21A7A5EA0(uint64_t a1, uint64_t a2)
{
  sub_21A7A6040(a1, a2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(a1);
}

void (*sub_21A7A5EDC(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = AnimationCompletionModifier.animatableData.modify(v4, a2);
  return sub_21A79CEBC;
}

uint64_t sub_21A7A5F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  MEMORY[0x220749464](&protocol conformance descriptor for AnimationCompletionModifier<A>, a5);
  return sub_21A7CF984();
}

uint64_t sub_21A7A5FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  MEMORY[0x220749464](&protocol conformance descriptor for AnimationCompletionModifier<A>, a5);
  return sub_21A7CF978();
}

uint64_t sub_21A7A6014()
{
  return sub_21A7CF834();
}

uint64_t sub_21A7A602C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return AnimationCompletionModifier.body(content:)(a1, a2);
}

uint64_t sub_21A7A6040(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 24))(v2, a1);
  return sub_21A7A5ACC(a2);
}

void sub_21A7A6078()
{
  JUMPOUT(0x220749464);
}

void sub_21A7A6088()
{
  JUMPOUT(0x220749464);
}

uint64_t sub_21A7A6098(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t sub_21A7A60A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A7A60D4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21A7A60DC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21A7A6158(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  v11 = ((v7 + 7 + ((v7 + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
  }
  else
  {
    v15 = ~v8;
    v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, *(_QWORD *)(a3 + 16));
    v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    v18 = (_QWORD *)((v10 + v17) & 0xFFFFFFFFFFFFFFF8);
    v19 = v18[1];
    v20 = (_QWORD *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFFFF8);
    *v20 = *v18;
    v20[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t sub_21A7A6248(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(unint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v5(a1, v3);
  v5((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), v3);
  return swift_release();
}

uint64_t sub_21A7A62B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v12 = (uint64_t *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  v14 = *v12;
  v13 = v12[1];
  v15 = (_QWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  *v15 = v14;
  v15[1] = v13;
  swift_retain();
  return a1;
}

uint64_t sub_21A7A634C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v12 = (_QWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21A7A63EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_OWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21A7A647C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_OWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_21A7A6514(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = *(unsigned __int8 *)(v4 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v15 = *(_QWORD *)((v10 + ((v9 + a1) & ~v8)) & 0xFFFFFFFFFFFFF8);
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v10 + (v9 & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v6 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    return ((uint64_t (*)(void))((char *)&loc_21A7A65A0 + 4 * byte_21A7D2350[v13]))();
  }
}

void sub_21A7A662C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v11 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if ((((_DWORD)v7 + 7 + (((_DWORD)v7 + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v9 = a3 - v6 + 1;
    else
      v9 = 2;
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X14 }
  }
  if ((((_DWORD)v7 + 7 + (((_DWORD)v7 + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v12 = ~v6 + a2;
    bzero(a1, ((v7 + 7 + ((v7 + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_21A7A6734()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x21A7A67B0);
}

void sub_21A7A673C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x21A7A6744);
  JUMPOUT(0x21A7A67B0);
}

void sub_21A7A6788()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x21A7A67B0);
}

void sub_21A7A6790()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x21A7A67B0);
}

uint64_t sub_21A7A6798(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x21A7A67B0);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x21A7A67ACLL);
    JUMPOUT(0x21A7A67A4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_21A7A67C8(int8x16_t *a1)
{
  uint64_t v2;
  int8x16_t v4;

  v2 = sub_21A7CF9FC();
  v4 = vextq_s8(a1[1], a1[1], 8uLL);
  return MEMORY[0x220749464](MEMORY[0x24BDEF3E0], v2, &v4);
}

void sub_21A7A6818(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for AnimationCompletionModifier(255, *a1, a1[1], a4);
  MEMORY[0x220749464](&protocol conformance descriptor for AnimationCompletionModifier<A>, v4);
  sub_21A7CFA14();
  JUMPOUT(0x220749464);
}

uint64_t sub_21A7A686C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AnimationCompletionModifier(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v9(v8, v5);
  v9(v8 + *(int *)(v6 + 36), v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7A6910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for AnimationCompletionModifier(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  return (*(uint64_t (**)(void))(v4 + *(int *)(v5 + 40) + ((v6 + 32) & ~v6)))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_21A7A6970()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550F66D8;
  if (!qword_2550F66D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2550F67A0);
    result = MEMORY[0x220749464](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2550F66D8);
  }
  return result;
}

uint64_t sub_21A7A69BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_21A7A6A04(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21A7A6A18(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void *sub_21A7A6A44(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_21A7CCC64((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_21A7D0194();

  if (!v4)
    return 0;
  type metadata accessor for HoverTextRootViewController();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t HoverTextCoordinator.__allocating_init(withService:isHoverTextTyping:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  HoverTextCoordinator.init(withService:isHoverTextTyping:)(a1, a2);
  return v4;
}

uint64_t HoverTextCoordinator.init(withService:isHoverTextTyping:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v3 = v2;
  v5 = sub_21A7CF750();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v11 = objc_allocWithZone((Class)type metadata accessor for AXRuntimeClient());
  *(_QWORD *)(v3 + 24) = AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)((uint64_t)v8, (uint64_t)&unk_24DD20A28, (uint64_t)v10);
  *(_QWORD *)(v3 + 32) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HoverTextEventHandler()), sel_init);
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v3 + 48) = 0;
  v12 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + 56) = sub_21A7A5610(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v3 + 64) = v12;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 88) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_BYTE *)(v3 + 96) = 0;
  swift_unknownObjectWeakAssign();
  *(_BYTE *)(v3 + 16) = a2 ^ 1;
  v13 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v14 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_21A7B069C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21A7A6A18;
  aBlock[3] = &block_descriptor_4;
  v15 = _Block_copy(aBlock);
  swift_release();
  v16 = sub_21A7CF6B4();
  swift_retain();
  objc_msgSend(v13, sel_registerUpdateBlock_forRetrieveSelector_withListener_, v15, v16, v3);
  swift_release();
  swift_unknownObjectRelease();
  _Block_release(v15);

  return v3;
}

void sub_21A7A6DA8()
{
  uint64_t Strong;
  char *v1;
  id v2;
  id v3;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = (char *)*(id *)(Strong + 32);
    swift_release();
    v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v3 = objc_msgSend(v2, sel_hoverTextPreferredActivatorKey);

    *(_QWORD *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey] = v3;
  }
}

id sub_21A7A6E58()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = *(id *)(v0 + 48);
LABEL_5:
    v5 = v1;
    return v2;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedDisplayManager);
  if (result)
  {
    v4 = *(void **)(v0 + 48);
    *(_QWORD *)(v0 + 48) = result;
    v2 = result;

    v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t HoverTextCoordinator.startHoverText()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[66] = v0;
  v1[67] = type metadata accessor for HoverTextPresentationEvent();
  v1[68] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  v1[69] = swift_task_alloc();
  v2 = sub_21A7CF750();
  v1[70] = v2;
  v1[71] = *(_QWORD *)(v2 - 8);
  v1[72] = swift_task_alloc();
  v1[73] = swift_task_alloc();
  v1[74] = swift_task_alloc();
  v1[75] = swift_task_alloc();
  v1[76] = sub_21A7CFF00();
  v1[77] = sub_21A7CFEF4();
  v1[78] = sub_21A7CFEE8();
  v1[79] = v3;
  return swift_task_switch();
}

uint64_t sub_21A7A6FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;

  v1 = *(_QWORD *)(v0 + 600);
  v2 = *(_QWORD *)(v0 + 568);
  v3 = *(_QWORD *)(v0 + 560);
  v4 = sub_21A7CF738();
  *(_QWORD *)(v0 + 640) = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(_QWORD *)(v0 + 648) = v5;
  v5(v1, v4, v3);
  swift_retain();
  v6 = sub_21A7CF744();
  v7 = sub_21A7CFF60();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 528);
    v9 = swift_slowAlloc();
    *(_DWORD *)v9 = 67109376;
    *(_DWORD *)(v0 + 492) = *(unsigned __int8 *)(v8 + 96);
    sub_21A7D0074();
    *(_WORD *)(v9 + 8) = 1024;
    *(_DWORD *)(v0 + 784) = (*(_BYTE *)(v8 + 16) & 1) == 0;
    sub_21A7D0074();
    swift_release();
    _os_log_impl(&dword_21A787000, v6, v7, "Coordinator asked to start HoverText. isRunning=%{BOOL}d isHoverTextTyping=%{BOOL}d", (uint8_t *)v9, 0xEu);
    MEMORY[0x22074950C](v9, -1, -1);
  }
  else
  {
    swift_release();
  }

  v10 = *(_QWORD *)(v0 + 600);
  v11 = *(_QWORD *)(v0 + 560);
  v12 = *(_QWORD *)(v0 + 528);
  v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 568) + 8);
  *(_QWORD *)(v0 + 656) = v13;
  v13(v10, v11);
  if ((*(_BYTE *)(v12 + 96) & 1) != 0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(v0 + 528) + 24);
    *(_QWORD *)(v0 + 664) = v14;
    v15 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled;
    if (*(_BYTE *)(v14 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled) == 1)
    {
      v16 = sub_21A7CF744();
      v17 = sub_21A7CFF90();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_21A787000, v16, v17, "Accessibility already enabled", v18, 2u);
        MEMORY[0x22074950C](v18, -1, -1);
      }

    }
    else
    {
      sub_21A7B656C();
      *(_BYTE *)(v14 + v15) = 1;
    }
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 672) = v19;
    *v19 = v0;
    v19[1] = sub_21A7A74A4;
    return sub_21A7A8DC8(0, 1);
  }
}

uint64_t sub_21A7A74A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 680) = a1;
  *(_QWORD *)(v3 + 688) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21A7A7514()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char **v16;
  char **v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t (*v59)(void *, char);
  uint64_t (**v60)(void *, char);
  uint64_t v61;
  uint64_t (**v62)(unint64_t);
  uint64_t v63;
  uint64_t (**v64)();
  uint64_t v65;
  uint64_t (**v66)();
  uint64_t v67;
  uint64_t (**v68)();
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 648);
  v2 = *(_QWORD *)(v0 + 640);
  v3 = *(_QWORD *)(v0 + 592);
  v4 = *(_QWORD *)(v0 + 560);
  swift_beginAccess();
  v1(v3, v2, v4);
  v5 = sub_21A7CF744();
  v6 = sub_21A7CFF60();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A787000, v5, v6, "Coordinator did show HoverText UI on main screen", v7, 2u);
    MEMORY[0x22074950C](v7, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 680);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
  v10 = *(_QWORD *)(v0 + 592);
  v11 = *(_QWORD *)(v0 + 560);
  v12 = *(_QWORD *)(v0 + 528);

  v9(v10, v11);
  v13 = swift_allocObject();
  swift_weakInit();
  v14 = (uint64_t *)(v8 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);
  swift_beginAccess();
  v15 = *v14;
  *v14 = (uint64_t)sub_21A7B076C;
  v14[1] = v13;
  sub_21A795888(v15);
  HoverTextRootViewController.startHoverText()();
  if ((*(_BYTE *)(v12 + 16) & 1) != 0)
  {
    v16 = &selRef_hoverTextShowedBanner;
    v17 = &selRef_setHoverTextShowedBanner_;
    v18 = 0x6C62616E652E7468;
    v19 = 0xEA00000000006465;
  }
  else
  {
    v16 = &selRef_hoverTextTypingShowedBanner;
    v17 = &selRef_setHoverTextTypingShowedBanner_;
    v18 = 0x62616E652E747468;
    v19 = 0xEB0000000064656CLL;
  }
  sub_21A7A92B0((SEL *)v16, v18, v19, (SEL *)v17);
  v20 = *(void **)(v0 + 680);
  v21 = *(_QWORD *)(v0 + 528);
  v22 = *(void **)(v21 + 72);
  *(_QWORD *)(v21 + 72) = v20;
  v23 = v20;

  swift_beginAccess();
  v24 = *(_QWORD *)(v21 + 64);
  *(_QWORD *)(v0 + 696) = v24;
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    v31 = sub_21A7D01C4();
    *(_QWORD *)(v0 + 704) = v31;
    if (v31)
      goto LABEL_8;
  }
  else
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 704) = v25;
    if (v25)
    {
LABEL_8:
      swift_beginAccess();
      v26 = *(_QWORD *)(v0 + 696);
      if ((v26 & 0xC000000000000001) != 0)
        v27 = (id)MEMORY[0x220748B70](0);
      else
        v27 = *(id *)(v26 + 32);
      *(_QWORD *)(v0 + 712) = v27;
      *(_QWORD *)(v0 + 720) = 1;
      v28 = v27;
      *(_QWORD *)(v0 + 728) = sub_21A7CFEF4();
      *(_QWORD *)(v0 + 736) = sub_21A7CFEE8();
      *(_QWORD *)(v0 + 744) = v29;
      return swift_task_switch();
    }
  }
  v32 = *(_QWORD *)(v0 + 528);
  swift_bridgeObjectRelease();
  swift_release();
  v33 = *(_QWORD *)(v0 + 664);
  v34 = *(_QWORD *)(v0 + 528);
  if (*(_BYTE *)(v32 + 16) == 1)
  {
    v35 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
    swift_beginAccess();
    v36 = *v35;
    *v35 = (uint64_t)sub_21A7B0954;
    v35[1] = v34;
    swift_retain();
    sub_21A795888(v36);
    v37 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange);
    swift_beginAccess();
    v38 = *v37;
    *v37 = (uint64_t)sub_21A7B095C;
    v37[1] = v34;
    swift_retain();
    sub_21A795888(v38);
    v39 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement);
    swift_beginAccess();
    v40 = *v39;
    *v39 = (uint64_t)sub_21A7B0984;
    v39[1] = v34;
    swift_retain();
    sub_21A795888(v40);
    v41 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated);
    swift_beginAccess();
    v42 = *v41;
    *v41 = (uint64_t)sub_21A7B098C;
    v41[1] = v34;
  }
  else
  {
    v43 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
    swift_beginAccess();
    v44 = *v43;
    *v43 = (uint64_t)sub_21A7B07F8;
    v43[1] = v34;
    swift_retain();
    sub_21A795888(v44);
    v45 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide);
    swift_beginAccess();
    v46 = *v45;
    *v45 = (uint64_t)sub_21A7B0800;
    v45[1] = v34;
    swift_retain();
    sub_21A795888(v46);
    v47 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange);
    swift_beginAccess();
    v48 = *v47;
    *v47 = (uint64_t)sub_21A7B0828;
    v47[1] = v34;
    swift_retain();
    sub_21A795888(v48);
    v49 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame);
    swift_beginAccess();
    v50 = *v49;
    *v49 = (uint64_t)sub_21A7B0850;
    v49[1] = v34;
    swift_retain();
    sub_21A795888(v50);
    v51 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
    swift_beginAccess();
    v52 = *v51;
    *v51 = (uint64_t)sub_21A7B0878;
    v51[1] = v34;
    swift_retain();
    sub_21A795888(v52);
    v53 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode);
    swift_beginAccess();
    v42 = *v53;
    *v53 = (uint64_t)sub_21A7B0880;
    v53[1] = v34;
  }
  swift_retain();
  sub_21A795888(v42);
  v54 = *(_QWORD *)(v0 + 528);
  v55 = (uint64_t *)(*(_QWORD *)(v0 + 664) + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
  swift_beginAccess();
  v56 = *v55;
  *v55 = (uint64_t)sub_21A7A98C8;
  v55[1] = 0;
  sub_21A795888(v56);
  v57 = *(unsigned __int8 *)(v54 + 16);
  v58 = *(_QWORD *)(v54 + 32);
  v59 = *(uint64_t (**)(void *, char))(v0 + 528);
  if (v57 == 1)
  {
    v60 = (uint64_t (**)(void *, char))(v58
                                                + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
    v61 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
    *v60 = sub_21A7B08B0;
    v60[1] = v59;
    swift_retain();
    sub_21A795888(v61);
    v62 = (uint64_t (**)(unint64_t))(v58
                                                    + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
    v63 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
    *v62 = sub_21A7B08B8;
    v62[1] = (uint64_t (*)(unint64_t))v59;
    swift_retain();
    sub_21A795888(v63);
    v64 = (uint64_t (**)())(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
    v65 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
    *v64 = sub_21A7B08D4;
    v64[1] = (uint64_t (*)())v59;
    swift_retain();
    sub_21A795888(v65);
    v66 = (uint64_t (**)())(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
    v67 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
    *v66 = sub_21A7B08FC;
    v66[1] = (uint64_t (*)())v59;
    swift_retain();
    sub_21A795888(v67);
    v68 = (uint64_t (**)())(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
    v69 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
    *v68 = sub_21A7B0924;
    v68[1] = (uint64_t (*)())v59;
    swift_retain();
    sub_21A795888(v69);
    v70 = (_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
    v71 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
    v72 = sub_21A7B094C;
  }
  else
  {
    v70 = (_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
    v71 = *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
    v72 = sub_21A7B08A8;
  }
  *v70 = v72;
  v70[1] = v59;
  swift_retain();
  sub_21A795888(v71);
  v73 = *(void **)(v0 + 680);
  v74 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v75 = objc_msgSend(v74, sel_hoverTextPreferredActivatorKey);

  *(_QWORD *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey) = v75;
  sub_21A7CA030();

  *(_BYTE *)(*(_QWORD *)(v0 + 528) + 96) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7A7D84()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v1 = (void *)v0[89];
  v2 = v0[69];
  v3 = v0[66];
  v4 = sub_21A7CFF18();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, 1, 1, v4);
  swift_retain();
  v6 = v1;
  v7 = sub_21A7CFEF4();
  v8 = swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v9;
  *(_BYTE *)(v8 + 32) = 0;
  *(_QWORD *)(v8 + 40) = v1;
  *(_QWORD *)(v8 + 48) = v3;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4);
  v11 = v0[69];
  if (v10 == 1)
  {
    sub_21A7950C4(v0[69], &qword_2550F67C8);
    if (v7)
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_21A7CFEE8();
      v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_21A7CFF0C();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v4);
    if (*(_QWORD *)(v8 + 16))
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  type metadata accessor for HoverTextRootViewController();
  if (v14 | v12)
  {
    v0[2] = 0;
    v0[3] = 0;
    v0[4] = v12;
    v0[5] = v14;
  }
  v0[94] = swift_task_create();
  v15 = (_QWORD *)swift_task_alloc();
  v0[95] = v15;
  v0[96] = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5DE0);
  *v15 = v0;
  v15[1] = sub_21A7A7F78;
  return sub_21A7CFF24();
}

uint64_t sub_21A7A7F78()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21A7A7FC8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  swift_release();
  v1 = *(_QWORD *)(v0 + 480);
  *(_QWORD *)(v0 + 776) = v1;
  if ((*(_BYTE *)(v0 + 488) & 1) != 0)
  {
    v2 = *(void **)(v0 + 712);
    *(_QWORD *)(v0 + 512) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_bridgeObjectRelease();

  }
  else
  {
    v3 = *(void **)(v0 + 712);
    swift_release();

  }
  return swift_task_switch();
}

id sub_21A7A8078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id result;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t (*v54)(void *, char);
  uint64_t (**v55)(void *, char);
  uint64_t v56;
  uint64_t (**v57)(unint64_t);
  uint64_t v58;
  uint64_t (**v59)();
  uint64_t v60;
  uint64_t (**v61)();
  uint64_t v62;
  uint64_t (**v63)();
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);

  v73 = *(_QWORD *)(v0 + 640);
  v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 648);
  v1 = *(_QWORD *)(v0 + 584);
  v2 = *(_QWORD *)(v0 + 560);
  v3 = *(_QWORD *)(v0 + 544);
  v4 = *(int **)(v0 + 536);
  v5 = *(_QWORD *)(v0 + 776) + qword_2550F6128;
  v6 = *(_QWORD *)(v5 + 8);
  v7 = **(_QWORD **)v5;
  *(_QWORD *)(v0 + 504) = *(_QWORD *)v5;
  *(_BYTE *)(v3 + 50) = 12;
  swift_retain();
  sub_21A7CF510();
  v8 = (_QWORD *)(v3 + v4[8]);
  *v8 = 0;
  v8[1] = 0;
  v9 = (_OWORD *)(v3 + v4[9]);
  *v9 = 0u;
  v9[1] = 0u;
  v10 = v3 + v4[10];
  *(_QWORD *)v10 = 0;
  *(_BYTE *)(v10 + 8) = 1;
  v11 = (_QWORD *)(v3 + v4[11]);
  *v11 = 0;
  v11[1] = 0;
  *(_QWORD *)(v3 + v4[12]) = 0;
  *(_QWORD *)(v3 + v4[13]) = 0;
  *(_QWORD *)v3 = 2;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_QWORD *)(v3 + 40) = 0;
  *(_WORD *)(v3 + 48) = 352;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 280))(v3, v7, v6);
  sub_21A7B1BB8(v3, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  swift_release();
  v74(v1, v73, v2);
  swift_retain();
  v12 = sub_21A7CF744();
  v13 = sub_21A7CFF60();
  v14 = os_log_type_enabled(v12, v13);
  v15 = *(void **)(v0 + 776);
  v16 = *(void **)(v0 + 712);
  v17 = *(_QWORD *)(v0 + 528);
  if (v14)
  {
    v18 = swift_slowAlloc();
    *(_DWORD *)v18 = 67109120;
    *(_DWORD *)(v18 + 4) = *(unsigned __int8 *)(v17 + 96);
    swift_release();
    _os_log_impl(&dword_21A787000, v12, v13, "Coordinator did show HoverText UI on external screen (isRunning=%{BOOL}d)", (uint8_t *)v18, 8u);
    MEMORY[0x22074950C](v18, -1, -1);
    sub_21A7B0A38(v15);

  }
  else
  {

    swift_release();
    sub_21A7B0A38(v15);
  }
  v19 = *(_QWORD *)(v0 + 720);
  v20 = *(_QWORD *)(v0 + 704);
  v21 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
  v22 = *(_QWORD *)(v0 + 584);
  v23 = *(_QWORD *)(v0 + 560);

  v21(v22, v23);
  if (v19 == v20)
  {
    v24 = *(_QWORD *)(v0 + 528);
    swift_bridgeObjectRelease();
    swift_release();
    v25 = *(_QWORD *)(v0 + 664);
    v26 = *(_QWORD *)(v0 + 528);
    if (*(_BYTE *)(v24 + 16) == 1)
    {
      v27 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
      swift_beginAccess();
      v28 = *v27;
      *v27 = (uint64_t)sub_21A7B0954;
      v27[1] = v26;
      swift_retain();
      sub_21A795888(v28);
      v29 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange);
      swift_beginAccess();
      v30 = *v29;
      *v29 = (uint64_t)sub_21A7B095C;
      v29[1] = v26;
      swift_retain();
      sub_21A795888(v30);
      v31 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement);
      swift_beginAccess();
      v32 = *v31;
      *v31 = (uint64_t)sub_21A7B0984;
      v31[1] = v26;
      swift_retain();
      sub_21A795888(v32);
      v33 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated);
      swift_beginAccess();
      v34 = *v33;
      *v33 = (uint64_t)sub_21A7B098C;
      v33[1] = v26;
    }
    else
    {
      v38 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
      swift_beginAccess();
      v39 = *v38;
      *v38 = (uint64_t)sub_21A7B07F8;
      v38[1] = v26;
      swift_retain();
      sub_21A795888(v39);
      v40 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide);
      swift_beginAccess();
      v41 = *v40;
      *v40 = (uint64_t)sub_21A7B0800;
      v40[1] = v26;
      swift_retain();
      sub_21A795888(v41);
      v42 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange);
      swift_beginAccess();
      v43 = *v42;
      *v42 = (uint64_t)sub_21A7B0828;
      v42[1] = v26;
      swift_retain();
      sub_21A795888(v43);
      v44 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame);
      swift_beginAccess();
      v45 = *v44;
      *v44 = (uint64_t)sub_21A7B0850;
      v44[1] = v26;
      swift_retain();
      sub_21A795888(v45);
      v46 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
      swift_beginAccess();
      v47 = *v46;
      *v46 = (uint64_t)sub_21A7B0878;
      v46[1] = v26;
      swift_retain();
      sub_21A795888(v47);
      v48 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode);
      swift_beginAccess();
      v34 = *v48;
      *v48 = (uint64_t)sub_21A7B0880;
      v48[1] = v26;
    }
    swift_retain();
    sub_21A795888(v34);
    v49 = *(_QWORD *)(v0 + 528);
    v50 = (uint64_t *)(*(_QWORD *)(v0 + 664) + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
    swift_beginAccess();
    v51 = *v50;
    *v50 = (uint64_t)sub_21A7A98C8;
    v50[1] = 0;
    sub_21A795888(v51);
    v52 = *(unsigned __int8 *)(v49 + 16);
    v53 = *(_QWORD *)(v49 + 32);
    v54 = *(uint64_t (**)(void *, char))(v0 + 528);
    if (v52 == 1)
    {
      v55 = (uint64_t (**)(void *, char))(v53
                                                  + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
      v56 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
      *v55 = sub_21A7B08B0;
      v55[1] = v54;
      swift_retain();
      sub_21A795888(v56);
      v57 = (uint64_t (**)(unint64_t))(v53
                                                      + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
      v58 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
      *v57 = sub_21A7B08B8;
      v57[1] = (uint64_t (*)(unint64_t))v54;
      swift_retain();
      sub_21A795888(v58);
      v59 = (uint64_t (**)())(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
      v60 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
      *v59 = sub_21A7B08D4;
      v59[1] = (uint64_t (*)())v54;
      swift_retain();
      sub_21A795888(v60);
      v61 = (uint64_t (**)())(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
      v62 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
      *v61 = sub_21A7B08FC;
      v61[1] = (uint64_t (*)())v54;
      swift_retain();
      sub_21A795888(v62);
      v63 = (uint64_t (**)())(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
      v64 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
      *v63 = sub_21A7B0924;
      v63[1] = (uint64_t (*)())v54;
      swift_retain();
      sub_21A795888(v64);
      v65 = (_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
      v66 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
      v67 = sub_21A7B094C;
    }
    else
    {
      v65 = (_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
      v66 = *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
      v67 = sub_21A7B08A8;
    }
    *v65 = v67;
    v65[1] = v54;
    swift_retain();
    sub_21A795888(v66);
    v68 = *(void **)(v0 + 680);
    v69 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v70 = objc_msgSend(v69, sel_hoverTextPreferredActivatorKey);

    *(_QWORD *)(v53 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey) = v70;
    sub_21A7CA030();

    *(_BYTE *)(*(_QWORD *)(v0 + 528) + 96) = 1;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v35 = *(_QWORD *)(v0 + 720);
    v36 = *(_QWORD *)(v0 + 696);
    if ((v36 & 0xC000000000000001) != 0)
      result = (id)MEMORY[0x220748B70](*(_QWORD *)(v0 + 720));
    else
      result = *(id *)(v36 + 8 * v35 + 32);
    *(_QWORD *)(v0 + 712) = result;
    *(_QWORD *)(v0 + 720) = v35 + 1;
    if (__OFADD__(v35, 1))
    {
      __break(1u);
    }
    else
    {
      v71 = result;
      *(_QWORD *)(v0 + 728) = sub_21A7CFEF4();
      *(_QWORD *)(v0 + 736) = sub_21A7CFEE8();
      *(_QWORD *)(v0 + 744) = v72;
      return (id)swift_task_switch();
    }
  }
  return result;
}

uint64_t sub_21A7A88D8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;

  v1 = *(void **)(v0 + 712);
  v2 = *(void **)(v0 + 680);
  swift_release();

  v3 = *(void **)(v0 + 776);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 648);
  v5 = *(_QWORD *)(v0 + 640);
  v6 = *(_QWORD *)(v0 + 576);
  v7 = *(_QWORD *)(v0 + 560);
  swift_beginAccess();
  v4(v6, v5, v7);
  v8 = v3;
  v9 = v3;
  v10 = sub_21A7CF744();
  v11 = sub_21A7CFF78();
  if (os_log_type_enabled(v10, v11))
  {
    v21 = *(_QWORD *)(v0 + 576);
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    v20 = *(_QWORD *)(v0 + 560);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v23 = v13;
    *(_DWORD *)v12 = 136315138;
    swift_getErrorValue();
    v14 = sub_21A7D0260();
    *(_QWORD *)(v0 + 520) = sub_21A79C3E4(v14, v15, &v23);
    sub_21A7D0074();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21A787000, v10, v11, "Coordinator could not start HoverText: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v13, -1, -1);
    MEMORY[0x22074950C](v12, -1, -1);

    v22(v21, v20);
  }
  else
  {
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    v17 = *(_QWORD *)(v0 + 576);
    v18 = *(_QWORD *)(v0 + 560);

    v16(v17, v18);
  }
  *(_BYTE *)(*(_QWORD *)(v0 + 528) + 96) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7A8B58()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;

  swift_release();
  v1 = *(void **)(v0 + 688);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 648);
  v3 = *(_QWORD *)(v0 + 640);
  v4 = *(_QWORD *)(v0 + 576);
  v5 = *(_QWORD *)(v0 + 560);
  swift_beginAccess();
  v2(v4, v3, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_21A7CF744();
  v9 = sub_21A7CFF78();
  if (os_log_type_enabled(v8, v9))
  {
    v19 = *(_QWORD *)(v0 + 576);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    v18 = *(_QWORD *)(v0 + 560);
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v21 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_getErrorValue();
    v12 = sub_21A7D0260();
    *(_QWORD *)(v0 + 520) = sub_21A79C3E4(v12, v13, &v21);
    sub_21A7D0074();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21A787000, v8, v9, "Coordinator could not start HoverText: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v11, -1, -1);
    MEMORY[0x22074950C](v10, -1, -1);

    v20(v19, v18);
  }
  else
  {
    v14 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    v15 = *(_QWORD *)(v0 + 576);
    v16 = *(_QWORD *)(v0 + 560);

    v14(v15, v16);
  }
  *(_BYTE *)(*(_QWORD *)(v0 + 528) + 96) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7A8DC8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 25) = a2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  *(_QWORD *)(v3 + 56) = swift_task_alloc();
  *(_QWORD *)(v3 + 64) = sub_21A7CFF00();
  *(_QWORD *)(v3 + 72) = sub_21A7CFEF4();
  *(_QWORD *)(v3 + 80) = sub_21A7CFEE8();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

uint64_t sub_21A7A8E60()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_BYTE *)(v0 + 25);
  v4 = *(void **)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = sub_21A7CFF18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  v6 = v4;
  swift_retain();
  v7 = sub_21A7CFEF4();
  v8 = swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v9;
  *(_BYTE *)(v8 + 32) = v2;
  *(_QWORD *)(v8 + 40) = v4;
  *(_QWORD *)(v8 + 48) = v3;
  *(_QWORD *)(v0 + 96) = sub_21A7AC988(v1, (uint64_t)&unk_2550F69A0, v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v10;
  type metadata accessor for HoverTextRootViewController();
  *(_QWORD *)(v0 + 112) = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5DE0);
  *v10 = v0;
  v10[1] = sub_21A7A8F7C;
  return sub_21A7CFF24();
}

uint64_t sub_21A7A8F7C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21A7A8FC8()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v0 + 24) & 1) != 0)
  {
    *(_QWORD *)(v0 + 32) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
}

uint64_t sub_21A7A9074(char a1)
{
  uint64_t result;

  if ((a1 & 1) != 0)
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (!result)
      return result;
  }
  else
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (!result)
      return result;
  }
  sub_21A7A9124();
  return swift_release();
}

uint64_t sub_21A7A9124()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t result;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_QWORD *)(v0 + 88))
  {
    swift_bridgeObjectRetain();
    v1 = sub_21A7A6E58();
    v2 = (void *)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
    result = MEMORY[0x22074959C](v0 + 40);
    if (!result)
    {
LABEL_12:
      __break(1u);
      return result;
    }
    objc_msgSend(v1, sel_hideAlertWithIdentifier_forService_, v2, result);

    swift_unknownObjectRelease();
    *(_QWORD *)(v0 + 80) = 0;
    *(_QWORD *)(v0 + 88) = 0;
    swift_bridgeObjectRelease();
  }
  v4 = sub_21A7A6E58();
  v5 = (void *)sub_21A7CFDE0();
  v6 = HTUILocString(v5);

  if (!v6)
  {
    sub_21A7CFE04();
    v6 = (id)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
  }
  result = MEMORY[0x22074959C](v0 + 40);
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  v7 = objc_msgSend(v4, sel_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_, v6, 0, 0, 0, 20, result, 1.0);

  swift_unknownObjectRelease();
  if (v7)
  {
    v8 = sub_21A7CFE04();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  *(_QWORD *)(v0 + 80) = v8;
  *(_QWORD *)(v0 + 88) = v10;
  return swift_bridgeObjectRelease();
}

void sub_21A7A92B0(SEL *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_sharedInstance);
  LOBYTE(a1) = objc_msgSend(v8, *a1);

  if ((a1 & 1) != 0)
    return;
  if (*(_QWORD *)(v4 + 88))
  {
    swift_bridgeObjectRetain();
    v9 = sub_21A7A6E58();
    v10 = (void *)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x22074959C](v4 + 40);
    if (!v11)
    {
LABEL_13:
      __break(1u);
      return;
    }
    objc_msgSend(v9, sel_hideAlertWithIdentifier_forService_, v10, v11);

    swift_unknownObjectRelease();
    *(_QWORD *)(v4 + 80) = 0;
    *(_QWORD *)(v4 + 88) = 0;
    swift_bridgeObjectRelease();
  }
  v12 = sub_21A7A6E58();
  v13 = (void *)sub_21A7CFDE0();
  v14 = HTUILocString(v13);

  if (!v14)
  {
    sub_21A7CFE04();
    v14 = (id)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
  }
  v15 = MEMORY[0x22074959C](v4 + 40);
  if (!v15)
  {
    __break(1u);
    goto LABEL_13;
  }
  v16 = objc_msgSend(v12, sel_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_, v14, 0, 0, 0, 20, v15, 2.0);

  swift_unknownObjectRelease();
  if (v16)
  {
    v17 = sub_21A7CFE04();
    v19 = v18;

  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  *(_QWORD *)(v4 + 80) = v17;
  *(_QWORD *)(v4 + 88) = v19;
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v7, sel_sharedInstance);
  objc_msgSend(v20, *a4, 1);

}

uint64_t sub_21A7A94DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_21A7CFF00();
  sub_21A79D268(a1);
  swift_retain();
  v8 = sub_21A7CFEF4();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  sub_21A79D22C(a1, (uint64_t)(v9 + 4));
  v9[11] = a2;
  sub_21A7ABD64((uint64_t)v6, (uint64_t)&unk_2550F68A0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_21A7A95DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_21A7CFF00();
  swift_bridgeObjectRetain();
  swift_retain();
  v10 = sub_21A7CFEF4();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  sub_21A7ABD64((uint64_t)v8, (uint64_t)&unk_2550F6880, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_21A7A96D4(uint64_t a1, uint64_t a2, char a3, void *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_21A7CFF00();
  v14 = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  v15 = sub_21A7CFEF4();
  v16 = swift_allocObject();
  v17 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v17;
  *(_QWORD *)(v16 + 32) = a1;
  *(_QWORD *)(v16 + 40) = a2;
  *(_BYTE *)(v16 + 48) = a3;
  *(_QWORD *)(v16 + 56) = a4;
  *(_QWORD *)(v16 + 64) = a5;
  sub_21A7ABD64((uint64_t)v12, (uint64_t)&unk_2550F6990, v16);
  return swift_release();
}

uint64_t sub_21A7A97E4(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_21A7CFF00();
  swift_retain();
  v8 = sub_21A7CFEF4();
  v9 = swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v10;
  *(_QWORD *)(v9 + 32) = a2;
  *(_BYTE *)(v9 + 40) = a1;
  sub_21A7ABD64((uint64_t)v6, (uint64_t)&unk_2550F6950, v9);
  return swift_release();
}

uint64_t sub_21A7A98C8(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[4];
  uint64_t v17;
  _BYTE v18[32];

  v4 = sub_21A7CF750();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  sub_21A7B2328(a2, (uint64_t)v18);
  v9 = sub_21A7CF744();
  v10 = sub_21A7CFF6C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 67109378;
    LODWORD(v16[0]) = a1;
    sub_21A7D0074();
    *(_WORD *)(v11 + 8) = 2080;
    sub_21A7B2328((uint64_t)v18, (uint64_t)v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6930);
    v13 = sub_21A7CFE10();
    v16[0] = sub_21A79C3E4(v13, v14, &v17);
    sub_21A7D0074();
    swift_bridgeObjectRelease();
    sub_21A7950C4((uint64_t)v18, &qword_2550F6930);
    _os_log_impl(&dword_21A787000, v9, v10, "Coordinator got AX notification: %d. data: %s", (uint8_t *)v11, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v12, -1, -1);
    MEMORY[0x22074950C](v11, -1, -1);
  }
  else
  {
    sub_21A7950C4((uint64_t)v18, &qword_2550F6930);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_21A7A9AE0(void *a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_21A7CFF00();
  v10 = a1;
  swift_retain();
  v11 = sub_21A7CFEF4();
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v13;
  *(_QWORD *)(v12 + 32) = v10;
  *(_QWORD *)(v12 + 40) = a3;
  *(_BYTE *)(v12 + 48) = a2;
  sub_21A7ABD64((uint64_t)v8, (uint64_t)&unk_2550F6918, v12);
  return swift_release();
}

uint64_t sub_21A7A9BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_21A7CFF00();
  swift_retain();
  v8 = sub_21A7CFEF4();
  v9 = swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v10;
  *(_QWORD *)(v9 + 32) = a2;
  *(_DWORD *)(v9 + 40) = a1;
  *(_BYTE *)(v9 + 44) = BYTE4(a1) & 1;
  sub_21A7ABEB0((uint64_t)v6, (uint64_t)&unk_2550F68F0, v9);
  return swift_release();
}

uint64_t sub_21A7A9CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_21A7CFF00();
  swift_retain();
  v9 = sub_21A7CFEF4();
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = a1;
  sub_21A7ABD64((uint64_t)v7, a3, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_21A7A9DAC(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_21A7CFF00();
  swift_retain();
  v10 = sub_21A7CFEF4();
  v11 = swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v12;
  *(_QWORD *)(v11 + 32) = a1;
  *(double *)(v11 + 40) = a2;
  *(double *)(v11 + 48) = a3;
  sub_21A7ABD64((uint64_t)v8, (uint64_t)&unk_2550F68B0, v11);
  return swift_release();
}

uint64_t sub_21A7A9E9C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A7CFF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_21A7CFF00();
  swift_retain();
  v8 = a1;
  v9 = sub_21A7CFEF4();
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = a2;
  v10[5] = v8;
  sub_21A7ABD64((uint64_t)v6, (uint64_t)&unk_2550F6928, (uint64_t)v10);
  return swift_release();
}

uint64_t HoverTextCoordinator.stopHoverText()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[35] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  v1[36] = swift_task_alloc();
  v2 = sub_21A7CF750();
  v1[37] = v2;
  v1[38] = *(_QWORD *)(v2 - 8);
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  v1[42] = swift_task_alloc();
  v1[43] = sub_21A7CFF00();
  v1[44] = sub_21A7CFEF4();
  v1[45] = sub_21A7CFEE8();
  v1[46] = v3;
  return swift_task_switch();
}

uint64_t sub_21A7AA074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  _QWORD *v14;

  v1 = *(_QWORD *)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = sub_21A7CF738();
  *(_QWORD *)(v0 + 376) = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 384) = v5;
  v5(v1, v4, v2);
  swift_retain();
  v6 = sub_21A7CF744();
  v7 = sub_21A7CFF60();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 280);
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    *(_DWORD *)(v0 + 504) = *(unsigned __int8 *)(v8 + 96);
    sub_21A7D0074();
    swift_release();
    _os_log_impl(&dword_21A787000, v6, v7, "Coordinator asked to stop HoverText. isRunning=%{BOOL}d", v9, 8u);
    MEMORY[0x22074950C](v9, -1, -1);
  }
  else
  {
    swift_release();
  }

  v10 = *(_QWORD *)(v0 + 336);
  v11 = *(_QWORD *)(v0 + 296);
  v12 = *(_QWORD *)(v0 + 280);
  v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 304) + 8);
  *(_QWORD *)(v0 + 392) = v13;
  v13(v10, v11);
  if (*(_BYTE *)(v12 + 96) == 1)
  {
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v14;
    *v14 = v0;
    v14[1] = sub_21A7AA24C;
    return sub_21A7AB3E0(0, 1);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21A7AA24C(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 408) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_21A7AA2C0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  void *v10;
  char **v11;
  char **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 376);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  v3 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 296);
  swift_beginAccess();
  v2(v3, v1, v4);
  swift_retain();
  v5 = sub_21A7CF744();
  v6 = sub_21A7CFF60();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 280);
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    *(_DWORD *)(v0 + 252) = *(unsigned __int8 *)(v7 + 96);
    sub_21A7D0074();
    swift_release();
    _os_log_impl(&dword_21A787000, v5, v6, "Coordinator did hide HoverText UI on main screen (isRunning=%{BOOL}d)", v8, 8u);
    MEMORY[0x22074950C](v8, -1, -1);
  }
  else
  {
    swift_release();
  }

  v9 = *(_QWORD *)(v0 + 280);
  (*(void (**)(_QWORD, _QWORD))(v0 + 392))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 296));
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = 0;

  if ((*(_BYTE *)(v9 + 16) & 1) != 0)
  {
    v11 = &selRef_hoverTextShowedBanner;
    v12 = &selRef_setHoverTextShowedBanner_;
    v13 = 0x62617369642E7468;
    v14 = 0xEB0000000064656CLL;
  }
  else
  {
    v11 = &selRef_hoverTextTypingShowedBanner;
    v12 = &selRef_setHoverTextTypingShowedBanner_;
    v13 = 0x617369642E747468;
    v14 = 0xEC00000064656C62;
  }
  sub_21A7AB598((SEL *)v11, v13, v14, (SEL *)v12);
  v15 = *(_QWORD *)(v0 + 280);
  swift_beginAccess();
  v16 = *(_QWORD *)(v15 + 64);
  *(_QWORD *)(v0 + 416) = v16;
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v23 = sub_21A7D01C4();
    *(_QWORD *)(v0 + 424) = v23;
    if (v23)
      goto LABEL_9;
  }
  else
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 424) = v17;
    if (v17)
    {
LABEL_9:
      swift_beginAccess();
      v18 = *(_QWORD *)(v0 + 416);
      if ((v18 & 0xC000000000000001) != 0)
        v19 = (id)MEMORY[0x220748B70](0);
      else
        v19 = *(id *)(v18 + 32);
      *(_QWORD *)(v0 + 432) = v19;
      *(_QWORD *)(v0 + 440) = 1;
      v20 = v19;
      *(_QWORD *)(v0 + 448) = sub_21A7CFEF4();
      *(_QWORD *)(v0 + 456) = sub_21A7CFEE8();
      *(_QWORD *)(v0 + 464) = v21;
      return swift_task_switch();
    }
  }
  v24 = *(_QWORD *)(v0 + 280);
  swift_bridgeObjectRelease();
  swift_release();
  v25 = *(_QWORD *)(v24 + 24);
  AXRuntimeClient.disableAccessibility()();
  if (v26)
  {
    v27 = *(_QWORD *)(v0 + 376);
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
    v29 = *(_QWORD *)(v0 + 312);
    v30 = *(_QWORD *)(v0 + 296);
    swift_beginAccess();
    v28(v29, v27, v30);
    v31 = v26;
    v32 = v26;
    v33 = sub_21A7CF744();
    v34 = sub_21A7CFF78();
    v35 = os_log_type_enabled(v33, v34);
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    v37 = *(_QWORD *)(v0 + 312);
    v38 = *(_QWORD *)(v0 + 296);
    if (v35)
    {
      v48 = *(_QWORD *)(v0 + 312);
      v47 = *(_QWORD *)(v0 + 296);
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v49 = v40;
      *(_DWORD *)v39 = 136315138;
      swift_getErrorValue();
      v41 = sub_21A7D0260();
      *(_QWORD *)(v0 + 272) = sub_21A79C3E4(v41, v42, &v49);
      sub_21A7D0074();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21A787000, v33, v34, "Coordinator could not stop HoverText: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22074950C](v40, -1, -1);
      MEMORY[0x22074950C](v39, -1, -1);

      v36(v48, v47);
    }
    else
    {

      v36(v37, v38);
    }
  }
  else
  {
    v43 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
    swift_beginAccess();
    v44 = *v43;
    *v43 = 0;
    v43[1] = 0;
    sub_21A795888(v44);
    v45 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
    swift_beginAccess();
    v46 = *v45;
    *v45 = 0;
    v45[1] = 0;
    sub_21A795888(v46);
    sub_21A7CA0E8();
  }
  *(_BYTE *)(*(_QWORD *)(v0 + 280) + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AA810()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v1 = (void *)v0[54];
  v3 = v0[35];
  v2 = v0[36];
  v4 = sub_21A7CFF18();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, 1, 1, v4);
  swift_retain();
  v6 = v1;
  v7 = sub_21A7CFEF4();
  v8 = swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v9;
  *(_BYTE *)(v8 + 32) = 0;
  *(_QWORD *)(v8 + 40) = v3;
  *(_QWORD *)(v8 + 48) = v1;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4);
  v11 = v0[36];
  if (v10 == 1)
  {
    sub_21A7950C4(v0[36], &qword_2550F67C8);
    if (v7)
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_21A7CFEE8();
      v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_21A7CFF0C();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v4);
    if (*(_QWORD *)(v8 + 16))
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6810);
  if (v14 | v12)
  {
    v0[2] = 0;
    v0[3] = 0;
    v0[4] = v12;
    v0[5] = v14;
  }
  v0[59] = swift_task_create();
  v15 = (_QWORD *)swift_task_alloc();
  v0[60] = v15;
  v0[61] = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5DE0);
  *v15 = v0;
  v15[1] = sub_21A7AAA04;
  return sub_21A7CFF24();
}

uint64_t sub_21A7AAA04()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21A7AAA50()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  swift_release();
  v1 = *(void **)(v0 + 240);
  *(_QWORD *)(v0 + 496) = v1;
  if ((*(_BYTE *)(v0 + 248) & 1) != 0)
  {
    v2 = *(void **)(v0 + 432);
    *(_QWORD *)(v0 + 256) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_bridgeObjectRelease();

  }
  else
  {
    v3 = *(void **)(v0 + 432);
    swift_release();
    sub_21A7B0A38(v1);

  }
  return swift_task_switch();
}

id sub_21A7AAB08()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id result;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 384))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 296));
  v1 = sub_21A7CF744();
  v2 = sub_21A7CFF60();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21A787000, v1, v2, "Coordinator did hide HoverText UI on external screen", v3, 2u);
    MEMORY[0x22074950C](v3, -1, -1);
    v4 = *(NSObject **)(v0 + 432);
  }
  else
  {
    v4 = v1;
    v1 = *(NSObject **)(v0 + 432);
  }
  v5 = *(_QWORD *)(v0 + 440);
  v6 = *(_QWORD *)(v0 + 424);
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  v8 = *(_QWORD *)(v0 + 320);
  v9 = *(_QWORD *)(v0 + 296);

  v7(v8, v9);
  if (v5 == v6)
  {
    v10 = *(_QWORD *)(v0 + 280);
    swift_bridgeObjectRelease();
    swift_release();
    v11 = *(_QWORD *)(v10 + 24);
    AXRuntimeClient.disableAccessibility()();
    if (v12)
    {
      v13 = *(_QWORD *)(v0 + 376);
      v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
      v15 = *(_QWORD *)(v0 + 312);
      v16 = *(_QWORD *)(v0 + 296);
      swift_beginAccess();
      v14(v15, v13, v16);
      v17 = v12;
      v18 = v12;
      v19 = sub_21A7CF744();
      v20 = sub_21A7CFF78();
      v21 = os_log_type_enabled(v19, v20);
      v22 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
      v23 = *(_QWORD *)(v0 + 312);
      v24 = *(_QWORD *)(v0 + 296);
      if (v21)
      {
        v39 = *(_QWORD *)(v0 + 312);
        v38 = *(_QWORD *)(v0 + 296);
        v25 = (uint8_t *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        v40 = v26;
        *(_DWORD *)v25 = 136315138;
        swift_getErrorValue();
        v27 = sub_21A7D0260();
        *(_QWORD *)(v0 + 272) = sub_21A79C3E4(v27, v28, &v40);
        sub_21A7D0074();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21A787000, v19, v20, "Coordinator could not stop HoverText: %s", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22074950C](v26, -1, -1);
        MEMORY[0x22074950C](v25, -1, -1);

        v22(v39, v38);
      }
      else
      {

        v22(v23, v24);
      }
    }
    else
    {
      v32 = (uint64_t *)(v11 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
      swift_beginAccess();
      v33 = *v32;
      *v32 = 0;
      v32[1] = 0;
      sub_21A795888(v33);
      v34 = (uint64_t *)(v11 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
      swift_beginAccess();
      v35 = *v34;
      *v34 = 0;
      v34[1] = 0;
      sub_21A795888(v35);
      sub_21A7CA0E8();
    }
    *(_BYTE *)(*(_QWORD *)(v0 + 280) + 96) = 0;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v29 = *(_QWORD *)(v0 + 440);
    v30 = *(_QWORD *)(v0 + 416);
    if ((v30 & 0xC000000000000001) != 0)
      result = (id)MEMORY[0x220748B70](*(_QWORD *)(v0 + 440));
    else
      result = *(id *)(v30 + 8 * v29 + 32);
    *(_QWORD *)(v0 + 432) = result;
    *(_QWORD *)(v0 + 440) = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
    }
    else
    {
      v36 = result;
      *(_QWORD *)(v0 + 448) = sub_21A7CFEF4();
      *(_QWORD *)(v0 + 456) = sub_21A7CFEE8();
      *(_QWORD *)(v0 + 464) = v37;
      return (id)swift_task_switch();
    }
  }
  return result;
}

uint64_t sub_21A7AAF30()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;

  v1 = *(void **)(v0 + 432);
  swift_release();

  v2 = *(void **)(v0 + 496);
  v3 = *(_QWORD *)(v0 + 376);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  v5 = *(_QWORD *)(v0 + 312);
  v6 = *(_QWORD *)(v0 + 296);
  swift_beginAccess();
  v4(v5, v3, v6);
  v7 = v2;
  v8 = v2;
  v9 = sub_21A7CF744();
  v10 = sub_21A7CFF78();
  if (os_log_type_enabled(v9, v10))
  {
    v20 = *(_QWORD *)(v0 + 312);
    v21 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    v19 = *(_QWORD *)(v0 + 296);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v22 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_getErrorValue();
    v13 = sub_21A7D0260();
    *(_QWORD *)(v0 + 272) = sub_21A79C3E4(v13, v14, &v22);
    sub_21A7D0074();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21A787000, v9, v10, "Coordinator could not stop HoverText: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v12, -1, -1);
    MEMORY[0x22074950C](v11, -1, -1);

    v21(v20, v19);
  }
  else
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    v16 = *(_QWORD *)(v0 + 312);
    v17 = *(_QWORD *)(v0 + 296);

    v15(v16, v17);
  }
  *(_BYTE *)(*(_QWORD *)(v0 + 280) + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AB18C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;

  swift_release();
  v1 = *(void **)(v0 + 408);
  v2 = *(_QWORD *)(v0 + 376);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  v4 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 296);
  swift_beginAccess();
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_21A7CF744();
  v9 = sub_21A7CFF78();
  if (os_log_type_enabled(v8, v9))
  {
    v19 = *(_QWORD *)(v0 + 312);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    v18 = *(_QWORD *)(v0 + 296);
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v21 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_getErrorValue();
    v12 = sub_21A7D0260();
    *(_QWORD *)(v0 + 272) = sub_21A79C3E4(v12, v13, &v21);
    sub_21A7D0074();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21A787000, v8, v9, "Coordinator could not stop HoverText: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v11, -1, -1);
    MEMORY[0x22074950C](v10, -1, -1);

    v20(v19, v18);
  }
  else
  {
    v14 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    v15 = *(_QWORD *)(v0 + 312);
    v16 = *(_QWORD *)(v0 + 296);

    v14(v15, v16);
  }
  *(_BYTE *)(*(_QWORD *)(v0 + 280) + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AB3E0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 25) = a2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  *(_QWORD *)(v3 + 56) = swift_task_alloc();
  *(_QWORD *)(v3 + 64) = sub_21A7CFF00();
  *(_QWORD *)(v3 + 72) = sub_21A7CFEF4();
  *(_QWORD *)(v3 + 80) = sub_21A7CFEE8();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

uint64_t sub_21A7AB478()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_BYTE *)(v0 + 25);
  v4 = *(void **)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = sub_21A7CFF18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  v6 = v4;
  swift_retain();
  v7 = sub_21A7CFEF4();
  v8 = swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v9;
  *(_BYTE *)(v8 + 32) = v2;
  *(_QWORD *)(v8 + 40) = v3;
  *(_QWORD *)(v8 + 48) = v4;
  *(_QWORD *)(v0 + 96) = sub_21A7ACAB8(v1, (uint64_t)&unk_2550F6860, v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6810);
  *(_QWORD *)(v0 + 112) = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5DE0);
  *v10 = v0;
  v10[1] = sub_21A7A8F7C;
  return sub_21A7CFF24();
}

void sub_21A7AB598(SEL *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_sharedInstance);
  LODWORD(a1) = objc_msgSend(v8, *a1);

  if (!(_DWORD)a1)
    return;
  if (*(_QWORD *)(v4 + 88))
  {
    swift_bridgeObjectRetain();
    v9 = sub_21A7A6E58();
    v10 = (void *)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x22074959C](v4 + 40);
    if (!v11)
    {
LABEL_14:
      __break(1u);
      return;
    }
    objc_msgSend(v9, sel_hideAlertWithIdentifier_forService_, v10, v11);

    swift_unknownObjectRelease();
    *(_QWORD *)(v4 + 80) = 0;
    *(_QWORD *)(v4 + 88) = 0;
    swift_bridgeObjectRelease();
  }
  v12 = sub_21A7A6E58();
  v13 = (void *)sub_21A7CFDE0();
  v14 = HTUILocString(v13);

  if (!v14)
  {
    sub_21A7CFE04();
    v14 = (id)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
  }
  v15 = MEMORY[0x22074959C](v4 + 40);
  if (!v15)
  {
    __break(1u);
    goto LABEL_14;
  }
  v16 = objc_msgSend(v12, sel_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_, v14, 0, 0, 0, 20, v15, 2.0);

  swift_unknownObjectRelease();
  if (v16)
  {
    v17 = sub_21A7CFE04();
    v19 = v18;

  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  *(_QWORD *)(v4 + 80) = v17;
  *(_QWORD *)(v4 + 88) = v19;
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v7, sel_sharedInstance);
  objc_msgSend(v20, *a4, 0);

}

Swift::Void __swiftcall HoverTextCoordinator.showAlert(_:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  Swift::String v5;
  id v6;

  v2 = *(void **)(v1 + 72);
  if (v2)
  {
    object = a1._object;
    countAndFlagsBits = a1._countAndFlagsBits;
    v6 = v2;
    v5._countAndFlagsBits = countAndFlagsBits;
    v5._object = object;
    HoverTextRootViewController.showAlert(_:)(v5);

  }
}

Swift::Void __swiftcall HoverTextCoordinator.addSceneForExternalDisplay(_:)(UIWindowScene a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v7 = a1.super.super.super.isa;
  MEMORY[0x2207488F4]();
  if (*(_QWORD *)((*(_QWORD *)(v1 + 64) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 64) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_21A7CFED0();
  sub_21A7CFEDC();
  sub_21A7CFEC4();
  swift_endAccess();
  if (*(_BYTE *)(v1 + 96) == 1)
  {
    v8 = sub_21A7CFF18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
    sub_21A7CFF00();
    v9 = v7;
    swift_retain();
    v10 = sub_21A7CFEF4();
    v11 = (_QWORD *)swift_allocObject();
    v12 = MEMORY[0x24BEE6930];
    v11[2] = v10;
    v11[3] = v12;
    v11[4] = v2;
    v11[5] = v9;
    sub_21A7ABD64((uint64_t)v6, (uint64_t)&unk_2550F6820, (uint64_t)v11);
    swift_release();
  }
}

uint64_t sub_21A7AB998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  v5[8] = a4;
  v7 = sub_21A7CF750();
  v5[9] = v7;
  v5[10] = *(_QWORD *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = sub_21A7CFF00();
  v5[14] = sub_21A7CFEF4();
  v8 = (_QWORD *)swift_task_alloc();
  v5[15] = v8;
  *v8 = v5;
  v8[1] = sub_21A7ABA4C;
  return sub_21A7A8DC8(a5, 0);
}

uint64_t sub_21A7ABA4C(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 128) = v1;
  swift_task_dealloc();
  if (!v1)

  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7ABAF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_release();
  v4 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_retain();
  v5 = sub_21A7CF744();
  v6 = sub_21A7CFF60();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 64);
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    *(_DWORD *)(v0 + 136) = *(unsigned __int8 *)(v7 + 96);
    sub_21A7D0074();
    swift_release();
    _os_log_impl(&dword_21A787000, v5, v6, "Did show HoverText UI on external screen (isRunning=%{BOOL}d)", v8, 8u);
    MEMORY[0x22074950C](v8, -1, -1);
  }
  else
  {
    swift_release();
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7ABC50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  swift_release();
  v4 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_21A7CF744();
  v6 = sub_21A7CFF78();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A787000, v5, v6, "Cannot attach HT view controller for external display", v7, 2u);
    MEMORY[0x22074950C](v7, -1, -1);
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7ABD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21A7CFF18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21A7CFF0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21A7950C4(a1, &qword_2550F67C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21A7CFEE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21A7ABEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21A7CFF18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21A7CFF0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21A7950C4(a1, &qword_2550F67C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21A7CFEE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6908);
  return swift_task_create();
}

Swift::Void __swiftcall HoverTextCoordinator.removeSceneForExternalDisplay(_:)(UIWindowScene a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v7 = a1.super.super.super.isa;
  v8 = sub_21A7B12EC((unint64_t *)(v1 + 64), (uint64_t)v7);

  v9 = *(_QWORD *)(v1 + 64);
  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10 >= v8)
      goto LABEL_3;
LABEL_7:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  v10 = sub_21A7D01C4();
  swift_bridgeObjectRelease();
  if (v10 < v8)
    goto LABEL_7;
LABEL_3:
  sub_21A7B1604(v8, v10);
  swift_endAccess();
  if (*(_BYTE *)(v1 + 96) == 1)
  {
    v11 = sub_21A7CFF18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
    sub_21A7CFF00();
    v12 = v7;
    swift_retain();
    v13 = sub_21A7CFEF4();
    v14 = (_QWORD *)swift_allocObject();
    v15 = MEMORY[0x24BEE6930];
    v14[2] = v13;
    v14[3] = v15;
    v14[4] = v2;
    v14[5] = v12;
    sub_21A7ABD64((uint64_t)v6, (uint64_t)&unk_2550F6830, (uint64_t)v14);
    swift_release();
  }
}

uint64_t sub_21A7AC1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  v5[8] = a4;
  v7 = sub_21A7CF750();
  v5[9] = v7;
  v5[10] = *(_QWORD *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = sub_21A7CFF00();
  v5[14] = sub_21A7CFEF4();
  v8 = (_QWORD *)swift_task_alloc();
  v5[15] = v8;
  *v8 = v5;
  v8[1] = sub_21A7AC25C;
  return sub_21A7AB3E0(a5, 0);
}

uint64_t sub_21A7AC25C(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 128) = v1;
  swift_task_dealloc();
  if (!v1)

  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AC308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_release();
  v4 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_retain();
  v5 = sub_21A7CF744();
  v6 = sub_21A7CFF60();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 64);
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    *(_DWORD *)(v0 + 136) = *(unsigned __int8 *)(v7 + 96);
    sub_21A7D0074();
    swift_release();
    _os_log_impl(&dword_21A787000, v5, v6, "Did hide HoverText UI on external screen (isRunning=%{BOOL}d)", v8, 8u);
    MEMORY[0x22074950C](v8, -1, -1);
  }
  else
  {
    swift_release();
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AC460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  swift_release();
  v4 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_21A7CF744();
  v6 = sub_21A7CFF78();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A787000, v5, v6, "Cannot detach HT view controller for external display", v7, 2u);
    MEMORY[0x22074950C](v7, -1, -1);
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AC574(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 128) = a5;
  *(_QWORD *)(v6 + 136) = a6;
  *(_BYTE *)(v6 + 193) = a4;
  *(_QWORD *)(v6 + 120) = a1;
  sub_21A7CFF00();
  *(_QWORD *)(v6 + 144) = sub_21A7CFEF4();
  *(_QWORD *)(v6 + 152) = sub_21A7CFEE8();
  *(_QWORD *)(v6 + 160) = v7;
  return swift_task_switch();
}

uint64_t sub_21A7AC5E8()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;

  v1 = (_DWORD *)(v0 + 80);
  if ((*(_BYTE *)(v0 + 193) & 1) != 0)
  {
    v2 = 0xE400000000000000;
    v3 = 1852399949;
  }
  else
  {
    v4 = *(void **)(v0 + 128);
    if (v4)
      LODWORD(v4) = objc_msgSend(v4, sel__accessibilityDisplayId);
    *v1 = (_DWORD)v4;
    sub_21A7D0224();
    sub_21A7CFE40();
    swift_bridgeObjectRelease();
    v3 = 0x6C616E7265747845;
    v2 = 0xE90000000000002DLL;
  }
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 136);
  v7 = *(_BYTE *)(v6 + 16);
  v8 = objc_allocWithZone((Class)type metadata accessor for HoverTextRootViewController());
  v9 = (void *)sub_21A7953C8(v3, v2, v7);
  *(_QWORD *)(v0 + 168) = v9;
  v10 = sub_21A7A6E58();
  *(_QWORD *)(v0 + 176) = v10;
  v11 = *(_BYTE *)(v6 + 16);
  v12 = MEMORY[0x22074959C](v6 + 40);
  *(_QWORD *)(v0 + 184) = v12;
  *(_QWORD *)(v0 + 56) = v0 + 192;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_21A7AC794;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_21A7AC974;
  *(_QWORD *)(v0 + 104) = &block_descriptor_118;
  objc_msgSend(v10, sel_addContentViewController_withUserInteractionEnabled_forService_context_userInterfaceStyle_forWindowScene_completion_, v9, (v11 & 1) == 0, v12, 0, 2, v5, v1);
  return swift_continuation_await();
}

uint64_t sub_21A7AC794()
{
  return swift_task_switch();
}

void sub_21A7AC7D8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v1 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 168);
  swift_release();
  v3 = *(unsigned __int8 *)(v0 + 192);

  swift_unknownObjectRelease();
  if (v3 != 1)
  {
    v8 = *(void **)(v0 + 168);
    sub_21A7B1A8C();
    swift_allocError();
    *v9 = 0xD000000000000029;
    v9[1] = 0x800000021A7D4060;
    swift_willThrow();

    v10 = *(void (**)(void))(v0 + 8);
LABEL_11:
    v10();
    return;
  }
  if (*(_BYTE *)(v0 + 193) == 1)
  {
    v4 = *(void **)(v0 + 168);
    v5 = *(_QWORD *)(v0 + 136);
    v6 = *(id *)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v4;
    v7 = v4;
  }
  else
  {
    v11 = *(void **)(v0 + 128);
    if (!v11)
      goto LABEL_13;
    v12 = *(void **)(v0 + 168);
    swift_beginAccess();
    v13 = v12;
    v6 = v11;
    sub_21A7B0AC0((uint64_t)v13, v6);
    swift_endAccess();
  }

  v14 = objc_msgSend(*(id *)(v0 + 168), sel_view);
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, sel_window);

    if (v16)
    {
      sub_21A7CA304(v16);

    }
    **(_QWORD **)(v0 + 120) = *(_QWORD *)(v0 + 168);
    v10 = *(void (**)(void))(v0 + 8);
    goto LABEL_11;
  }
  __break(1u);
LABEL_13:
  __break(1u);
}

uint64_t sub_21A7AC974(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_21A7AC988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21A7CFF18();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21A7CFF0C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21A7950C4(a1, &qword_2550F67C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21A7CFEE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  type metadata accessor for HoverTextRootViewController();
  return swift_task_create();
}

uint64_t sub_21A7ACAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21A7CFF18();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21A7CFF0C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21A7950C4(a1, &qword_2550F67C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21A7CFEE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6810);
  return swift_task_create();
}

uint64_t sub_21A7ACBEC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 192) = a5;
  *(_QWORD *)(v6 + 200) = a6;
  *(_BYTE *)(v6 + 281) = a4;
  *(_QWORD *)(v6 + 184) = a1;
  sub_21A7CFF00();
  *(_QWORD *)(v6 + 208) = sub_21A7CFEF4();
  *(_QWORD *)(v6 + 216) = sub_21A7CFEE8();
  *(_QWORD *)(v6 + 224) = v7;
  return swift_task_switch();
}

void sub_21A7ACC60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v1 = v0 + 280;
  if (*(_BYTE *)(v0 + 281) != 1)
  {
    v14 = *(void **)(v0 + 200);
    if (!v14)
    {
      __break(1u);
      goto LABEL_17;
    }
    v15 = *(_QWORD *)(v0 + 192);
    swift_beginAccess();
    v16 = *(_QWORD *)(v15 + 56);
    v17 = v14;
    v3 = sub_21A7A6A44(v17, v16);
    *(_QWORD *)(v0 + 256) = v3;

    if (v3)
    {
      v18 = *(_QWORD *)(v0 + 192);
      swift_endAccess();
      v8 = sub_21A7A6E58();
      *(_QWORD *)(v0 + 264) = v8;
      v19 = *(unsigned __int8 *)(v18 + 16);
      v20 = MEMORY[0x22074959C](v18 + 40);
      *(_QWORD *)(v0 + 272) = v20;
      if (v20)
      {
        v11 = v20;
        v12 = v19 ^ 1u;
        *(_QWORD *)(v0 + 120) = v1;
        *(_QWORD *)(v0 + 80) = v0;
        *(_QWORD *)(v0 + 88) = sub_21A7ACFEC;
        *(_QWORD *)(v0 + 176) = swift_continuation_init();
        *(_QWORD *)(v0 + 144) = MEMORY[0x24BDAC760];
        *(_QWORD *)(v0 + 152) = 0x40000000;
        v13 = &block_descriptor_29;
        goto LABEL_12;
      }
      goto LABEL_19;
    }
    swift_endAccess();
LABEL_15:
    swift_release();
    **(_QWORD **)(v0 + 184) = 0;
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v2 = *(void **)(*(_QWORD *)(v0 + 192) + 72);
  *(_QWORD *)(v0 + 232) = v2;
  if (!v2)
    goto LABEL_15;
  v3 = v2;
  v4 = objc_msgSend(v3, sel_view);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_window);

    if (v6)
    {
      sub_21A7CA97C(v6);

    }
    v7 = *(_QWORD *)(v0 + 192);
    v8 = sub_21A7A6E58();
    *(_QWORD *)(v0 + 240) = v8;
    v9 = *(unsigned __int8 *)(v7 + 16);
    v10 = MEMORY[0x22074959C](v7 + 40);
    *(_QWORD *)(v0 + 248) = v10;
    if (v10)
    {
      v11 = v10;
      v12 = v9 ^ 1u;
      *(_QWORD *)(v0 + 56) = v1;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_21A7ACEE0;
      *(_QWORD *)(v0 + 176) = swift_continuation_init();
      *(_QWORD *)(v0 + 144) = MEMORY[0x24BDAC760];
      *(_QWORD *)(v0 + 152) = 0x40000000;
      v13 = &block_descriptor_31;
LABEL_12:
      *(_QWORD *)(v0 + 160) = sub_21A7AC974;
      *(_QWORD *)(v0 + 168) = v13;
      objc_msgSend(v8, sel_removeContentViewController_withUserInteractionEnabled_forService_context_completion_, v3, v12, v11, 0, v0 + 144);
      swift_continuation_await();
      return;
    }
    goto LABEL_18;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t sub_21A7ACEE0()
{
  return swift_task_switch();
}

uint64_t sub_21A7ACF24()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 232);
  swift_release();
  v3 = *(unsigned __int8 *)(v0 + 280);

  swift_unknownObjectRelease();
  if (v3 == 1)
  {
    **(_QWORD **)(v0 + 184) = *(_QWORD *)(v0 + 232);
  }
  else
  {
    sub_21A7B1A8C();
    swift_allocError();
    *v4 = 0xD000000000000029;
    v4[1] = 0x800000021A7D4030;
    swift_willThrow();

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7ACFEC()
{
  return swift_task_switch();
}

uint64_t sub_21A7AD030()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 264);
  v2 = *(void **)(v0 + 256);
  swift_release();
  v3 = *(unsigned __int8 *)(v0 + 280);

  swift_unknownObjectRelease();
  if (v3 == 1)
  {
    **(_QWORD **)(v0 + 184) = *(_QWORD *)(v0 + 256);
  }
  else
  {
    sub_21A7B1A8C();
    swift_allocError();
    *v4 = 0xD000000000000029;
    v4[1] = 0x800000021A7D4030;
    swift_willThrow();

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AD0F8()
{
  int64_t v0;
  int64_t v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v24;
  uint64_t v25;

  v1 = v0;
  v25 = MEMORY[0x24BEE4AF8];
  v2 = *(void **)(v0 + 72);
  if (!v2)
    goto LABEL_4;
  v3 = v2;
  MEMORY[0x2207488F4]();
  if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_3;
  while (1)
  {
    sub_21A7CFED0();
LABEL_3:
    sub_21A7CFEDC();
    sub_21A7CFEC4();

LABEL_4:
    swift_beginAccess();
    v4 = *(_QWORD *)(v1 + 56);
    if ((v4 & 0xC000000000000001) != 0)
    {
      v3 = 0;
      v5 = 0;
      v6 = 0;
      v7 = sub_21A7D017C() | 0x8000000000000000;
    }
    else
    {
      v8 = -1 << *(_BYTE *)(v4 + 32);
      v5 = ~v8;
      v3 = (id)(v4 + 64);
      v9 = -v8;
      v10 = v9 < 64 ? ~(-1 << v9) : -1;
      v6 = v10 & *(_QWORD *)(v4 + 64);
      v7 = v4;
    }
    swift_bridgeObjectRetain();
    v11 = 0;
    v1 = (unint64_t)(v5 + 64) >> 6;
    if ((v7 & 0x8000000000000000) != 0)
      break;
LABEL_11:
    if (v6)
    {
      v12 = (v6 - 1) & v6;
      v13 = __clz(__rbit64(v6)) | (v11 << 6);
      v14 = v11;
      goto LABEL_30;
    }
    v17 = v11 + 1;
    if (!__OFADD__(v11, 1))
    {
      if (v17 >= v1)
        goto LABEL_35;
      v18 = *((_QWORD *)v3 + v17);
      v14 = v11 + 1;
      if (!v18)
      {
        v14 = v11 + 2;
        if (v11 + 2 >= v1)
          goto LABEL_35;
        v18 = *((_QWORD *)v3 + v14);
        if (!v18)
        {
          v14 = v11 + 3;
          if (v11 + 3 >= v1)
            goto LABEL_35;
          v18 = *((_QWORD *)v3 + v14);
          if (!v18)
          {
            v14 = v11 + 4;
            if (v11 + 4 >= v1)
              goto LABEL_35;
            v18 = *((_QWORD *)v3 + v14);
            if (!v18)
            {
              v19 = v11 + 5;
              while (v1 != v19)
              {
                v18 = *((_QWORD *)v3 + v19++);
                if (v18)
                {
                  v14 = v19 - 1;
                  goto LABEL_29;
                }
              }
              goto LABEL_35;
            }
          }
        }
      }
LABEL_29:
      v12 = (v18 - 1) & v18;
      v13 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_30:
      v20 = 8 * v13;
      v21 = *(void **)(*(_QWORD *)(v7 + 56) + v20);
      v15 = *(id *)(*(_QWORD *)(v7 + 48) + v20);
      v16 = v21;
      if (v15)
        goto LABEL_31;
      goto LABEL_35;
    }
    __break(1u);
  }
  while (sub_21A7D01A0())
  {
    sub_21A7B19BC();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v24;
    swift_unknownObjectRelease();
    type metadata accessor for HoverTextRootViewController();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v16 = v24;
    swift_unknownObjectRelease();
    v14 = v11;
    v12 = v6;
    if (!v24)
      break;
LABEL_31:

    v22 = v16;
    MEMORY[0x2207488F4]();
    if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_21A7CFED0();
    sub_21A7CFEDC();
    sub_21A7CFEC4();

    v11 = v14;
    v6 = v12;
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_11;
  }
LABEL_35:
  sub_21A7B1C5C();
  return v25;
}

uint64_t sub_21A7AD44C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t updated;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v11;

  v1 = v0;
  v2 = type metadata accessor for HoverTextPresentationEvent();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  MEMORY[0x24BDAC7A8](updated);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A7B1D18(v1, (uint64_t)v8, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
  {
    sub_21A7B1C18((uint64_t)v8, (uint64_t)v5);
    __asm { BR              X12 }
  }
  return 7105601;
}

uint64_t sub_21A7AD688(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t updated;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(_QWORD);
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD v32[8];
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[3];
  uint64_t v37;

  v2 = sub_21A7CF750();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for HoverTextPresentationEvent();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v11 = MEMORY[0x24BDAC7A8](updated);
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v32 - v14;
  sub_21A7B1D18(a1, (uint64_t)v32 - v14, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6) != 1)
  {
    v32[6] = a1;
    v32[7] = v3;
    v33 = (char *)v2;
    sub_21A7B1C18((uint64_t)v15, (uint64_t)v9);
    __asm { BR              X10 }
  }
  v37 = sub_21A7AD0F8();
  v17 = sub_21A7CF72C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v17, v2);
  sub_21A7B1D18(a1, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  v18 = sub_21A7CF744();
  v19 = sub_21A7CFF6C();
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v36[0] = v22;
    *(_DWORD *)v21 = 136315394;
    v33 = v5;
    v23 = v3;
    v24 = sub_21A7AD44C();
    v35 = sub_21A79C3E4(v24, v25, v36);
    sub_21A7D0074();
    swift_bridgeObjectRelease();
    sub_21A7B1BB8((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
    *(_WORD *)(v21 + 12) = 2080;
    swift_beginAccess();
    v26 = type metadata accessor for HoverTextRootViewController();
    v27 = swift_bridgeObjectRetain();
    v28 = MEMORY[0x220748918](v27, v26);
    v30 = v29;
    swift_bridgeObjectRelease();
    v34 = sub_21A79C3E4(v28, v30, v36);
    sub_21A7D0074();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v18, v19, "Will sent event=%s to view controllers: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v22, -1, -1);
    MEMORY[0x22074950C](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v2);
  }
  else
  {
    sub_21A7B1BB8((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_beginAccess();
  return v37;
}

uint64_t sub_21A7ADD70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  *(_QWORD *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 88) = a5;
  sub_21A79D22C(a4, v5 + 16);
  v6 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)(v5 + 96) = *(_OWORD *)(v5 + 16);
  *(_OWORD *)(v5 + 112) = v6;
  *(_OWORD *)(v5 + 128) = *(_OWORD *)(v5 + 48);
  *(_BYTE *)(v5 + 65) = *(_BYTE *)(v5 + 64);
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(_QWORD *)(v5 + 144) = swift_task_alloc();
  v7 = type metadata accessor for HoverTextPresentationEvent();
  *(_QWORD *)(v5 + 152) = v7;
  *(_QWORD *)(v5 + 160) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 168) = swift_task_alloc();
  sub_21A7CFF00();
  *(_QWORD *)(v5 + 176) = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7ADE48()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(int **)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_BYTE *)(v0 + 65);
  v7 = *(_QWORD *)(v0 + 128);
  v23 = *(_OWORD *)(v0 + 96);
  v24 = *(_OWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 80);
  swift_release();
  *(_BYTE *)(v1 + 50) = 12;
  sub_21A79D268(v8);
  sub_21A7CF510();
  v9 = (_QWORD *)(v1 + v2[8]);
  *v9 = 0;
  v9[1] = 0;
  v10 = (_OWORD *)(v1 + v2[9]);
  *v10 = 0u;
  v10[1] = 0u;
  v11 = v1 + v2[10];
  *(_QWORD *)v11 = 0;
  *(_BYTE *)(v11 + 8) = 1;
  v12 = (_QWORD *)(v1 + v2[11]);
  *v12 = 0;
  v12[1] = 0;
  *(_QWORD *)(v1 + v2[12]) = 0;
  *(_QWORD *)(v1 + v2[13]) = 0;
  *(_OWORD *)v1 = v23;
  *(_OWORD *)(v1 + 16) = v24;
  *(_QWORD *)(v1 + 32) = v7;
  *(_QWORD *)(v1 + 40) = v5;
  *(_BYTE *)(v1 + 48) = v6;
  *(_BYTE *)(v1 + 49) = 1;
  sub_21A7B1D18(v1, v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  v13 = sub_21A7AD688(v4);
  sub_21A7B1BB8(v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v13 >> 62))
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v14)
      goto LABEL_3;
LABEL_10:
    v22 = *(_QWORD *)(v0 + 168);
    swift_bridgeObjectRelease_n();
    sub_21A7B1BB8(v22, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v14 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v14 >= 1)
  {
    v16 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
        v17 = (char *)MEMORY[0x220748B70](v16, v13);
      else
        v17 = (char *)*(id *)(v13 + 8 * v16 + 32);
      v18 = v17;
      v19 = *(_QWORD *)(v0 + 168);
      ++v16;
      v20 = *(_QWORD *)&v18[qword_2550F6128 + 8];
      v21 = **(_QWORD **)&v18[qword_2550F6128];
      *(_QWORD *)(v0 + 72) = *(_QWORD *)&v18[qword_2550F6128];
      (*(void (**)(uint64_t, uint64_t))(v20 + 280))(v19, v21);

    }
    while (v14 != v16);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AE080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  v5 = type metadata accessor for HoverTextPresentationEvent();
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = swift_task_alloc();
  sub_21A7CFF00();
  v4[8] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AE134()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _OWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(int **)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  swift_release();
  *(_BYTE *)(v1 + 50) = 12;
  sub_21A7CF510();
  v5 = (_QWORD *)(v1 + v2[8]);
  *v5 = 0;
  v5[1] = 0;
  v6 = (_OWORD *)(v1 + v2[9]);
  *v6 = 0u;
  v6[1] = 0u;
  v7 = v1 + v2[10];
  *(_QWORD *)v7 = 0;
  *(_BYTE *)(v7 + 8) = 1;
  v8 = (_QWORD *)(v1 + v2[11]);
  *v8 = 0;
  v8[1] = 0;
  *(_QWORD *)(v1 + v2[12]) = 0;
  *(_QWORD *)(v1 + v2[13]) = 0;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)v1 = 0u;
  *(_WORD *)(v1 + 48) = 352;
  sub_21A7B1D18(v1, v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  v9 = sub_21A7AD688(v4);
  sub_21A7B1BB8(v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_21A7B1BB8(*(_QWORD *)(v0 + 56), (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v10 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v10 >= 1)
  {
    v12 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v13 = (char *)MEMORY[0x220748B70](v12, v9);
      else
        v13 = (char *)*(id *)(v9 + 8 * v12 + 32);
      v14 = v13;
      v15 = *(_QWORD *)(v0 + 56);
      ++v12;
      v16 = *(_QWORD *)&v14[qword_2550F6128 + 8];
      v17 = **(_QWORD **)&v14[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)&v14[qword_2550F6128];
      (*(void (**)(uint64_t, uint64_t))(v16 + 280))(v15, v17);

    }
    while (v10 != v12);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AE330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_BYTE *)(v8 + 96) = a6;
  *(_QWORD *)(v8 + 24) = a4;
  *(_QWORD *)(v8 + 32) = a5;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(_QWORD *)(v8 + 56) = swift_task_alloc();
  v9 = type metadata accessor for HoverTextPresentationEvent();
  *(_QWORD *)(v8 + 64) = v9;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 80) = swift_task_alloc();
  sub_21A7CFF00();
  *(_QWORD *)(v8 + 88) = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AE3EC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(int **)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(void **)(v0 + 40);
  v7 = *(unsigned __int8 *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 24);
  swift_release();
  *(_BYTE *)(v1 + 50) = 12;
  v9 = v6;
  swift_bridgeObjectRetain();
  sub_21A7CF510();
  v10 = (_QWORD *)(v1 + v2[8]);
  *v10 = 0;
  v10[1] = 0;
  v11 = (_OWORD *)(v1 + v2[9]);
  *v11 = 0u;
  v11[1] = 0u;
  v12 = v1 + v2[10];
  *(_QWORD *)v12 = 0;
  *(_BYTE *)(v12 + 8) = 1;
  v13 = (_QWORD *)(v1 + v2[11]);
  *v13 = 0;
  v13[1] = 0;
  *(_QWORD *)(v1 + v2[12]) = 0;
  *(_QWORD *)(v1 + v2[13]) = 0;
  *(_QWORD *)v1 = v8;
  *(_QWORD *)(v1 + 8) = v5;
  *(_QWORD *)(v1 + 16) = v7;
  *(_QWORD *)(v1 + 24) = v6;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 48) = 320;
  sub_21A7B1D18(v1, v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  v14 = sub_21A7AD688(v4);
  sub_21A7B1BB8(v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v15)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_21A7B1BB8(*(_QWORD *)(v0 + 80), (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v15 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v15 >= 1)
  {
    v17 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
        v18 = (char *)MEMORY[0x220748B70](v17, v14);
      else
        v18 = (char *)*(id *)(v14 + 8 * v17 + 32);
      v19 = v18;
      v20 = *(_QWORD *)(v0 + 80);
      ++v17;
      v21 = *(_QWORD *)&v19[qword_2550F6128 + 8];
      v22 = **(_QWORD **)&v19[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)&v19[qword_2550F6128];
      (*(void (**)(uint64_t, uint64_t))(v21 + 280))(v20, v22);

    }
    while (v15 != v17);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AE618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v6[6] = swift_task_alloc();
  v7 = type metadata accessor for HoverTextPresentationEvent();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = swift_task_alloc();
  sub_21A7CFF00();
  v6[10] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AE6D0()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(int **)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  swift_release();
  *(_BYTE *)(v1 + 50) = 12;
  swift_bridgeObjectRetain();
  sub_21A7CF510();
  v7 = (_QWORD *)(v1 + v2[8]);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_OWORD *)(v1 + v2[9]);
  *v8 = 0u;
  v8[1] = 0u;
  v9 = v1 + v2[10];
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  v10 = (_QWORD *)(v1 + v2[11]);
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)(v1 + v2[12]) = 0;
  *(_QWORD *)(v1 + v2[13]) = 0;
  *(_QWORD *)v1 = v6;
  *(_QWORD *)(v1 + 8) = v5;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_WORD *)(v1 + 48) = 288;
  sub_21A7B1D18(v1, v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  v11 = sub_21A7AD688(v4);
  sub_21A7B1BB8(v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v11 >> 62))
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v12)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_21A7B1BB8(*(_QWORD *)(v0 + 72), (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v12 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v12 >= 1)
  {
    v14 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0)
        v15 = (char *)MEMORY[0x220748B70](v14, v11);
      else
        v15 = (char *)*(id *)(v11 + 8 * v14 + 32);
      v16 = v15;
      v17 = *(_QWORD *)(v0 + 72);
      ++v14;
      v18 = *(_QWORD *)&v16[qword_2550F6128 + 8];
      v19 = **(_QWORD **)&v16[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)&v16[qword_2550F6128];
      (*(void (**)(uint64_t, uint64_t))(v18 + 280))(v17, v19);

    }
    while (v12 != v14);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AE8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[8] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[9] = swift_task_alloc();
  sub_21A7CFF00();
  v4[10] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AE968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v1 = *(_QWORD *)(v0 + 72);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  v4 = sub_21A7D01C4();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  result = objc_opt_self();
  v16 = (id)result;
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = v3 & 0xC000000000000001;
    v8 = v3;
    do
    {
      if (v7)
        v9 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v9 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v10 = v9;
      ++v6;
      v11 = qword_2550F6138;
      objc_msgSend(*(id *)&v9[qword_2550F6138], sel_invalidate, v16);
      v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      *(_QWORD *)(v0 + 48) = sub_21A795B64;
      *(_QWORD *)(v0 + 56) = v12;
      *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
      *(_QWORD *)(v0 + 24) = 1107296256;
      *(_QWORD *)(v0 + 32) = sub_21A795378;
      *(_QWORD *)(v0 + 40) = &block_descriptor_48;
      v13 = _Block_copy((const void *)(v0 + 16));
      swift_release();
      v14 = objc_msgSend(v16, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v13, 0.2);
      _Block_release(v13);
      v15 = *(void **)&v10[v11];
      *(_QWORD *)&v10[v11] = v14;

      v3 = v8;
    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AEB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AEC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = &v7[qword_2550F6128];
      v10 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v11 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)v9;
      (*(void (**)(uint64_t))(v10 + 248))(v11);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AED6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AEDF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = &v7[qword_2550F6128];
      v10 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v11 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)v9;
      (*(void (**)(uint64_t))(v10 + 232))(v11);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AEF4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AEFD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = &v7[qword_2550F6128];
      v10 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v11 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)v9;
      (*(void (**)(uint64_t))(v10 + 240))(v11);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AF12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  *(_BYTE *)(v5 + 48) = a5;
  *(_QWORD *)(v5 + 24) = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(_QWORD *)(v5 + 32) = swift_task_alloc();
  sub_21A7CFF00();
  *(_QWORD *)(v5 + 40) = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AF1BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      v9 = *(unsigned __int8 *)(v0 + 48);
      ++v6;
      v10 = *(_QWORD *)&v8[qword_2550F6128 + 8];
      v11 = **(_QWORD **)&v8[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)&v8[qword_2550F6128];
      (*(void (**)(uint64_t, uint64_t))(v10 + 256))(v9, v11);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AF314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AF3A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = &v7[qword_2550F6128];
      v10 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v11 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)v9;
      (*(void (**)(uint64_t))(v10 + 224))(v11);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AF4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + 96) = a6;
  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 40) = a5;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(_QWORD *)(v6 + 48) = swift_task_alloc();
  v7 = type metadata accessor for HoverTextPresentationEvent();
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 72) = swift_task_alloc();
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  sub_21A7CFF00();
  *(_QWORD *)(v6 + 88) = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AF5BC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  char *v29;
  BOOL v30;
  void *v31;
  id v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  char v47;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(int **)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(void **)(v0 + 32);
  swift_release();
  *(_BYTE *)(v1 + 50) = 12;
  v6 = v5;
  sub_21A7CF510();
  v7 = (_QWORD *)(v1 + v2[8]);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_OWORD *)(v1 + v2[9]);
  *v8 = 0u;
  v8[1] = 0u;
  v9 = v1 + v2[10];
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  v10 = (_QWORD *)(v1 + v2[11]);
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)(v1 + v2[12]) = 0;
  *(_QWORD *)(v1 + v2[13]) = 0;
  *(_QWORD *)v1 = v5;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 33) = 0u;
  *(_BYTE *)(v1 + 49) = 1;
  sub_21A7B1D18(v1, v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  v11 = sub_21A7AD688(v4);
  sub_21A7B1BB8(v4, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  v12 = sub_21A7AD0F8();
  v51 = v12;
  if (v12 >> 62)
    goto LABEL_42;
  v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v13)
  {
    while (1)
    {
      if (v11 >> 62)
      {
        swift_bridgeObjectRetain();
        v56 = sub_21A7D01C4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v56 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v14 = 0;
      v54 = v11;
      v52 = v11 & 0xC000000000000001;
      v49 = *(_QWORD *)(v0 + 72) + 8;
      v50 = *(_QWORD *)(v0 + 72);
      v53 = v13;
      while (1)
      {
        if ((v51 & 0xC000000000000001) != 0)
        {
          v29 = (char *)MEMORY[0x220748B70](v14, v51);
          v30 = __OFADD__(v14++, 1);
          if (v30)
            goto LABEL_38;
        }
        else
        {
          if (v14 >= *(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_40;
          v29 = (char *)*(id *)(v51 + 32 + 8 * v14);
          v30 = __OFADD__(v14++, 1);
          if (v30)
          {
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            goto LABEL_41;
          }
        }
        if (!v56)
          goto LABEL_7;
        if (v52)
        {
          swift_bridgeObjectRetain();
          v32 = (id)MEMORY[0x220748B70](0, v11);
        }
        else
        {
          v31 = *(void **)(v11 + 32);
          swift_bridgeObjectRetain();
          v32 = v31;
        }
        v33 = v32;
        type metadata accessor for HoverTextRootViewController();
        v34 = sub_21A7D0020();

        if ((v34 & 1) != 0)
        {
LABEL_19:
          swift_bridgeObjectRelease();
          v36 = *(_QWORD *)(v0 + 72);
          v35 = *(_QWORD *)(v0 + 80);
          v16 = &v29[qword_2550F6128];
          v37 = *(uint64_t **)&v29[qword_2550F6128];
          v18 = *(_QWORD *)&v29[qword_2550F6128 + 8];
          v23 = *v37;
          *(_QWORD *)(v0 + 16) = v37;
          sub_21A7B1D18(v35, v36, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
          swift_retain();
          goto LABEL_8;
        }
        if (v56 != 1)
          break;
LABEL_6:
        swift_bridgeObjectRelease();
LABEL_7:
        v15 = *(_QWORD **)(v0 + 72);
        v16 = &v29[qword_2550F6128];
        v17 = *(uint64_t **)&v29[qword_2550F6128];
        v18 = *(_QWORD *)&v29[qword_2550F6128 + 8];
        v55 = *v17;
        *(_QWORD *)(v0 + 16) = v17;
        *(_BYTE *)(v50 + 50) = 12;
        swift_retain();
        sub_21A7CF510();
        v19 = (_QWORD *)((char *)v15 + v2[8]);
        *v19 = 0;
        v19[1] = 0;
        v20 = (_OWORD *)((char *)v15 + v2[9]);
        *v20 = 0u;
        v20[1] = 0u;
        v21 = (char *)v15 + v2[10];
        *(_QWORD *)v21 = 0;
        v21[8] = 1;
        v22 = (_QWORD *)((char *)v15 + v2[11]);
        *v22 = 0;
        v22[1] = 0;
        *(_QWORD *)((char *)v15 + v2[12]) = 0;
        v23 = v55;
        *(_QWORD *)((char *)v15 + v2[13]) = 0;
        *v15 = 3;
        *(_QWORD *)(v49 + 32) = 0;
        *(_OWORD *)v49 = 0u;
        *(_OWORD *)(v49 + 16) = 0u;
        *(_WORD *)(v50 + 48) = 352;
LABEL_8:
        v24 = *(_QWORD *)(v0 + 72);
        v25 = *(unsigned __int8 *)(v0 + 96);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 280))(v24, v23, v18);
        sub_21A7B1BB8(v24, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
        swift_release();
        v26 = *((_QWORD *)v16 + 1);
        v27 = **(_QWORD **)v16;
        *(_QWORD *)(v0 + 24) = *(_QWORD *)v16;
        v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 336);
        swift_retain();
        v28(v25, v27, v26);

        swift_release();
        v11 = v54;
        if (v14 == v53)
          goto LABEL_43;
      }
      if (v52)
        break;
      v42 = *(id *)(v11 + 40);
      v43 = sub_21A7D0020();

      if ((v43 & 1) != 0)
        goto LABEL_19;
      if (v56 == 2)
        goto LABEL_6;
      v44 = 6;
      while (1)
      {
        v45 = v44 - 3;
        if (__OFADD__(v44 - 4, 1))
          break;
        v46 = *(id *)(v11 + 8 * v44);
        v47 = sub_21A7D0020();

        if ((v47 & 1) != 0)
          goto LABEL_19;
        ++v44;
        if (v45 == v56)
          goto LABEL_6;
      }
LABEL_41:
      __break(1u);
LABEL_42:
      v13 = sub_21A7D01C4();
      if (!v13)
        goto LABEL_43;
    }
    MEMORY[0x220748B70](1, v11);
    v38 = sub_21A7D0020();
    swift_unknownObjectRelease();
    if ((v38 & 1) != 0)
      goto LABEL_19;
    if (v56 != 2)
    {
      v39 = 2;
      while (1)
      {
        MEMORY[0x220748B70](v39, v11);
        v40 = v39 + 1;
        if (__OFADD__(v39, 1))
          goto LABEL_39;
        v41 = sub_21A7D0020();
        swift_unknownObjectRelease();
        if ((v41 & 1) != 0)
          goto LABEL_19;
        ++v39;
        if (v40 == v56)
          goto LABEL_6;
      }
    }
    goto LABEL_6;
  }
LABEL_43:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21A7B1BB8(*(_QWORD *)(v0 + 80), (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AFB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[4] = a4;
  v5[5] = a5;
  v5[3] = a1;
  sub_21A7CFF00();
  v5[6] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AFBD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = *(_QWORD *)(v1 + 72);
  if (v2)
  {
    v4 = *(uint64_t **)(v2 + qword_2550F6128);
    v3 = *(_QWORD *)(v2 + qword_2550F6128 + 8);
    v5 = *v4;
    *(_QWORD *)(v0 + 16) = v4;
    (*(void (**)(uint64_t, uint64_t))(v3 + 344))(*(_QWORD *)(v0 + 40) | ((HIDWORD(*(_QWORD *)(v0 + 40)) & 1) << 32), v5);
  }
  **(_BYTE **)(v0 + 24) = v2 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7AFC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AFCE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = &v7[qword_2550F6128];
      v10 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v11 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)v9;
      (*(void (**)(uint64_t))(v10 + 312))(v11);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7AFE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7AFEC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v10 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)&v7[qword_2550F6128];
      (*(void (**)(uint64_t, uint64_t))(v9 + 320))(1, v10);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7B0020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7B00AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v10 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)&v7[qword_2550F6128];
      (*(void (**)(_QWORD, uint64_t))(v9 + 320))(0, v10);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7B0204(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(double *)(v6 + 32) = a1;
  *(double *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 24) = a6;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(_QWORD *)(v6 + 48) = swift_task_alloc();
  sub_21A7CFF00();
  *(_QWORD *)(v6 + 56) = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7B0294()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  double v9;
  double v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      v9 = *(double *)(v0 + 32);
      v10 = *(double *)(v0 + 40);
      ++v6;
      v11 = &v7[qword_2550F6128];
      v12 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v13 = **(_QWORD **)&v7[qword_2550F6128];
      *(_QWORD *)(v0 + 16) = *(_QWORD *)v11;
      (*(void (**)(uint64_t, double, double))(v12 + 328))(v13, v9, v10);

    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7B03EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v5[5] = swift_task_alloc();
  sub_21A7CFF00();
  v5[6] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7B0478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  unint64_t v14;
  unint64_t v15;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_21A7AD688(v1);
  sub_21A7B1BB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21A7D01C4();
  v4 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    v14 = v3 & 0xC000000000000001;
    v15 = v3;
    do
    {
      if (v14)
        v7 = (char *)MEMORY[0x220748B70](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      v9 = *(_QWORD *)(v0 + 32);
      ++v6;
      v10 = *(uint64_t **)&v7[qword_2550F6128];
      v11 = *(_QWORD *)&v7[qword_2550F6128 + 8];
      v12 = *v10;
      *(_QWORD *)(v0 + 16) = v10;
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 264);
      swift_retain();
      v13(v9, v12, v11);
      swift_release();

      v3 = v15;
    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

id *HoverTextCoordinator.deinit()
{
  id *v0;

  sub_21A7B1978((uint64_t)(v0 + 5));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HoverTextCoordinator.__deallocating_deinit()
{
  HoverTextCoordinator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21A7B0678()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_21A7B069C()
{
  sub_21A7A6DA8();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_21A7B06BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21A7B0720;
  return v6(a1);
}

uint64_t sub_21A7B0720()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21A7B076C(char a1)
{
  return sub_21A7A9074(a1);
}

uint64_t sub_21A7B0778(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_21A7B33A0;
  return sub_21A7AC574(a1, v4, v5, v6, v8, v7);
}

uint64_t sub_21A7B07F8(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v4;

  return sub_21A7A96D4(a1, a2, a3, a4, v4);
}

uint64_t sub_21A7B0800()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD222D8, (uint64_t)&unk_2550F6980);
}

uint64_t sub_21A7B0828()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD222B0, (uint64_t)&unk_2550F6970);
}

uint64_t sub_21A7B0850()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD22288, (uint64_t)&unk_2550F6960);
}

uint64_t sub_21A7B0878(char a1)
{
  uint64_t v1;

  return sub_21A7A97E4(a1, v1);
}

uint64_t sub_21A7B0880()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD22238, (uint64_t)&unk_2550F6940);
}

uint64_t sub_21A7B08A8(void *a1)
{
  uint64_t v1;

  return sub_21A7A9E9C(a1, v1);
}

uint64_t sub_21A7B08B0(void *a1, char a2)
{
  uint64_t v2;

  return sub_21A7A9AE0(a1, a2, v2);
}

uint64_t sub_21A7B08B8(unint64_t a1)
{
  uint64_t v1;

  return sub_21A7A9BDC(a1 | ((HIDWORD(a1) & 1) << 32), v1);
}

uint64_t sub_21A7B08D4()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD22170, (uint64_t)&unk_2550F68E0);
}

uint64_t sub_21A7B08FC()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD22148, (uint64_t)&unk_2550F68D0);
}

uint64_t sub_21A7B0924()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD22120, (uint64_t)&unk_2550F68C0);
}

uint64_t sub_21A7B094C(double a1, double a2)
{
  uint64_t v2;

  return sub_21A7A9DAC(v2, a1, a2);
}

uint64_t sub_21A7B0954(uint64_t a1)
{
  uint64_t v1;

  return sub_21A7A94DC(a1, v1);
}

uint64_t sub_21A7B095C()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD220A8, (uint64_t)&unk_2550F6890);
}

uint64_t sub_21A7B0984(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21A7A95DC(a1, a2, v2);
}

uint64_t sub_21A7B098C()
{
  uint64_t v0;

  return sub_21A7A9CC8(v0, (uint64_t)&unk_24DD22008, (uint64_t)&unk_2550F6870);
}

uint64_t sub_21A7B09B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_21A7B33A0;
  return sub_21A7ACBEC(a1, v4, v5, v6, v8, v7);
}

void sub_21A7B0A38(id a1)
{

}

uint64_t sub_21A7B0A48(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21A7B33A0;
  return sub_21A7AB998(a1, v4, v5, v7, v6);
}

uint64_t sub_21A7B0AC0(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_21A7D0188();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_21A7B0B60(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_21A7CE224(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_21A7B0B60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7650);
    v2 = sub_21A7D01E8();
    v18 = v2;
    sub_21A7D017C();
    v3 = sub_21A7D01A0();
    if (v3)
    {
      v4 = v3;
      sub_21A7B19BC();
      do
      {
        swift_dynamicCast();
        type metadata accessor for HoverTextRootViewController();
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_21A7CDA64(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_21A7D0014();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_21A7D01A0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

void sub_21A7B0D88(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21A7D01C4();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x220748B7CLL);
}

uint64_t sub_21A7B0DF0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_21A7B0E58;
  return v5(v2 + 32);
}

uint64_t sub_21A7B0E58()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_21A7B0EA8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v2 = v4;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v5 += v8;
    swift_bridgeObjectRetain();
    *v2 = MEMORY[0x220748B7C](isUniquelyReferenced_nonNull_native, v5, 1, v4);
    swift_bridgeObjectRelease();
    v4 = *v2;
  }
  v11 = v4 + 32;
  v12 = (char *)(v4 + 32 + 8 * a1);
  swift_arrayDestroy();
  if (!v7)
    return sub_21A7CFEC4();
  v13 = *(_QWORD *)(*v2 + 16);
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_25;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)(v11 + 8 * a2);
    if (a1 != a2 || v12 >= &v16[8 * v15])
      memmove(v12, v16, 8 * v15);
    v17 = *(_QWORD *)(*v2 + 16);
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      *(_QWORD *)(*v2 + 16) = v18;
      return sub_21A7CFEC4();
    }
    goto LABEL_26;
  }
LABEL_27:
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t sub_21A7B1044(unint64_t a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v15;

  v15 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_21;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)MEMORY[0x220748B70](v5, a1);
LABEL_9:
        v7 = v6;
        v8 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_20;
        if (a2)
          v9 = objc_msgSend(a2, sel_windowDisplayId);
        else
          v9 = 0;
        v10 = objc_msgSend(v7, sel_viewIfLoaded);
        if (v10
          && (v11 = v10, v12 = objc_msgSend(v10, sel_window), v11, v12)
          && (v13 = HTDisplayIDForWindow(v12), v12, v9 == v13))
        {
          sub_21A7D0134();
          sub_21A7D0158();
          sub_21A7D0164();
          sub_21A7D0140();
        }
        else
        {

        }
        ++v5;
        if (v8 == v4)
          return v15;
      }
      if (v5 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      v4 = sub_21A7D01C4();
      if (!v4)
        return MEMORY[0x24BEE4AF8];
    }
    v6 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21A7B1200(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x220748B70](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2)
          return v5;
      }
      else if (*(_QWORD *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1))
        break;
      if (++v5 == v4)
        return 0;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    v4 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_21A7B12EC(unint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t i;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v5 = swift_bridgeObjectRetain();
  v6 = sub_21A7B1200(v5, a2);
  v8 = v7;
  swift_bridgeObjectRelease();
  if (v2)
    return v6;
  if ((v8 & 1) == 0)
  {
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_54;
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      v25 = sub_21A7D01C4();
      swift_bridgeObjectRelease();
      if (v9 != v25)
        goto LABEL_6;
    }
    else if (v9 != *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v6 + 5; ; ++i)
      {
        v11 = i - 4;
        v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
          break;
        if ((v11 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11 >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_45;
        if (*(_QWORD *)(v12 + 8 * i) != a2)
          goto LABEL_11;
LABEL_31:
        v9 = i - 3;
        if (__OFADD__(v11, 1))
          goto LABEL_46;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v21 = sub_21A7D01C4();
          swift_bridgeObjectRelease();
        }
        else
        {
          v21 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v21)
          return v6;
      }
      v22 = MEMORY[0x220748B70](i - 4);
      swift_unknownObjectRelease();
      if (v22 == a2)
        goto LABEL_31;
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1))
          goto LABEL_47;
        goto LABEL_31;
      }
      v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v13 = (id)MEMORY[0x220748B70](v6, *a1);
        v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000) != 0)
            goto LABEL_50;
          if (v11 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_51;
          v14 = *(id *)(v9 + 8 * i);
          goto LABEL_19;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0)
          goto LABEL_48;
        if (v6 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_49;
        v13 = *(id *)(v9 + 8 * v6 + 32);
        if ((v9 & 0xC000000000000001) == 0)
          goto LABEL_16;
      }
      v14 = (id)MEMORY[0x220748B70](i - 4, v9);
      v9 = *a1;
LABEL_19:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        sub_21A7B0D88(v9);
      }
      v16 = *(void **)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20);
      *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;

      sub_21A7CFEC4();
      v9 = *a1;
      v17 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v17 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
        sub_21A7B0D88(v9);
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_52;
      v18 = v9 & 0xFFFFFFFFFFFFFF8;
      if (v11 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_53;
      v19 = *(void **)(v18 + 8 * i);
      *(_QWORD *)(v18 + 8 * i) = v13;

      sub_21A7CFEC4();
      goto LABEL_30;
    }
    return v6;
  }
  v23 = *a1;
  if (!(v23 >> 62))
    return *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v26 = sub_21A7D01C4();
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_21A7B1604(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_21A7D01C4();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x220748B7C](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_21A7B19BC();
  swift_arrayDestroy();
  if (!v5)
    return sub_21A7CFEC4();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_21A7D01C4();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_21A7CFEC4();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_21A7D01C4();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t sub_21A7B1900(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21A7B33A0;
  return sub_21A7AC1A8(a1, v4, v5, v7, v6);
}

uint64_t sub_21A7B1978(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t type metadata accessor for HoverTextCoordinator()
{
  return objc_opt_self();
}

unint64_t sub_21A7B19BC()
{
  unint64_t result;

  result = qword_2550F6840;
  if (!qword_2550F6840)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2550F6840);
  }
  return result;
}

uint64_t sub_21A7B19F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B1A1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21A7B33A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2550F6848 + dword_2550F6848))(a1, v4);
}

unint64_t sub_21A7B1A8C()
{
  unint64_t result;

  result = qword_2550F6858;
  if (!qword_2550F6858)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BE4F858], MEMORY[0x24BE4F850]);
    atomic_store(result, (unint64_t *)&qword_2550F6858);
  }
  return result;
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21A7B1B08()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B1B10(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AE8DC(a1, v4, v5, v6);
}

uint64_t type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent()
{
  uint64_t result;

  result = qword_2550F6A18;
  if (!qword_2550F6A18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A7B1BB8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21A7B1BF4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A7B1C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7B1C5C()
{
  return swift_release();
}

uint64_t sub_21A7B1C64()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B1C98(uint64_t a1)
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
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_21A7B33A0;
  return sub_21A7AE618(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21A7B1D18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A7B1D5C()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B1D64(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AE080(a1, v4, v5, v6);
}

uint64_t sub_21A7B1DD0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_21A79C514(*(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B1E10(uint64_t a1)
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
  v6 = (uint64_t)(v1 + 4);
  v7 = v1[11];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21A7B33A0;
  return sub_21A7ADD70(a1, v4, v5, v6, v7);
}

uint64_t sub_21A7B1E8C()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B1E94(uint64_t a1)
{
  double *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  _QWORD *v9;

  v4 = *((_QWORD *)v1 + 2);
  v5 = *((_QWORD *)v1 + 3);
  v6 = *((_QWORD *)v1 + 4);
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_21A7B1F1C;
  return sub_21A7B0204(v7, v8, a1, v4, v5, v6);
}

uint64_t sub_21A7B1F1C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21A7B1F64()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B1F6C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7B0020(a1, v4, v5, v6);
}

uint64_t sub_21A7B1FD8()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B1FE0(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AFE3C(a1, v4, v5, v6);
}

uint64_t sub_21A7B204C()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B2054(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AFC5C(a1, v4, v5, v6);
}

uint64_t sub_21A7B20C0()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B20C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(unsigned int *)(v1 + 40) | ((unint64_t)*(unsigned __int8 *)(v1 + 44) << 32);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21A7B33A0;
  return sub_21A7AFB60(a1, v4, v5, v6, v7);
}

uint64_t sub_21A7B2154(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21A7B33A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2550F68F8 + dword_2550F68F8))(a1, v4);
}

uint64_t sub_21A7B21C4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B21F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_21A7B33A0;
  return sub_21A7AF4F4(a1, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21A7B22B0(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21A7B33A0;
  return sub_21A7B03EC(a1, v4, v5, v7, v6);
}

uint64_t sub_21A7B2328(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7B2370()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B2378(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AF314(a1, v4, v5, v6);
}

uint64_t sub_21A7B23E4()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B23EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21A7B33A0;
  return sub_21A7AF12C(a1, v4, v5, v6, v7);
}

uint64_t sub_21A7B2468()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B2470(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AEF4C(a1, v4, v5, v6);
}

uint64_t sub_21A7B24DC()
{
  return objectdestroy_40Tm();
}

uint64_t sub_21A7B24E4(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AED6C(a1, v4, v5, v6);
}

uint64_t sub_21A7B2550()
{
  return objectdestroy_40Tm();
}

uint64_t objectdestroy_40Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B2590(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B33A0;
  return sub_21A7AEB8C(a1, v4, v5, v6);
}

uint64_t sub_21A7B25FC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B2638(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v10 = *(_BYTE *)(v1 + 48);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_21A7B33A0;
  return sub_21A7AE330(a1, v4, v5, v6, v7, v10, v8, v9);
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B2704(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_21A7B1F1C;
  return sub_21A7AC574(a1, v4, v5, v6, v8, v7);
}

id *sub_21A7B2784(id *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  _OWORD *v27;
  __int128 v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void *v33;
  void (*v34)(id *, _QWORD, uint64_t, int *);
  id v35;
  uint64_t v37;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = (char *)*a2;
    *a1 = *a2;
    a1 = (id *)&v9[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    v7 = (int *)type metadata accessor for HoverTextPresentationEvent();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(id *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v37 = v8;
      v10 = (char *)*a2;
      v11 = (uint64_t)a2[1];
      v12 = (uint64_t)a2[2];
      v13 = a2[3];
      v14 = (uint64_t)a2[4];
      v15 = (uint64_t)a2[5];
      v16 = *((_BYTE *)a2 + 48);
      sub_21A79D438(*a2, v11, v12, v13, v14, v15, v16);
      *a1 = v10;
      a1[1] = (id)v11;
      a1[2] = (id)v12;
      a1[3] = v13;
      a1[4] = (id)v14;
      a1[5] = (id)v15;
      *((_BYTE *)a1 + 48) = v16;
      *(_WORD *)((char *)a1 + 49) = *(_WORD *)((char *)a2 + 49);
      v17 = v7[7];
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = sub_21A7CF57C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      v21 = v7[8];
      v22 = (id *)((char *)a1 + v21);
      v23 = (id *)((char *)a2 + v21);
      v24 = v23[1];
      *v22 = *v23;
      v22[1] = v24;
      v25 = v7[9];
      v26 = (_OWORD *)((char *)a1 + v25);
      v27 = (_OWORD *)((char *)a2 + v25);
      v28 = v27[1];
      *v26 = *v27;
      v26[1] = v28;
      v29 = v7[10];
      v30 = (char *)a1 + v29;
      v31 = (char *)a2 + v29;
      *(_QWORD *)v30 = *(_QWORD *)v31;
      v30[8] = v31[8];
      *(_OWORD *)((char *)a1 + v7[11]) = *(_OWORD *)((char *)a2 + v7[11]);
      *(id *)((char *)a1 + v7[12]) = *(id *)((char *)a2 + v7[12]);
      v32 = v7[13];
      v33 = *(id *)((char *)a2 + v32);
      *(id *)((char *)a1 + v32) = v33;
      v34 = *(void (**)(id *, _QWORD, uint64_t, int *))(v37 + 56);
      swift_bridgeObjectRetain();
      v35 = v33;
      v34(a1, 0, 1, v7);
    }
  }
  return a1;
}

void sub_21A7B293C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for HoverTextPresentationEvent();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2))
  {
    sub_21A79C4C4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    v3 = a1 + *(int *)(v2 + 28);
    v4 = sub_21A7CF57C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
    swift_bridgeObjectRelease();

  }
}

_QWORD *sub_21A7B29E8(_QWORD *a1, id *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  void (*v32)(_QWORD *, _QWORD, uint64_t, int *);
  id v33;
  uint64_t v35;

  v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(id *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v35 = v7;
    v8 = *a2;
    v9 = (uint64_t)a2[1];
    v10 = (uint64_t)a2[2];
    v11 = a2[3];
    v12 = (uint64_t)a2[4];
    v13 = (uint64_t)a2[5];
    v14 = *((_BYTE *)a2 + 48);
    sub_21A79D438(*a2, v9, v10, v11, v12, v13, v14);
    *a1 = v8;
    a1[1] = v9;
    a1[2] = v10;
    a1[3] = v11;
    a1[4] = v12;
    a1[5] = v13;
    *((_BYTE *)a1 + 48) = v14;
    *(_WORD *)((char *)a1 + 49) = *(_WORD *)((char *)a2 + 49);
    v15 = v6[7];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_21A7CF57C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = v6[8];
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (id *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v6[9];
    v24 = (_OWORD *)((char *)a1 + v23);
    v25 = (_OWORD *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = v6[10];
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    *(_QWORD *)v28 = *(_QWORD *)v29;
    v28[8] = v29[8];
    *(_OWORD *)((char *)a1 + v6[11]) = *(_OWORD *)((char *)a2 + v6[11]);
    *(_QWORD *)((char *)a1 + v6[12]) = *(id *)((char *)a2 + v6[12]);
    v30 = v6[13];
    v31 = *(id *)((char *)a2 + v30);
    *(_QWORD *)((char *)a1 + v30) = v31;
    v32 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v35 + 56);
    swift_bridgeObjectRetain();
    v33 = v31;
    v32(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_21A7B2B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, int *);
  int v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  void *v33;
  void (*v34)(uint64_t, _QWORD, uint64_t, int *);
  id v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;

  v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v37 = *(id *)a2;
      v38 = *(_QWORD *)(a2 + 8);
      v39 = *(_QWORD *)(a2 + 16);
      v40 = *(void **)(a2 + 24);
      v41 = *(_QWORD *)(a2 + 32);
      v42 = *(_QWORD *)(a2 + 40);
      v43 = *(_BYTE *)(a2 + 48);
      sub_21A79D438(*(id *)a2, v38, v39, v40, v41, v42, v43);
      v44 = *(void **)a1;
      v45 = *(_QWORD *)(a1 + 8);
      v46 = *(_QWORD *)(a1 + 16);
      v47 = *(void **)(a1 + 24);
      v48 = *(_QWORD *)(a1 + 32);
      v49 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)a1 = v37;
      *(_QWORD *)(a1 + 8) = v38;
      *(_QWORD *)(a1 + 16) = v39;
      *(_QWORD *)(a1 + 24) = v40;
      *(_QWORD *)(a1 + 32) = v41;
      *(_QWORD *)(a1 + 40) = v42;
      v50 = *(unsigned __int8 *)(a1 + 48);
      *(_BYTE *)(a1 + 48) = v43;
      sub_21A79C4C4(v44, v45, v46, v47, v48, v49, v50);
      *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
      *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
      v51 = v6[7];
      v52 = a1 + v51;
      v53 = a2 + v51;
      v54 = sub_21A7CF57C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 24))(v52, v53, v54);
      v55 = v6[8];
      v56 = (_QWORD *)(a1 + v55);
      v57 = (_QWORD *)(a2 + v55);
      *v56 = *v57;
      v56[1] = v57[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v58 = v6[9];
      v59 = (_QWORD *)(a1 + v58);
      v60 = (_QWORD *)(a2 + v58);
      *v59 = *v60;
      v59[1] = v60[1];
      v59[2] = v60[2];
      v59[3] = v60[3];
      v61 = v6[10];
      v62 = a1 + v61;
      v63 = (uint64_t *)(a2 + v61);
      v64 = *v63;
      *(_BYTE *)(v62 + 8) = *((_BYTE *)v63 + 8);
      *(_QWORD *)v62 = v64;
      v65 = v6[11];
      v66 = (_QWORD *)(a1 + v65);
      v67 = (_QWORD *)(a2 + v65);
      *v66 = *v67;
      v66[1] = v67[1];
      *(_QWORD *)(a1 + v6[12]) = *(_QWORD *)(a2 + v6[12]);
      v68 = v6[13];
      v69 = *(void **)(a1 + v68);
      v70 = *(void **)(a2 + v68);
      *(_QWORD *)(a1 + v68) = v70;
      v71 = v70;

      return a1;
    }
    sub_21A7B1BB8(a1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = *(id *)a2;
  v12 = *(_QWORD *)(a2 + 8);
  v13 = *(void **)(a2 + 24);
  v72 = *(_QWORD *)(a2 + 16);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = *(_QWORD *)(a2 + 40);
  v16 = *(_BYTE *)(a2 + 48);
  sub_21A79D438(*(id *)a2, v12, v72, v13, v14, v15, v16);
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + 8) = v12;
  *(_QWORD *)(a1 + 16) = v72;
  *(_QWORD *)(a1 + 24) = v13;
  *(_QWORD *)(a1 + 32) = v14;
  *(_QWORD *)(a1 + 40) = v15;
  *(_BYTE *)(a1 + 48) = v16;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  v17 = v6[7];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = v6[8];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  v24 = v6[9];
  v25 = (_OWORD *)(a1 + v24);
  v26 = (_OWORD *)(a2 + v24);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = v6[10];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = *(_BYTE *)(v30 + 8);
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_BYTE *)(v29 + 8) = v31;
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(_QWORD *)(a1 + v6[12]) = *(_QWORD *)(a2 + v6[12]);
  v32 = v6[13];
  v33 = *(void **)(a2 + v32);
  *(_QWORD *)(a1 + v32) = v33;
  v34 = *(void (**)(uint64_t, _QWORD, uint64_t, int *))(v7 + 56);
  swift_bridgeObjectRetain();
  v35 = v33;
  v34(a1, 0, 1, v6);
  return a1;
}

_OWORD *sub_21A7B2E90(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;

  v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
    *(_WORD *)((char *)a1 + 49) = *(_WORD *)((char *)a2 + 49);
    v9 = v6[7];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_21A7CF57C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
    v13 = v6[9];
    v14 = (_OWORD *)((char *)a1 + v13);
    v15 = (_OWORD *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = v6[10];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    *(_OWORD *)((char *)a1 + v6[11]) = *(_OWORD *)((char *)a2 + v6[11]);
    *(_QWORD *)((char *)a1 + v6[12]) = *(_QWORD *)((char *)a2 + v6[12]);
    *(_QWORD *)((char *)a1 + v6[13]) = *(_QWORD *)((char *)a2 + v6[13]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_21A7B2FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, int *);
  int v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _OWORD *v43;
  _OWORD *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;

  v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v24 = *(_BYTE *)(a2 + 48);
      v25 = *(void **)a1;
      v26 = *(_QWORD *)(a1 + 8);
      v27 = *(_QWORD *)(a1 + 16);
      v28 = *(void **)(a1 + 24);
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(_QWORD *)(a1 + 40);
      v31 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v31;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      v32 = *(unsigned __int8 *)(a1 + 48);
      *(_BYTE *)(a1 + 48) = v24;
      sub_21A79C4C4(v25, v26, v27, v28, v29, v30, v32);
      *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
      *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
      v33 = v6[7];
      v34 = a1 + v33;
      v35 = a2 + v33;
      v36 = sub_21A7CF57C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 40))(v34, v35, v36);
      v37 = v6[8];
      v38 = (_QWORD *)(a1 + v37);
      v39 = (uint64_t *)(a2 + v37);
      v41 = *v39;
      v40 = v39[1];
      *v38 = v41;
      v38[1] = v40;
      swift_bridgeObjectRelease();
      v42 = v6[9];
      v43 = (_OWORD *)(a1 + v42);
      v44 = (_OWORD *)(a2 + v42);
      v45 = v44[1];
      *v43 = *v44;
      v43[1] = v45;
      v46 = v6[10];
      v47 = a1 + v46;
      v48 = a2 + v46;
      *(_BYTE *)(v47 + 8) = *(_BYTE *)(v48 + 8);
      *(_QWORD *)v47 = *(_QWORD *)v48;
      *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
      *(_QWORD *)(a1 + v6[12]) = *(_QWORD *)(a2 + v6[12]);
      v49 = v6[13];
      v50 = *(void **)(a1 + v49);
      *(_QWORD *)(a1 + v49) = *(_QWORD *)(a2 + v49);

      return a1;
    }
    sub_21A7B1BB8(a1, (uint64_t (*)(_QWORD))type metadata accessor for HoverTextPresentationEvent);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  v12 = v6[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  v16 = v6[9];
  v17 = (_OWORD *)(a1 + v16);
  v18 = (_OWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = v6[10];
  v21 = a1 + v20;
  v22 = a2 + v20;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(_QWORD *)(a1 + v6[12]) = *(_QWORD *)(a2 + v6[12]);
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_21A7B3220()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A7B322C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for HoverTextPresentationEvent();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_21A7B3278()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A7B3284(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for HoverTextPresentationEvent();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_21A7B32D4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HoverTextPresentationEvent();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_21A7B330C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HoverTextPresentationEvent();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_21A7B334C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for HoverTextPresentationEvent();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t initializeWithCopy for HoverTextHUDView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for HoverTextHUDView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for HoverTextHUDView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextHUDView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HoverTextHUDView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HoverTextHUDView()
{
  return &type metadata for HoverTextHUDView;
}

uint64_t sub_21A7B3524()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A7B3534@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v4 = *(_QWORD *)(v3 + 104);
  *a2 = *(_QWORD *)(v3 + 96);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21A7B35C4()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  swift_bridgeObjectRetain();
  sub_21A7CF6C0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A7B3680@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 136);
  return swift_retain();
}

uint64_t sub_21A7B3710()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  swift_retain();
  sub_21A7CF6C0();
  swift_release();
  return swift_release();
}

uint64_t sub_21A7B37C8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + 152);
  return result;
}

uint64_t sub_21A7B3854()
{
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7B38F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  v5 = sub_21A7CF57C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A7B39BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v4 = sub_21A7CF57C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2;
  swift_getKeyPath();
  v11 = v8;
  v12 = v7;
  v13 = v8;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6C0();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_21A7B3AC8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  *a2 = v4;
  return v4;
}

void sub_21A7B3B5C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  v2 = v1;
  sub_21A7CF6C0();
  swift_release();

}

double sub_21A7B3C10@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>)
{
  int *v22;
  uint64_t *v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  double result;
  __int128 v28;
  uint64_t v29;

  *(_QWORD *)a8 = 0x4028000000000000;
  v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2550F6AB0);
  v23 = (uint64_t *)(a8 + v22[16]);
  *v23 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5608);
  swift_storeEnumTagMultiPayload();
  v24 = a8 + v22[17];
  type metadata accessor for CGSize(0);
  sub_21A7CFC00();
  *(_OWORD *)v24 = v28;
  *(_QWORD *)(v24 + 16) = v29;
  v25 = (_OWORD *)(a8 + v22[18]);
  sub_21A7CFC00();
  *v25 = v28;
  v26 = v22[19];
  sub_21A7CFC00();
  result = *(double *)&v28;
  *(_OWORD *)(a8 + v26) = v28;
  *(double *)(a8 + 8) = a9;
  *(double *)(a8 + 16) = a10;
  *(double *)(a8 + 24) = a11;
  *(_QWORD *)(a8 + 72) = a6;
  *(_QWORD *)(a8 + 80) = a7;
  *(_QWORD *)(a8 + 32) = a1;
  *(_QWORD *)(a8 + 40) = a2;
  *(_QWORD *)(a8 + 48) = a3;
  *(_QWORD *)(a8 + 56) = a4;
  *(_QWORD *)(a8 + 64) = a5;
  return result;
}

uint64_t sub_21A7B3D78@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  const __CTFont *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  _OWORD v21[3];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A30);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A38);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A7B3FAC(a1, (uint64_t)v12, a3, a4, a5);
  swift_getKeyPath();
  *(_QWORD *)&v21[0] = a1;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v16 = (const __CTFont *)*(id *)((char *)a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  CTFontGetAscent(v16);
  CTFontGetDescent(v16);
  CTFontGetLeading(v16);

  sub_21A7CFCA8();
  sub_21A7CF840();
  sub_21A795080((uint64_t)v12, (uint64_t)v15, &qword_2550F6A30);
  v17 = &v15[*(int *)(v13 + 36)];
  v18 = v21[1];
  *(_OWORD *)v17 = v21[0];
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = v21[2];
  sub_21A7950C4((uint64_t)v12, &qword_2550F6A30);
  sub_21A795080((uint64_t)v15, a2, &qword_2550F6A38);
  v19 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A40) + 36);
  *(_OWORD *)v19 = xmmword_21A7D2570;
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = &off_24DD20FB0;
  swift_retain();
  return sub_21A7950C4((uint64_t)v15, &qword_2550F6A38);
}

uint64_t sub_21A7B3FAC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  char *v34;
  __int128 v35;
  double v36;
  double v37;
  id v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGRect v63;
  CGRect v64;

  v59 = a2;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A48);
  MEMORY[0x24BDAC7A8](v57);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A50);
  MEMORY[0x24BDAC7A8](v58);
  v52 = (uint64_t)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A58);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A60);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A30);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v56 = (uint64_t)&v51 - v22;
  *(_QWORD *)v14 = sub_21A7CF96C();
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 1;
  v23 = (uint64_t)&v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A68) + 44)];
  v55 = a5;
  sub_21A7B44B4(a1, v23, a3, a4, a5);
  sub_21A7B50D0((uint64_t)a1);
  sub_21A7B5410((uint64_t)a1);
  v24 = (void *)objc_opt_self();
  v25 = objc_msgSend(v24, sel_mainScreen);
  objc_msgSend(v25, sel_bounds);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v63.origin.x = v27;
  v63.origin.y = v29;
  v63.size.width = v31;
  v63.size.height = v33;
  CGRectGetWidth(v63);
  sub_21A7CFCA8();
  sub_21A7CF840();
  sub_21A795080((uint64_t)v14, (uint64_t)v17, &qword_2550F6A58);
  v34 = &v17[*(int *)(v15 + 36)];
  v35 = v61;
  *(_OWORD *)v34 = v60;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v62;
  sub_21A7950C4((uint64_t)v14, &qword_2550F6A58);
  v53 = a3;
  v54 = a4;
  sub_21A7B50D0((uint64_t)a1);
  v37 = v36;
  v38 = objc_msgSend(v24, sel_mainScreen);
  objc_msgSend(v38, sel_bounds);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v64.origin.x = v40;
  v64.origin.y = v42;
  v64.size.width = v44;
  v64.size.height = v46;
  if (CGRectGetWidth(v64) * 0.1 >= v37 || (sub_21A7B50D0((uint64_t)a1), v47 >= sub_21A7B5410((uint64_t)a1)))
  {
    sub_21A795080((uint64_t)v17, (uint64_t)v10, &qword_2550F6A60);
    swift_storeEnumTagMultiPayload();
    sub_21A7951D8(&qword_2550F6A70, &qword_2550F6A50, sub_21A7B559C, MEMORY[0x24BDEDB80]);
    sub_21A7B559C();
    sub_21A7CF9F0();
  }
  else
  {
    v48 = v52;
    sub_21A795080((uint64_t)v17, v52, &qword_2550F6A60);
    *(_WORD *)(v48 + *(int *)(v58 + 36)) = 1;
    sub_21A795080(v48, (uint64_t)v10, &qword_2550F6A50);
    swift_storeEnumTagMultiPayload();
    sub_21A7951D8(&qword_2550F6A70, &qword_2550F6A50, sub_21A7B559C, MEMORY[0x24BDEDB80]);
    sub_21A7B559C();
    sub_21A7CF9F0();
    sub_21A7950C4(v48, &qword_2550F6A50);
  }
  v49 = v56;
  sub_21A795014((uint64_t)v21, v56, &qword_2550F6A30);
  sub_21A7950C4((uint64_t)v17, &qword_2550F6A60);
  return sub_21A795014(v49, v59, &qword_2550F6A30);
}

uint64_t sub_21A7B44B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
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
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CTFont *v57;
  uint64_t v58;
  _OWORD *v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  id v71;
  uint64_t v72;
  char v73;
  char v74;
  _QWORD *v75;
  uint64_t v76;
  unsigned __int8 v77;
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
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;

  v109 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A88);
  MEMORY[0x24BDAC7A8](v9);
  v99 = (uint64_t *)((char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A90);
  v106 = *(_QWORD *)(v107 - 8);
  v11 = MEMORY[0x24BDAC7A8](v107);
  v98 = (uint64_t)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v97 = (uint64_t)&v94 - v13;
  v14 = sub_21A7CF540();
  v103 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v94 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v94 - v18;
  v20 = sub_21A7CF504();
  v101 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_21A7CF57C();
  v100 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v94 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6A98);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v108 = (uint64_t)&v94 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v110 = (uint64_t)&v94 - v29;
  swift_getKeyPath();
  v30 = (uint64_t)a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  *(_QWORD *)&v113 = a1;
  v102 = sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  v104 = v30;
  sub_21A7CF6CC();
  swift_release();
  v105 = a1;
  v31 = (uint64_t)a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  v32 = v100;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
  v96 = v31;
  v95 = v33;
  v33(v25, v31, v23);
  sub_21A7CF4C8();
  sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
  sub_21A7CFF30();
  sub_21A7CFF3C();
  sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
  LOBYTE(v31) = sub_21A7CFDD4();
  v34 = *(void (**)(char *, uint64_t))(v103 + 8);
  v34(v17, v14);
  v34(v19, v14);
  (*(void (**)(char *, uint64_t))(v101 + 8))(v22, v20);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v23);
  if ((v31 & 1) != 0)
  {
    v35 = 1;
    v36 = v110;
    v37 = v105;
    v38 = v107;
  }
  else
  {
    swift_getKeyPath();
    v37 = v105;
    *(_QWORD *)&v113 = v105;
    sub_21A7CF6CC();
    swift_release();
    v95(v25, v96, v23);
    v101 = sub_21A7CFABC();
    v40 = v39;
    LODWORD(v100) = v41;
    v103 = v42;
    swift_getKeyPath();
    *(_QWORD *)&v113 = v37;
    sub_21A7CF6CC();
    swift_release();
    v43 = v37[19];
    v44 = 1.0;
    v45 = 1.0;
    if (v43 <= 4)
      v45 = dbl_21A7D2720[v43];
    swift_getKeyPath();
    *(_QWORD *)&v113 = v37;
    sub_21A7CF6CC();
    swift_release();
    v46 = OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont;
    objc_msgSend(*(id *)((char *)v37 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont), sel_pointSize);
    v48 = v47;
    swift_getKeyPath();
    *(_QWORD *)&v113 = v37;
    sub_21A7CF6CC();
    swift_release();
    v49 = v37[19];
    if (v49 <= 4)
      v44 = dbl_21A7D2720[v49];
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = v37;
    *(double *)(v50 + 24) = a3;
    *(double *)(v50 + 32) = a4;
    *(double *)(v50 + 40) = a5;
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v37;
    *(double *)(v51 + 24) = a3;
    *(double *)(v51 + 32) = a4;
    *(double *)(v51 + 40) = a5;
    swift_retain_n();
    v52 = sub_21A7CF9A8();
    v53 = sub_21A7CF9A8();
    v54 = (uint64_t)v99;
    *v99 = v53;
    *(_QWORD *)(v54 + 8) = 0;
    *(_BYTE *)(v54 + 16) = 1;
    v55 = v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F6AA0) + 44);
    v56 = swift_allocObject();
    *(_QWORD *)(v56 + 16) = v101;
    *(_QWORD *)(v56 + 24) = v40;
    *(_BYTE *)(v56 + 32) = v100 & 1;
    *(_QWORD *)(v56 + 40) = v103;
    sub_21A7B3C10(v52, (uint64_t)sub_21A7B56A8, v50, (uint64_t)sub_21A7B56B8, v51, (uint64_t)sub_21A7B56F8, v56, v55, 2.0 / v45, v48 * 2.8125, v44);
    swift_getKeyPath();
    *(_QWORD *)&v113 = v37;
    sub_21A7CF6CC();
    swift_release();
    v57 = (const __CTFont *)*(id *)((char *)v37 + v46);
    CTFontGetAscent(v57);
    CTFontGetDescent(v57);
    CTFontGetLeading(v57);

    sub_21A7CFCA8();
    sub_21A7CF840();
    v58 = v98;
    sub_21A795080(v54, v98, &qword_2550F6A88);
    v38 = v107;
    v59 = (_OWORD *)(v58 + *(int *)(v107 + 36));
    v60 = v114;
    *v59 = v113;
    v59[1] = v60;
    v59[2] = v115;
    sub_21A7950C4(v54, &qword_2550F6A88);
    v61 = v58;
    v62 = v97;
    sub_21A795014(v61, v97, &qword_2550F6A90);
    v63 = v62;
    v36 = v110;
    sub_21A795014(v63, v110, &qword_2550F6A90);
    v35 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56))(v36, v35, 1, v38);
  swift_getKeyPath();
  v111 = v37;
  sub_21A7CF6CC();
  swift_release();
  v64 = v37[13];
  if (v64)
  {
    v111 = (_QWORD *)v37[12];
    v112 = v64;
    sub_21A796C40();
    swift_bridgeObjectRetain();
    v65 = sub_21A7CFAC8();
    v66 = v37;
    v68 = v67;
    v70 = v69 & 1;
    swift_getKeyPath();
    v111 = v66;
    sub_21A7CF6CC();
    swift_release();
    v71 = *(id *)((char *)v66 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
    sub_21A7CFA68();
    v107 = sub_21A7CFA74();
    v106 = v72;
    v74 = v73;
    v105 = v75;
    swift_release();
    v76 = v74 & 1;
    sub_21A792428(v65, v68, v70);
    swift_bridgeObjectRelease();
    v77 = sub_21A7CFA5C();
    sub_21A7CF7BC();
    v79 = v78;
    v81 = v80;
    v104 = v82;
    v103 = v83;
    v84 = v77;
  }
  else
  {
    v107 = 0;
    v106 = 0;
    v76 = 0;
    v105 = 0;
    v84 = 0;
    v79 = 0;
    v81 = 0;
    v104 = 0;
    v103 = 0;
  }
  v85 = v108;
  sub_21A795080(v110, v108, &qword_2550F6A98);
  v86 = v109;
  sub_21A795080(v85, v109, &qword_2550F6A98);
  v87 = v86 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F6AA8) + 48);
  v88 = v107;
  v89 = v106;
  *(_QWORD *)v87 = v107;
  *(_QWORD *)(v87 + 8) = v89;
  *(_QWORD *)(v87 + 16) = v76;
  v90 = v76;
  v91 = (uint64_t)v105;
  *(_QWORD *)(v87 + 24) = v105;
  *(_QWORD *)(v87 + 32) = v84;
  *(_QWORD *)(v87 + 40) = v79;
  *(_QWORD *)(v87 + 48) = v81;
  v92 = v103;
  *(_QWORD *)(v87 + 56) = v104;
  *(_QWORD *)(v87 + 64) = v92;
  *(_BYTE *)(v87 + 72) = 0;
  sub_21A7B5710(v88, v89, v90, v91);
  sub_21A7950C4(v110, &qword_2550F6A98);
  sub_21A7B5740(v88, v89, v90, v91);
  return sub_21A7950C4(v85, &qword_2550F6A98);
}

uint64_t sub_21A7B4EF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v2 = sub_21A7CF66C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v11[1] = a1;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  v7 = *(_QWORD *)(a1 + 136);
  if (v7)
  {
    v8 = *(void **)(v7 + 16);
    if (v8)
    {
      swift_retain();
      if ((objc_msgSend(v8, sel_isValid) & 1) == 0)
        return swift_release();
    }
    else
    {
      swift_retain();
    }
    sub_21A7CF660();
    sub_21A791C2C();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(_QWORD *)(v7 + 40) = v10;
    objc_msgSend(*(id *)(v7 + 16), sel_invalidate);
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7B5034(uint64_t a1)
{
  uint64_t result;

  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  result = swift_release();
  if (*(_QWORD *)(a1 + 136))
  {
    swift_retain();
    sub_21A791B1C();
    return swift_release();
  }
  return result;
}

void sub_21A7B50D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t inited;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v18 = a1;
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v6 = a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_getKeyPath();
  v17 = a1;
  sub_21A7CF6CC();
  swift_release();
  v7 = OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont;
  v8 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  sub_21A792278(v8);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  v17 = a1;
  sub_21A7CF6CC();
  swift_release();
  if (*(_QWORD *)(a1 + 104))
  {
    swift_getKeyPath();
    v17 = a1;
    sub_21A7CF6CC();
    swift_release();
    if (*(_QWORD *)(a1 + 104))
    {
      swift_getKeyPath();
      v17 = a1;
      swift_bridgeObjectRetain();
      sub_21A7CF6CC();
      swift_release();
      v9 = *(id *)(a1 + v7);
      v10 = (void *)sub_21A7CFDE0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2550F66E0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21A7D2340;
      v12 = (void *)*MEMORY[0x24BEBB360];
      *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
      *(_QWORD *)(inited + 64) = sub_21A7B5624();
      *(_QWORD *)(inited + 40) = v9;
      v13 = v9;
      v14 = v12;
      sub_21A7A54F8(inited);
      type metadata accessor for Key(0);
      sub_21A791288(&qword_2550F5DB0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21A7D1558);
      v15 = (void *)sub_21A7CFDA4();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_sizeWithAttributes_, v15);
      swift_bridgeObjectRelease();

    }
    else
    {
      __break(1u);
    }
  }
}

double sub_21A7B5410(uint64_t a1)
{
  id v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  uint64_t v12;
  double v13;
  CGRect v15;

  v2 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v2, sel_bounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  Width = CGRectGetWidth(v15);
  swift_getKeyPath();
  sub_21A791288(&qword_2550F5DA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTextStore, (uint64_t)&unk_21A7D152C);
  sub_21A7CF6CC();
  swift_release();
  v12 = OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode;
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode)
    && (swift_getKeyPath(), sub_21A7CF6CC(), swift_release(), *(_QWORD *)(a1 + v12) != 1))
  {
    v13 = 0.8;
  }
  else
  {
    v13 = 0.95;
  }
  return Width * v13;
}

uint64_t sub_21A7B556C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21A7B3D78(*(_QWORD **)v1, a1, *(double *)(v1 + 8), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

void sub_21A7B5584()
{
  uint64_t v0;

  sub_21A78C41C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_21A7B559C()
{
  return sub_21A7951D8(&qword_2550F6A78, &qword_2550F6A60, (uint64_t (*)(void))sub_21A7B55C0, MEMORY[0x24BDEBEE0]);
}

unint64_t sub_21A7B55C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550F6A80;
  if (!qword_2550F6A80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6A58);
    result = MEMORY[0x220749464](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2550F6A80);
  }
  return result;
}

unint64_t sub_21A7B5624()
{
  unint64_t result;

  result = qword_2550F66E8[0];
  if (!qword_2550F66E8[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_2550F66E8);
  }
  return result;
}

uint64_t sub_21A7B5660()
{
  uint64_t *v0;

  return sub_21A78AFEC(v0[2], v0[3], v0[4]);
}

uint64_t sub_21A7B5684()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7B56A8()
{
  uint64_t v0;

  return sub_21A7B4EF4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21A7B56B8()
{
  uint64_t v0;

  return sub_21A7B5034(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21A7B56C8()
{
  uint64_t v0;

  sub_21A792428(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21A7B56F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21A7A12E0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_21A7B5710(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21A7A4658(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_21A7B5740(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21A792428(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21A7B5780()
{
  uint64_t v0;

  return sub_21A78B548(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21A7B5798()
{
  uint64_t v0;

  return sub_21A78B84C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_21A7B57B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F6AB8;
  if (!qword_2550F6AB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6A40);
    v2[0] = sub_21A7951D8(&qword_2550F6AC0, &qword_2550F6A38, (uint64_t (*)(void))sub_21A7B5840, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_21A7B58CC();
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F6AB8);
  }
  return result;
}

unint64_t sub_21A7B5840()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F6AC8;
  if (!qword_2550F6AC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F6A30);
    v2[0] = sub_21A7951D8(&qword_2550F6A70, &qword_2550F6A50, sub_21A7B559C, MEMORY[0x24BDEDB80]);
    v2[1] = sub_21A7B559C();
    result = MEMORY[0x220749464](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F6AC8);
  }
  return result;
}

unint64_t sub_21A7B58CC()
{
  unint64_t result;

  result = qword_2550F6AD0;
  if (!qword_2550F6AD0)
  {
    result = MEMORY[0x220749464](&unk_21A7D2FA4, &type metadata for HUDStyle);
    atomic_store(result, (unint64_t *)&qword_2550F6AD0);
  }
  return result;
}

uint64_t sub_21A7B5914(uint64_t a1)
{
  int64_t v2;
  uint64_t result;
  int *v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21A7B9008(0, v2, 0);
    result = v9;
    v4 = (int *)(a1 + 32);
    do
    {
      v6 = *v4++;
      v5 = v6;
      v10 = result;
      v8 = *(_QWORD *)(result + 16);
      v7 = *(_QWORD *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_21A7B9008(v7 > 1, v8 + 1, 1);
        result = v10;
      }
      *(_QWORD *)(result + 16) = v8 + 1;
      *(_DWORD *)(result + 4 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

id AXRuntimeClient.__allocating_init(logger:subscribeToNotifications:runloop:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)(a1, a2, a3);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AXRuntimeClient.enableAccessibility()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v2 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled) == 1)
  {
    v3 = sub_21A7CF744();
    v4 = sub_21A7CFF90();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21A787000, v3, v4, "Accessibility already enabled", v5, 2u);
      MEMORY[0x22074950C](v5, -1, -1);
    }

  }
  else
  {
    sub_21A7B656C();
    if (!v1)
      *(_BYTE *)(v0 + v2) = 1;
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AXRuntimeClient.disableAccessibility()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint8_t *v7;
  void *v8;
  uint8_t *v9;

  v1 = v0;
  v2 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled;
  v3 = *(_BYTE *)(v0 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled);
  v4 = sub_21A7CF744();
  v5 = sub_21A7CFF90();
  v6 = os_log_type_enabled(v4, v5);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A787000, v4, v5, "Unregistering for ax runtime notifications and removing observer", v7, 2u);
      MEMORY[0x22074950C](v7, -1, -1);
    }

    v8 = *(void **)(v1 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver) = 0;

    sub_21A7B6770(0);
  }
  else
  {
    if (v6)
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21A787000, v4, v5, "Accessibility already disabled", v9, 2u);
      MEMORY[0x22074950C](v9, -1, -1);
    }

  }
  *(_BYTE *)(v1 + v2) = 0;
}

void AXRuntimeClientError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_21A7B5C54()
{
  sub_21A7D00F8();
  sub_21A7CFE40();
  type metadata accessor for AXError(0);
  sub_21A7D0170();
  return 0;
}

void sub_21A7B5E28()
{
  uint64_t v0;

  AXRuntimeClientError.errorDescription.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t FocusChangeInfo.label.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 FocusChangeInfo.frame.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __n128 result;
  __int128 v4;

  v2 = *(_BYTE *)(v1 + 48);
  result = *(__n128 *)(v1 + 16);
  v4 = *(_OWORD *)(v1 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v2;
  return result;
}

id AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  objc_class *ObjectType;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  objc_super v24;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange];
  *v8 = 0;
  v8[1] = 0;
  v9 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
  *v9 = 0;
  v9[1] = 0;
  v10 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated];
  *v10 = 0;
  v10[1] = 0;
  v11 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange];
  *v11 = 0;
  v11[1] = 0;
  v12 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement];
  *v12 = 0;
  v12[1] = 0;
  v13 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide];
  *v13 = 0;
  v13[1] = 0;
  v14 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange];
  *v14 = 0;
  v14[1] = 0;
  v15 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame];
  *v15 = 0;
  v15[1] = 0;
  v16 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged];
  *v16 = 0;
  v16[1] = 0;
  v17 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode];
  *v17 = 0;
  v17[1] = 0;
  v18 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification];
  *v18 = 0;
  v18[1] = 0;
  v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver] = 0;
  v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred] = 0;
  v19 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_logger];
  v20 = sub_21A7CF750();
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v19, a1, v20);
  *(_QWORD *)&v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_subscribeToNotifications] = a2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_runloop] = a3;
  v24.receiver = v3;
  v24.super_class = ObjectType;
  v22 = objc_msgSendSuper2(&v24, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a1, v20);
  return v22;
}

uint64_t AXRuntimeClient.nativeFocusItemDidChange.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange, (void (*)(_QWORD, _QWORD))sub_21A79581C);
}

uint64_t AXRuntimeClient.nativeFocusItemDidChange.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange, (uint64_t (*)(uint64_t, uint64_t))sub_21A795888);
}

uint64_t (*AXRuntimeClient.nativeFocusItemDidChange.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.valueChanged.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.valueChanged.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.valueChanged.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t AXRuntimeClient.elementVisualsUpdated.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.elementVisualsUpdated.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.elementVisualsUpdated.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.focusedApplicationsDidChange.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.focusedApplicationsDidChange.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.focusedApplicationsDidChange.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.didReceiveAnnouncement.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.didReceiveAnnouncement.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.didReceiveAnnouncement.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.keyboardWillHide.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.keyboardWillHide.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.keyboardWillHide.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.currentInputModeDidChange.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.currentInputModeDidChange.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.currentInputModeDidChange.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.keyboardWillChangeFrame.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.keyboardWillChangeFrame.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.keyboardWillChangeFrame.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.loupeStateChanged.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged, (void (*)(_QWORD, _QWORD))sub_21A79581C);
}

uint64_t AXRuntimeClient.loupeStateChanged.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged, (uint64_t (*)(uint64_t, uint64_t))sub_21A795888);
}

uint64_t (*AXRuntimeClient.loupeStateChanged.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.updateTypingDisplayMode.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t AXRuntimeClient.updateTypingDisplayMode.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t (*AXRuntimeClient.updateTypingDisplayMode.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.didReceiveNotification.getter()
{
  return sub_21A7B6458(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification, (void (*)(_QWORD, _QWORD))sub_21A7B9360);
}

uint64_t sub_21A7B6458(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t AXRuntimeClient.didReceiveNotification.setter(uint64_t a1, uint64_t a2)
{
  return sub_21A7B64CC(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification, (uint64_t (*)(uint64_t, uint64_t))sub_21A7B9364);
}

uint64_t sub_21A7B64CC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*AXRuntimeClient.didReceiveNotification.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_21A7B656C()
{
  void *v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;

  sub_21A7B6770(1);
  if (!v1)
  {
    v2 = v0;
    AXUIElementRegisterSystemWideServerDeathCallback();
    v3 = objc_msgSend((id)objc_opt_self(), sel_systemWideElement);
    if (v3)
    {
      v4 = v3;
      v5 = sub_21A7CF744();
      v6 = sub_21A7CFF6C();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21A787000, v5, v6, "Registering for ax runtime notifications and creating observer", v7, 2u);
        MEMORY[0x22074950C](v7, -1, -1);
      }

      v8 = *(id *)&v2[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_runloop];
      v9 = swift_bridgeObjectRetain();
      v10 = sub_21A7B5914(v9);
      swift_bridgeObjectRelease();
      v11 = sub_21A7B6C94(v10);
      swift_bridgeObjectRelease();
      v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v13 = objc_allocWithZone((Class)AXObserverWrapper);
      v14 = sub_21A7B8D34(v4, v8, v11, (uint64_t)sub_21A7B8F44, v12);
      v15 = *(void **)&v2[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver];
      *(_QWORD *)&v2[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver] = v14;

    }
    else
    {
      sub_21A7B84B4();
      swift_allocError();
      *(_QWORD *)v16 = 0;
      *(_QWORD *)(v16 + 8) = 0;
      *(_BYTE *)(v16 + 16) = 4;
      swift_willThrow();
    }
  }
}

uint64_t sub_21A7B6770(char a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t result;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v2 = sub_21A7CF744();
  v3 = sub_21A7CFF90();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67109120;
    sub_21A7D0074();
    _os_log_impl(&dword_21A787000, v2, v3, "Updating app ax. Enable? %{BOOL}d", v4, 8u);
    MEMORY[0x22074950C](v4, -1, -1);
  }

  result = _AXSApplicationAccessibilityEnabled();
  if ((a1 & 1) != 0)
  {
    if ((_DWORD)result)
      return result;
    v6 = sub_21A7CF744();
    v7 = sub_21A7CFF90();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21A787000, v6, v7, "Enabling app accessibility", v8, 2u);
      MEMORY[0x22074950C](v8, -1, -1);
    }
    goto LABEL_12;
  }
  if (!(_DWORD)result)
    return result;
  if (_AXSCanDisableApplicationAccessibility())
  {
    v6 = sub_21A7CF744();
    v9 = sub_21A7CFF90();
    if (os_log_type_enabled(v6, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21A787000, v6, v9, "Disabling app accessibility", v10, 2u);
      MEMORY[0x22074950C](v10, -1, -1);
    }
LABEL_12:

    return _AXSApplicationAccessibilitySetEnabled();
  }
  sub_21A7B84B4();
  swift_allocError();
  *(_OWORD *)v11 = xmmword_21A7D2880;
  *(_BYTE *)(v11 + 16) = 4;
  return swift_willThrow();
}

void sub_21A7B6990(char *a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;

  if (a1)
  {
    v1 = sub_21A7CF744();
    v2 = sub_21A7CFF90();
    if (os_log_type_enabled(v1, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21A787000, v1, v2, "AX system server died", v3, 2u);
      MEMORY[0x22074950C](v3, -1, -1);
    }

    v4 = sub_21A7CF744();
    v5 = sub_21A7CFF90();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21A787000, v4, v5, "Unregistering for ax runtime notifications and removing observer", v6, 2u);
      MEMORY[0x22074950C](v6, -1, -1);
    }

    v7 = *(void **)&a1[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver];
    *(_QWORD *)&a1[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver] = 0;

    sub_21A7B6770(0);
    sub_21A7B656C();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21A7B6C94(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_21A7D014C();
    v4 = a1 + 32;
    do
    {
      v4 += 4;
      sub_21A7D029C();
      sub_21A7D0134();
      sub_21A7D0158();
      sub_21A7D0164();
      sub_21A7D0140();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

void sub_21A7B6D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const void *v22;
  CFTypeID v23;
  id v24;
  void (**v25)(uint64_t);
  void (**v26)(uint64_t);
  void (**v27)(uint64_t);
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void (**v37)(uint64_t);
  uint64_t v38;
  int v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char *v44;
  void (*v45)(uint64_t, unint64_t);
  char *v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, id);
  uint64_t v48;
  id v49;
  unsigned int v50;
  uint64_t v51;
  char *v52;
  void (*v53)(uint64_t, uint64_t);
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void (**v64)(_OWORD *);
  void (*v65)(_OWORD *);
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSString *v71;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void (**v76)(_OWORD *);
  void (*v77)(_OWORD *);
  char *v78;
  char v79;
  char *v80;
  void (*v81)(_QWORD, _QWORD, uint64_t, id);
  id v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  char v86;
  char *v87;
  void *v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[5];
  CGRect v98;

  v5 = a3 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x22074959C](v5);
  if (!v6)
    return;
  v7 = (_BYTE *)v6;
  switch((int)a1)
  {
    case 1005:
      sub_21A7B2328(a2, (uint64_t)v97);
      if (*((_QWORD *)&v97[1] + 1))
      {
        sub_21A79E2D4(0, &qword_2550F6AF0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          *(_QWORD *)&v97[0] = 0xD00000000000001FLL;
          *((_QWORD *)&v97[0] + 1) = 0x800000021A7D4470;
          v8 = objc_msgSend((id)v95, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
          swift_unknownObjectRelease();

          if (v8)
          {
            sub_21A7D00A4();
            swift_unknownObjectRelease();
          }
          else
          {
            v95 = 0u;
            v96 = 0u;
          }
          sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
          if (*((_QWORD *)&v97[1] + 1))
          {
            if (swift_dynamicCast())
              v28 = *((_QWORD *)&v95 + 1);
            else
              v28 = 0;
LABEL_40:
            sub_21A7B2328(a2, (uint64_t)v97);
            if (*((_QWORD *)&v97[1] + 1))
            {
              sub_21A79E2D4(0, &qword_2550F6AF0);
              if ((swift_dynamicCast() & 1) != 0)
              {
                v29 = (void *)v95;
                *(_QWORD *)&v97[0] = 0xD00000000000001ELL;
                *((_QWORD *)&v97[0] + 1) = 0x800000021A7D4450;
                v30 = objc_msgSend((id)v95, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
                swift_unknownObjectRelease();

                if (v30)
                {
                  sub_21A7D00A4();
                  swift_unknownObjectRelease();
                }
                else
                {
                  v95 = 0u;
                  v96 = 0u;
                }
                sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
                if (*((_QWORD *)&v97[1] + 1))
                {
                  v39 = swift_dynamicCast();
                  if (v39)
                    v31 = v95;
                  else
                    v31 = 0;
                  if (v39)
                    v32 = *((_QWORD *)&v95 + 1);
                  else
                    v32 = 0;
LABEL_49:
                  sub_21A7B2328(a2, (uint64_t)&v95);
                  if (*((_QWORD *)&v96 + 1))
                  {
                    sub_21A79E2D4(0, &qword_2550F6AF0);
                    if ((swift_dynamicCast() & 1) != 0)
                    {
                      *(_QWORD *)&v95 = 0xD000000000000026;
                      *((_QWORD *)&v95 + 1) = 0x800000021A7D34E0;
                      v33 = objc_msgSend((id)v93, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
                      swift_unknownObjectRelease();

                      if (v33)
                      {
                        sub_21A7D00A4();
                        swift_unknownObjectRelease();
                      }
                      else
                      {
                        v95 = 0u;
                        v96 = 0u;
                      }
                      sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
LABEL_83:
                      sub_21A7B2328(a2, (uint64_t)&v93);
                      if (*((_QWORD *)&v94 + 1))
                      {
                        sub_21A79E2D4(0, &qword_2550F6AF0);
                        if ((swift_dynamicCast() & 1) != 0)
                        {
                          strcpy((char *)&v93, "notification");
                          BYTE13(v93) = 0;
                          HIWORD(v93) = -5120;
                          v40 = objc_msgSend((id)v91, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
                          swift_unknownObjectRelease();

                          if (v40)
                          {
                            sub_21A7D00A4();
                            swift_unknownObjectRelease();
                          }
                          else
                          {
                            v93 = 0u;
                            v94 = 0u;
                          }
                          sub_21A7B8FA4((uint64_t)&v93, (uint64_t)&v95);
LABEL_95:
                          sub_21A7B2328(a2, (uint64_t)&v91);
                          if (*((_QWORD *)&v92 + 1))
                          {
                            sub_21A79E2D4(0, &qword_2550F6AF0);
                            if ((swift_dynamicCast() & 1) != 0)
                            {
                              *(_QWORD *)&v91 = 0xD000000000000025;
                              *((_QWORD *)&v91 + 1) = 0x800000021A7D4420;
                              v42 = objc_msgSend((id)v89, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
                              swift_unknownObjectRelease();

                              if (v42)
                              {
                                sub_21A7D00A4();
                                swift_unknownObjectRelease();
                              }
                              else
                              {
                                v91 = 0u;
                                v92 = 0u;
                              }
                              sub_21A7B8FA4((uint64_t)&v91, (uint64_t)&v93);
                              if (!*((_QWORD *)&v94 + 1))
                              {
                                v43 = 0;
LABEL_114:
                                if (v32)
                                {
                                  swift_bridgeObjectRelease();
                                  v46 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                  swift_beginAccess();
                                  v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v46;
                                  if (!*(_QWORD *)v46)
                                  {
                                    sub_21A7B8F64((uint64_t)&v93);
                                    sub_21A7B8F64((uint64_t)&v95);
                                    sub_21A7B8F64((uint64_t)v97);
                                    swift_endAccess();
                                    swift_bridgeObjectRelease();

                                    goto LABEL_127;
                                  }
                                  swift_endAccess();
                                  swift_retain();
                                  v47(v31, v32, 12, v43);
                                  swift_bridgeObjectRelease();
                                  goto LABEL_117;
                                }
                                if ((AXDeviceSupportsHoverTextTyping() & 1) == 0
                                  || (v49 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance),
                                      v50 = objc_msgSend(v49, sel_hoverTextTypingEnabled),
                                      v49,
                                      !v50))
                                {

                                  swift_bridgeObjectRelease();
                                  goto LABEL_125;
                                }
                                if (!v28)
                                {
                                  if ((v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred] & 1) != 0)
                                  {
                                    v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred] = 0;
                                    v67 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                    swift_beginAccess();
                                    v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v67;
                                    if (!*(_QWORD *)v67)
                                      goto LABEL_185;
                                    swift_endAccess();
                                    swift_retain();
                                    v68 = 9;
                                  }
                                  else if (*((_QWORD *)&v96 + 1))
                                  {
                                    v78 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                    swift_beginAccess();
                                    v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v78;
                                    if (!*(_QWORD *)v78)
                                      goto LABEL_185;
                                    swift_endAccess();
                                    swift_retain();
                                    v68 = 0;
                                  }
                                  else
                                  {
                                    if (!*((_QWORD *)&v97[1] + 1))
                                    {

                                      goto LABEL_125;
                                    }
                                    v87 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                    swift_beginAccess();
                                    v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v87;
                                    if (!*(_QWORD *)v87)
                                      goto LABEL_185;
                                    swift_endAccess();
                                    swift_retain();
                                    v68 = 10;
                                  }
                                  v47(0, 0, v68, v43);
LABEL_117:

                                  v48 = (uint64_t)v47;
LABEL_118:
                                  sub_21A795888(v48);
LABEL_125:
                                  sub_21A7B8F64((uint64_t)&v93);
                                  sub_21A7B8F64((uint64_t)&v95);
LABEL_126:
                                  sub_21A7B8F64((uint64_t)v97);
                                  goto LABEL_127;
                                }
                                v51 = _s11HoverTextUI0aB17PresentationEventV011ValueChangeE4TypeO03rawF0AESgSS_tcfC_0();
                                if (v51 == 12)
                                {
LABEL_123:

                                  sub_21A7B8F64((uint64_t)&v93);
                                  sub_21A7B8F64((uint64_t)&v95);
                                  sub_21A7B8F64((uint64_t)v97);
                                  return;
                                }
                                v69 = v51;
                                if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v51) == 0xD000000000000017
                                  && v70 == 0x800000021A7D33A0)
                                {
                                  goto LABEL_157;
                                }
                                v79 = sub_21A7D023C();
                                swift_bridgeObjectRelease();
                                if ((v79 & 1) == 0)
                                {
                                  if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v69) == 0xD000000000000017
                                    && v83 == 0x800000021A7D33C0)
                                  {
LABEL_157:
                                    swift_bridgeObjectRelease();
                                    goto LABEL_171;
                                  }
                                  v84 = sub_21A7D023C();
                                  swift_bridgeObjectRelease();
                                  if ((v84 & 1) == 0)
                                  {
                                    if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v69) != 0xD00000000000001ALL
                                      || v85 != 0x800000021A7D3420)
                                    {
                                      v86 = sub_21A7D023C();
                                      swift_bridgeObjectRelease();
                                      if ((v86 & 1) == 0)
                                        goto LABEL_123;
                                      goto LABEL_171;
                                    }
                                    goto LABEL_157;
                                  }
                                }
LABEL_171:
                                v80 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                swift_beginAccess();
                                v81 = *(void (**)(_QWORD, _QWORD, uint64_t, id))v80;
                                if (*(_QWORD *)v80)
                                {
                                  swift_endAccess();
                                  swift_retain();
                                  v81(0, 0, v69, v43);

                                  v48 = (uint64_t)v81;
                                  goto LABEL_118;
                                }
LABEL_185:
                                sub_21A7B8F64((uint64_t)&v93);
                                sub_21A7B8F64((uint64_t)&v95);
                                sub_21A7B8F64((uint64_t)v97);
                                swift_endAccess();

                                goto LABEL_127;
                              }
                              sub_21A7B2328((uint64_t)&v93, (uint64_t)&v89);
                              if (v90)
                              {
                                sub_21A7A6A04(&v89, &v91);
                                type metadata accessor for AXUIElementRef(0);
                                swift_dynamicCast();
                                v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFEA68]), sel_initWithAXUIElement_, v88);

                                goto LABEL_114;
                              }
                              goto LABEL_189;
                            }
                          }
                          else
                          {
                            sub_21A7B8F64((uint64_t)&v91);
                          }
                          v43 = 0;
                          v93 = 0u;
                          v94 = 0u;
                          goto LABEL_114;
                        }
                      }
                      else
                      {
                        sub_21A7B8F64((uint64_t)&v93);
                      }
                      v95 = 0u;
                      v96 = 0u;
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    sub_21A7B8F64((uint64_t)&v95);
                  }
                  memset(v97, 0, 32);
                  goto LABEL_83;
                }
LABEL_48:
                sub_21A7B8F64((uint64_t)v97);
                v31 = 0;
                v32 = 0;
                goto LABEL_49;
              }
            }
            else
            {
              sub_21A7B8F64((uint64_t)v97);
            }
            memset(v97, 0, 32);
            goto LABEL_48;
          }
LABEL_39:
          sub_21A7B8F64((uint64_t)v97);
          v28 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        sub_21A7B8F64((uint64_t)v97);
      }
      memset(v97, 0, 32);
      goto LABEL_39;
    case 1006:
    case 1007:
    case 1009:
    case 1010:
    case 1011:
    case 1012:
    case 1013:
    case 1015:
    case 1016:
    case 1017:
    case 1018:
    case 1019:
    case 1020:
    case 1021:
    case 1022:
    case 1023:
    case 1024:
    case 1025:
    case 1026:
    case 1027:
    case 1028:
    case 1029:
    case 1030:
    case 1032:
    case 1033:
    case 1034:
    case 1035:
    case 1036:
    case 1037:
    case 1038:
    case 1039:
    case 1040:
    case 1041:
    case 1042:
    case 1043:
    case 1045:
    case 1046:
    case 1047:
    case 1048:
    case 1049:
    case 1050:
    case 1051:
    case 1055:
    case 1056:
    case 1057:
    case 1058:
    case 1059:
    case 1060:
    case 1061:
    case 1062:
    case 1063:
    case 1064:
    case 1065:
    case 1066:
    case 1067:
    case 1068:
    case 1069:
    case 1070:
    case 1071:
    case 1072:
    case 1073:
    case 1074:
    case 1075:
    case 1076:
    case 1077:
    case 1078:
    case 1079:
    case 1080:
      goto LABEL_127;
    case 1008:
      sub_21A7B2328(a2, (uint64_t)v97);
      if (!*((_QWORD *)&v97[1] + 1))
        goto LABEL_126;
      sub_21A79E2D4(0, &qword_2550F6AF0);
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_127;
      v10 = (void *)v95;
      *(_QWORD *)&v95 = 1635017060;
      *((_QWORD *)&v95 + 1) = 0xE400000000000000;
      v11 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
      swift_unknownObjectRelease();
      if (v11)
      {
        sub_21A7D00A4();
        swift_unknownObjectRelease();
      }
      else
      {
        v95 = 0u;
        v96 = 0u;
      }
      sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
      if (*((_QWORD *)&v97[1] + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v97[0] = v93;
          *(_QWORD *)&v95 = 10;
          *((_QWORD *)&v95 + 1) = 0xE100000000000000;
          *(_QWORD *)&v93 = 32;
          *((_QWORD *)&v93 + 1) = 0xE100000000000000;
          sub_21A796C40();
          v34 = sub_21A7D0098();
          v36 = v35;
          swift_bridgeObjectRelease();
          goto LABEL_91;
        }
      }
      else
      {
        sub_21A7B8F64((uint64_t)v97);
      }
      v34 = 0;
      v36 = 0xE000000000000000;
LABEL_91:
      *(_QWORD *)&v95 = 0xD000000000000021;
      *((_QWORD *)&v95 + 1) = 0x800000021A7D43F0;
      v41 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
      swift_unknownObjectRelease();
      if (v41)
      {
        sub_21A7D00A4();

        swift_unknownObjectRelease();
      }
      else
      {

        v95 = 0u;
        v96 = 0u;
      }
      sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
      if (*((_QWORD *)&v97[1] + 1))
      {
        if ((swift_dynamicCast() & 1) != 0 && (v93 & 1) != 0)
        {
          v44 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement];
          swift_beginAccess();
          v45 = *(void (**)(uint64_t, unint64_t))v44;
          if (*(_QWORD *)v44)
          {
            swift_retain();
            v45(v34, v36);
            sub_21A795888((uint64_t)v45);
          }
        }
      }
      else
      {
        sub_21A7B8F64((uint64_t)v97);
      }
      swift_bridgeObjectRelease();
      goto LABEL_127;
    case 1014:
      v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange;
      goto LABEL_70;
    case 1031:
      sub_21A7B2328(a2, (uint64_t)&v95);
      if (*((_QWORD *)&v96 + 1))
      {
        sub_21A79E2D4(0, &qword_2550F6AF0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          *(_QWORD *)&v95 = 0x656C6269736976;
          *((_QWORD *)&v95 + 1) = 0xE700000000000000;
          v12 = objc_msgSend((id)v93, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
          swift_unknownObjectRelease();

          if (v12)
          {
            sub_21A7D00A4();
            swift_unknownObjectRelease();
          }
          else
          {
            v95 = 0u;
            v96 = 0u;
          }
          sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
          if (*((_QWORD *)&v97[1] + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              if ((v95 & 1) != 0)
LABEL_68:
                v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame;
              else
LABEL_69:
                v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide;
LABEL_70:
              v37 = (void (**)(uint64_t))&v7[v9];
              swift_beginAccess();
              v14 = *v37;
              if (*v37)
              {
                v38 = swift_retain();
                v14(v38);
LABEL_72:
                sub_21A795888((uint64_t)v14);
              }
            }
            goto LABEL_127;
          }
          goto LABEL_126;
        }
      }
      else
      {
        sub_21A7B8F64((uint64_t)&v95);
      }
      memset(v97, 0, 32);
      goto LABEL_126;
    case 1044:
      v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated;
      goto LABEL_70;
    case 1052:
      v13 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
      swift_beginAccess();
      v14 = *v13;
      if (!*v13)
        goto LABEL_127;
      swift_retain();
      v15 = 11;
      goto LABEL_31;
    case 1053:
      sub_21A7B2328(a2, (uint64_t)v97);
      if (!*((_QWORD *)&v97[1] + 1))
        goto LABEL_126;
      sub_21A79E2D4(0, &qword_2550F6AF0);
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_127;
      if (!*MEMORY[0x24BDFEE88])
      {
        __break(1u);
        goto LABEL_188;
      }
      v16 = (void *)v95;
      v17 = (id)*MEMORY[0x24BDFEE88];
      v18 = sub_21A7CFE04();
      v20 = v19;

      *(_QWORD *)&v97[0] = v18;
      *((_QWORD *)&v97[0] + 1) = v20;
      swift_bridgeObjectRetain();
      v21 = objc_msgSend((id)v95, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
      swift_unknownObjectRelease();
      if (!v21)
      {
        swift_bridgeObjectRelease();
        goto LABEL_134;
      }
      sub_21A7D00A4();
      swift_unknownObjectRelease();
      sub_21A7A6A04(v97, &v95);
      swift_bridgeObjectRelease();
      __swift_project_boxed_opaque_existential_1(&v95, *((uint64_t *)&v96 + 1));
      v22 = (const void *)sub_21A7D0230();
      v23 = CFGetTypeID(v22);
      swift_unknownObjectRelease();
      if (v23 != AXUIElementGetTypeID())
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v95);
LABEL_134:
        if (*MEMORY[0x24BDFEE98])
        {
          v54 = (id)*MEMORY[0x24BDFEE98];
          v55 = sub_21A7CFE04();
          v57 = v56;

          *(_QWORD *)&v95 = v55;
          *((_QWORD *)&v95 + 1) = v57;
          swift_bridgeObjectRetain();
          v58 = objc_msgSend(v16, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
          swift_unknownObjectRelease();
          if (v58)
          {
            sub_21A7D00A4();
            swift_unknownObjectRelease();
          }
          else
          {
            v95 = 0u;
            v96 = 0u;
          }
          sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
          if (*((_QWORD *)&v97[1] + 1))
          {
            if ((swift_dynamicCast() & 1) == 0)
            {
LABEL_166:
              swift_bridgeObjectRelease();

              goto LABEL_127;
            }
            swift_bridgeObjectRelease();
            if (!*MEMORY[0x24BDFEE90])
            {
LABEL_190:
              __break(1u);
              JUMPOUT(0x21A7B82BCLL);
            }
            v59 = (id)*MEMORY[0x24BDFEE90];
            v60 = sub_21A7CFE04();
            v62 = v61;

            *(_QWORD *)&v95 = v60;
            *((_QWORD *)&v95 + 1) = v62;
            swift_bridgeObjectRetain();
            v63 = objc_msgSend(v16, sel___swift_objectForKeyedSubscript_, sub_21A7D0248());
            swift_unknownObjectRelease();
            if (v63)
            {
              sub_21A7D00A4();
              swift_unknownObjectRelease();
            }
            else
            {
              v95 = 0u;
              v96 = 0u;
            }
            sub_21A7B8FA4((uint64_t)&v95, (uint64_t)v97);
            if (*((_QWORD *)&v97[1] + 1))
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v71 = (NSString *)sub_21A7CFDE0();
                swift_bridgeObjectRelease();
                v98 = CGRectFromString(v71);
                x = v98.origin.x;
                y = v98.origin.y;
                width = v98.size.width;
                height = v98.size.height;

                v76 = (void (**)(_OWORD *))&v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange];
                swift_beginAccess();
                v77 = *v76;
                if (*v76)
                {
                  v97[0] = v93;
                  *(CGFloat *)&v97[1] = x;
                  *((CGFloat *)&v97[1] + 1) = y;
                  *(CGFloat *)&v97[2] = width;
                  *((CGFloat *)&v97[2] + 1) = height;
                  LOBYTE(v97[3]) = 0x80;
                  swift_retain();
                  v77(v97);
                  sub_21A795888((uint64_t)v77);
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              goto LABEL_166;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();

          goto LABEL_126;
        }
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
        goto LABEL_190;
      }
      sub_21A79E24C((uint64_t)&v95, (uint64_t)&v93);
      type metadata accessor for AXUIElementRef(0);
      swift_dynamicCast();
      v24 = (id)_UIAXElementForAXUIElementRef();

      if (v24)
      {
        sub_21A7D00A4();
        swift_unknownObjectRelease();
      }
      else
      {
        v93 = 0u;
        v94 = 0u;
      }
      sub_21A7B8FA4((uint64_t)&v93, (uint64_t)v97);
      if (*((_QWORD *)&v97[1] + 1))
      {
        sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v64 = (void (**)(_OWORD *))&v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange];
          swift_beginAccess();
          v65 = *v64;
          if (!*v64)
          {
            v82 = (id)v91;
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v95);
            swift_endAccess();

            goto LABEL_127;
          }
          swift_endAccess();
          *(_QWORD *)&v97[0] = v91;
          memset((char *)v97 + 8, 0, 41);
          v66 = (id)v91;
          sub_21A79581C((uint64_t)v65);
          v65(v97);

          sub_21A795888((uint64_t)v65);
        }
      }
      else
      {
        sub_21A7B8F64((uint64_t)v97);
      }

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v95);
LABEL_127:
      v52 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification];
      swift_beginAccess();
      v53 = *(void (**)(uint64_t, uint64_t))v52;
      if (*(_QWORD *)v52)
      {
        swift_retain();
        v53(a1, a2);
        sub_21A795888((uint64_t)v53);
      }

      return;
    case 1054:
      *(_BYTE *)(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred) = 1;
      goto LABEL_127;
    case 1081:
      v25 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
      swift_beginAccess();
      v14 = *v25;
      if (!*v25)
        goto LABEL_127;
      swift_retain();
      v15 = 8;
LABEL_31:
      ((void (*)(_QWORD, _QWORD, uint64_t, _QWORD))v14)(0, 0, v15, 0);
      goto LABEL_72;
    case 1082:
      v26 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
      swift_beginAccess();
      v14 = *v26;
      if (!*v26)
        goto LABEL_127;
      swift_retain();
      v14(1);
      goto LABEL_72;
    case 1083:
      v27 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
      swift_beginAccess();
      v14 = *v27;
      if (!*v27)
        goto LABEL_127;
      swift_retain();
      v14(0);
      goto LABEL_72;
    case 1084:
      goto LABEL_69;
    case 1085:
      goto LABEL_68;
    case 1086:
      v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode;
      goto LABEL_70;
    default:
      if ((_DWORD)a1 != 5001)
        goto LABEL_127;
      v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange;
      goto LABEL_70;
  }
}

id AXRuntimeClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AXRuntimeClient.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AXRuntimeClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21A7B84B4()
{
  unint64_t result;

  result = qword_2550F6AE0;
  if (!qword_2550F6AE0)
  {
    result = MEMORY[0x220749464](&protocol conformance descriptor for AXRuntimeClientError, &type metadata for AXRuntimeClientError);
    atomic_store(result, (unint64_t *)&qword_2550F6AE0);
  }
  return result;
}

id sub_21A7B84FC(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u)
    return result;
  return result;
}

void destroy for AXRuntimeClientError(uint64_t a1)
{
  sub_21A7B8520(*(id *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_21A7B8520(id a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u)

}

uint64_t _s11HoverTextUI20AXRuntimeClientErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21A7B84FC(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AXRuntimeClientError(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21A7B84FC(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_21A7B8520(v6, v7, v8);
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

uint64_t assignWithTake for AXRuntimeClientError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_21A7B8520(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AXRuntimeClientError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AXRuntimeClientError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21A7B86B4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_21A7B86CC(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXRuntimeClientError()
{
  return &type metadata for AXRuntimeClientError;
}

uint64_t destroy for FocusChangeInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FocusChangeInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FocusChangeInfo(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithTake for FocusChangeInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for FocusChangeInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FocusChangeInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FocusChangeInfo()
{
  return &type metadata for FocusChangeInfo;
}

void destroy for FocusChange(uint64_t a1)
{
  sub_21A79C514(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for FocusChange(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_21A79C4B4(*(void **)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for FocusChange(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_21A79C4B4(*(void **)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(void **)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_21A79C514(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for FocusChange(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_21A79C514(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for FocusChange(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 127);
  v3 = (*(_BYTE *)(a1 + 48) & 0x7E | (*(unsigned __int8 *)(a1 + 48) >> 7)) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FocusChange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
    {
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)result = 0u;
      *(_BYTE *)(result + 48) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_21A7B8AAC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48) >> 7;
}

uint64_t sub_21A7B8AB8(uint64_t result)
{
  *(_BYTE *)(result + 48) &= ~0x80u;
  return result;
}

uint64_t sub_21A7B8AC8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 48) = *(_BYTE *)(result + 48) & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for FocusChange()
{
  return &type metadata for FocusChange;
}

uint64_t sub_21A7B8C38()
{
  return type metadata accessor for AXRuntimeClient();
}

uint64_t type metadata accessor for AXRuntimeClient()
{
  uint64_t result;

  result = qword_253F22E98;
  if (!qword_253F22E98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A7B8C7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A7CF750();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

id sub_21A7B8D34(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v17;
  _QWORD aBlock[7];

  v6 = v5;
  aBlock[6] = *MEMORY[0x24BDAC8D0];
  sub_21A79E2D4(0, &qword_2550F6AE8);
  v11 = (void *)sub_21A7CFEA0();
  swift_bridgeObjectRelease();
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21A7B8EA0;
  aBlock[3] = &block_descriptor_5;
  v12 = _Block_copy(aBlock);
  v17 = 0;
  v13 = objc_msgSend(v6, sel_initWithSystemElement_runloop_notifications_handler_error_, a1, a2, v11, v12, &v17);
  _Block_release(v12);

  if (v13)
  {
    v14 = v17;
  }
  else
  {
    v15 = v17;
    sub_21A7CF618();

    swift_willThrow();
  }

  swift_release();
  return v13;
}

uint64_t sub_21A7B8EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, __int128 *);
  __int128 v7;
  __int128 v8;

  v5 = *(void (**)(uint64_t, __int128 *))(a1 + 32);
  if (a3)
  {
    *((_QWORD *)&v8 + 1) = swift_getObjectType();
    *(_QWORD *)&v7 = a3;
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v5(a2, &v7);
  swift_release();
  return sub_21A7B8F64((uint64_t)&v7);
}

uint64_t sub_21A7B8F20()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21A7B8F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21A7B6D38(a1, a2, v2);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_21A7B8F64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6930);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A7B8FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7B8FEC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21A7B9024(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21A7B9008(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21A7B9204(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21A7B9024(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62A0);
  v10 = *(_QWORD *)(sub_21A7CF57C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_21A7CF57C() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t sub_21A7B9204(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6AF8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21A7D0200();
  __break(1u);
  return result;
}

uint64_t sub_21A7B936C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A7C30C8(a1, a2, a3, &qword_2550F73C0);
}

uint64_t sub_21A7B9378(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2550F73C0);
}

void sub_21A7B9384()
{
  sub_21A7916EC();
  sub_21A7CF60C();
  __break(1u);
}

void sub_21A7B93A8()
{
  sub_21A7CF4BC();
  __break(1u);
}

uint64_t sub_21A7B93C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A7C30C8(a1, a2, a3, &qword_2550F73C8);
}

uint64_t sub_21A7B93CC(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2550F73C8);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_21A7CFDBC();
}

void sub_21A7B9418()
{
  sub_21A791668();
  sub_21A7CF60C();
  __break(1u);
}

void sub_21A7B943C()
{
  sub_21A7CF4B0();
  __break(1u);
}

void sub_21A7B9454()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  if (*(_BYTE *)(v0 + 210) == 1)
  {
    sub_21A7B9590();
    swift_getKeyPath();
    sub_21A7CF6CC();
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    sub_21A7CF6CC();
    swift_release();
    sub_21A7B9590();
  }
}

double sub_21A7B9590()
{
  double *v0;
  double *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char *v18;
  id v19;
  double v20;
  double v21;
  void (*v22)(char *, uint64_t);
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double Width;
  id v43;
  double v44;
  double v45;
  double v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  double v57;
  double v58;
  double v59;
  id v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v70;
  double v71;
  uint64_t v72;
  void (*v73)(char *, char *, uint64_t);
  double *v74;
  double *v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v1 = v0;
  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v75 = v0;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v6 = v0[25];
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v76.origin.x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, v1[4], v1[5]);
  v17 = 0.0;
  if (CGRectGetWidth(v76) * 0.85 * 0.5 <= v6)
  {
    swift_getKeyPath();
    v75 = v1;
    sub_21A7CF6CC();
    swift_release();
    v18 = (char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    v73 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v73(v5, v18, v2);
    swift_getKeyPath();
    v74 = v1;
    sub_21A7CF6CC();
    swift_release();
    v72 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
    v19 = *(id *)((char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_21A792278(v19);
    v21 = v20;

    v22 = *(void (**)(char *, uint64_t))(v3 + 8);
    v22(v5, v2);
    v23 = v21 + 2.0;
    v24 = objc_msgSend(v7, sel_mainScreen);
    objc_msgSend(v24, sel_bounds);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v77.origin.x = UIEdgeInsetsInsetRect(v26, v28, v30, v32, v1[4], v1[5]);
    if (CGRectGetWidth(v77) * 0.85 < v23)
    {
      swift_getKeyPath();
      v74 = v1;
      sub_21A7CF6CC();
      swift_release();
      v71 = v1[25];
      v33 = objc_msgSend(v7, sel_mainScreen);
      objc_msgSend(v33, sel_bounds);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;

      v78.origin.x = UIEdgeInsetsInsetRect(v35, v37, v39, v41, v1[4], v1[5]);
      Width = CGRectGetWidth(v78);
      swift_getKeyPath();
      v74 = v1;
      sub_21A7CF6CC();
      swift_release();
      v73(v5, v18, v2);
      swift_getKeyPath();
      v74 = v1;
      sub_21A7CF6CC();
      swift_release();
      v43 = *(id *)((char *)v1 + v72);
      sub_21A792278(v43);
      v45 = v44;

      v22(v5, v2);
      swift_getKeyPath();
      v74 = v1;
      sub_21A7CF6CC();
      swift_release();
      v46 = v45 + 2.0 - v1[25];
      v47 = objc_msgSend(v7, sel_mainScreen);
      objc_msgSend(v47, sel_bounds);
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;

      v79.origin.x = UIEdgeInsetsInsetRect(v49, v51, v53, v55, v1[4], v1[5]);
      if (v46 >= CGRectGetWidth(v79) * 0.85 * 0.5)
      {
        return v71 - Width * 0.85 * 0.5;
      }
      else
      {
        swift_getKeyPath();
        v74 = v1;
        sub_21A7CF6CC();
        swift_release();
        v73(v5, v18, v2);
        swift_getKeyPath();
        v74 = v1;
        sub_21A7CF6CC();
        swift_release();
        v56 = *(id *)((char *)v1 + v72);
        sub_21A792278(v56);
        v58 = v57;

        v22(v5, v2);
        v59 = v58 + 2.0;
        v60 = objc_msgSend(v7, sel_mainScreen);
        objc_msgSend(v60, sel_bounds);
        v62 = v61;
        v64 = v63;
        v66 = v65;
        v68 = v67;

        v80.origin.x = UIEdgeInsetsInsetRect(v62, v64, v66, v68, v1[4], v1[5]);
        return v59 + CGRectGetWidth(v80) * -0.85;
      }
    }
  }
  return v17;
}

void sub_21A7B9B7C(int a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  id v28;
  __n128 v29;
  __n128 v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  uint64_t KeyPath;
  uint64_t v41;
  void *v42;
  char *v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t (*v61)(char *, uint64_t);
  char *v62;
  uint64_t v63;
  _QWORD aBlock[7];

  v4 = v3;
  v57 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F67C8);
  MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_21A7CFD50();
  v56 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21A7CFD74();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t (*)(char *, uint64_t))sub_21A7CF57C();
  v60 = *((_QWORD *)v15 - 1);
  v61 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v59 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7380);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v20 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  aBlock[0] = v4;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  v58 = v20;
  sub_21A7CF6CC();
  swift_release();
  v21 = v4 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  sub_21A795080(v21, (uint64_t)v19, &qword_2550F7380);
  v22 = type metadata accessor for HoverTextPresentationEvent();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48))(v19, 1, v22))
  {
    sub_21A7950C4((uint64_t)v19, &qword_2550F7380);
    return;
  }
  v54 = v14;
  v51 = v12;
  v52 = v11;
  v53 = v10;
  v23 = *(_QWORD *)&v19[*(int *)(v22 + 48)];
  sub_21A7950C4((uint64_t)v19, &qword_2550F7380);
  swift_getKeyPath();
  aBlock[0] = v4;
  sub_21A7CF6CC();
  swift_release();
  v24 = v4 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v26 = v60;
  v25 = v61;
  v27 = v59;
  (*(void (**)(char *, uint64_t, uint64_t (*)(char *, uint64_t)))(v60 + 16))(v59, v24, v61);
  swift_getKeyPath();
  aBlock[0] = v4;
  sub_21A7CF6CC();
  swift_release();
  v28 = *(id *)(v4 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_21A792278(v28);

  v29 = ((__n128 (*)(char *, uint64_t (*)(char *, uint64_t)))*(_QWORD *)(v26 + 8))(v27, v25);
  v29.n128_f64[0] = a2 - a3;
  v30.n128_u64[0] = 0;
  v31 = CGPointMake(v29, v30);
  sub_21A7C570C(v31, v32);
  v61 = v34;
  v35 = v23 + v33;
  if (__OFADD__(v23, v33))
  {
    __break(1u);
    return;
  }
  v36 = v33;
  swift_getKeyPath();
  aBlock[0] = v4;
  sub_21A7CF6CC();
  swift_release();
  if ((*(_BYTE *)(v4 + 248) & 1) != 0)
  {
    v37 = (uint64_t)v62;
    v38 = v57;
    v39 = v54;
    if (!v36)
      goto LABEL_7;
    goto LABEL_6;
  }
  v37 = (uint64_t)v62;
  v38 = v57;
  v39 = v54;
  if (v36 != *(_QWORD *)(v4 + 232))
  {
LABEL_6:
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v50 - 4) = v4;
    *(&v50 - 3) = v35;
    *(&v50 - 2) = 0;
    *((_BYTE *)&v50 - 8) = 0;
    aBlock[0] = v4;
    sub_21A7CF6C0();
    swift_release();
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = v35;
    *(_QWORD *)(v41 + 24) = 0;
    aBlock[4] = sub_21A7C5BC8;
    aBlock[5] = v41;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21A7A6A18;
    aBlock[3] = &block_descriptor_6;
    v42 = _Block_copy(aBlock);
    sub_21A7CFD5C();
    v63 = MEMORY[0x24BEE4AF8];
    sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
    sub_21A794FD4((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0, MEMORY[0x24BEE12C8]);
    v43 = v53;
    v44 = v55;
    sub_21A7D00BC();
    MEMORY[0x220748A50](0, v39, v43, v42);
    v45 = v42;
    v37 = (uint64_t)v62;
    _Block_release(v45);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v43, v44);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v52);
    swift_release();
  }
LABEL_7:
  if ((v38 & 1) != 0)
  {
    sub_21A7C04D0(v36, v61);
    v46 = sub_21A7CFF18();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v37, 1, 1, v46);
    sub_21A7CFF00();
    swift_retain();
    v47 = sub_21A7CFEF4();
    v48 = (_QWORD *)swift_allocObject();
    v49 = MEMORY[0x24BEE6930];
    v48[2] = v47;
    v48[3] = v49;
    v48[4] = v4;
    sub_21A7ABD64(v37, (uint64_t)&unk_2550F7390, (uint64_t)v48);
    swift_release();
  }
}

void sub_21A7BA1F8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  if (*(_BYTE *)(v0 + 210) == 1)
  {
    sub_21A7C4FB8();
    swift_getKeyPath();
    sub_21A7CF6CC();
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    sub_21A7CF6CC();
    swift_release();
    sub_21A7C4FB8();
  }
}

void sub_21A7BA334(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Width;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t KeyPath;
  char *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  id v56;
  double v57;
  double v58;
  double v59;
  id v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  _QWORD v76[3];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t aBlock;
  uint64_t v83;
  void (*v84)(uint64_t, void *);
  void *v85;
  uint64_t (*v86)();
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v2 = v1;
  v4 = sub_21A7CF57C();
  v77 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v80 = v1;
  v81 = 1;
  aBlock = v1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  swift_release();
  sub_21A7CF7D4();
  v8 = v7;
  swift_getKeyPath();
  v78 = v1;
  v79 = v8;
  aBlock = v1;
  sub_21A7CF6C0();
  v76[1] = 0;
  swift_release();
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_mainScreen);
  objc_msgSend(v10, sel_bounds);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v88.origin.x = UIEdgeInsetsInsetRect(v12, v14, v16, v18, *(double *)(v2 + 32), *(double *)(v2 + 40));
  v19 = 35.0 - CGRectGetWidth(v88) * 0.85 * 0.5;
  v20 = objc_msgSend(v9, sel_mainScreen);
  objc_msgSend(v20, sel_bounds);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v89.origin.x = UIEdgeInsetsInsetRect(v22, v24, v26, v28, *(double *)(v2 + 32), *(double *)(v2 + 40));
  Width = CGRectGetWidth(v89);
  v76[2] = a1;
  v30 = v4;
  sub_21A7CF7E0();
  if (v31 < v19)
  {
    swift_getKeyPath();
    aBlock = v2;
    sub_21A7CF6CC();
    swift_release();
    v32 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    v33 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v6, v32, v30);
    swift_getKeyPath();
    aBlock = v2;
    sub_21A7CF6CC();
    swift_release();
    v34 = *(id *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_21A792278(v34);
    v36 = v35;

    (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v30);
    v37 = v36 + 2.0;
    v38 = objc_msgSend(v9, (SEL)0x24DD25D13);
    objc_msgSend(v38, sel_bounds);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;

    v90.origin.x = UIEdgeInsetsInsetRect(v40, v42, v44, v46, *(double *)(v2 + 32), *(double *)(v2 + 40));
    if (CGRectGetWidth(v90) * 0.85 < v37)
    {
      swift_getKeyPath();
      aBlock = v2;
      sub_21A7CF6CC();
      swift_release();
      if (*(_QWORD *)(v2 + 272))
        return;
      v47 = (void *)objc_opt_self();
      v48 = swift_allocObject();
      swift_weakInit();
      v86 = sub_21A7C7AA0;
      v87 = v48;
      aBlock = MEMORY[0x24BDAC760];
      v83 = 1107296256;
      v84 = sub_21A795378;
      v85 = &block_descriptor_245;
      v49 = _Block_copy(&aBlock);
      swift_release();
      v50 = objc_msgSend(v47, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v49, 0.075);
      _Block_release(v49);
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      v76[-2] = v2;
      v76[-1] = v50;
      aBlock = v2;
LABEL_9:
      sub_21A7CF6C0();
      swift_release();

      return;
    }
  }
  v52 = v6;
  v53 = v77;
  sub_21A7CF7E0();
  if (Width * 0.85 * 0.5 + -35.0 < v54)
  {
    swift_getKeyPath();
    aBlock = v2;
    sub_21A7CF6CC();
    swift_release();
    v55 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v52, v55, v30);
    swift_getKeyPath();
    aBlock = v2;
    sub_21A7CF6CC();
    swift_release();
    v56 = *(id *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_21A792278(v56);
    v58 = v57;

    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v30);
    v59 = v58 + 2.0;
    v60 = objc_msgSend(v9, (SEL)0x24DD25D13);
    objc_msgSend(v60, sel_bounds);
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v68 = v67;

    v91.origin.x = UIEdgeInsetsInsetRect(v62, v64, v66, v68, *(double *)(v2 + 32), *(double *)(v2 + 40));
    if (CGRectGetWidth(v91) * 0.85 < v59)
    {
      swift_getKeyPath();
      aBlock = v2;
      sub_21A7CF6CC();
      swift_release();
      if (*(_QWORD *)(v2 + 272))
        return;
      v69 = (void *)objc_opt_self();
      v70 = swift_allocObject();
      swift_weakInit();
      v86 = sub_21A7C7A98;
      v87 = v70;
      aBlock = MEMORY[0x24BDAC760];
      v83 = 1107296256;
      v84 = sub_21A795378;
      v85 = &block_descriptor_240;
      v71 = _Block_copy(&aBlock);
      swift_release();
      v50 = objc_msgSend(v69, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v71, 0.075);
      _Block_release(v71);
      v72 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v72);
      v76[-2] = v2;
      v76[-1] = v50;
      aBlock = v2;
      goto LABEL_9;
    }
  }
  swift_getKeyPath();
  aBlock = v2;
  sub_21A7CF6CC();
  swift_release();
  objc_msgSend(*(id *)(v2 + 272), sel_invalidate);
  v73 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v73);
  v76[-2] = v2;
  v76[-1] = 0;
  aBlock = v2;
  sub_21A7CF6C0();
  swift_release();
  sub_21A7C63EC();
  v75 = v74;
  swift_getKeyPath();
  aBlock = v2;
  sub_21A7CF6CC();
  swift_release();
  sub_21A7B9B7C(0, v75, *(double *)(v2 + 216));
}

uint64_t sub_21A7BAC64()
{
  uint64_t v0;
  double v1;
  double v2;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  swift_release();
  swift_getKeyPath();
  sub_21A7CF6CC();
  swift_release();
  objc_msgSend(*(id *)(v0 + 272), sel_invalidate);
  swift_getKeyPath();
  sub_21A7CF6C0();
  swift_release();
  sub_21A7C63EC();
  v2 = v1;
  swift_getKeyPath();
  sub_21A7CF6CC();
  swift_release();
  sub_21A7B9B7C(1, v2, *(double *)(v0 + 216));
  swift_getKeyPath();
  sub_21A7CF6C0();
  swift_release();
  swift_getKeyPath();
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BAE7C()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A7BAF04@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 96);
  return swift_retain();
}

uint64_t sub_21A7BAF94()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7BAFA8()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A7BB030@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 104);
  return swift_retain();
}

uint64_t sub_21A7BB0C0()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  swift_retain();
  sub_21A7CF6C0();
  swift_release();
  return swift_release();
}

uint64_t sub_21A7BB17C()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A7BB204@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 112);
  return swift_retain();
}

double sub_21A7BB294()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 120);
}

double sub_21A7BB318@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(double *)(v3 + 120);
  *a2 = result;
  return result;
}

uint64_t sub_21A7BB3A4()
{
  return sub_21A7BB798();
}

uint64_t sub_21A7BB3B8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t sub_21A7BB43C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 128);
  return result;
}

uint64_t sub_21A7BB4C8()
{
  return sub_21A7BB954();
}

double sub_21A7BB4DC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 136);
}

double *sub_21A7BB564(double *result, double a2, double a3, double a4, double a5)
{
  result[17] = a2;
  result[18] = a3;
  result[19] = a4;
  result[20] = a5;
  return result;
}

double sub_21A7BB570()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 168);
}

__n128 sub_21A7BB5F8@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(__n128 *)(v3 + 168);
  v5 = *(_OWORD *)(v3 + 184);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

double sub_21A7BB688()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 200);
}

double sub_21A7BB70C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(double *)(v3 + 200);
  *a2 = result;
  return result;
}

uint64_t sub_21A7BB798()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BB844()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 208);
}

uint64_t sub_21A7BB8C8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 208);
  return result;
}

uint64_t sub_21A7BB954()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BB9F8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 209);
}

uint64_t sub_21A7BBA7C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 209);
  return result;
}

uint64_t sub_21A7BBB08()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 210);
}

uint64_t sub_21A7BBB8C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 210);
  return result;
}

double sub_21A7BBC18()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 216);
}

double sub_21A7BBC9C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(double *)(v3 + 216);
  *a2 = result;
  return result;
}

double sub_21A7BBD28()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + 224);
}

double sub_21A7BBDAC@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(double *)(v3 + 224);
  *a2 = result;
  return result;
}

uint64_t sub_21A7BBE38()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v0 + 232);
}

__n128 sub_21A7BBEC0@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v4 = *(_BYTE *)(v3 + 248);
  result = *(__n128 *)(v3 + 232);
  *a2 = result;
  a2[1].n128_u8[0] = v4;
  return result;
}

void *sub_21A7BBF54()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v1 = *(void **)(v0 + 272);
  v2 = v1;
  return v1;
}

id sub_21A7BBFE0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v4 = *(void **)(v3 + 272);
  *a2 = v4;
  return v4;
}

void sub_21A7BC06C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  v2 = v1;
  sub_21A7CF6C0();
  swift_release();

}

uint64_t sub_21A7BC120()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v0 + 296);
}

__n128 sub_21A7BC1AC@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(*a1 + 296);
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_21A7BC24C()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BC300@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  return sub_21A795080(v3, a1, &qword_2550F7380);
}

uint64_t sub_21A7BC3B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  return sub_21A795080(v4, a2, &qword_2550F7380);
}

uint64_t sub_21A7BC470(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7380);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21A795080(a1, (uint64_t)v6, &qword_2550F7380);
  v7 = *a2;
  swift_getKeyPath();
  v10 = v7;
  v11 = v6;
  v12 = v7;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  swift_release();
  return sub_21A7950C4((uint64_t)v6, &qword_2550F7380);
}

uint64_t sub_21A7BC578(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  sub_21A7C5E10(a2, v3);
  return swift_endAccess();
}

uint64_t sub_21A7BC5E0()
{
  return sub_21A7BD0C8((uint64_t)&unk_21A7D2B50, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL);
}

uint64_t sub_21A7BC5F4(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) = a2;
  return result;
}

uint64_t sub_21A7BC604()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21A7BC6A4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21A7BC740()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  swift_bridgeObjectRetain();
  sub_21A7CF6C0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A7BC7FC()
{
  return sub_21A7BC824();
}

uint64_t sub_21A7BC810()
{
  return sub_21A7BC824();
}

uint64_t sub_21A7BC824()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A7BC8AC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A7BC8C0(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor, a2);
}

uint64_t sub_21A7BC8C0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;

  v5 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  *a3 = *(_QWORD *)(v5 + *a2);
  return swift_retain();
}

uint64_t sub_21A7BC95C()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7BC970()
{
  return sub_21A7BC824();
}

uint64_t sub_21A7BC984()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode);
}

uint64_t sub_21A7BCA10@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode);
  return result;
}

uint64_t sub_21A7BCAA4()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BCB48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v4 = sub_21A7CF57C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_21A7BCC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v4 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

id sub_21A7BCC88()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(id *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
}

void sub_21A7BCD14(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont) = a2;
  v3 = a2;

}

double sub_21A7BCD4C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
}

__n128 sub_21A7BCDE0@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  result = *(__n128 *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
  v5 = *(_OWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect + 16);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_21A7BCE78()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BCF34(char a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t KeyPath;
  uint64_t v5;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) & 1) == 0 && (a1 & 1) != 0)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_21A7CF6C0();
    swift_release();
    v5 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v5);
    sub_21A7CF6C0();
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7BD0B4()
{
  return sub_21A7BD0C8((uint64_t)&unk_21A7D2AB0, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible);
}

uint64_t sub_21A7BD0C8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_21A7BD14C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible);
  return result;
}

uint64_t sub_21A7BD1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE v7[24];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v1 = sub_21A7CF57C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21A7D02F0();
  swift_getKeyPath();
  *(_QWORD *)&v13 = v0;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v5 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_21A7CF564();
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  sub_21A7D02B4();
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v13 = v8;
  v14 = v9;
  return sub_21A7D02D8();
}

uint64_t sub_21A7BD32C(uint64_t a1, uint64_t a2)
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
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  char *v66;
  id v67;
  _OWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v3 = v2;
  v91 = a1;
  v92 = a2;
  v4 = sub_21A7CF57C();
  v89 = *(_QWORD *)(v4 - 8);
  v90 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v88 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21A7CFFD8();
  v85 = *(_QWORD *)(v6 - 8);
  v86 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v87 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21A7CFF9C();
  MEMORY[0x24BDAC7A8](v8);
  v84 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21A7CFD74();
  MEMORY[0x24BDAC7A8](v10);
  v11 = (void *)objc_opt_self();
  swift_retain();
  v12 = objc_msgSend(v11, sel_sharedInstance);
  v13 = objc_msgSend(v12, sel_hoverTextTypingInsertionPointColorData);

  if (v13)
  {
    v14 = sub_21A7CF63C();
    v16 = v15;

    v17 = (void *)sub_21A7CF630();
  }
  else
  {
    v17 = 0;
    v14 = 0;
    v16 = 0xF000000000000000;
  }
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_makeFromData_, v17);

  if (v19)
  {
    v20 = MEMORY[0x2207485E8](objc_msgSend(v19, sel_color));

  }
  else
  {
    v20 = sub_21A7CFBDC();
  }
  sub_21A7915AC(v14, v16);
  *(_QWORD *)(v2 + 96) = v20;
  v21 = objc_msgSend(v11, sel_sharedInstance);
  v22 = objc_msgSend(v21, sel_hoverTextTypingMisspelledTextColorData);

  if (v22)
  {
    v23 = sub_21A7CF63C();
    v25 = v24;

    v26 = (void *)sub_21A7CF630();
  }
  else
  {
    v26 = 0;
    v23 = 0;
    v25 = 0xF000000000000000;
  }
  v27 = objc_msgSend(v18, sel_makeFromData_, v26);

  if (v27)
  {
    v28 = MEMORY[0x2207485E8](objc_msgSend(v27, sel_color));

  }
  else
  {
    v28 = sub_21A7CFB94();
  }
  sub_21A7915AC(v23, v25);
  *(_QWORD *)(v2 + 104) = v28;
  v29 = objc_msgSend(v11, sel_sharedInstance);
  v30 = objc_msgSend(v29, sel_hoverTextTypingAutocorrectedTextColorData);

  if (v30)
  {
    v31 = sub_21A7CF63C();
    v33 = v32;

    v34 = (void *)sub_21A7CF630();
  }
  else
  {
    v34 = 0;
    v31 = 0;
    v33 = 0xF000000000000000;
  }
  v35 = objc_msgSend(v18, sel_makeFromData_, v34);

  if (v35)
  {
    v36 = MEMORY[0x2207485E8](objc_msgSend(v35, sel_color));

  }
  else
  {
    v36 = sub_21A7CFBA0();
  }
  sub_21A7915AC(v31, v33);
  *(_QWORD *)(v2 + 112) = v36;
  *(_QWORD *)(v2 + 120) = 0;
  *(_BYTE *)(v2 + 128) = 0;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_OWORD *)(v2 + 195) = 0u;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_BYTE *)(v2 + 248) = 1;
  *(_OWORD *)(v2 + 256) = xmmword_21A7D2890;
  *(_QWORD *)(v2 + 272) = 0;
  *(_QWORD *)(v2 + 280) = 0x4041800000000000;
  *(_QWORD *)(v2 + 288) = 0x3FB3333333333333;
  *(_QWORD *)(v2 + 296) = 0;
  *(_QWORD *)(v2 + 304) = 0;
  v37 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  *(_BYTE *)(v2 + 312) = 1;
  v38 = type metadata accessor for HoverTextPresentationEvent();
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56);
  v39(v37, 1, 1, v38);
  v39(v37, 1, 1, v38);
  v40 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore_elementAttributeQueue;
  sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
  sub_21A7CFD68();
  v93 = MEMORY[0x24BEE4AF8];
  sub_21A791288((unint64_t *)&unk_2550F7630, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73D0);
  sub_21A794FD4((unint64_t *)&unk_2550F7640, &qword_2550F73D0, MEMORY[0x24BEE12C8]);
  sub_21A7D00BC();
  (*(void (**)(char *, _QWORD, uint64_t))(v85 + 104))(v87, *MEMORY[0x24BEE5750], v86);
  *(_QWORD *)(v2 + v40) = sub_21A7CFFFC();
  *(_BYTE *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) = 0;
  v41 = objc_msgSend(v11, sel_sharedInstance);
  v42 = objc_msgSend(v41, sel_hoverTextTypingTextColorData);

  if (v42)
  {
    v43 = sub_21A7CF63C();
    v45 = v44;

    v42 = (id)sub_21A7CF630();
  }
  else
  {
    v43 = 0;
    v45 = 0xF000000000000000;
  }
  v46 = objc_msgSend(v18, sel_makeFromData_, v42);

  if (v46)
  {
    v47 = MEMORY[0x2207485E8](objc_msgSend(v46, sel_color));

  }
  else
  {
    v47 = sub_21A7CFBDC();
  }
  sub_21A7915AC(v43, v45);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor) = v47;
  v48 = objc_msgSend(v11, sel_sharedInstance);
  v49 = objc_msgSend(v48, sel_hoverTextTypingBorderColorData);

  if (v49)
  {
    v50 = sub_21A7CF63C();
    v52 = v51;

    v49 = (id)sub_21A7CF630();
  }
  else
  {
    v50 = 0;
    v52 = 0xF000000000000000;
  }
  v53 = objc_msgSend(v18, sel_makeFromData_, v49);

  if (v53)
  {
    v54 = MEMORY[0x2207485E8](objc_msgSend(v53, sel_color));

  }
  else
  {
    v54 = sub_21A7CFBDC();
  }
  sub_21A7915AC(v50, v52);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor) = v54;
  v55 = objc_msgSend(v11, sel_sharedInstance);
  v56 = objc_msgSend(v55, sel_hoverTextTypingBackgroundColorData);

  if (v56)
  {
    v57 = sub_21A7CF63C();
    v59 = v58;

    v56 = (id)sub_21A7CF630();
  }
  else
  {
    v57 = 0;
    v59 = 0xF000000000000000;
  }
  v60 = objc_msgSend(v18, sel_makeFromData_, v56);

  if (v60)
  {
    v61 = MEMORY[0x2207485E8](objc_msgSend(v60, sel_color));

  }
  else
  {
    v62 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    MEMORY[0x220748648](v62);
    v63 = objc_msgSend(v11, sel_sharedInstance);
    objc_msgSend(v63, sel_hoverTextBackgroundOpacity);

    v61 = sub_21A7CFBD0();
    swift_release();
  }
  sub_21A7915AC(v57, v59);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__backgroundColor) = v61;
  v64 = objc_msgSend(v11, sel_sharedInstance);
  v65 = objc_msgSend(v64, sel_hoverTextTypingDisplayMode);

  *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode) = v65;
  v66 = v88;
  sub_21A7CF510();
  (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText, v66, v90);
  v67 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, 10.0);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont) = v67;
  v68 = (_OWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
  *v68 = 0u;
  v68[1] = 0u;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) = 0;
  sub_21A7CF6F0();
  v69 = (_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  v70 = v92;
  *v69 = v91;
  v69[1] = v70;
  swift_release();
  v71 = sub_21A79FECC();
  swift_retain();
  sub_21A7BDF08();
  sub_21A7BE638();
  sub_21A7BED1C();
  v72 = (void *)*MEMORY[0x24BED27E8];
  swift_retain();
  sub_21A7A0254(v72, (uint64_t)sub_21A78CFB8, 0);
  swift_release();
  v73 = (void *)*MEMORY[0x24BED2830];
  swift_retain();
  sub_21A7A0254(v73, (uint64_t)sub_21A7BDEB8, 0);
  swift_release();
  v74 = (void *)*MEMORY[0x24BED2840];
  swift_retain();
  sub_21A7A0254(v74, (uint64_t)sub_21A7BDEC0, 0);
  swift_release();
  v75 = (void *)*MEMORY[0x24BED2858];
  swift_retain();
  sub_21A7A0254(v75, (uint64_t)sub_21A7BDEC8, 0);
  swift_release();
  v76 = (void *)*MEMORY[0x24BED2820];
  swift_retain();
  sub_21A7A0254(v76, (uint64_t)sub_21A7BDED0, 0);
  swift_release();
  v77 = (void *)*MEMORY[0x24BED2828];
  swift_retain();
  sub_21A7A0254(v77, (uint64_t)sub_21A7BDED8, 0);
  swift_release();
  v78 = (void *)*MEMORY[0x24BED2848];
  swift_retain();
  sub_21A7A0254(v78, (uint64_t)sub_21A7BDEE0, 0);
  swift_release();
  v79 = (void *)*MEMORY[0x24BED2860];
  swift_retain();
  sub_21A7A0254(v79, (uint64_t)sub_21A7BDEE8, 0);
  swift_release();
  v80 = (void *)*MEMORY[0x24BED2850];
  swift_retain();
  sub_21A7A0254(v80, (uint64_t)sub_21A7BDEF0, 0);
  swift_release();
  v81 = (void *)*MEMORY[0x24BED2818];
  swift_retain();
  sub_21A7A0254(v81, (uint64_t)sub_21A7BDEF8, 0);
  swift_release();
  v82 = (void *)*MEMORY[0x24BED28F0];
  swift_retain();
  sub_21A7A0254(v82, (uint64_t)sub_21A7BDF00, 0);
  swift_release_n();
  return v71;
}

uint64_t sub_21A7BDEB8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDEC0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDEC8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDED0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDED8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDEE0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDEE8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDEF0()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDEF8()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDF00()
{
  return sub_21A78CFF0();
}

uint64_t sub_21A7BDF08()
{
  return sub_21A7BE64C((uint64_t)sub_21A7C79A8, (uint64_t)&block_descriptor_213);
}

void sub_21A7BDF1C(uint64_t a1)
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
  char *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD aBlock[6];

  v2 = sub_21A7CF750();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)aBlock - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)aBlock - v10;
  v12 = objc_msgSend((id)objc_opt_self(), sel_primaryApp);
  if (v12)
  {
    v13 = v12;
    v14 = objc_msgSend(v12, sel_uiElement);
    if (v14)
    {
      v15 = v14;
      v16 = objc_msgSend(v14, sel_stringWithAXAttribute_, 3019);
      if (v16)
      {
        v17 = v16;
        v18 = sub_21A7CFE04();
        v20 = v19;

        v21 = (_QWORD *)swift_allocObject();
        v21[2] = v18;
        v21[3] = v20;
        v21[4] = a1;
        aBlock[4] = sub_21A7C79DC;
        aBlock[5] = v21;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_21A7A6A18;
        aBlock[3] = &block_descriptor_219;
        v22 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        AXPerformBlockOnMainThread();
        _Block_release(v22);

      }
      else
      {
        v31 = sub_21A7CF738();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v31, v2);
        v32 = sub_21A7CF744();
        v33 = sub_21A7CFF78();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_21A787000, v32, v33, "[Hover Typing Store]: unable to find localeID for the current software keyboard.", v34, 2u);
          MEMORY[0x22074950C](v34, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      }
    }
    else
    {
      v27 = sub_21A7CF738();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v27, v2);
      v28 = sub_21A7CF744();
      v29 = sub_21A7CFF78();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_21A787000, v28, v29, "[Hover Typing Store]: unable to find primary app UI element.", v30, 2u);
        MEMORY[0x22074950C](v30, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
  }
  else
  {
    v23 = sub_21A7CF738();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v23, v2);
    v24 = sub_21A7CF744();
    v25 = sub_21A7CFF78();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_21A787000, v24, v25, "[Hover Typing Store]: unable to find primary app.", v26, 2u);
      MEMORY[0x22074950C](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  }
}

uint64_t sub_21A7BE2D0(uint64_t a1, unint64_t a2, uint64_t a3)
{
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
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t KeyPath;
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

  v6 = sub_21A7CF690();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A7CF6A8();
  v34 = *(_QWORD *)(v9 - 8);
  v35 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21A7CF750();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21A7CF738();
  swift_beginAccess();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v33 = v12;
  v17(v15, v16, v12);
  swift_bridgeObjectRetain_n();
  v18 = sub_21A7CF744();
  v19 = sub_21A7CFF90();
  if (os_log_type_enabled(v18, v19))
  {
    v30 = v6;
    v20 = swift_slowAlloc();
    v32 = a1;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v29 = v7;
    v23 = v22;
    v38 = v22;
    v31 = a3;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    v37 = sub_21A79C3E4(v32, a2, &v38);
    v6 = v30;
    a3 = v31;
    sub_21A7D0074();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21A787000, v18, v19, "[Hover Typing Store]: software keyboard language set to %s", v21, 0xCu);
    swift_arrayDestroy();
    v24 = v23;
    v7 = v29;
    MEMORY[0x22074950C](v24, -1, -1);
    MEMORY[0x22074950C](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v33);
  swift_bridgeObjectRetain();
  sub_21A7CF678();
  v25 = v36;
  sub_21A7CF69C();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
  v26 = sub_21A7CF684();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v25, v6);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v29 - 2) = a3;
  *((_BYTE *)&v29 - 8) = v26 == 2;
  v38 = a3;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7BE638()
{
  return sub_21A7BE64C((uint64_t)sub_21A7C7960, (uint64_t)&block_descriptor_202);
}

uint64_t sub_21A7BE64C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD aBlock[6];

  v5 = v2;
  v6 = sub_21A7CFD50();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21A7CFD74();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(_QWORD *)(v5 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore_elementAttributeQueue);
  aBlock[4] = a1;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21A7A6A18;
  aBlock[3] = a2;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_21A7CFD5C();
  v17[1] = MEMORY[0x24BEE4AF8];
  sub_21A791288(&qword_2550F66D0, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
  sub_21A794FD4((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0, MEMORY[0x24BEE12C8]);
  sub_21A7D00BC();
  MEMORY[0x220748A50](0, v14, v10, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

void sub_21A7BE820(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *v29;
  _QWORD aBlock[6];

  v2 = sub_21A7CF750();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)aBlock - v7;
  v9 = objc_msgSend((id)objc_opt_self(), sel_primaryApp);
  if (!v9)
    goto LABEL_7;
  v10 = v9;
  v11 = objc_msgSend(v9, sel_uiElement);
  if (!v11)
  {

LABEL_7:
    v21 = sub_21A7CF738();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v21, v2);
    v22 = sub_21A7CF744();
    v23 = sub_21A7CFF78();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21A787000, v22, v23, "[Hover Typing Store]: unable to find primary app.", v24, 2u);
      MEMORY[0x22074950C](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return;
  }
  v12 = v11;
  v13 = objc_msgSend(v10, sel_firstResponder);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, sel_uiElement);
    if (v15)
    {
      v16 = v15;
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = a1;
      v17[3] = v16;
      v17[4] = v12;
      aBlock[4] = sub_21A7C799C;
      aBlock[5] = v17;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_21A7A6A18;
      aBlock[3] = &block_descriptor_208;
      v18 = _Block_copy(aBlock);
      swift_retain();
      v19 = v16;
      v20 = v12;
      swift_release();
      AXPerformBlockOnMainThread();
      _Block_release(v18);

      return;
    }

  }
  v25 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v25, v2);
  v26 = sub_21A7CF744();
  v27 = sub_21A7CFF78();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_21A787000, v26, v27, "[Hover Typing]: unable to find first responder.", v28, 2u);
    MEMORY[0x22074950C](v28, -1, -1);
    v29 = v12;
  }
  else
  {
    v29 = v26;
    v26 = v12;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_21A7BEB44(uint64_t a1, id a2, void *a3)
{
  uint64_t result;
  uint64_t KeyPath;
  CGRect v7;

  objc_msgSend(a2, sel_rectWithAXAttribute_, 2236);
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  swift_release();
  swift_getKeyPath();
  sub_21A7CF6CC();
  swift_release();
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 0.0;
  v7.size.height = 0.0;
  result = CGRectEqualToRect(*(CGRect *)(a1 + 168), v7);
  if ((_DWORD)result)
  {
    objc_msgSend(a3, sel_rectWithAXAttribute_, 2236);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_21A7CF6C0();
    return swift_release();
  }
  return result;
}

void sub_21A7BED1C()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t KeyPath;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedInstance);
  v2 = objc_msgSend(v1, sel_hoverTextContentSize);

  sub_21A7CFE04();
  if (v2)

  v3 = (void *)sub_21A7CFDE0();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, v3);

  v5 = (void *)objc_opt_self();
  v6 = (void *)*MEMORY[0x24BEBE1D0];
  v7 = objc_msgSend(v5, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x24BEBE1D0], v4);
  v8 = objc_msgSend(v0, sel_sharedInstance);
  v9 = objc_msgSend(v8, sel_hoverTextTypingTextStyle);

  if (!v9)
    v9 = v6;
  v10 = v9;
  v11 = v4;
  v12 = objc_msgSend(v5, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, v10, v11);

  v13 = v12;
  v14 = objc_msgSend(v0, sel_sharedInstance);
  v15 = objc_msgSend(v14, sel_hoverTextTypingFontName);

  v16 = v13;
  if (v15)
  {
    sub_21A7CFE04();

    objc_msgSend(v13, sel_pointSize);
    v18 = v17;
    v19 = (void *)sub_21A7CFDE0();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v5, sel_fontWithName_size_, v19, v18);

    v16 = v13;
    if (v20)
    {

      v16 = v20;
    }
  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();

  swift_release();
}

void sub_21A7BF038(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  NSObject *v30;
  int v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(char *, uint64_t);
  _QWORD *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t KeyPath;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  char v68;
  _QWORD *v69;
  uint64_t v70;
  int v71;
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
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t *v92;
  char *v93;
  id v94;
  id v95;
  NSObject *v96;
  os_log_type_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  char v107;
  _DWORD v108[2];
  uint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124;
  uint64_t *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint8_t *v129;
  _QWORD *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  id v136;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7380);
  MEMORY[0x24BDAC7A8](v4);
  v122 = (uint64_t)v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_21A7CF540();
  v119 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v118 = (char *)v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v117 = (char *)v108 - v8;
  v116 = sub_21A7CF504();
  v115 = *(_QWORD *)(v116 - 8);
  MEMORY[0x24BDAC7A8](v116);
  v114 = (char *)v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_21A7CF57C();
  v111 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113);
  v112 = (char *)v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = (_QWORD *)type metadata accessor for HoverTextPresentationEvent();
  v11 = *(v130 - 1);
  MEMORY[0x24BDAC7A8](v130);
  v13 = (char *)v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v108 - v15;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v108 - v18;
  v20 = sub_21A7CF750();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v126 = (char *)v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v110 = (char *)v108 - v24;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)v108 - v26;
  v28 = sub_21A7CF738();
  swift_beginAccess();
  v29 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v125 = (uint64_t *)v28;
  *(_QWORD *)&v124 = v29;
  v29(v27, v28, v20);
  v129 = (uint8_t *)a1;
  sub_21A791748(a1, (uint64_t)v19);
  swift_retain_n();
  v30 = sub_21A7CF744();
  v31 = sub_21A7CFF6C();
  v32 = os_log_type_enabled(v30, (os_log_type_t)v31);
  v121 = v11;
  v128 = v2;
  if (v32)
  {
    v108[1] = v31;
    v109 = v21;
    v123 = v20;
    v127 = v13;
    v33 = swift_slowAlloc();
    v133 = swift_slowAlloc();
    *(_DWORD *)v33 = 136315394;
    swift_getKeyPath();
    v134 = v2;
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    sub_21A7CF6CC();
    swift_release();
    v34 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
    v35 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
    swift_bridgeObjectRetain();
    v134 = sub_21A79C3E4(v34, v35, &v133);
    sub_21A7D0074();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    sub_21A791748((uint64_t)v19, (uint64_t)v16);
    __asm { BR              X12 }
  }
  swift_release_n();
  sub_21A79178C((uint64_t)v19);

  v36 = *(void (**)(char *, uint64_t))(v21 + 8);
  v36(v27, v20);
  v37 = v130;
  sub_21A791748((uint64_t)v129, (uint64_t)v13);
  HoverTextPresentationEvent.processEvent()();
  if (!v38)
  {
    v51 = (uint64_t *)&v13[*((int *)v37 + 11)];
    v53 = *v51;
    v52 = v51[1];
    swift_getKeyPath();
    v54 = v128;
    v55 = (char *)(v128 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar);
    v133 = v128;
    v129 = (uint8_t *)sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    sub_21A7CF6CC();
    swift_release();
    if ((*(_BYTE *)(v54 + 312) & 1) == 0 && v53 == *(_QWORD *)(v54 + 296) && v52 == *(_QWORD *)(v54 + 304))
    {
      v71 = v13[50];
      if (v71 == 12)
      {
LABEL_14:
        v72 = (uint64_t)v13;
LABEL_23:
        sub_21A79178C(v72);
        return;
      }
      if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v13[50]) == 0xD000000000000017
        && v104 == 0x800000021A7D33A0)
      {
        goto LABEL_32;
      }
      v105 = sub_21A7D023C();
      swift_bridgeObjectRelease();
      if ((v105 & 1) != 0)
        goto LABEL_9;
      if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v71) == 0xD000000000000017
        && v106 == 0x800000021A7D33C0)
      {
LABEL_32:
        swift_bridgeObjectRelease();
      }
      else
      {
        v107 = sub_21A7D023C();
        swift_bridgeObjectRelease();
        if ((v107 & 1) == 0)
          goto LABEL_14;
      }
    }
LABEL_9:
    v125 = v51;
    v56 = (uint64_t)v13;
    v57 = v112;
    v127 = (char *)v56;
    sub_21A7C1F88(v56, v112);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(_QWORD *)&v108[-4] = v54;
    *(_QWORD *)&v108[-2] = v57;
    v133 = v54;
    v123 = MEMORY[0x24BEE4AE0] + 8;
    sub_21A7CF6C0();
    v110 = 0;
    swift_release();
    v59 = v111;
    *(_QWORD *)&v124 = *(_QWORD *)(v111 + 8);
    v60 = v113;
    ((void (*)(char *, uint64_t))v124)(v57, v113);
    swift_getKeyPath();
    v133 = v54;
    sub_21A7CF6CC();
    swift_release();
    v61 = v54 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v57, v61, v60);
    v62 = v114;
    sub_21A7CF4C8();
    sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
    v63 = v117;
    v126 = v55;
    v64 = v116;
    sub_21A7CFF30();
    v65 = v118;
    sub_21A7CFF3C();
    sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
    v66 = v120;
    LOBYTE(v61) = sub_21A7CFDD4();
    v67 = *(void (**)(char *, uint64_t))(v119 + 8);
    v67(v65, v66);
    v67(v63, v66);
    (*(void (**)(char *, uint64_t))(v115 + 8))(v62, v64);
    ((void (*)(char *, uint64_t))v124)(v57, v60);
    if ((v61 & 1) != 0)
    {
      swift_getKeyPath();
      v134 = v54;
      sub_21A7CF6CC();
      swift_release();
      v68 = *(_BYTE *)(v54 + 209);
    }
    else
    {
      v68 = 1;
    }
    v69 = v130;
    v70 = (uint64_t)v127;
    v73 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v73);
    *(_QWORD *)&v108[-4] = v54;
    LOBYTE(v108[-2]) = v68;
    v134 = v54;
    sub_21A7CF6C0();
    swift_release();
    swift_getKeyPath();
    v134 = v54;
    sub_21A7CF6CC();
    swift_release();
    if (CGRectIsEmpty(*(CGRect *)(v54 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect))
      || (swift_getKeyPath(), v134 = v54, sub_21A7CF6CC(), v74 = swift_release(), *(_BYTE *)(v54 + 209) != 1)
      || (v75 = v70 + *((int *)v69 + 10), (*(_BYTE *)(v75 + 8) & 1) != 0)
      || *(_QWORD *)v75 != 3)
    {
      v77 = v70 + *((int *)v69 + 9);
      v124 = *(_OWORD *)v77;
      v78 = *(_QWORD *)(v77 + 16);
      v79 = *(_QWORD *)(v77 + 24);
      v80 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v80);
      *(_QWORD *)&v108[-12] = v54;
      *(_OWORD *)&v108[-10] = v124;
      *(_QWORD *)&v108[-6] = v78;
      *(_QWORD *)&v108[-4] = v79;
      v134 = v54;
      v76 = MEMORY[0x24BEE4AE0];
      sub_21A7CF6C0();
    }
    else
    {
      MEMORY[0x24BDAC7A8](v74);
      *(_QWORD *)&v108[-4] = v54;
      *(_QWORD *)&v108[-2] = v70;
      sub_21A7CFCFC();
      v76 = MEMORY[0x24BEE4AE0];
      sub_21A7CF8B8();
    }
    swift_release();
    v81 = v70;
    v82 = v122;
    sub_21A791748(v81, v122);
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD *))(v121 + 56))(v82, 0, 1, v130);
    v83 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v83);
    *(_QWORD *)&v108[-4] = v54;
    *(_QWORD *)&v108[-2] = v82;
    v134 = v54;
    v130 = (_QWORD *)(v76 + 8);
    sub_21A7CF6C0();
    swift_release();
    sub_21A7950C4(v82, &qword_2550F7380);
    v84 = v125;
    v85 = *v125;
    v86 = (uint64_t (*)(char *, uint64_t))v125[1];
    sub_21A7C04D0(*v125, v86);
    v87 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v87);
    *(_QWORD *)&v108[-8] = v54;
    *(_QWORD *)&v108[-6] = v85;
    *(_QWORD *)&v108[-4] = v86;
    LOBYTE(v108[-2]) = 0;
    v134 = v54;
    sub_21A7CF6C0();
    swift_release();
    v88 = *v84;
    v89 = v84[1];
    v90 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v90);
    *(_QWORD *)&v108[-8] = v54;
    *(_QWORD *)&v108[-6] = v88;
    *(_QWORD *)&v108[-4] = v89;
    LOBYTE(v108[-2]) = 0;
    v134 = v54;
    sub_21A7CF6C0();
    swift_release();
    v72 = (uint64_t)v127;
    goto LABEL_23;
  }
  sub_21A79178C((uint64_t)v13);
  v136 = v38;
  v39 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F5DE0);
  if (!swift_dynamicCast())
    goto LABEL_25;
  if (v135 != 1)
  {
    sub_21A7917C8(v134, v135);
LABEL_25:
    v91 = (char *)v128;

    v92 = v125;
    swift_beginAccess();
    v93 = v126;
    ((void (*)(char *, uint64_t *, uint64_t))v124)(v126, v92, v20);
    swift_retain();
    v94 = v38;
    swift_retain();
    v95 = v38;
    v96 = sub_21A7CF744();
    v97 = sub_21A7CFF60();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = swift_slowAlloc();
      v99 = swift_slowAlloc();
      v134 = v99;
      *(_DWORD *)v98 = 136315394;
      v123 = v20;
      swift_getKeyPath();
      v136 = v91;
      sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
      v130 = v36;
      sub_21A7CF6CC();
      swift_release();
      v100 = *(_QWORD *)&v91[OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier];
      v101 = *(_QWORD *)&v91[OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8];
      swift_bridgeObjectRetain();
      v136 = (id)sub_21A79C3E4(v100, v101, &v134);
      sub_21A7D0074();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v98 + 12) = 2080;
      swift_getErrorValue();
      v102 = sub_21A7D0260();
      v136 = (id)sub_21A79C3E4(v102, v103, &v134);
      sub_21A7D0074();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21A787000, v96, v97, "[Hover Typing Store]: %s - Will not update display text: %s", (uint8_t *)v98, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22074950C](v99, -1, -1);
      MEMORY[0x22074950C](v98, -1, -1);

      ((void (*)(char *, uint64_t))v130)(v126, v123);
    }
    else
    {

      swift_release_n();
      v36(v93, v20);
    }
    return;
  }

  v40 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v40);
  v41 = v128;
  *(_QWORD *)&v108[-4] = v128;
  LOBYTE(v108[-2]) = 0;
  v133 = v41;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  swift_release();
  v42 = v125;
  swift_beginAccess();
  v43 = v110;
  ((void (*)(char *, uint64_t *, uint64_t))v124)(v110, v42, v20);
  swift_retain_n();
  v44 = sub_21A7CF744();
  v45 = sub_21A7CFF60();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v123 = v20;
    v48 = v47;
    v132 = v47;
    *(_DWORD *)v46 = 136315138;
    v129 = v46 + 4;
    swift_getKeyPath();
    v130 = v36;
    v131 = v41;
    sub_21A7CF6CC();
    swift_release();
    v49 = *(_QWORD *)(v41 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
    v50 = *(_QWORD *)(v41 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
    swift_bridgeObjectRetain();
    v131 = sub_21A79C3E4(v49, v50, &v132);
    sub_21A7D0074();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v44, v45, "[Hover Typing Store]: %s - No display text to show", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v48, -1, -1);
    MEMORY[0x22074950C](v46, -1, -1);

    ((void (*)(char *, uint64_t))v130)(v110, v123);
  }
  else
  {

    swift_release_n();
    v36(v43, v20);
  }

}

uint64_t sub_21A7C03F0()
{
  type metadata accessor for HoverTextPresentationEvent();
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7C04D0(uint64_t a1, uint64_t (*a2)(char *, uint64_t))
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
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  id v14;
  double v15;
  double v16;
  void (*v17)(char *, uint64_t);
  char v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = a1;
  v31 = a2;
  v3 = sub_21A7CF5E8();
  MEMORY[0x24BDAC7A8](v3);
  v27 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_21A7CF504();
  MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21A7CF57C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v10 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v35 = v2;
  v11 = sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v12 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13(v9, v12, v6);
  swift_getKeyPath();
  v34 = v2;
  sub_21A7CF6CC();
  swift_release();
  v26 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  v14 = *(id *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_21A792278(v14);
  v16 = v15;

  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v9, v6);
  swift_getKeyPath();
  v34 = v2;
  v32 = v11;
  v33 = v10;
  sub_21A7CF6CC();
  swift_release();
  v13(v9, v12, v6);
  sub_21A7CF4C8();
  v17(v9, v6);
  sub_21A791288(&qword_2550F7398, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2A8]);
  sub_21A7CFE7C();
  sub_21A7CFF54();
  if ((v18 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v25 - 2) = v2;
    *(&v25 - 1) = 0;
    v34 = v2;
    sub_21A7CF6C0();
    return swift_release();
  }
  else
  {
    sub_21A7CFE88();
    v31 = (uint64_t (*)(char *, uint64_t))v17;
    swift_bridgeObjectRelease();
    sub_21A7CF5DC();
    sub_21A7CF594();
    swift_getKeyPath();
    v34 = v2;
    sub_21A7CF6CC();
    swift_release();
    v19 = *(id *)(v2 + v26);
    sub_21A792278(v19);
    v21 = v20;

    v22 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v22);
    *(&v25 - 2) = v2;
    *((double *)&v25 - 1) = v16 - v21;
    v34 = v2;
    sub_21A7CF6C0();
    swift_release();
    return v31(v9, v6);
  }
}

uint64_t sub_21A7C0914(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_21A7CFA38();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v11 = v1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  if (*(_BYTE *)(v1 + 128) == 1)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v10 - 2) = v1;
    *((_BYTE *)&v10 - 8) = 0;
    v11 = v1;
    sub_21A7CF6C0();
    swift_release();
    sub_21A7CFCF0();
    sub_21A7CF8B8();
    return swift_release();
  }
  else
  {
    v9 = sub_21A7CFCF0();
    MEMORY[0x24BDAC7A8](v9);
    *(&v10 - 2) = v1;
    *((_BYTE *)&v10 - 8) = a1 & 1;
    swift_retain();
    sub_21A7CFA2C();
    sub_21A7CF8AC();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_21A7C0B60(uint64_t a1)
{
  uint64_t KeyPath;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  CGRectGetMaxX(*(CGRect *)(a1 + 136));
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7C0D04()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7C0DAC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t KeyPath;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  if (*(_BYTE *)(v0 + 128) == 1)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_21A7CF6C0();
    swift_release();
    sub_21A7CFCF0();
    sub_21A7CF8B8();
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7C0EF8()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

void sub_21A7C0FAC(char a1)
{
  id v1;
  uint64_t KeyPath;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  uint64_t v24;

  switch(a1)
  {
    case 2:
    case 14:
    case 15:
      sub_21A7BED1C();
      return;
    case 8:
      v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      objc_msgSend(v1, sel_hoverTextTypingDisplayMode);

      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
      sub_21A7CF6C0();
      swift_release();
      return;
    case 10:
      v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v4 = objc_msgSend(v3, sel_hoverTextTypingInsertionPointColorData);

      if (v4)
      {
        v5 = sub_21A7CF63C();
        v7 = v6;

        v4 = (id)sub_21A7CF630();
      }
      else
      {
        v5 = 0;
        v7 = 0xF000000000000000;
      }
      v23 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v4);

      if (v23)
        goto LABEL_34;
      sub_21A7A0CF4(10);
      goto LABEL_41;
    case 11:
      v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v9 = objc_msgSend(v8, sel_hoverTextTypingTextColorData);

      if (v9)
      {
        v5 = sub_21A7CF63C();
        v7 = v10;

        v9 = (id)sub_21A7CF630();
      }
      else
      {
        v5 = 0;
        v7 = 0xF000000000000000;
      }
      v23 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v9);

      if (v23)
        goto LABEL_34;
      sub_21A7A0CF4(11);
      goto LABEL_41;
    case 12:
      v11 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v12 = objc_msgSend(v11, sel_hoverTextTypingBorderColorData);

      if (v12)
      {
        v5 = sub_21A7CF63C();
        v7 = v13;

        v12 = (id)sub_21A7CF630();
      }
      else
      {
        v5 = 0;
        v7 = 0xF000000000000000;
      }
      v23 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v12);

      if (v23)
        goto LABEL_34;
      sub_21A7A0CF4(12);
      goto LABEL_41;
    case 13:
      v14 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v15 = objc_msgSend(v14, sel_hoverTextTypingBackgroundColorData);

      if (v15)
      {
        v5 = sub_21A7CF63C();
        v7 = v16;

        v15 = (id)sub_21A7CF630();
      }
      else
      {
        v5 = 0;
        v7 = 0xF000000000000000;
      }
      v23 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v15);

      if (v23)
        goto LABEL_34;
      sub_21A7A0CF4(13);
      goto LABEL_41;
    case 16:
      v17 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v18 = objc_msgSend(v17, sel_hoverTextTypingMisspelledTextColorData);

      if (v18)
      {
        v5 = sub_21A7CF63C();
        v7 = v19;

        v18 = (id)sub_21A7CF630();
      }
      else
      {
        v5 = 0;
        v7 = 0xF000000000000000;
      }
      v23 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v18);

      if (v23)
        goto LABEL_34;
      sub_21A7A0CF4(16);
      goto LABEL_41;
    case 17:
      v20 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      v21 = objc_msgSend(v20, sel_hoverTextTypingAutocorrectedTextColorData);

      if (v21)
      {
        v5 = sub_21A7CF63C();
        v7 = v22;

        v21 = (id)sub_21A7CF630();
      }
      else
      {
        v5 = 0;
        v7 = 0xF000000000000000;
      }
      v23 = objc_msgSend((id)objc_opt_self(), sel_makeFromData_, v21);

      if (v23)
      {
LABEL_34:
        MEMORY[0x2207485E8](objc_msgSend(v23, sel_color));

      }
      else
      {
        sub_21A7A0CF4(17);
      }
LABEL_41:
      sub_21A7915AC(v5, v7);
      v24 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v24);
      sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
      sub_21A7CF6C0();
      swift_release();
      swift_release();
      break;
    case 18:
      sub_21A7C19B8();
      break;
    default:
      return;
  }
}

uint64_t sub_21A7C19B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;
  char *v32;
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

  v1 = v0;
  v2 = sub_21A7CF750();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v32 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_sharedInstance);
  objc_msgSend(v5, sel_setHoverTextTypingFontName_, 0);

  v6 = objc_msgSend(v4, (SEL)&selRef_azimuth);
  objc_msgSend(v6, sel_setHoverTextContentSize_, 0);

  sub_21A7BED1C();
  v7 = objc_msgSend(v4, (SEL)&selRef_azimuth);
  objc_msgSend(v7, sel_setHoverTextTypingDisplayMode_, 2);

  swift_getKeyPath();
  v47 = v1;
  v48 = 2;
  v49 = v1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  swift_release();
  v8 = objc_msgSend(v4, (SEL)&selRef_azimuth);
  v9 = sub_21A7CFBDC();
  objc_msgSend(v8, sel_setHoverTextTypingTextColorData_, 0);

  swift_getKeyPath();
  v45 = v1;
  v46 = v9;
  v49 = v1;
  sub_21A7CF6C0();
  swift_release();
  swift_release();
  v10 = objc_msgSend(v4, (SEL)&selRef_azimuth);
  v11 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  MEMORY[0x220748648](v11);
  v12 = objc_msgSend(v4, (SEL)&selRef_azimuth);
  objc_msgSend(v12, sel_hoverTextBackgroundOpacity);

  v13 = sub_21A7CFBD0();
  swift_release();
  objc_msgSend(v10, sel_setHoverTextTypingBackgroundColorData_, 0);

  swift_getKeyPath();
  v43 = v1;
  v44 = v13;
  v49 = v1;
  sub_21A7CF6C0();
  swift_release();
  swift_release();
  v14 = objc_msgSend(v4, sel_sharedInstance);
  v15 = sub_21A7CFBDC();
  objc_msgSend(v14, sel_setHoverTextTypingBorderColorData_, 0);

  swift_getKeyPath();
  v41 = v1;
  v42 = v15;
  v49 = v1;
  sub_21A7CF6C0();
  swift_release();
  swift_release();
  v16 = objc_msgSend(v4, sel_sharedInstance);
  v17 = sub_21A7CFB94();
  objc_msgSend(v16, sel_setHoverTextTypingMisspelledTextColorData_, 0);

  swift_getKeyPath();
  v39 = v1;
  v40 = v17;
  v49 = v1;
  sub_21A7CF6C0();
  swift_release();
  swift_release();
  v18 = objc_msgSend(v4, sel_sharedInstance);
  v19 = sub_21A7CFBA0();
  objc_msgSend(v18, sel_setHoverTextTypingAutocorrectedTextColorData_, 0);

  swift_getKeyPath();
  v37 = v1;
  v38 = v19;
  v49 = v1;
  sub_21A7CF6C0();
  swift_release();
  swift_release();
  v20 = v4;
  v21 = v32;
  v22 = objc_msgSend(v20, sel_sharedInstance);
  v23 = sub_21A7CFBDC();
  objc_msgSend(v22, sel_setHoverTextTypingInsertionPointColorData_, 0);

  swift_getKeyPath();
  v35 = v1;
  v36 = v23;
  v49 = v1;
  v24 = v33;
  sub_21A7CF6C0();
  swift_release();
  v25 = v34;
  swift_release();
  v26 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v21, v26, v25);
  v27 = sub_21A7CF744();
  v28 = sub_21A7CFF60();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_21A787000, v27, v28, "[Hover Typing Store]: Reset Hover Typing UI settings.", v29, 2u);
    MEMORY[0x22074950C](v29, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v21, v25);
}

uint64_t sub_21A7C1F88@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _QWORD *v54;
  void *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  void *v62;
  id v63;
  char *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, _QWORD *);
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  void (*v81)(char *, char *, uint64_t);
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t KeyPath;
  uint64_t aBlock;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v89;
  uint64_t (*v90)();
  _QWORD *v91;

  v3 = v2;
  v77 = a1;
  v78 = a2;
  v5 = sub_21A7CF57C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v79 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = v7;
  MEMORY[0x24BDAC7A8](v8);
  v80 = (char *)&v66 - v9;
  v73 = (_QWORD *)sub_21A7CF534();
  v71 = *(v73 - 1);
  MEMORY[0x24BDAC7A8](v73);
  v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_21A7CF5E8();
  v74 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v5;
  v82 = swift_allocBox();
  v15 = v14;
  v76 = type metadata accessor for HoverTextPresentationEvent();
  v16 = a1 + *(int *)(v76 + 28);
  v68 = v6;
  v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v83 = v15;
  v81 = v17;
  v17(v15, (char *)v16, v5);
  swift_getKeyPath();
  v69 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  aBlock = v3;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v18 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor);
  swift_retain();
  sub_21A7CF5DC();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  aBlock = v18;
  sub_21A791668();
  swift_retain();
  sub_21A7CF5D0();
  v19 = *MEMORY[0x24BDCC380];
  v20 = v71;
  v70 = *(void (**)(char *, uint64_t, _QWORD *))(v71 + 104);
  v21 = v73;
  v70(v11, v19, v73);
  sub_21A7CF528();
  swift_release();
  v71 = *(_QWORD *)(v20 + 8);
  ((void (*)(char *, _QWORD *))v71)(v11, v21);
  v22 = *(void (**)(char *, uint64_t))(v74 + 8);
  v23 = v75;
  v22(v13, v75);
  swift_getKeyPath();
  aBlock = v3;
  sub_21A7CF6CC();
  swift_release();
  v69 = v3;
  v24 = *(id *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  v25 = sub_21A7CFA68();
  sub_21A7CF5DC();
  v84 = swift_getKeyPath();
  swift_getKeyPath();
  aBlock = v25;
  sub_21A7916EC();
  swift_retain();
  sub_21A7CF5D0();
  v70(v11, v19, v21);
  sub_21A7CF528();
  swift_release();
  ((void (*)(char *, _QWORD *))v71)(v11, v21);
  v26 = v72;
  v22(v13, v23);
  v27 = *(void **)(v77 + *(int *)(v76 + 52));
  if (v27)
  {
    v29 = v80;
    v28 = v81;
    v81(v80, v83, v26);
    v30 = sub_21A7CFE04();
    v32 = v31;
    v33 = swift_allocObject();
    v34 = v69;
    *(_QWORD *)(v33 + 16) = v82;
    *(_QWORD *)(v33 + 24) = v34;
    v35 = v79;
    v28(v79, v29, v26);
    v36 = v68;
    v37 = *(unsigned __int8 *)(v68 + 80);
    v76 = ((v37 + 48) & ~v37) + v67;
    v38 = (v37 + 48) & ~v37;
    v77 = v38;
    v75 = v37 | 7;
    v39 = (_QWORD *)swift_allocObject();
    v39[2] = v30;
    v39[3] = v32;
    v39[4] = sub_21A7C7480;
    v39[5] = v33;
    v74 = *(_QWORD *)(v36 + 32);
    ((void (*)(char *, char *, uint64_t))v74)((char *)v39 + v38, v35, v26);
    v90 = sub_21A7C748C;
    v91 = v39;
    aBlock = MEMORY[0x24BDAC760];
    v87 = 1107296256;
    v88 = sub_21A7C724C;
    v89 = &block_descriptor_123;
    v40 = _Block_copy(&aBlock);
    v41 = v27;
    v73 = v41;
    v42 = v82;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v41, sel_enumerateAttributesUsingBlock_, v40);
    _Block_release(v40);
    swift_bridgeObjectRelease();
    swift_release();
    v71 = *(_QWORD *)(v36 + 8);
    v43 = v80;
    ((void (*)(char *, uint64_t))v71)(v80, v26);
    v44 = v83;
    swift_beginAccess();
    v45 = v44;
    v46 = v81;
    v81(v43, v45, v26);
    v47 = sub_21A7CFE04();
    v49 = v48;
    v50 = swift_allocObject();
    v51 = v42;
    *(_QWORD *)(v50 + 16) = v42;
    *(_QWORD *)(v50 + 24) = v34;
    v52 = v34;
    v53 = v79;
    v46(v79, v43, v26);
    v54 = (_QWORD *)swift_allocObject();
    v54[2] = v47;
    v54[3] = v49;
    v54[4] = sub_21A7C7494;
    v54[5] = v50;
    ((void (*)(char *, char *, uint64_t))v74)((char *)v54 + v77, v53, v26);
    v90 = sub_21A7C748C;
    v91 = v54;
    aBlock = MEMORY[0x24BDAC760];
    v87 = 1107296256;
    v88 = sub_21A7C724C;
    v89 = &block_descriptor_133;
    v55 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v73, sel_enumerateAttributesUsingBlock_, v55);
    _Block_release(v55);
    swift_bridgeObjectRelease();
    swift_release();
    v56 = (void (*)(char *, uint64_t))v71;
    ((void (*)(char *, uint64_t))v71)(v43, v26);
    v46(v43, v83, v26);
    v57 = sub_21A7CFE04();
    v59 = v58;
    v60 = swift_allocObject();
    *(_QWORD *)(v60 + 16) = v51;
    *(_QWORD *)(v60 + 24) = v52;
    v46(v53, v43, v26);
    v61 = (_QWORD *)swift_allocObject();
    v61[2] = v57;
    v61[3] = v59;
    v61[4] = sub_21A7C74D0;
    v61[5] = v60;
    ((void (*)(char *, char *, uint64_t))v74)((char *)v61 + v77, v53, v26);
    v90 = sub_21A7C748C;
    v91 = v61;
    aBlock = MEMORY[0x24BDAC760];
    v87 = 1107296256;
    v88 = sub_21A7C724C;
    v89 = &block_descriptor_143;
    v62 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    v63 = v73;
    objc_msgSend(v73, sel_enumerateAttributesUsingBlock_, v62);
    _Block_release(v62);

    swift_bridgeObjectRelease();
    swift_release();
    v56(v43, v26);
  }
  v64 = v83;
  swift_beginAccess();
  v81(v78, v64, v26);
  return swift_release();
}

void sub_21A7C2844(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t KeyPath;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  void (*v56)(_QWORD *, _QWORD);
  id v57;
  id v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  void (*v64)(_QWORD *, _QWORD);
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  void (*v73)(char *, uint64_t);
  void (*v74)(char *, uint64_t, uint64_t);
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[4];

  v68 = a3;
  v80 = a1;
  v3 = sub_21A7CFA98();
  MEMORY[0x24BDAC7A8](v3);
  v65 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73A8);
  MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62C0);
  MEMORY[0x24BDAC7A8](v7);
  v67 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v71 = (uint64_t)&v65 - v10;
  MEMORY[0x24BDAC7A8](v11);
  v78 = (char *)&v65 - v12;
  v81 = sub_21A7CF540();
  v79 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v70 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v65 - v15;
  v17 = sub_21A7CF57C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_21A7CF504();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = swift_projectBox();
  swift_beginAccess();
  sub_21A7CF4C8();
  v74 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v74(v20, v25, v17);
  swift_endAccess();
  sub_21A7CF4D4();
  v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  v69 = v20;
  v76 = v17;
  v72 = v26;
  v26(v20, v17);
  v77 = v7;
  v27 = (uint64_t)v78;
  v28 = v80;
  v29 = sub_21A7CF4F8();
  v30 = *(void (**)(char *, uint64_t))(v79 + 8);
  v75 = v16;
  v73 = v30;
  v30(v16, v81);
  v31 = *(void (**)(char *, uint64_t))(v22 + 8);
  v31(v24, v21);
  swift_beginAccess();
  sub_21A7CF4C8();
  swift_endAccess();
  v32 = sub_21A7CF4E0();
  v31(v24, v21);
  v33 = v28;
  v34 = v27;
  sub_21A795080(v33, v27, &qword_2550F62C0);
  if (v29 >= v32)
  {
    v50 = v27;
LABEL_9:
    sub_21A7950C4(v50, &qword_2550F62C0);
    return;
  }
  v35 = v75;
  v36 = v81;
  v79 = *(_QWORD *)(v79 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v79)(v75, v27, v81);
  swift_beginAccess();
  v37 = v69;
  v38 = v76;
  v74(v69, v25, v76);
  v39 = v70;
  sub_21A7CF4D4();
  v72(v37, v38);
  sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
  v40 = sub_21A7CFDD4();
  v41 = v73;
  v73(v39, v36);
  v41(v35, v36);
  v42 = v71;
  sub_21A795080(v34, v71, &qword_2550F62C0);
  if ((v40 & 1) == 0)
  {
    sub_21A7950C4(v42, &qword_2550F62C0);
    sub_21A7950C4(v34, &qword_2550F62C0);
    v48 = v68;
    v49 = (uint64_t)v67;
    goto LABEL_7;
  }
  v43 = v75;
  v44 = v81;
  ((void (*)(char *, uint64_t, uint64_t))v79)(v75, v42 + *(int *)(v77 + 36), v81);
  swift_beginAccess();
  v45 = v76;
  v74(v37, v25, v76);
  sub_21A7CF558();
  v72(v37, v45);
  v46 = sub_21A7CFDD4();
  v47 = v73;
  v73(v39, v44);
  v47(v43, v44);
  sub_21A7950C4(v42, &qword_2550F62C0);
  sub_21A7950C4(v34, &qword_2550F62C0);
  v48 = v68;
  v49 = (uint64_t)v67;
  if ((v46 & 1) == 0)
  {
LABEL_7:
    sub_21A795080(v80, v49, &qword_2550F62C0);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v65 - 2) = v52;
    swift_getKeyPath();
    sub_21A7CFA80();
    swift_getKeyPath();
    v53 = v48 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
    v83[0] = v48;
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    v81 = v53;
    sub_21A7CF6CC();
    swift_release();
    swift_retain();
    v54 = v66;
    sub_21A7CFAA4();
    v55 = sub_21A7CFAB0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v54, 0, 1, v55);
    swift_beginAccess();
    sub_21A794FD4(&qword_2550F62D0, &qword_2550F62C0, MEMORY[0x24BEE1BC0]);
    v56 = (void (*)(_QWORD *, _QWORD))sub_21A7CF5A0();
    sub_21A7C75F0();
    sub_21A7CF5F4();
    v56(v83, 0);
    swift_endAccess();
    sub_21A7950C4(v49, &qword_2550F62C0);
    v57 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v58 = objc_msgSend(v57, sel_hoverTextTypingMisspelledTextColorData);

    if (!v58)
      return;
    v59 = sub_21A7CF63C();
    v61 = v60;

    sub_21A7915C0(v59, v61);
    sub_21A795080(v80, v49, &qword_2550F62C0);
    v62 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v62);
    *(&v65 - 2) = v63;
    swift_getKeyPath();
    swift_getKeyPath();
    v83[0] = v48;
    sub_21A7CF6CC();
    swift_release();
    v82 = *(_QWORD *)(v48 + 104);
    swift_beginAccess();
    swift_retain();
    v64 = (void (*)(_QWORD *, _QWORD))sub_21A7CF5A0();
    sub_21A791668();
    sub_21A7CF5F4();
    v64(v83, 0);
    swift_endAccess();
    v50 = v49;
    goto LABEL_9;
  }
}

uint64_t sub_21A7C30C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_21A7CFDD4() & 1;
}

void sub_21A7C311C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(_QWORD *, _QWORD);
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *, _QWORD);
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  void (*v45)(char *, uint64_t, uint64_t);
  void (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];

  v50 = a3;
  v4 = sub_21A7CFA98();
  MEMORY[0x24BDAC7A8](v4);
  v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73A8);
  MEMORY[0x24BDAC7A8](v6);
  v48 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62C0);
  MEMORY[0x24BDAC7A8](v52);
  v49 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v43 - v10;
  v12 = sub_21A7CF57C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21A7CF540();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v43 - v21;
  v23 = swift_projectBox();
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v46(v22, a1, v16);
  swift_beginAccess();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v53 = v23;
  v45 = v24;
  v24(v15, v23, v12);
  sub_21A7CF4D4();
  v44 = *(void (**)(char *, uint64_t))(v13 + 8);
  v44(v15, v12);
  sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
  LOBYTE(v23) = sub_21A7CFDD4();
  v25 = *(void (**)(char *, uint64_t))(v17 + 8);
  v25(v19, v16);
  v25(v22, v16);
  v51 = a1;
  sub_21A795080(a1, (uint64_t)v11, &qword_2550F62C0);
  if ((v23 & 1) != 0)
  {
    v46(v22, (uint64_t)&v11[*(int *)(v52 + 36)], v16);
    v26 = v53;
    swift_beginAccess();
    v45(v15, v26, v12);
    sub_21A7CF558();
    v44(v15, v12);
    v27 = sub_21A7CFDD4();
    v25(v19, v16);
    v25(v22, v16);
    sub_21A7950C4((uint64_t)v11, &qword_2550F62C0);
    v29 = (uint64_t)v49;
    v28 = v50;
    if ((v27 & 1) != 0)
      return;
  }
  else
  {
    sub_21A7950C4((uint64_t)v11, &qword_2550F62C0);
    v29 = (uint64_t)v49;
    v28 = v50;
  }
  sub_21A795080(v51, v29, &qword_2550F62C0);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v43 - 2) = v31;
  swift_getKeyPath();
  sub_21A7CFA8C();
  swift_getKeyPath();
  v55[0] = v28;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  swift_retain();
  v32 = v48;
  sub_21A7CFAA4();
  v33 = sub_21A7CFAB0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
  swift_beginAccess();
  sub_21A794FD4(&qword_2550F62D0, &qword_2550F62C0, MEMORY[0x24BEE1BC0]);
  v34 = (void (*)(_QWORD *, _QWORD))sub_21A7CF5A0();
  sub_21A7C75F0();
  sub_21A7CF5F4();
  v34(v55, 0);
  swift_endAccess();
  sub_21A7950C4(v29, &qword_2550F62C0);
  v35 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v36 = objc_msgSend(v35, sel_hoverTextTypingAutocorrectedTextColorData);

  if (v36)
  {
    v37 = sub_21A7CF63C();
    v39 = v38;

    sub_21A7915C0(v37, v39);
    sub_21A795080(v51, v29, &qword_2550F62C0);
    v40 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v40);
    *(&v43 - 2) = v41;
    swift_getKeyPath();
    swift_getKeyPath();
    v55[0] = v28;
    sub_21A7CF6CC();
    swift_release();
    v54 = *(_QWORD *)(v28 + 112);
    swift_beginAccess();
    swift_retain();
    v42 = (void (*)(_QWORD *, _QWORD))sub_21A7CF5A0();
    sub_21A791668();
    sub_21A7CF5F4();
    v42(v55, 0);
    swift_endAccess();
    sub_21A7950C4(v29, &qword_2550F62C0);
  }
}

uint64_t sub_21A7C3788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, _QWORD);
  uint64_t KeyPath;
  _QWORD v12[8];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62C0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A7CF57C();
  swift_projectBox();
  sub_21A795080(a1, (uint64_t)v7, &qword_2550F62C0);
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  v12[0] = a3;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  swift_retain();
  v8 = sub_21A7CFBD0();
  swift_release();
  v12[7] = v8;
  swift_beginAccess();
  sub_21A794FD4(&qword_2550F62D0, &qword_2550F62C0, MEMORY[0x24BEE1BC0]);
  v9 = (void (*)(_QWORD *, _QWORD))sub_21A7CF5A0();
  sub_21A791668();
  sub_21A7CF5F4();
  v9(v12, 0);
  swift_endAccess();
  return sub_21A7950C4((uint64_t)v7, &qword_2550F62C0);
}

uint64_t sub_21A7C3954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  v2 = sub_21A7CF750();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21A7CF738();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  v7 = sub_21A7CF744();
  v8 = sub_21A7CFF60();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v18 = v16;
    *(_DWORD *)v9 = 136315138;
    v15 = v9 + 4;
    swift_getKeyPath();
    v17 = v1;
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    sub_21A7CF6CC();
    swift_release();
    v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
    swift_bridgeObjectRetain();
    v17 = sub_21A79C3E4(v10, v11, &v18);
    sub_21A7D0074();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v7, v8, "[Hover Typing Store]: %s - Keyboard will hide. Hiding Hover Typing HUD", v9, 0xCu);
    v12 = v16;
    swift_arrayDestroy();
    MEMORY[0x22074950C](v12, -1, -1);
    MEMORY[0x22074950C](v9, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v15 - 2) = (uint8_t *)v1;
  *((_BYTE *)&v15 - 8) = 0;
  v18 = v1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7C3C40(char a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t result;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  uint64_t KeyPath;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;

  v2 = v1;
  v4 = sub_21A7CF540();
  v30 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v28 = (char *)v24 - v7;
  v25 = sub_21A7CF504();
  v27 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_21A7CF57C();
  v31 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v32 = v1;
  v33 = a1;
  v12 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v35 = v2;
  v13 = sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  v24[4] = MEMORY[0x24BEE4AE0] + 8;
  v14 = v13;
  sub_21A7CF6C0();
  result = swift_release();
  if ((a1 & 1) == 0)
  {
    swift_getKeyPath();
    v35 = v2;
    v24[2] = v12;
    v24[3] = v14;
    sub_21A7CF6CC();
    swift_release();
    v16 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    v24[1] = 0;
    v18 = v26;
    v17(v11, v16, v26);
    sub_21A7CF4C8();
    sub_21A791288(&qword_2550F5DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
    v19 = v28;
    v20 = v25;
    sub_21A7CFF30();
    v21 = v29;
    sub_21A7CFF3C();
    sub_21A791288(&qword_2550F5DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
    LOBYTE(v16) = sub_21A7CFDD4();
    v22 = *(void (**)(char *, uint64_t))(v30 + 8);
    v22(v21, v4);
    v22(v19, v4);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v20);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v18);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v24[-2] = v2;
    LOBYTE(v24[-1]) = (v16 & 1) == 0;
    v34 = v2;
    sub_21A7CF6C0();
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7C3FA4(void *a1)
{
  uint64_t v1;
  uint64_t result;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  __n128 v12;
  __n128 v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL4 v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  CGFloat v26;
  _BOOL4 v27;
  uint64_t KeyPath;
  uint64_t v29;
  CGPoint v30;
  CGPoint v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) == 1)
  {
    swift_getKeyPath();
    sub_21A7CF6CC();
    result = swift_release();
    if ((*(_BYTE *)(v1 + 209) & 1) == 0)
    {
      swift_getKeyPath();
      sub_21A7CF6CC();
      result = swift_release();
      if ((*(_BYTE *)(v1 + 210) & 1) == 0)
      {
        objc_msgSend(a1, sel_location);
        v5 = v4;
        v7 = v6;
        swift_getKeyPath();
        sub_21A7CF6CC();
        swift_release();
        v8 = *(double *)(v1 + 168);
        v9 = *(double *)(v1 + 176);
        v10 = *(double *)(v1 + 184);
        v11 = *(double *)(v1 + 192);
        v12.n128_f64[0] = v5;
        v13.n128_f64[0] = v7;
        sub_21A7C43CC(v12, v13);
        v30.x = v14;
        v30.y = v15;
        v32.origin.x = v8;
        v32.origin.y = v9;
        v32.size.width = v10;
        v32.size.height = v11;
        v16 = CGRectContainsPoint(v32, v30);
        swift_getKeyPath();
        sub_21A7CF6CC();
        swift_release();
        v17 = *(double *)(v1 + 136);
        v18 = *(double *)(v1 + 144);
        v19 = *(double *)(v1 + 152);
        v20 = *(double *)(v1 + 160);
        swift_getKeyPath();
        sub_21A7CF6CC();
        swift_release();
        v33.origin.x = v17;
        v33.origin.y = v18;
        v33.size.width = v19;
        v33.size.height = v20;
        v34 = CGRectOffset(v33, *(CGFloat *)(v1 + 120), 0.0);
        v35 = CGRectInset(v34, -10.0, -10.0);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
        v35.origin.x = v5;
        v35.origin.y = v7;
        sub_21A7C43CC((__n128)v35.origin, *(__n128 *)&v35.origin.y);
        v31.x = v25;
        v31.y = v26;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v27 = CGRectContainsPoint(v36, v31);
        if (objc_msgSend(a1, sel_isTouchDown))
        {
          KeyPath = swift_getKeyPath();
          MEMORY[0x24BDAC7A8](KeyPath);
          sub_21A7CF6C0();
          swift_release();
        }
        swift_getKeyPath();
        sub_21A7CF6CC();
        result = swift_release();
        if ((*(_BYTE *)(v1 + 208) & 1) == 0)
        {
          result = (uint64_t)objc_msgSend(a1, sel_isLift);
          if ((result & 1) != 0
            || (result = (uint64_t)objc_msgSend(a1, sel_isInRangeLift), (result & 1) != 0)
            || (result = (uint64_t)objc_msgSend(a1, sel_isInRange), (result & 1) != 0))
          {
            if (v16 || v27)
              return result;
          }
          else
          {
            result = (uint64_t)objc_msgSend(a1, sel_isCancel);
            if (((result ^ 1 | v16 | v27) & 1) != 0)
              return result;
          }
          v29 = swift_getKeyPath();
          MEMORY[0x24BDAC7A8](v29);
          sub_21A7CF6C0();
          return swift_release();
        }
      }
    }
  }
  return result;
}

uint64_t sub_21A7C43CC(__n128 a1, __n128 a2)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v6;

  v3 = *(_QWORD *)(v2 + 64);
  switch(v3)
  {
    case 2:
      a1.n128_f64[0] = (1.0 - a1.n128_f64[0]) * *(double *)(v2 + 16);
      a2.n128_f64[0] = (1.0 - a2.n128_f64[0]) * *(double *)(v2 + 24);
      break;
    case 3:
      v6 = *(double *)(v2 + 16) * a2.n128_f64[0];
      a2.n128_f64[0] = (1.0 - a1.n128_f64[0]) * *(double *)(v2 + 24);
      a1.n128_f64[0] = v6;
      break;
    case 4:
      v4 = (1.0 - a2.n128_f64[0]) * *(double *)(v2 + 16);
      a2.n128_f64[0] = *(double *)(v2 + 24) * a1.n128_f64[0];
      a1.n128_f64[0] = v4;
      break;
    default:
      a1.n128_f64[0] = *(double *)(v2 + 16) * a1.n128_f64[0];
      a2.n128_f64[0] = *(double *)(v2 + 24) * a2.n128_f64[0];
      break;
  }
  return CGPointMake(a1, a2);
}

uint64_t sub_21A7C444C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  swift_release();
  swift_release();

  sub_21A7950C4(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent, &qword_2550F7380);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  v2 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  v3 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v4 = sub_21A7CF6FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t sub_21A7C454C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_21A7A0688();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  sub_21A7950C4(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent, &qword_2550F7380);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  v2 = sub_21A7CF57C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  v3 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v4 = sub_21A7CF6FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_21A7C4670()
{
  sub_21A7C454C();
  return swift_deallocClassInstance();
}

uint64_t sub_21A7C4694()
{
  return type metadata accessor for HoverTypingStore();
}

uint64_t type metadata accessor for HoverTypingStore()
{
  uint64_t result;

  result = qword_2550F6B90;
  if (!qword_2550F6B90)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21A7C46D8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_21A7C4814();
  if (v0 <= 0x3F)
  {
    sub_21A7CF57C();
    if (v1 <= 0x3F)
    {
      sub_21A7CF6FC();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_21A7C4814()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550F6BA0)
  {
    type metadata accessor for HoverTextPresentationEvent();
    v0 = sub_21A7D0038();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550F6BA0);
  }
}

uint64_t sub_21A7C4868()
{
  return sub_21A7BD1E0();
}

uint64_t sub_21A7C4888()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible);
}

uint64_t sub_21A7C4914()
{
  return sub_21A7C493C();
}

uint64_t sub_21A7C4928()
{
  return sub_21A7C493C();
}

uint64_t sub_21A7C493C()
{
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return swift_retain();
}

uint64_t sub_21A7C49C8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode);
}

double sub_21A7C4A54()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  return *(double *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
}

uint64_t sub_21A7C4AE8()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v0, sel_hoverTextTypingDisplayMode);

  swift_getKeyPath();
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6C0();
  return swift_release();
}

uint64_t sub_21A7C4BC0()
{
  return sub_21A7BDF08();
}

uint64_t sub_21A7C4BE0()
{
  return sub_21A7BE638();
}

uint64_t sub_21A7C4C00()
{
  return sub_21A7C3954();
}

uint64_t sub_21A7C4C20(char a1)
{
  return sub_21A7C3C40(a1);
}

uint64_t sub_21A7C4C40(void *a1)
{
  return sub_21A7C3FA4(a1);
}

void sub_21A7C4C60(char a1)
{
  sub_21A7C0FAC(a1);
}

void sub_21A7C4C80(uint64_t a1)
{
  sub_21A7BF038(a1);
}

uint64_t sub_21A7C4CA0(char a1)
{
  return sub_21A7C0914(a1 & 1);
}

uint64_t sub_21A7C4CC4()
{
  return sub_21A7C0DAC();
}

void sub_21A7C4CEC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_21A7C4D04()
{
  return sub_21A7BCE78();
}

__n128 sub_21A7C4D28()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect;
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_21A7C4D48@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A7BC8C0(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__backgroundColor, a2);
}

uint64_t sub_21A7C4D6C()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7C4D90()
{
  return sub_21A791620(&OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__backgroundColor);
}

uint64_t sub_21A7C4DAC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A7BC8C0(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor, a2);
}

uint64_t sub_21A7C4DD0()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7C4DF4()
{
  return sub_21A791620(&OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
}

uint64_t sub_21A7C4E14()
{
  return sub_21A7BB954();
}

uint64_t sub_21A7C4E38()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  result = sub_21A7BCF34(v2);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) = v2;
  return result;
}

uint64_t sub_21A7C4E84()
{
  return sub_21A7BB954();
}

void sub_21A7C4EA8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 128) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_21A7C4EBC()
{
  return sub_21A7BB798();
}

double sub_21A7C4EE0()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 120) = result;
  return result;
}

uint64_t sub_21A7C4EF4()
{
  return sub_21A7BB954();
}

uint64_t sub_21A7C4F24()
{
  return sub_21A7BB798();
}

double sub_21A7C4F48()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 216) = result;
  return result;
}

uint64_t sub_21A7C4F5C()
{
  return sub_21A7BB798();
}

double sub_21A7C4F90()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 200) = result;
  return result;
}

void sub_21A7C4FA0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 210) = *(_BYTE *)(v0 + 24);
}

double sub_21A7C4FB8()
{
  double *v0;
  double *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  void (*v14)(char *, uint64_t);
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  double v51;
  double v52;
  double v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  double v64;
  double v65;
  double v66;
  id v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  id v81;
  char *v82;
  uint64_t v83;
  double *v84;
  double *v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v1 = v0;
  v2 = sub_21A7CF57C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v6 = (char *)v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v85 = v1;
  v7 = sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v8 = (char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v5, v8, v2);
  swift_getKeyPath();
  v83 = v7;
  v84 = v1;
  v82 = v6;
  sub_21A7CF6CC();
  swift_release();
  v10 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  v11 = *(id *)((char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_21A792278(v11);
  v13 = v12;

  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v5, v2);
  v15 = v13 + 2.0;
  v81 = (id)objc_opt_self();
  v16 = objc_msgSend(v81, sel_mainScreen);
  objc_msgSend(v16, sel_bounds);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v86.origin.x = UIEdgeInsetsInsetRect(v18, v20, v22, v24, v1[4], v1[5]);
  if (v15 >= CGRectGetWidth(v86) * 0.85)
  {
    v79 = v10;
    v80 = v14;
    v39 = v81;
    v40 = objc_msgSend(v81, (SEL)0x24DD25D13);
    objc_msgSend(v40, sel_bounds);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    v88.origin.x = UIEdgeInsetsInsetRect(v42, v44, v46, v48, v1[4], v1[5]);
    v49 = CGRectGetWidth(v88) * 0.85 * 0.5;
    swift_getKeyPath();
    v84 = v1;
    sub_21A7CF6CC();
    swift_release();
    if (v1[25] > 0.0)
    {
      swift_getKeyPath();
      v84 = v1;
      sub_21A7CF6CC();
      swift_release();
      v49 = v49 - v1[25];
      if (v49 < 0.0)
      {
        swift_getKeyPath();
        v84 = v1;
        sub_21A7CF6CC();
        swift_release();
        v9(v5, v8, v2);
        swift_getKeyPath();
        v84 = v1;
        sub_21A7CF6CC();
        swift_release();
        v50 = *(id *)((char *)v1 + v79);
        sub_21A792278(v50);
        v52 = v51;

        v80(v5, v2);
        swift_getKeyPath();
        v84 = v1;
        sub_21A7CF6CC();
        swift_release();
        v53 = v52 + 2.0 - v1[25];
        v54 = objc_msgSend(v39, sel_mainScreen);
        objc_msgSend(v54, sel_bounds);
        v56 = v55;
        v58 = v57;
        v60 = v59;
        v62 = v61;

        v89.origin.x = UIEdgeInsetsInsetRect(v56, v58, v60, v62, v1[4], v1[5]);
        v49 = 0.0;
        if (v53 < CGRectGetWidth(v89) * 0.85 * 0.5)
        {
          swift_getKeyPath();
          v84 = v1;
          sub_21A7CF6CC();
          swift_release();
          v9(v5, v8, v2);
          swift_getKeyPath();
          v84 = v1;
          sub_21A7CF6CC();
          swift_release();
          v63 = *(id *)((char *)v1 + v79);
          sub_21A792278(v63);
          v65 = v64;

          v80(v5, v2);
          v66 = v65 + 2.0;
          v67 = objc_msgSend(v39, sel_mainScreen);
          objc_msgSend(v67, sel_bounds);
          v69 = v68;
          v71 = v70;
          v73 = v72;
          v75 = v74;

          v90.origin.x = UIEdgeInsetsInsetRect(v69, v71, v73, v75, v1[4], v1[5]);
          v76 = v66 + CGRectGetWidth(v90) * -0.85 * 0.5;
          swift_getKeyPath();
          v84 = v1;
          sub_21A7CF6CC();
          swift_release();
          v49 = v76 - v1[25];
        }
      }
    }
    return v49 + -1.0;
  }
  else
  {
    swift_getKeyPath();
    v84 = v1;
    sub_21A7CF6CC();
    swift_release();
    v9(v5, v8, v2);
    swift_getKeyPath();
    v84 = v1;
    sub_21A7CF6CC();
    swift_release();
    v25 = *(id *)((char *)v1 + v10);
    sub_21A792278(v25);
    v27 = v26;

    v14(v5, v2);
    v28 = v27 + 2.0;
    v29 = objc_msgSend(v81, sel_mainScreen);
    objc_msgSend(v29, sel_bounds);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v87.origin.x = UIEdgeInsetsInsetRect(v31, v33, v35, v37, v1[4], v1[5]);
    v38 = v28 + CGRectGetWidth(v87) * -0.85 * 0.5;
    swift_getKeyPath();
    v84 = v1;
    sub_21A7CF6CC();
    swift_release();
    if (v1[25] > 0.0)
    {
      swift_getKeyPath();
      v84 = v1;
      sub_21A7CF6CC();
      swift_release();
      return v38 - v1[25];
    }
  }
  return v38;
}

void sub_21A7C570C(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  const __CTFont *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v26 = sub_21A7CF57C();
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v28 = v2;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  swift_release();
  v9 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  v10 = (const __CTFont *)*(id *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  CTFontGetAscent(v10);
  CTFontGetDescent(v10);
  CTFontGetLeading(v10);

  v11 = CGRectMake_0();
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA48]), sel_initWithFrame_, v11, v12, v13, v14);
  sub_21A79E2D4(0, &qword_2550F73A0);
  swift_getKeyPath();
  v28 = v2;
  sub_21A7CF6CC();
  swift_release();
  v16 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v26);
  v17 = (void *)sub_21A7D0008();
  objc_msgSend(v15, sel_setAttributedText_, v17);

  swift_getKeyPath();
  v27 = v3;
  sub_21A7CF6CC();
  swift_release();
  objc_msgSend(v15, sel_setFont_, *(_QWORD *)(v3 + v9));
  objc_msgSend(v15, sel_setNeedsLayout);
  objc_msgSend(v15, sel_layoutIfNeeded);
  v18 = objc_msgSend(v15, sel_characterRangeAtPoint_, a1, a2);
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(v15, sel_beginningOfDocument);
    v21 = objc_msgSend(v19, sel_start);
    v22 = objc_msgSend(v15, sel_offsetFromPosition_toPosition_, v20, v21);

    v23 = objc_msgSend(v19, sel_start);
    v24 = objc_msgSend(v19, sel_end);
    objc_msgSend(v15, sel_offsetFromPosition_toPosition_, v23, v24);

    if (__OFADD__(v22, 1))
    {
      __break(1u);
    }
    else
    {

    }
  }
  else
  {

  }
}

uint64_t sub_21A7C5A98()
{
  return sub_21A7BC24C();
}

__n128 sub_21A7C5ABC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  __n128 result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 40);
  result = *(__n128 *)(v0 + 24);
  *(__n128 *)(v1 + 232) = result;
  *(_BYTE *)(v1 + 248) = v2;
  return result;
}

void sub_21A7C5AD4(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_msgSend((id)objc_opt_self(), sel_primaryApp);
  if (v4)
  {
    v11 = v4;
    v5 = objc_msgSend(v4, sel_firstResponder);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, sel_uiElement);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, sel_setAXAttribute_withRange_, 2005, a1, a2);

        v9 = v6;
        v6 = v8;
      }
      else
      {
        v9 = v11;
      }

      v10 = v6;
    }
    else
    {
      v10 = v11;
    }

  }
}

uint64_t sub_21A7C5BB8()
{
  return swift_deallocObject();
}

void sub_21A7C5BC8()
{
  uint64_t v0;

  sub_21A7C5AD4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_21A7C5BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[2] = a4;
  v4[3] = type metadata accessor for HoverTextPresentationEvent();
  v4[4] = swift_task_alloc();
  sub_21A7CFF00();
  v4[5] = sub_21A7CFEF4();
  sub_21A7CFEE8();
  return swift_task_switch();
}

uint64_t sub_21A7C5C78()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _OWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(int **)(v0 + 24);
  swift_release();
  *(_BYTE *)(v1 + 50) = 12;
  sub_21A7CF510();
  v3 = (_QWORD *)(v1 + v2[8]);
  *v3 = 0;
  v3[1] = 0;
  v4 = (_OWORD *)(v1 + v2[9]);
  *v4 = 0u;
  v4[1] = 0u;
  v5 = v1 + v2[10];
  *(_QWORD *)v5 = 0;
  *(_BYTE *)(v5 + 8) = 1;
  v6 = (_QWORD *)(v1 + v2[11]);
  *v6 = 0;
  v6[1] = 0;
  *(_QWORD *)(v1 + v2[12]) = 0;
  *(_QWORD *)(v1 + v2[13]) = 0;
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 16) = 8;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 48) = 320;
  sub_21A7BF038(v1);
  sub_21A79178C(v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A7C5D4C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7C5D78(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A7B1F1C;
  return sub_21A7C5BE8(a1, v4, v5, v6);
}

double CGRectMake_0()
{
  return 0.0;
}

uint64_t sub_21A7C5DF8()
{
  uint64_t v0;

  return sub_21A7BC578(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21A7C5E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7C5E5C()
{
  return sub_21A7BB954();
}

uint64_t sub_21A7C5E84()
{
  return sub_21A7BCE78();
}

uint64_t sub_21A7C5EB4()
{
  return sub_21A7BB954();
}

void sub_21A7C5ED8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 208) = *(_BYTE *)(v0 + 24);
}

__n128 sub_21A7C5EE8()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16);
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)(v1 + 168) = result;
  *(_OWORD *)(v1 + 184) = v3;
  return result;
}

void sub_21A7C5F00()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 209) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_21A7C5F18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  double *v5;
  double v6;
  double v7;
  char *v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  void (*v13)(char *, uint64_t);
  double v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t KeyPath;
  double v41;
  double v42;
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, char *, uint64_t);
  double *v45;
  double *v46;
  CGRect v47;
  CGRect v48;

  v0 = sub_21A7CF57C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = (double *)result;
    sub_21A7B9454();
    v7 = v6 + 10.0;
    swift_getKeyPath();
    v46 = v5;
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    sub_21A7CF6CC();
    swift_release();
    v8 = (char *)v5 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    v44 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    v44(v3, v8, v0);
    swift_getKeyPath();
    v45 = v5;
    sub_21A7CF6CC();
    swift_release();
    v9 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
    v10 = *(id *)((char *)v5 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_21A792278(v10);
    v12 = v11;

    v13 = *(void (**)(char *, uint64_t))(v1 + 8);
    v13(v3, v0);
    v14 = v12 + 2.0;
    v15 = (void *)objc_opt_self();
    v16 = objc_msgSend(v15, sel_mainScreen);
    objc_msgSend(v16, sel_bounds);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v47.origin.x = UIEdgeInsetsInsetRect(v18, v20, v22, v24, v5[4], v5[5]);
    if (v7 <= v14 + CGRectGetWidth(v47) * -0.85)
    {
      swift_getKeyPath();
      v45 = v5;
      sub_21A7CF6CC();
      swift_release();
      v45 = v5;
      swift_getKeyPath();
      sub_21A7CF6E4();
      swift_release();
      v5[27] = v5[27] + 10.0;
      v45 = v5;
      swift_getKeyPath();
      sub_21A7CF6D8();
    }
    else
    {
      swift_getKeyPath();
      v43 = v13;
      v45 = v5;
      sub_21A7CF6CC();
      swift_release();
      v44(v3, v8, v0);
      swift_getKeyPath();
      v45 = v5;
      sub_21A7CF6CC();
      swift_release();
      v25 = *(id *)((char *)v5 + v9);
      sub_21A792278(v25);
      v27 = v26;

      v43(v3, v0);
      v28 = v27 + 2.0;
      v29 = objc_msgSend(v15, sel_mainScreen);
      objc_msgSend(v29, sel_bounds);
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;

      v48.origin.x = UIEdgeInsetsInsetRect(v31, v33, v35, v37, v5[4], v5[5]);
      v38 = v28 + CGRectGetWidth(v48) * -0.85;
      v39 = v38 - sub_21A7B9590();
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      *(&v43 - 2) = (void (*)(char *, uint64_t))v5;
      *((double *)&v43 - 1) = v39;
      v45 = v5;
      sub_21A7CF6C0();
    }
    swift_release();
    sub_21A7C63EC();
    v42 = v41;
    swift_getKeyPath();
    v45 = v5;
    sub_21A7CF6CC();
    swift_release();
    sub_21A7B9B7C(0, v42, v5[27]);
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7C63EC()
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
  uint64_t result;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  id v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD v27[3];
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = v0;
  v2 = sub_21A7CF750();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21A7CF5E8();
  MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21A7CF504();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_21A7CF57C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v11 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  v39 = v1;
  sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
  sub_21A7CF6CC();
  result = swift_release();
  if ((*(_BYTE *)(v1 + 312) & 1) == 0)
  {
    v28 = *(_QWORD *)(v1 + 296);
    v27[1] = *(_QWORD *)(v1 + 304);
    swift_getKeyPath();
    v39 = v1;
    v27[2] = v11;
    sub_21A7CF6CC();
    swift_release();
    v13 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
    sub_21A7CF4C8();
    v14 = *(void (**)(char *, uint64_t))(v8 + 8);
    v14(v10, v7);
    sub_21A791288(&qword_2550F7398, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2A8]);
    sub_21A7CFE7C();
    result = sub_21A7CFE28();
    if (result < 0)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      return result;
    }
    if ((v28 & 0x8000000000000000) == 0 && result >= v28)
    {
      sub_21A7CFE34();
      sub_21A7CFE88();
      swift_bridgeObjectRelease();
      sub_21A7CF5DC();
      sub_21A7CF594();
      swift_getKeyPath();
      v38 = v1;
      sub_21A7CF6CC();
      swift_release();
      v15 = *(id *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
      sub_21A792278(v15);

      v14(v10, v7);
      swift_getKeyPath();
      v38 = v1;
      sub_21A7CF6CC();
      return swift_release();
    }
    v16 = sub_21A7CF738();
    swift_beginAccess();
    v17 = v30;
    v18 = v31;
    v19 = v16;
    v20 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v19, v32);
    swift_bridgeObjectRetain();
    v21 = sub_21A7CF744();
    v22 = sub_21A7CFF78();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v37 = v24;
      *(_DWORD *)v23 = 136315394;
      result = sub_21A7CFE28();
      if ((result & 0x8000000000000000) == 0)
      {
        v35 = result;
        v36 = 0;
        v33 = 0;
        v34 = 0xE000000000000000;
        sub_21A7D0170();
        sub_21A7CFE40();
        sub_21A7D0170();
        v33 = sub_21A79C3E4(v33, v34, &v37);
        sub_21A7D0074();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2080;
        v25 = sub_21A7D002C();
        v33 = sub_21A79C3E4(v25, v26, &v37);
        sub_21A7D0074();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21A787000, v21, v22, "Display string range %s does not contain selected text range %s", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22074950C](v24, -1, -1);
        MEMORY[0x22074950C](v23, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v32);
      }
      goto LABEL_12;
    }

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v17, v20);
  }
  return result;
}

uint64_t sub_21A7C6998()
{
  uint64_t result;
  uint64_t v1;
  double v2;
  uint64_t KeyPath;
  double v4;
  double v5;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    sub_21A7B9454();
    if (v2 + -10.0 >= 0.0)
    {
      swift_getKeyPath();
      sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
      sub_21A7CF6CC();
      swift_release();
      swift_getKeyPath();
      sub_21A7CF6E4();
      swift_release();
      *(double *)(v1 + 216) = *(double *)(v1 + 216) + -10.0;
      swift_getKeyPath();
      sub_21A7CF6D8();
    }
    else
    {
      sub_21A7B9590();
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
      sub_21A7CF6C0();
    }
    swift_release();
    sub_21A7C63EC();
    v5 = v4;
    swift_getKeyPath();
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    sub_21A7CF6CC();
    swift_release();
    sub_21A7B9B7C(0, v5, *(double *)(v1 + 216));
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7C6BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t), uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t result;
  unint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  void (*v52)(char *, uint64_t);
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  void (*v60)(char *, char *, uint64_t);
  uint64_t v61;
  char *v62;
  uint64_t v63;
  _QWORD v64[3];
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  void (*v72)(uint64_t);
  char *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[48];

  v71 = a8;
  v64[2] = a3;
  v64[1] = a2;
  v12 = sub_21A7CF504();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62A8);
  MEMORY[0x24BDAC7A8](v68);
  v70 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v66 = (char *)v64 - v18;
  v19 = sub_21A7CF540();
  v20 = *(_QWORD **)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v73 = (char *)v64 - v24;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62C0);
  MEMORY[0x24BDAC7A8](v65);
  v67 = (char *)v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v69 = (uint64_t)v64 - v27;
  *(_QWORD *)&v76 = a5;
  *((_QWORD *)&v76 + 1) = a6;
  swift_bridgeObjectRetain();
  sub_21A7D00EC();
  v28 = *(_QWORD *)(a1 + 16);
  v72 = a7;
  if (v28 && (v29 = sub_21A7CCD50((uint64_t)v78), (v30 & 1) != 0))
  {
    sub_21A79E24C(*(_QWORD *)(a1 + 56) + 32 * v29, (uint64_t)&v76);
  }
  else
  {
    v76 = 0u;
    v77 = 0u;
  }
  sub_21A7C76CC((uint64_t)v78);
  v31 = *((_QWORD *)&v77 + 1);
  result = sub_21A7950C4((uint64_t)&v76, &qword_2550F6930);
  if (v31)
  {
    v74 = a5;
    v75 = a6;
    swift_bridgeObjectRetain();
    sub_21A7D00EC();
    if (*(_QWORD *)(a1 + 16) && (v33 = sub_21A7CCD50((uint64_t)v78), (v34 & 1) != 0))
    {
      sub_21A79E24C(*(_QWORD *)(a1 + 56) + 32 * v33, (uint64_t)&v76);
    }
    else
    {
      v76 = 0u;
      v77 = 0u;
    }
    sub_21A7C76CC((uint64_t)v78);
    if (!*((_QWORD *)&v77 + 1))
      return sub_21A7950C4((uint64_t)&v76, &qword_2550F6930);
    result = swift_dynamicCast();
    if ((result & 1) != 0 && v74 == 1)
    {
      if (sub_21A7CFE04() == a5 && v35 == a6)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        v37 = v73;
        sub_21A7CF4D4();
        sub_21A7CF558();
        sub_21A791288(&qword_2550F62C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
        result = sub_21A7CFDC8();
        if ((result & 1) != 0)
        {
          v38 = v68;
          v39 = v66;
          v40 = &v66[*(int *)(v68 + 48)];
          v41 = (void (*)(char *, char *, uint64_t))v20[4];
          v41(v66, v37, v19);
          v41(v40, v22, v19);
          v42 = v70;
          v43 = &v70[*(int *)(v38 + 48)];
          v44 = (void (*)(char *, char *, uint64_t))v20[2];
          v44(v70, v39, v19);
          v45 = v40;
          v44(v43, v40, v19);
          v46 = (uint64_t)v67;
          v41(v67, v42, v19);
          v47 = (void (*)(char *, uint64_t))v20[1];
          v47(v43, v19);
          v48 = &v42[*(int *)(v38 + 48)];
          v41(v42, v39, v19);
          v41(v48, v45, v19);
          v41((char *)(v46 + *(int *)(v65 + 36)), v48, v19);
          v47(v42, v19);
          v49 = v69;
          sub_21A7C7700(v46, v69);
          v72(v49);
          return sub_21A7950C4(v49, &qword_2550F62C0);
        }
        __break(1u);
        goto LABEL_24;
      }
      v36 = sub_21A7D023C();
      swift_bridgeObjectRelease();
      if ((v36 & 1) != 0)
        goto LABEL_18;
      sub_21A7CF4C8();
      sub_21A7CF4D4();
      v50 = v73;
      sub_21A7CF4EC();
      v51 = (void (*)(char *, uint64_t))v20[1];
      v51(v22, v19);
      v52 = *(void (**)(char *, uint64_t))(v13 + 8);
      v52(v15, v12);
      sub_21A7CF4C8();
      sub_21A7CF4EC();
      v52(v15, v12);
      sub_21A791288(&qword_2550F62C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
      v53 = v50;
      result = sub_21A7CFDC8();
      if ((result & 1) == 0)
      {
LABEL_24:
        __break(1u);
        return result;
      }
      v54 = v68;
      v55 = v66;
      v56 = &v66[*(int *)(v68 + 48)];
      v57 = (void (*)(char *, char *, uint64_t))v20[2];
      v57(v66, v53, v19);
      v57(v56, v22, v19);
      v58 = v70;
      v59 = &v70[*(int *)(v54 + 48)];
      v57(v70, v55, v19);
      v57(v59, v56, v19);
      v60 = (void (*)(char *, char *, uint64_t))v20[4];
      v61 = (uint64_t)v67;
      v60(v67, v58, v19);
      v51(v59, v19);
      v62 = &v58[*(int *)(v54 + 48)];
      v60(v58, v55, v19);
      v60(v62, v56, v19);
      v60((char *)(v61 + *(int *)(v65 + 36)), v62, v19);
      v51(v58, v19);
      v63 = v69;
      sub_21A7C7700(v61, v69);
      v72(v63);
      sub_21A7950C4(v63, &qword_2550F62C0);
      v51(v22, v19);
      return ((uint64_t (*)(char *, uint64_t))v51)(v73, v19);
    }
  }
  return result;
}

uint64_t sub_21A7C724C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;

  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v9 = sub_21A7CFDB0();
  swift_retain();
  v8(v9, a3, a4, a5);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A7C72DC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[4];
  v2 = (_QWORD *)(v0[2] + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  *v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A7C7324@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21A7BC8C0(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor, a2);
}

uint64_t sub_21A7C7348()
{
  return sub_21A7BB0C0();
}

void sub_21A7C736C()
{
  sub_21A7CF4B0();
  __break(1u);
}

void sub_21A7C7388()
{
  sub_21A791668();
  sub_21A7CF60C();
  __break(1u);
}

uint64_t sub_21A7C73AC()
{
  return 8;
}

uint64_t sub_21A7C73B8()
{
  return swift_release();
}

uint64_t sub_21A7C73C0(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_21A7C73CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A7C30C8(a1, a2, a3, &qword_2550F73C8) & 1;
}

uint64_t sub_21A7C73EC(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2550F73C8);
}

_QWORD *sub_21A7C73F8(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_21A7C7404()
{
  sub_21A7CF4BC();
  __break(1u);
}

void sub_21A7C7420()
{
  sub_21A7916EC();
  sub_21A7CF60C();
  __break(1u);
}

uint64_t sub_21A7C7444()
{
  return 8;
}

uint64_t sub_21A7C7450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A7C30C8(a1, a2, a3, &qword_2550F73C0) & 1;
}

uint64_t sub_21A7C7470(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2550F73C0);
}

void sub_21A7C7480(uint64_t a1)
{
  uint64_t v1;

  sub_21A7C2844(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_21A7C7494(uint64_t a1)
{
  uint64_t v1;

  sub_21A7C311C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t objectdestroy_116Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7C74D0(uint64_t a1)
{
  uint64_t v1;

  return sub_21A7C3788(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t objectdestroy_119Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21A7CF57C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21A7C7558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_21A7CF57C();
  return sub_21A7C6BE8(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(void (**)(uint64_t))(v4 + 32), *(_QWORD *)(v4 + 40));
}

void sub_21A7C75D4()
{
  sub_21A7CF4A4();
  __break(1u);
}

unint64_t sub_21A7C75F0()
{
  unint64_t result;

  result = qword_2550F73B0;
  if (!qword_2550F73B0)
  {
    result = MEMORY[0x220749464](MEMORY[0x24BDEAC70], MEMORY[0x24BDEAC80]);
    atomic_store(result, (unint64_t *)&qword_2550F73B0);
  }
  return result;
}

void sub_21A7C7634()
{
  sub_21A7C75F0();
  sub_21A7CF60C();
  __break(1u);
}

uint64_t sub_21A7C7658()
{
  return 8;
}

uint64_t sub_21A7C7664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A7C30C8(a1, a2, a3, &qword_2550F73B8) & 1;
}

uint64_t sub_21A7C7684(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2550F73B8);
}

uint64_t sub_21A7C7694()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7C76B8()
{
  return sub_21A7C7814();
}

uint64_t sub_21A7C76CC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21A7C7700(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F62C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7C774C()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7C7770()
{
  return sub_21A7C77DC();
}

uint64_t sub_21A7C7784()
{
  return sub_21A791620(&OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor);
}

uint64_t sub_21A7C77A4()
{
  return sub_21A7BB0C0();
}

uint64_t sub_21A7C77C8()
{
  return sub_21A7C784C();
}

uint64_t sub_21A7C77DC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 104) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_21A7C7814()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 112) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_21A7C784C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 96) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_21A7C7884()
{
  return sub_21A7C0EF8();
}

uint64_t sub_21A7C78A4()
{
  uint64_t v0;

  return sub_21A7C0B60(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21A7C78C0()
{
  return sub_21A7C0D04();
}

uint64_t sub_21A7C78CC()
{
  return sub_21A7BC24C();
}

__n128 sub_21A7C78F0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  __n128 result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 40);
  result = *(__n128 *)(v0 + 24);
  *(__n128 *)(v1 + 296) = result;
  *(_BYTE *)(v1 + 312) = v2;
  return result;
}

uint64_t sub_21A7C790C()
{
  return sub_21A7C03F0();
}

void sub_21A7C7924()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont) = v2;
  v4 = v2;

}

void sub_21A7C7960()
{
  uint64_t v0;

  sub_21A7BE820(v0);
}

uint64_t sub_21A7C7968()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21A7C799C()
{
  uint64_t v0;

  return sub_21A7BEB44(*(_QWORD *)(v0 + 16), *(id *)(v0 + 24), *(void **)(v0 + 32));
}

void sub_21A7C79A8()
{
  uint64_t v0;

  sub_21A7BDF1C(v0);
}

uint64_t sub_21A7C79B0()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7C79DC()
{
  uint64_t v0;

  return sub_21A7BE2D0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

void sub_21A7C79E8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) = *(_BYTE *)(v0 + 24);
}

void sub_21A7C7A08()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + 272);
  *(_QWORD *)(v1 + 272) = v2;
  v4 = v2;

}

uint64_t sub_21A7C7A40()
{
  return sub_21A7BB798();
}

double sub_21A7C7A64()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 224) = result;
  return result;
}

uint64_t sub_21A7C7A74()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A7C7A98()
{
  return sub_21A7C6998();
}

uint64_t sub_21A7C7AA0()
{
  return sub_21A7C5F18();
}

double sub_21A7C7AA8()
{
  return sub_21A7C4EE0();
}

double sub_21A7C7ABC()
{
  return sub_21A7C4F90();
}

double sub_21A7C7AD0()
{
  return sub_21A7C7A64();
}

double sub_21A7C7AE4()
{
  return sub_21A7C4F48();
}

uint64_t sub_21A7C7B00()
{
  return sub_21A7C4E38();
}

void sub_21A7C7B1C()
{
  sub_21A7C4CEC();
}

double sub_21A7C7B5C()
{
  double result;

  *(_QWORD *)&result = sub_21A7C5ABC().n128_u64[0];
  return result;
}

double sub_21A7C7B70()
{
  double result;

  *(_QWORD *)&result = sub_21A7C78F0().n128_u64[0];
  return result;
}

double sub_21A7C7B84()
{
  double result;

  *(_QWORD *)&result = sub_21A7C4D28().n128_u64[0];
  return result;
}

void sub_21A7C7B98()
{
  sub_21A7C7A08();
}

uint64_t sub_21A7C7BD0()
{
  return sub_21A7C5DF8();
}

double sub_21A7C7BE4()
{
  double result;

  *(_QWORD *)&result = sub_21A7C5EE8().n128_u64[0];
  return result;
}

void sub_21A7C7BF8()
{
  sub_21A7C4EA8();
}

void sub_21A7C7C0C()
{
  sub_21A7C5ED8();
}

void sub_21A7C7C20()
{
  sub_21A7C5F00();
}

void sub_21A7C7C34()
{
  sub_21A7C4FA0();
}

uint64_t destroy for HUDStyle()
{
  return swift_release();
}

_OWORD *initializeWithCopy for HUDStyle(_OWORD *a1, _OWORD *a2)
{
  __int128 v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for HUDStyle(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = a2[3];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = v3;
  return a1;
}

_OWORD *assignWithTake for HUDStyle(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for HUDStyle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HUDStyle(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HUDStyle()
{
  return &type metadata for HUDStyle;
}

uint64_t sub_21A7C7DA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A7C7DB8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
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
  double v59;
  char *v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t);
  unsigned int v75;
  char *v76;
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
  _QWORD *v88;
  _QWORD *v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v87 = a3;
  v88 = a2;
  v85 = a1;
  v82 = a4;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73D8);
  MEMORY[0x24BDAC7A8](v86);
  v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73E0);
  MEMORY[0x24BDAC7A8](v84);
  v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_21A7CF924();
  MEMORY[0x24BDAC7A8](v83);
  v13 = (double *)((char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73E8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73F0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73F8);
  MEMORY[0x24BDAC7A8](v73);
  v21 = (char *)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7400);
  MEMORY[0x24BDAC7A8](v77);
  v76 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7408);
  MEMORY[0x24BDAC7A8](v79);
  v78 = (uint64_t)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7410);
  MEMORY[0x24BDAC7A8](v81);
  v80 = (char *)&v73 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_21A7CFA5C();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7418);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v16, v85, v26);
  v27 = &v16[*(int *)(v14 + 36)];
  *v27 = v25;
  *(_OWORD *)(v27 + 8) = 0u;
  *(_OWORD *)(v27 + 24) = 0u;
  v27[40] = 1;
  v85 = *v88;
  *(_QWORD *)&v93 = v88;
  v28 = (*(uint64_t (**)(void))(v87 + 120))();
  v29 = sub_21A7CFA5C();
  sub_21A795080((uint64_t)v16, (uint64_t)v19, &qword_2550F73E8);
  v30 = &v19[*(int *)(v17 + 36)];
  *(_QWORD *)v30 = v28;
  v30[8] = v29;
  sub_21A7950C4((uint64_t)v16, &qword_2550F73E8);
  v31 = v83;
  v32 = (char *)v13 + *(int *)(v83 + 20);
  v33 = *MEMORY[0x24BDEEB68];
  v34 = sub_21A7CF990();
  v35 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104);
  v75 = v33;
  v35(v32, v33, v34);
  v74 = v35;
  *v13 = a5;
  v13[1] = a5;
  v36 = (uint64_t)&v21[*(int *)(v73 + 36)];
  sub_21A7C8548((uint64_t)v13, v36);
  *(_WORD *)(v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F7420) + 36)) = 256;
  sub_21A795080((uint64_t)v19, (uint64_t)v21, &qword_2550F73F0);
  sub_21A7C858C((uint64_t)v13);
  sub_21A7950C4((uint64_t)v19, &qword_2550F73F0);
  v35((char *)v13 + *(int *)(v31 + 20), v33, v34);
  *v13 = a5;
  v13[1] = a5;
  sub_21A7CF810();
  sub_21A7C8548((uint64_t)v13, (uint64_t)v9);
  v37 = &v9[*(int *)(v86 + 36)];
  v38 = v91;
  *(_OWORD *)v37 = v90;
  *((_OWORD *)v37 + 1) = v38;
  *((_QWORD *)v37 + 4) = v92;
  sub_21A7C858C((uint64_t)v13);
  *(_QWORD *)&v93 = v88;
  v39 = (*(uint64_t (**)(uint64_t))(v87 + 96))(v85);
  sub_21A795080((uint64_t)v9, (uint64_t)v11, &qword_2550F73D8);
  v40 = v84;
  *(_QWORD *)&v11[*(int *)(v84 + 52)] = v39;
  *(_WORD *)&v11[*(int *)(v40 + 56)] = 256;
  sub_21A7950C4((uint64_t)v9, &qword_2550F73D8);
  v41 = sub_21A7CFCA8();
  v43 = v42;
  v44 = (uint64_t)v76;
  v45 = (uint64_t)&v76[*(int *)(v77 + 36)];
  sub_21A795080((uint64_t)v11, v45, &qword_2550F73E0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7428);
  v46 = (uint64_t *)(v45 + *(int *)(v77 + 36));
  *v46 = v41;
  v46[1] = v43;
  sub_21A795080((uint64_t)v21, v44, &qword_2550F73F8);
  sub_21A7950C4((uint64_t)v11, &qword_2550F73E0);
  sub_21A7950C4((uint64_t)v21, &qword_2550F73F8);
  LOBYTE(v43) = sub_21A7CFA5C();
  sub_21A7CF7BC();
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v55 = v44;
  v56 = v44;
  v57 = v78;
  sub_21A795080(v55, v78, &qword_2550F7400);
  v58 = v57 + *(int *)(v79 + 36);
  *(_BYTE *)v58 = v43;
  *(_QWORD *)(v58 + 8) = v48;
  *(_QWORD *)(v58 + 16) = v50;
  *(_QWORD *)(v58 + 24) = v52;
  *(_QWORD *)(v58 + 32) = v54;
  *(_BYTE *)(v58 + 40) = 0;
  sub_21A7950C4(v56, &qword_2550F7400);
  v59 = a5 + a6;
  v74((char *)v13 + *(int *)(v83 + 20), v75, v34);
  *v13 = v59;
  v13[1] = v59;
  sub_21A7CF810();
  sub_21A7C8548((uint64_t)v13, (uint64_t)v9);
  v60 = &v9[*(int *)(v86 + 36)];
  v61 = v94;
  *(_OWORD *)v60 = v93;
  *((_OWORD *)v60 + 1) = v61;
  *((_QWORD *)v60 + 4) = v95;
  sub_21A7C858C((uint64_t)v13);
  v62 = sub_21A7CFBAC();
  sub_21A795080((uint64_t)v9, (uint64_t)v11, &qword_2550F73D8);
  v63 = v84;
  *(_QWORD *)&v11[*(int *)(v84 + 52)] = v62;
  *(_WORD *)&v11[*(int *)(v63 + 56)] = 256;
  sub_21A7950C4((uint64_t)v9, &qword_2550F73D8);
  v64 = sub_21A7CFCA8();
  v66 = v65;
  v67 = (uint64_t)v80;
  v68 = (uint64_t)&v80[*(int *)(v81 + 36)];
  sub_21A795080((uint64_t)v11, v68, &qword_2550F73E0);
  v69 = (uint64_t *)(v68 + *(int *)(v77 + 36));
  *v69 = v64;
  v69[1] = v66;
  sub_21A795080(v57, v67, &qword_2550F7408);
  sub_21A7950C4((uint64_t)v11, &qword_2550F73E0);
  sub_21A7950C4(v57, &qword_2550F7408);
  v89 = v88;
  v70 = (*(uint64_t (**)(uint64_t))(v87 + 16))(v85);
  v71 = v82;
  sub_21A795080(v67, v82, &qword_2550F7410);
  *(_QWORD *)(v71 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550F7430) + 52)) = v70;
  return sub_21A7950C4(v67, &qword_2550F7410);
}

uint64_t sub_21A7C853C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21A7C7DB8(a1, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), a2, *(double *)v2, *(double *)(v2 + 8));
}

uint64_t sub_21A7C8548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A7CF924();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7C858C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A7CF924();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21A7C85CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550F7438;
  if (!qword_2550F7438)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F7430);
    result = MEMORY[0x220749464](MEMORY[0x24BDF44C8], v1);
    atomic_store(result, (unint64_t *)&qword_2550F7438);
  }
  return result;
}

uint64_t HoverTextRootView.body.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  double v17;
  uint64_t v18;
  char v19;
  char *v20;
  uint64_t v22;
  uint64_t *v23;

  v22 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7440);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7448);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7450);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = sub_21A7CF9A8();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7458);
  sub_21A7C880C(a1, a2, &v7[*(int *)(v14 + 44)]);
  v15 = *a1;
  v23 = a1;
  v16 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
  if ((v16(v15, a2) & 1) != 0)
    v17 = 1.0;
  else
    v17 = 0.0;
  sub_21A795080((uint64_t)v7, (uint64_t)v10, &qword_2550F7440);
  *(double *)&v10[*(int *)(v8 + 36)] = v17;
  sub_21A7950C4((uint64_t)v7, &qword_2550F7440);
  v18 = sub_21A7CFD08();
  v23 = a1;
  v19 = v16(v15, a2);
  sub_21A795080((uint64_t)v10, (uint64_t)v13, &qword_2550F7448);
  v20 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v20 = v18;
  v20[8] = v19 & 1;
  sub_21A7950C4((uint64_t)v10, &qword_2550F7448);
  return sub_21A7C8E58((uint64_t)v13, v22);
}

uint64_t sub_21A7C880C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double (*v17)(uint64_t, uint64_t);
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t (*v71)(uint64_t, uint64_t, __n128);
  uint64_t v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL4 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _OWORD v87[9];
  char v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _OWORD v100[3];

  v82 = a3;
  v69 = sub_21A7CFA08();
  MEMORY[0x24BDAC7A8](v69);
  v66 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_21A7CF7EC();
  v74 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v65 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7488);
  v8 = *(_QWORD *)(v7 - 8);
  v80 = v7;
  v81 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v67 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7490);
  v79 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v63 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7498);
  v76 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v68 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v70 = (char *)&v56 - v14;
  v15 = *a1;
  *(_QWORD *)&v89 = a1;
  v71 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a2 + 144);
  v16 = v71(v15, a2, v13);
  v77 = v16 != 1;
  v73 = v16 == 1;
  *(_QWORD *)&v89 = a1;
  v17 = *(double (**)(uint64_t, uint64_t))(a2 + 192);
  swift_retain();
  v64 = v15;
  v18 = v17(v15, a2);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = sub_21A7C8F28(a1, a2);
  v27 = v26;
  v29 = v28;
  swift_retain();
  sub_21A7C9008((uint64_t)&v89);
  swift_release();
  v61 = v90;
  v62 = v89;
  v59 = v92;
  v60 = v91;
  v57 = v94;
  v58 = v93;
  v56 = v95;
  v30 = v96;
  v88 = v29 & 1;
  *(_QWORD *)&v89 = a1;
  v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(v15, a2);
  *(_QWORD *)&v83 = a1;
  *((_QWORD *)&v83 + 1) = a2;
  *(double *)&v84 = v18;
  *((_QWORD *)&v84 + 1) = v20;
  *(_QWORD *)&v85 = v22;
  *((_QWORD *)&v85 + 1) = v24;
  *(_QWORD *)&v86 = v25;
  *((_QWORD *)&v86 + 1) = v27;
  LOBYTE(v87[0]) = v88;
  *(_OWORD *)((char *)v87 + 8) = v62;
  *(_OWORD *)((char *)&v87[1] + 8) = v61;
  *(_OWORD *)((char *)&v87[2] + 8) = v60;
  *(_OWORD *)((char *)&v87[3] + 8) = v59;
  *(_OWORD *)((char *)&v87[4] + 8) = v58;
  *(_OWORD *)((char *)&v87[5] + 8) = v57;
  *(_OWORD *)((char *)&v87[6] + 8) = v56;
  *((_QWORD *)&v87[7] + 1) = v30;
  *(_QWORD *)&v87[8] = 0;
  BYTE8(v87[8]) = v31 & 1;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = a1;
  *(_QWORD *)(v32 + 24) = a2;
  swift_retain();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F74A0);
  v34 = sub_21A7C943C(&qword_2550F74A8, &qword_2550F74A0, (uint64_t (*)(void))sub_21A7C94C0);
  sub_21A7CFAF8();
  swift_release();
  v99 = v87[6];
  v100[0] = v87[7];
  *(_OWORD *)((char *)v100 + 9) = *(_OWORD *)((char *)&v87[7] + 9);
  v95 = v87[2];
  v96 = v87[3];
  v97 = v87[4];
  v98 = v87[5];
  v91 = v85;
  v92 = v86;
  v93 = v87[0];
  v94 = v87[1];
  v89 = v83;
  v90 = v84;
  sub_21A7C955C((uint64_t)&v89);
  sub_21A7CFA20();
  v35 = v65;
  sub_21A7CF7C8();
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = a1;
  *(_QWORD *)(v36 + 24) = a2;
  sub_21A791288(&qword_2550F6348, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB540], MEMORY[0x24BDEB530]);
  swift_retain();
  v37 = v67;
  v38 = v72;
  sub_21A7CFC84();
  swift_release();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v35, v38);
  sub_21A7CF804();
  *(_QWORD *)&v83 = v33;
  *((_QWORD *)&v83 + 1) = v34;
  swift_getOpaqueTypeConformance2();
  sub_21A794FD4(&qword_2550F74E0, &qword_2550F7488, MEMORY[0x24BDEC410]);
  v39 = v68;
  v40 = v37;
  v41 = v75;
  v42 = v80;
  v43 = v63;
  sub_21A7CFB58();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v40, v42);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v43, v41);
  v44 = v76;
  v45 = v70;
  v46 = v78;
  (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v70, v39, v78);
  *(_QWORD *)&v83 = a1;
  v47 = ((uint64_t (*)(uint64_t, uint64_t))v71)(v64, a2);
  LOBYTE(v30) = v47 != 0;
  LOBYTE(a2) = v47 == 0;
  v48 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  v49 = v44;
  v48(v39, v45, v46);
  v50 = v82;
  *v82 = 0;
  *((_BYTE *)v50 + 8) = v73;
  *((_BYTE *)v50 + 9) = v77;
  v51 = (char *)v50;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F74E8);
  v48(&v51[*(int *)(v52 + 48)], v39, v46);
  v53 = &v51[*(int *)(v52 + 64)];
  *(_QWORD *)v53 = 0;
  v53[8] = a2;
  v53[9] = v30;
  v54 = *(void (**)(char *, uint64_t))(v49 + 8);
  v54(v45, v46);
  return ((uint64_t (*)(char *, uint64_t))v54)(v39, v46);
}

uint64_t sub_21A7C8E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A7C8EA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A7C8EB0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;
  double v6;

  result = sub_21A7CF7D4();
  if (v6 <= 0.0)
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a3 + 288))(0, *a2, a3);
  if (v6 >= 0.0)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 288))(1, *a2, a3);
  return result;
}

uint64_t sub_21A7C8F28(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v6;

  v3 = *a1;
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 144);
  if (((uint64_t (*)(_QWORD))v4)(*a1) == 2 || v4(v3, a2) == 3)
    return 0x3FE0000000000000;
  if (!v4(v3, a2))
  {
    sub_21A7CFD20();
    return v6;
  }
  if (v4(v3, a2) == 1)
  {
    sub_21A7CFD14();
    return v6;
  }
  return 0;
}

uint64_t sub_21A7C9008@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v20;
  uint64_t v22;

  type metadata accessor for HoverTypingStore();
  v2 = swift_dynamicCastClass();
  if (v2)
  {
    swift_getKeyPath();
    sub_21A791288((unint64_t *)&qword_2550F5FA8, (uint64_t (*)(uint64_t))type metadata accessor for HoverTypingStore, (uint64_t)&unk_21A7D29E0);
    swift_retain_n();
    sub_21A7CF6CC();
    swift_release();
    v22 = *(_QWORD *)(v2 + 120);
    sub_21A7CFD2C();
    v4 = v3;
    v6 = v5;
    swift_release();
    v7 = v4;
    v8 = v6;
    v9 = 0x3FF0000000000000;
    v10 = &off_24DD22710;
    v11 = 0x4008000000000000;
    v12 = 0x4024000000000000;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v22 = 0;
    v9 = 0;
    v7 = 0;
    v8 = 0;
  }
  type metadata accessor for HoverTextStore();
  v13 = swift_dynamicCastClass();
  if (v13)
  {
    v14 = v13;
    swift_retain();
    __asm { FMOV            V0.2D, #10.0 }
    *(_QWORD *)&_Q0 = v14;
    v20 = xmmword_21A7D3000;
  }
  else
  {
    _Q0 = 0uLL;
    v20 = 0uLL;
  }
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v12;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v22;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_OWORD *)(a1 + 88) = _Q0;
  *(_OWORD *)(a1 + 104) = v20;
  sub_21A7C9644(v2);
  return sub_21A7C9610(v2);
}

uint64_t sub_21A7C91EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return HoverTextRootView.body.getter(*(uint64_t **)v1, *(_QWORD *)(v1 + 8), a1);
}

_OWORD *initializeBufferWithCopyOfBuffer for HoverTextRootView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for HoverTextRootView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = v3;
  return a1;
}

_OWORD *assignWithTake for HoverTextRootView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextRootView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HoverTextRootView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HoverTextRootView()
{
  return &type metadata for HoverTextRootView;
}

uint64_t sub_21A7C9330()
{
  return sub_21A7C943C(&qword_2550F7460, &qword_2550F7450, (uint64_t (*)(void))sub_21A7C935C);
}

unint64_t sub_21A7C935C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F7468;
  if (!qword_2550F7468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F7448);
    v2[0] = sub_21A794FD4(&qword_2550F7470, &qword_2550F7440, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F7468);
  }
  return result;
}

uint64_t sub_21A7C93E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A7C9404()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 296))(**(_QWORD **)(v0 + 16));
}

uint64_t sub_21A7C943C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = sub_21A794FD4(&qword_2550F7478, &qword_2550F7480, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x220749464](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21A7C94C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550F74B0;
  if (!qword_2550F74B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550F74B8);
    v2[0] = sub_21A794FD4(&qword_2550F74C0, &qword_2550F74C8, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_21A794FD4(&qword_2550F74D0, &qword_2550F74D8, MEMORY[0x24BDF5428]);
    result = MEMORY[0x220749464](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550F74B0);
  }
  return result;
}

uint64_t sub_21A7C955C(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 72);
  swift_release();
  sub_21A7C9610(v2);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_21A7C9610(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_21A7C963C(uint64_t a1)
{
  uint64_t v1;

  return sub_21A7C8EB0(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21A7C9644(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21A7C9680()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_21A7D02A8();
  sub_21A7D02CC();
  sub_21A7D02CC();
  sub_21A7D02C0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21A7CFE1C();
    swift_bridgeObjectRelease();
  }
  return sub_21A7D02E4();
}

uint64_t sub_21A7C9720()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_21A7D02CC();
  sub_21A7D02CC();
  if (!v1)
    return sub_21A7D02C0();
  sub_21A7D02C0();
  swift_bridgeObjectRetain();
  sub_21A7CFE1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A7C979C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_21A7D02A8();
  sub_21A7D02CC();
  sub_21A7D02CC();
  sub_21A7D02C0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21A7CFE1C();
    swift_bridgeObjectRelease();
  }
  return sub_21A7D02E4();
}

uint64_t sub_21A7C9838(uint64_t *a1, uint64_t *a2)
{
  return sub_21A7CE8F8(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_21A7C9854()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t result;
  _QWORD aBlock[6];

  v1 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor);
  v3 = v2;
  if (v2 != (void *)1)
  {
LABEL_6:
    sub_21A7CF1B8(v2);
    return (uint64_t)v3;
  }
  v4 = *MEMORY[0x24BE00908];
  if ((v4 & 0x80000000) == 0)
  {
    v5 = objc_allocWithZone(MEMORY[0x24BE00618]);
    v6 = (void *)sub_21A7CFDE0();
    v3 = objc_msgSend(v5, sel_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_, v6, v4, 0, 0);

    if (v3)
    {
      objc_msgSend(v3, sel_setHIDEventFilterMask_, 67);
      v7 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_21A7CF1EC;
      aBlock[5] = v7;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_21A7C9FDC;
      aBlock[3] = &block_descriptor_16;
      v8 = _Block_copy(aBlock);
      swift_release();
      objc_msgSend(v3, sel_setHIDEventHandler_, v8);
      _Block_release(v8);
    }
    v9 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v10 = v3;
    sub_21A7CF1A8(v9);
    goto LABEL_6;
  }
  result = sub_21A7D01AC();
  __break(1u);
  return result;
}

uint64_t sub_21A7C9A10(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const void *v24;
  id v25;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t aBlock;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  void (*v34)();
  uint64_t v35;

  v4 = sub_21A7CFD50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21A7CFD74();
  v9 = *(void (***)(_QWORD, _QWORD))(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v12 = a1;
    v13 = objc_msgSend(v12, sel_handInfo);
    if (v13 && (v14 = v13, v15 = objc_msgSend(v13, sel_isStylus), v14, v15))
    {
      sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
      v16 = (void *)sub_21A7CFFE4();
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = a2;
      *(_QWORD *)(v17 + 24) = v12;
      v34 = sub_21A7CF23C;
      v35 = v17;
      aBlock = MEMORY[0x24BDAC760];
      v31 = 1107296256;
      v32 = sub_21A7A6A18;
      v33 = &block_descriptor_34;
      v18 = _Block_copy(&aBlock);
      v29 = v8;
      v19 = v18;
      v28 = v12;
      swift_retain();
      swift_release();
      sub_21A7CFD5C();
      aBlock = MEMORY[0x24BEE4AF8];
      sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
      sub_21A7CF254((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0);
      sub_21A7D00BC();
      MEMORY[0x220748A50](0, v11, v7, v19);
      _Block_release(v19);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      ((void (**)(char *, uint64_t))v9)[1](v11, v29);
    }
    else
    {
      if (objc_msgSend(v12, sel_type) == 10 || objc_msgSend(v12, sel_type) == 11)
      {
        sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
        v20 = (void *)sub_21A7CFFE4();
        v21 = swift_allocObject();
        *(_QWORD *)(v21 + 16) = a2;
        *(_QWORD *)(v21 + 24) = v12;
        v34 = sub_21A7CF204;
        v35 = v21;
        aBlock = MEMORY[0x24BDAC760];
        v31 = 1107296256;
        v22 = &block_descriptor_28;
      }
      else
      {
        if (objc_msgSend(v12, sel_type) != 3001)
        {

          return 0;
        }
        sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
        v20 = (void *)sub_21A7CFFE4();
        v27 = swift_allocObject();
        *(_QWORD *)(v27 + 16) = a2;
        *(_QWORD *)(v27 + 24) = v12;
        v34 = sub_21A7CF1F8;
        v35 = v27;
        aBlock = MEMORY[0x24BDAC760];
        v31 = 1107296256;
        v22 = &block_descriptor_22;
      }
      v32 = sub_21A7A6A18;
      v33 = v22;
      v23 = _Block_copy(&aBlock);
      v28 = v9;
      v29 = v8;
      v24 = v23;
      v25 = v12;
      swift_retain();
      swift_release();
      sub_21A7CFD5C();
      aBlock = MEMORY[0x24BEE4AF8];
      sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
      sub_21A7CF254((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0);
      sub_21A7D00BC();
      MEMORY[0x220748A50](0, v11, v7, v24);
      _Block_release(v24);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      (*((void (**)(char *, uint64_t))v28 + 1))(v11, v29);
    }
  }
  return 0;
}

void sub_21A7C9E90(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22074959C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_21A7CBE14(a2);

  }
}

void sub_21A7C9EE8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22074959C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(a2, sel_type);
    sub_21A7CEB74(a2);

  }
}

void sub_21A7C9F50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void (*v6)(uint64_t);

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22074959C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(void (**)(uint64_t))(v4 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
    if (v6)
    {
      swift_retain();
      v6(a2);
      sub_21A7B9364((uint64_t)v6);
    }

  }
}

uint64_t sub_21A7C9FDC(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void *);
  id v4;

  v3 = *(uint64_t (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(a2) = v3(a2);
  swift_release();

  return a2 & 1;
}

void sub_21A7CA030()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedEventManager);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_registerEventHandler_, v0);

    v3 = sub_21A7C9854();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = (id)sub_21A7CFDE0();
      objc_msgSend(v4, sel_beginHandlingHIDEventsForReason_, v5);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_21A7CA0E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2 + 64;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v2 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v7)
      goto LABEL_21;
    v16 = *(_QWORD *)(v3 + 8 * v15);
    ++v8;
    if (!v16)
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v7)
        goto LABEL_21;
      v16 = *(_QWORD *)(v3 + 8 * v8);
      if (!v16)
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v7)
          goto LABEL_21;
        v16 = *(_QWORD *)(v3 + 8 * v8);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v6 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    v11 = (unint64_t *)(*(_QWORD *)(v2 + 48) + 24 * v10);
    v13 = v11[1];
    v12 = v11[2];
    v14 = *v11;
    swift_bridgeObjectRetain();
    sub_21A7CAB5C(v14, v13, v12);
    swift_bridgeObjectRelease();
  }
  v17 = v15 + 3;
  if (v17 < v7)
  {
    v16 = *(_QWORD *)(v3 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        v8 = v17 + 1;
        if (__OFADD__(v17, 1))
          break;
        if (v8 >= v7)
          goto LABEL_21;
        v16 = *(_QWORD *)(v3 + 8 * v8);
        ++v17;
        if (v16)
          goto LABEL_20;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    v8 = v17;
    goto LABEL_20;
  }
LABEL_21:
  swift_release();
  v18 = objc_msgSend((id)objc_opt_self(), sel_sharedEventManager);
  if (!v18)
    goto LABEL_27;
  v19 = v18;
  objc_msgSend(v18, sel_unregisterEventHandler_, v0);

  v20 = sub_21A7C9854();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (void *)sub_21A7CFDE0();
    objc_msgSend(v21, sel_endHandlingHIDEventsForReason_, v22);

  }
}

void sub_21A7CA304(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  unsigned int v39;
  id v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49[3];

  v3 = sub_21A7CF750();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v42 - v8;
  v10 = (unint64_t)objc_msgSend(a1, sel__contextId);
  v11 = HTDisplayIDForWindow(a1);
  v12 = objc_msgSend(a1, sel_screen);
  v13 = objc_msgSend(v12, sel_displayConfiguration);

  if (!v13)
  {
    __break(1u);
    return;
  }
  v14 = objc_msgSend(v13, sel_hardwareIdentifier);

  v46 = v14;
  if (v14)
  {
    v47 = sub_21A7CFE04();
    v14 = v15;
  }
  else
  {
    v47 = 0;
  }
  v16 = (uint64_t *)(v1 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  swift_beginAccess();
  if (!*(_QWORD *)(*v16 + 16))
  {
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21A7CCC94(v10 | (unint64_t)(v11 << 32), v47, (uint64_t)v14);
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v27 = sub_21A7CF72C();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v27, v3);
    swift_bridgeObjectRetain();
    v28 = sub_21A7CF744();
    v29 = sub_21A7CFF90();
    v30 = os_log_type_enabled(v28, v29);
    v44 = v11;
    if (v30)
    {
      v31 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      v43 = v4;
      v33 = v32;
      v49[0] = v32;
      *(_DWORD *)v31 = 67109634;
      LODWORD(v48) = v10;
      v45 = v10;
      sub_21A7D0074();
      *(_WORD *)(v31 + 8) = 1024;
      LODWORD(v48) = v11;
      sub_21A7D0074();
      *(_WORD *)(v31 + 14) = 2080;
      if (v14)
        v34 = v47;
      else
        v34 = 0x3E6C696E3CLL;
      v42 = v3;
      if (v14)
        v35 = (unint64_t)v14;
      else
        v35 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      v36 = v34;
      v10 = v45;
      v48 = sub_21A79C3E4(v36, v35, v49);
      sub_21A7D0074();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21A787000, v28, v29, "Begin tapping mouse events contextID=%u displayID=%u displayHardwareID=%s", (uint8_t *)v31, 0x18u);
      swift_arrayDestroy();
      MEMORY[0x22074950C](v33, -1, -1);
      MEMORY[0x22074950C](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v42);
      if ((_DWORD)v10)
        goto LABEL_25;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      if ((_DWORD)v10)
      {
LABEL_25:
        v37 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
        v38 = v46;
        v39 = v10;
        v40 = objc_msgSend(v37, sel_requestGlobalMouseEventsForDisplay_targetContextID_, v46, v10);

        swift_beginAccess();
        swift_unknownObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v48 = *v16;
        *v16 = 0x8000000000000000;
        sub_21A7CE0DC((uint64_t)v40, v39 | (unint64_t)(v44 << 32), v47, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
        *v16 = v48;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_unknownObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();

    return;
  }
  v45 = v10;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v18 = sub_21A7CF72C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v18, v3);
  swift_bridgeObjectRetain();
  v19 = sub_21A7CF744();
  v20 = sub_21A7CFF90();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = v11;
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v49[0] = v23;
    *(_DWORD *)v22 = 67109634;
    LODWORD(v48) = v45;
    sub_21A7D0074();
    *(_WORD *)(v22 + 8) = 1024;
    LODWORD(v48) = v21;
    sub_21A7D0074();
    *(_WORD *)(v22 + 14) = 2080;
    if (v14)
      v24 = v47;
    else
      v24 = 0x3E6C696E3CLL;
    v25 = v3;
    if (v14)
      v26 = (unint64_t)v14;
    else
      v26 = 0xE500000000000000;
    v43 = v4;
    swift_bridgeObjectRetain();
    v48 = sub_21A79C3E4(v24, v26, v49);
    sub_21A7D0074();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v19, v20, "Tapping mouse events already occuring for contextID=%u displayID=%u displayHardwareID=%s", (uint8_t *)v22, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x22074950C](v23, -1, -1);
    MEMORY[0x22074950C](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v25);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t sub_21A7CA97C(void *a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t *v3;
  uint64_t result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v2 = objc_msgSend(a1, sel__contextId);
  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  result = swift_beginAccess();
  v5 = 0;
  v6 = *v3;
  v7 = 1 << *(_BYTE *)(*v3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v10 = *(_QWORD *)(v6 + 64);
  v9 = v6 + 64;
  v11 = v8 & v10;
  v12 = (unint64_t)(v7 + 63) >> 6;
  while (v11)
  {
    v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v14 = v13 | (v5 << 6);
LABEL_5:
    v15 = *(_QWORD *)(*v3 + 48);
    if (*(_DWORD *)(v15 + 24 * v14) == v2)
    {
      v19 = v15 + 24 * v14;
      v21 = *(_QWORD *)(v19 + 8);
      v20 = *(_QWORD *)(v19 + 16);
      v22 = v2 | ((unint64_t)*(unsigned int *)(v19 + 4) << 32);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      sub_21A7CAB5C(v22, v21, v20);
      swift_unknownObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  v16 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v16 >= v12)
    return result;
  v17 = *(_QWORD *)(v9 + 8 * v16);
  ++v5;
  if (v17)
    goto LABEL_24;
  v5 = v16 + 1;
  if (v16 + 1 >= v12)
    return result;
  v17 = *(_QWORD *)(v9 + 8 * v5);
  if (v17)
    goto LABEL_24;
  v5 = v16 + 2;
  if (v16 + 2 >= v12)
    return result;
  v17 = *(_QWORD *)(v9 + 8 * v5);
  if (v17)
    goto LABEL_24;
  v5 = v16 + 3;
  if (v16 + 3 >= v12)
    return result;
  v17 = *(_QWORD *)(v9 + 8 * v5);
  if (v17)
    goto LABEL_24;
  v5 = v16 + 4;
  if (v16 + 4 >= v12)
    return result;
  v17 = *(_QWORD *)(v9 + 8 * v5);
  if (v17)
  {
LABEL_24:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v5 << 6);
    goto LABEL_5;
  }
  v18 = v16 + 5;
  if (v18 >= v12)
    return result;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
  {
    v5 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    v5 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v5 >= v12)
      return result;
    v17 = *(_QWORD *)(v9 + 8 * v5);
    ++v18;
    if (v17)
      goto LABEL_24;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21A7CAB5C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];

  v4 = v3;
  v8 = sub_21A7CF750();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21A7CF72C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_bridgeObjectRetain_n();
  v13 = sub_21A7CF744();
  v14 = sub_21A7CFF90();
  v15 = os_log_type_enabled(v13, v14);
  v34 = a1;
  v35 = a2;
  if (v15)
  {
    v16 = a2;
    v33 = v4;
    v17 = HIDWORD(a1);
    v18 = a1;
    v19 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v37[0] = v32;
    *(_DWORD *)v19 = 67109634;
    LODWORD(v36) = v18;
    sub_21A7D0074();
    *(_WORD *)(v19 + 8) = 1024;
    LODWORD(v36) = v17;
    sub_21A7D0074();
    *(_WORD *)(v19 + 14) = 2080;
    if (a3)
      v20 = v16;
    else
      v20 = 0x3E6C696E3CLL;
    if (a3)
      v21 = a3;
    else
      v21 = 0xE500000000000000;
    swift_bridgeObjectRetain();
    v36 = sub_21A79C3E4(v20, v21, v37);
    v4 = v33;
    sub_21A7D0074();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21A787000, v13, v14, "Stop tapping mouse events contextID=%u displayID=%u displayHardwareID=%s", (uint8_t *)v19, 0x18u);
    v22 = v32;
    swift_arrayDestroy();
    MEMORY[0x22074950C](v22, -1, -1);
    MEMORY[0x22074950C](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v23 = (uint64_t *)(v4 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  result = swift_beginAccess();
  v25 = *v23;
  if (*(_QWORD *)(*v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27 = v34;
    v26 = v35;
    v28 = sub_21A7CCC94(v34, v35, a3);
    if ((v29 & 1) != 0)
    {
      v30 = *(void **)(*(_QWORD *)(v25 + 56) + 8 * v28);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v30, sel_invalidate);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_21A7CD304(v27, v26, a3);
      swift_endAccess();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_21A7CAEA8(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double Current;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[7];

  v3 = sub_21A7CFD50();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A7CFD74();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Current = CFAbsoluteTimeGetCurrent();
  v12 = *(_QWORD *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange];
  if (v12 && Current - *(double *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastMouseEventTime] > 0.25)
  {
    v37 = v3;
    v39 = v8;
    v40 = v7;
    v41 = v4;
    v13 = *(_QWORD *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange + 8];
    *(double *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastMouseEventTime] = Current;
    v14 = (uint64_t *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams];
    swift_beginAccess();
    v15 = *v14;
    swift_bridgeObjectRetain();
    v38 = v13;
    sub_21A7B9360(v12);
    v16 = a1;
    v17 = sub_21A7CEED8(v15, a1);
    v19 = v18;
    swift_bridgeObjectRelease();

    if (v19)
    {
      v20 = HIDWORD(v17);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if (a1)
        goto LABEL_5;
    }
    else
    {
      LODWORD(v20) = 0;
      if (a1)
      {
LABEL_5:
        v21 = objc_msgSend(v16, sel_pointerControllerInfo);
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v21, sel_pointerX);
          v24 = v23;

          v25 = objc_msgSend(v16, sel_pointerControllerInfo);
          if (v25)
          {
            v26 = v25;
            v27 = swift_allocObject();
            objc_msgSend(v26, sel_pointerY);
            v29 = v28;

            *(_QWORD *)(v27 + 16) = v24;
            *(_QWORD *)(v27 + 24) = v29;
            v30 = *(void **)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_axHandlerQueue];
            v31 = swift_allocObject();
            *(_QWORD *)(v31 + 16) = v27;
            *(_QWORD *)(v31 + 24) = a1;
            *(_DWORD *)(v31 + 32) = v20;
            *(_QWORD *)(v31 + 40) = v1;
            *(_QWORD *)(v31 + 48) = v12;
            *(_QWORD *)(v31 + 56) = v38;
            aBlock[4] = sub_21A7CF13C;
            aBlock[5] = v31;
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_21A7A6A18;
            aBlock[3] = &block_descriptor_7;
            v32 = _Block_copy(aBlock);
            sub_21A7B9360(v12);
            v33 = v16;
            v34 = v30;
            swift_retain();
            v35 = v1;
            sub_21A7CFD5C();
            v42 = MEMORY[0x24BEE4AF8];
            sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
            sub_21A7CF254((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0);
            v36 = v37;
            sub_21A7D00BC();
            MEMORY[0x220748A50](0, v10, v6, v32);
            _Block_release(v32);

            sub_21A7B9364(v12);
            (*(void (**)(char *, uint64_t))(v41 + 8))(v6, v36);
            (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v40);
            swift_release();
            swift_release();
            return;
          }
LABEL_12:
          __break(1u);
          return;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

id sub_21A7CB254(uint64_t a1, void *a2, unsigned int a3, void *a4, uint64_t a5, uint64_t a6)
{
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
  char *v20;
  id result;
  void *v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  _QWORD *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  id v49;
  id v50;
  _QWORD *v51;
  NSObject *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  int v56;
  unsigned int v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  _QWORD *p_isa;
  id v83;
  char *v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  _QWORD v88[9];

  v75 = a4;
  v76 = a6;
  v74 = a5;
  v86 = a3;
  v8 = sub_21A7CFD50();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21A7CFD74();
  v78 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v77 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21A7CF750();
  v85 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v84 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v79 = (char *)&v69 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v69 - v19;
  result = objc_msgSend((id)objc_opt_self(), sel_server);
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v22 = result;
  v72 = v12;
  v73 = v11;
  result = (id)swift_beginAccess();
  if (!a2)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  v24 = *(double *)(a1 + 16);
  v23 = *(double *)(a1 + 24);
  v25 = objc_msgSend(a2, sel_contextId);
  objc_msgSend(v22, sel_convertPoint_fromContextId_displayId_, v25, v86, v24, v23);
  v27 = v26;
  v29 = v28;

  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = v27;
  *(_QWORD *)(a1 + 24) = v29;
  v30 = sub_21A7CF72C();
  swift_beginAccess();
  v81 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
  v81(v20, v30, v14);
  swift_retain_n();
  v31 = a2;
  v83 = v20;
  v32 = sub_21A7CF744();
  v33 = sub_21A7CFF6C();
  v34 = os_log_type_enabled(v32, v33);
  v80 = v14;
  v70 = v9;
  v71 = v8;
  p_isa = &v31->isa;
  if (v34)
  {
    v35 = swift_slowAlloc();
    *(_DWORD *)v35 = 134218752;
    swift_beginAccess();
    v88[0] = *(_QWORD *)(a1 + 16);
    sub_21A7D0074();
    *(_WORD *)(v35 + 12) = 2048;
    swift_beginAccess();
    v88[0] = *(_QWORD *)(a1 + 24);
    sub_21A7D0074();
    swift_release_n();
    *(_WORD *)(v35 + 22) = 1024;
    v36 = -[NSObject contextId](v31, sel_contextId);

    LODWORD(v88[0]) = v36;
    v14 = v80;
    sub_21A7D0074();

    *(_WORD *)(v35 + 28) = 1024;
    v37 = v86;
    LODWORD(v88[0]) = v86;
    sub_21A7D0074();
    _os_log_impl(&dword_21A787000, v32, v33, "Find element at pointer point={%f %f} contextID=%u displayID=%u", (uint8_t *)v35, 0x22u);
    MEMORY[0x22074950C](v35, -1, -1);
    v38 = v37;
  }
  else
  {

    swift_release_n();
    v32 = v31;
    v38 = v86;
  }

  v85 = *(_QWORD *)(v85 + 8);
  ((void (*)(id, uint64_t))v85)(v83, v14);
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  swift_beginAccess();
  v39 = objc_msgSend((id)objc_opt_self(), sel_elementAtCoordinate_withVisualPadding_displayID_, 0, v38, *(double *)(a1 + 16), *(double *)(a1 + 24));
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  if (v39)
  {
    swift_beginAccess();
    v81(v84, v30, v14);
    swift_retain_n();
    v40 = v39;
    v41 = p_isa;
    v42 = v40;
    v43 = v41;
    v83 = v42;
    v44 = sub_21A7CF744();
    v45 = sub_21A7CFF6C();
    v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      v47 = swift_slowAlloc();
      p_isa = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v47 = 134219010;
      swift_beginAccess();
      v88[0] = *(_QWORD *)(a1 + 16);
      LODWORD(v81) = v46;
      sub_21A7D0074();
      swift_release_n();
      *(_WORD *)(v47 + 12) = 2048;
      swift_beginAccess();
      v88[0] = *(_QWORD *)(a1 + 24);
      sub_21A7D0074();
      swift_release_n();
      *(_WORD *)(v47 + 22) = 1024;
      v48 = -[NSObject contextId](v43, sel_contextId);

      LODWORD(v88[0]) = v48;
      sub_21A7D0074();

      *(_WORD *)(v47 + 28) = 1024;
      LODWORD(v88[0]) = v86;
      sub_21A7D0074();
      *(_WORD *)(v47 + 34) = 2112;
      v49 = v83;
      v88[0] = v83;
      v50 = v83;
      v14 = v80;
      sub_21A7D0074();
      v51 = p_isa;
      *p_isa = v39;

      _os_log_impl(&dword_21A787000, v44, (os_log_type_t)v81, "Element found at pointer point={%f %f} contextID=%u displayID=%u element=%@", (uint8_t *)v47, 0x2Cu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F7620);
      swift_arrayDestroy();
      MEMORY[0x22074950C](v51, -1, -1);
      MEMORY[0x22074950C](v47, -1, -1);
    }
    else
    {

      v49 = v83;
      swift_release_n();

      v44 = v43;
    }

    ((void (*)(char *, uint64_t))v85)(v84, v14);
    sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
    v58 = (void *)sub_21A7CFFE4();
    v59 = (_QWORD *)swift_allocObject();
    v60 = v74;
    v61 = v75;
    v59[2] = v49;
    v59[3] = v61;
    v62 = v76;
    v59[4] = v60;
    v59[5] = v62;
    v88[4] = sub_21A7CF19C;
    v88[5] = v59;
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 1107296256;
    v88[2] = sub_21A7A6A18;
    v88[3] = &block_descriptor_10;
    v63 = _Block_copy(v88);
    v64 = v49;
    v65 = v61;
    swift_retain();
    swift_release();
    v66 = v77;
    sub_21A7CFD5C();
    v88[0] = MEMORY[0x24BEE4AF8];
    sub_21A791288(&qword_2550F66D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F67A0);
    sub_21A7CF254((unint64_t *)&qword_2550F66D8, (uint64_t *)&unk_2550F67A0);
    v67 = v73;
    v68 = v71;
    sub_21A7D00BC();
    MEMORY[0x220748A50](0, v66, v67, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v68);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v66, v72);
  }
  else
  {
    swift_beginAccess();
    v81(v79, v30, v14);
    swift_retain_n();
    v52 = p_isa;
    v53 = sub_21A7CF744();
    v54 = sub_21A7CFF6C();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc();
      *(_DWORD *)v55 = 134218752;
      swift_beginAccess();
      v88[6] = *(_QWORD *)(a1 + 16);
      sub_21A7D0074();
      *(_WORD *)(v55 + 12) = 2048;
      swift_beginAccess();
      v87 = *(_QWORD *)(a1 + 24);
      sub_21A7D0074();
      swift_release_n();
      *(_WORD *)(v55 + 22) = 1024;
      v56 = v38;
      v57 = -[NSObject contextId](v52, sel_contextId);

      LODWORD(v87) = v57;
      v14 = v80;
      sub_21A7D0074();

      *(_WORD *)(v55 + 28) = 1024;
      LODWORD(v87) = v56;
      sub_21A7D0074();
      _os_log_impl(&dword_21A787000, v53, v54, "No element found at pointer point={%f %f} contextID=%u displayID=%u", (uint8_t *)v55, 0x22u);
      MEMORY[0x22074950C](v55, -1, -1);
    }
    else
    {

      swift_release_n();
      v53 = v52;
    }

    return (id)((uint64_t (*)(char *, uint64_t))v85)(v79, v14);
  }
}

void sub_21A7CBCA0(void *a1, uint64_t a2, void (*a3)(id, _QWORD))
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  void (*v14)(uint64_t);

  v6 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement;
  v7 = *(void **)(a2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement);
  if (v7)
  {
    sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
    v8 = a1;
    v9 = v7;
    v10 = sub_21A7D0020();

    if ((v10 & 1) != 0)
      return;
    v11 = *(void **)(a2 + v6);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(a2 + v6) = a1;
  v12 = a1;

  v13 = a2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement;
  *(_DWORD *)v13 = 0;
  *(_BYTE *)(v13 + 4) = 1;
  v14 = *(void (**)(uint64_t))(a2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
  if (v14)
  {
    swift_retain();
    v14(0x100000000);
    sub_21A7B9364((uint64_t)v14);
  }

  a3(v12, 0);
}

void sub_21A7CBE14(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  double Current;
  void (*v5)(id, uint64_t);
  double v6;
  uint64_t v7;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  double v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  void (**v46)(uint64_t);
  void (*v47)(uint64_t);
  unsigned int v48;
  void (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;

  v2 = v1;
  if (!AXDeviceSupportsPencilHover())
    return;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(void (**)(id, uint64_t))(v2
                                          + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
  if (!v5)
    return;
  v6 = Current;
  v7 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastStylusEventTime;
  if (Current - *(double *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastStylusEventTime) <= 0.25
    || a1 == 0)
  {
    return;
  }
  swift_retain();
  v9 = objc_msgSend(a1, sel_handInfo);
  if (!v9)
  {
LABEL_37:
    sub_21A7B9364((uint64_t)v5);
    return;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_paths);

  if (!v11)
    goto LABEL_40;
  sub_21A79E2D4(0, &qword_2550F7608);
  v12 = sub_21A7CFEAC();

  if (!(v12 >> 62))
  {
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_13;
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  v51 = sub_21A7D01C4();
  swift_bridgeObjectRelease();
  if (!v51)
    goto LABEL_36;
LABEL_13:
  if ((v12 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v13 = *(id *)(v12 + 32);
      goto LABEL_16;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    return;
  }
  v13 = (id)MEMORY[0x220748B70](0, v12);
LABEL_16:
  v14 = v13;
  swift_bridgeObjectRelease();
  *(double *)(v2 + v7) = v6;
  objc_msgSend(v14, sel_pathZValue);
  if (v15 <= 0.0)
  {

    goto LABEL_37;
  }
  v16 = (uint64_t *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  swift_beginAccess();
  v17 = *v16;
  swift_bridgeObjectRetain();
  v18 = a1;
  v19 = sub_21A7CE964(v17, a1);
  v21 = v20;
  swift_bridgeObjectRelease();

  if (v21)
  {
    v22 = HIDWORD(v19);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v23, sel__referenceBounds);
  v25 = v24;
  v27 = v26;

  objc_msgSend(v14, sel_pathLocation);
  v29 = v25 * v28;
  v31 = v27 * v30;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v32 = objc_msgSend((id)objc_opt_self(), sel_elementAtCoordinate_withVisualPadding_displayID_, 0, v22, v29, v31);
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  if (!v32)
  {
    sub_21A7B9364((uint64_t)v5);

    return;
  }
  v33 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement;
  v34 = *(void **)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement);
  if (v34)
  {
    sub_21A79E2D4(0, (unint64_t *)&unk_2550F7610);
    v35 = v32;
    v36 = v34;
    v37 = sub_21A7D0020();

    if ((v37 & 1) != 0)
    {
      objc_msgSend(v14, sel_azimuth);
      v39 = v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement;
      *(_DWORD *)v39 = v38;
      *(_BYTE *)(v39 + 4) = 0;
      v40 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
      if (v40)
      {
        v41 = v38;
        swift_retain();
        v40(v41);
        sub_21A7B9364((uint64_t)v40);
      }
      sub_21A7B9364((uint64_t)v5);

      return;
    }
    v43 = *(void **)(v2 + v33);
  }
  else
  {
    v42 = v32;
    v43 = 0;
  }
  *(_QWORD *)(v2 + v33) = v32;
  v44 = v32;

  v45 = v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement;
  *(_DWORD *)v45 = 0;
  *(_BYTE *)(v45 + 4) = 1;
  v46 = (void (**)(uint64_t))(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
  v47 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
  if (v47)
  {
    swift_retain();
    v47(0x100000000);
    sub_21A7B9364((uint64_t)v47);
  }

  objc_msgSend(v14, sel_azimuth);
  *(_DWORD *)v45 = v48;
  *(_BYTE *)(v45 + 4) = 0;
  v49 = *v46;
  if (*v46)
  {
    v50 = v48;
    swift_retain();
    v49(v50);
    sub_21A7B9364((uint64_t)v49);
  }
  v5(v44, 1);

  sub_21A7B9364((uint64_t)v5);
}

void sub_21A7CC2EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer);
  if (v2)
    goto LABEL_4;
  v3 = v0;
  sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
  v4 = (void *)sub_21A7CFFE4();
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFE490]), sel_initWithTargetSerialQueue_, v4);

  if (v5)
  {
    objc_msgSend(v5, sel_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_, 1);
    v6 = *(void **)(v3 + v1);
    *(_QWORD *)(v3 + v1) = v5;
    v5;

    v2 = 0;
LABEL_4:
    v7 = v2;
    return;
  }
  __break(1u);
}

void sub_21A7CC3AC(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  void (*v6)(void);

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (char *)MEMORY[0x22074959C](v1);
  if (v2)
  {
    *(_QWORD *)&v2[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount] = 0;

  }
  swift_beginAccess();
  v3 = (_BYTE *)MEMORY[0x22074959C](v1);
  if (v3)
  {
    v3[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive] = 1;

  }
  swift_beginAccess();
  v4 = MEMORY[0x22074959C](v1);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(void (**)(void))(v4 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
    sub_21A7B9360((uint64_t)v6);

    if (v6)
    {
      v6();
      sub_21A7B9364((uint64_t)v6);
    }
  }
}

void sub_21A7CC494(uint64_t a1)
{
  uint64_t v1;
  char *v2;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (char *)MEMORY[0x22074959C](v1);
  if (v2)
  {
    *(_QWORD *)&v2[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount] = 0;

  }
}

id sub_21A7CC4E8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23;

  v1 = sub_21A7CFFD8();
  v20 = *(_QWORD *)(v1 - 8);
  v21 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21A7CFF9C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_21A7CFD74();
  MEMORY[0x24BDAC7A8](v6);
  v7 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v19 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_axHandlerQueue;
  sub_21A79E2D4(0, (unint64_t *)&qword_2550F6790);
  v14 = v0;
  sub_21A7CFD5C();
  v23 = MEMORY[0x24BEE4AF8];
  sub_21A791288((unint64_t *)&unk_2550F7630, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F73D0);
  sub_21A7CF254((unint64_t *)&unk_2550F7640, &qword_2550F73D0);
  sub_21A7D00BC();
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v3, *MEMORY[0x24BEE5750], v21);
  *(_QWORD *)&v0[v19] = sub_21A7CFFFC();
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastMouseEventTime] = 0;
  v15 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams;
  *(_QWORD *)&v14[v15] = sub_21A7A5718(MEMORY[0x24BEE4AF8]);
  v16 = &v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement];
  *(_DWORD *)v16 = 0;
  v16[4] = 1;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey] = 2;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastStylusEventTime] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousEvent] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor] = 1;
  *(_DWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount] = 0;
  v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer] = 0;

  v17 = (objc_class *)type metadata accessor for HoverTextEventHandler();
  v22.receiver = v14;
  v22.super_class = v17;
  return objc_msgSendSuper2(&v22, sel_init);
}

id sub_21A7CC824()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HoverTextEventHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HoverTextEventHandler()
{
  return objc_opt_self();
}

uint64_t destroy for HTPointerStreamContext()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s11HoverTextUI22HTPointerStreamContextVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTPointerStreamContext(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for HTPointerStreamContext(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTPointerStreamContext(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HTPointerStreamContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTPointerStreamContext()
{
  return &type metadata for HTPointerStreamContext;
}

unint64_t sub_21A7CCB18()
{
  unint64_t result;

  result = qword_2550F75F8;
  if (!qword_2550F75F8)
  {
    result = MEMORY[0x220749464](&unk_21A7D3108, &type metadata for HTPointerStreamContext);
    atomic_store(result, (unint64_t *)&qword_2550F75F8);
  }
  return result;
}

unint64_t sub_21A7CCB5C(uint64_t a1)
{
  uint64_t v2;

  sub_21A7D02A8();
  type metadata accessor for CFString(0);
  sub_21A791288(&qword_2550F7658, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21A7D133C);
  sub_21A7CF714();
  v2 = sub_21A7D02E4();
  return sub_21A7CCD80(a1, v2);
}

unint64_t sub_21A7CCBE4(uint64_t a1)
{
  uint64_t v2;

  sub_21A7CFE04();
  sub_21A7D02A8();
  sub_21A7CFE1C();
  v2 = sub_21A7D02E4();
  swift_bridgeObjectRelease();
  return sub_21A7CCEC0(a1, v2);
}

unint64_t sub_21A7CCC64(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A7D0014();
  return sub_21A7CD034(a1, v2);
}

unint64_t sub_21A7CCC94(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_21A7D02A8();
  sub_21A7D02CC();
  sub_21A7D02CC();
  sub_21A7D02C0();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_21A7CFE1C();
    swift_bridgeObjectRelease();
  }
  v6 = sub_21A7D02E4();
  return sub_21A7CD14C(a1, a2, a3, v6);
}

unint64_t sub_21A7CCD50(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A7D00D4();
  return sub_21A7CD240(a1, v2);
}

unint64_t sub_21A7CCD80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_21A791288(&qword_2550F7658, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21A7D133C);
    v7 = v6;
    v8 = sub_21A7CF708();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_21A7CF708();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_21A7CCEC0(uint64_t a1, uint64_t a2)
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
    v6 = sub_21A7CFE04();
    v8 = v7;
    if (v6 == sub_21A7CFE04() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_21A7D023C();
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
          v13 = sub_21A7CFE04();
          v15 = v14;
          if (v13 == sub_21A7CFE04() && v15 == v16)
            break;
          v18 = sub_21A7D023C();
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

unint64_t sub_21A7CD034(uint64_t a1, uint64_t a2)
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
    sub_21A79E2D4(0, (unint64_t *)&qword_2550F6840);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_21A7D0020();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_21A7D0020();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_21A7CD14C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  BOOL v17;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v10 = a1;
    v11 = HIDWORD(a1);
    v12 = ~v6;
    v13 = *(_QWORD *)(v4 + 48);
    do
    {
      v14 = v13 + 24 * v7;
      if (*(_DWORD *)v14 == v10 && *(_DWORD *)(v14 + 4) == (_DWORD)v11)
      {
        v16 = *(_QWORD *)(v14 + 16);
        if (v16)
        {
          if (a3)
          {
            v17 = *(_QWORD *)(v14 + 8) == a2 && v16 == a3;
            if (v17 || (sub_21A7D023C() & 1) != 0)
              return v7;
          }
        }
        else if (!a3)
        {
          return v7;
        }
      }
      v7 = (v7 + 1) & v12;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_21A7CD240(uint64_t a1, uint64_t a2)
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
      sub_21A7CF294(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x220748B40](v9, a1);
      sub_21A7C76CC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21A7CD304(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_21A7CCC94(a1, a2, a3);
  LOBYTE(a3) = v9;
  swift_bridgeObjectRelease();
  if ((a3 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v4;
  v14 = *v4;
  *v4 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21A7CE594();
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_21A7CDD34(v8, v11);
  *v4 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_21A7CD3E4(uint64_t a1, char a2)
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F6780);
  v6 = sub_21A7D01DC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v32 = v5 + 64;
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
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v32 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_33;
      v23 = *(_QWORD *)(v32 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v32 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v23 = *(_QWORD *)(v32 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v33 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v20);
    if ((a2 & 1) == 0)
    {
      v30 = v29;
      swift_retain();
    }
    sub_21A7D02A8();
    type metadata accessor for CFString(0);
    sub_21A791288(&qword_2550F7658, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21A7D133C);
    sub_21A7CF714();
    result = sub_21A7D02E4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v29;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v31 = 1 << *(_BYTE *)(v5 + 32);
  if (v31 >= 64)
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v31;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21A7CD704(uint64_t a1, char a2)
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
  __int128 v13;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  char v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6778);
  v36 = a2;
  v6 = sub_21A7D01DC();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v35 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v18 = v17 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v19 >= v34)
          goto LABEL_35;
        v20 = v35[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v34)
            goto LABEL_35;
          v20 = v35[v14];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v34)
            {
LABEL_35:
              swift_release();
              v3 = v2;
              if ((v36 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v20 = v35[v21];
            if (!v20)
            {
              while (1)
              {
                v14 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_42;
                if (v14 >= v34)
                  goto LABEL_35;
                v20 = v35[v14];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v14 = v21;
          }
        }
LABEL_21:
        v10 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 24 * v18);
      *(_QWORD *)&v13 = *v22;
      v37 = v13;
      v24 = v22[1];
      v23 = v22[2];
      v25 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v18);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      sub_21A7D02A8();
      sub_21A7D02CC();
      sub_21A7D02CC();
      sub_21A7D02C0();
      if (v23)
      {
        swift_bridgeObjectRetain();
        sub_21A7CFE1C();
        swift_bridgeObjectRelease();
      }
      result = sub_21A7D02E4();
      v26 = -1 << *(_BYTE *)(v7 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
        v13 = v37;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        v13 = v37;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v11 + 8 * v28);
        }
        while (v32 == -1);
        v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 24 * v15);
      *v16 = v13;
      v16[1] = v24;
      v16[2] = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v15) = v25;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21A7CDA64(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7650);
  v6 = sub_21A7D01DC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
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
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_21A7D0014();
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
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21A7CDD34(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21A7D00C8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      v25 = v4;
      do
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 24 * v6 + 16);
        sub_21A7D02A8();
        sub_21A7D02CC();
        sub_21A7D02CC();
        sub_21A7D02C0();
        if (v9)
        {
          swift_bridgeObjectRetain();
          sub_21A7CFE1C();
        }
        v10 = sub_21A7D02E4();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          v4 = v25;
          if (v11 < v8)
            goto LABEL_5;
        }
        else
        {
          v4 = v25;
          if (v11 >= v8)
            goto LABEL_13;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_13:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = v12 + 24 * v3;
          v14 = (__int128 *)(v12 + 24 * v6);
          if (v3 != v6 || v13 >= (unint64_t)v14 + 24)
          {
            v15 = *v14;
            *(_QWORD *)(v13 + 16) = *((_QWORD *)v14 + 2);
            *(_OWORD *)v13 = v15;
          }
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (_QWORD *)(v16 + 8 * v3);
          v18 = (_QWORD *)(v16 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= v18 + 1))
          {
            *v17 = *v18;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_21A7CDF7C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  id result;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v9 = *v4;
  v11 = sub_21A7CCB5C((uint64_t)a3);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v15 = v10;
  v16 = *(_QWORD *)(v9 + 24);
  if (v16 >= v14 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_21A7CE3D8();
LABEL_7:
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      v18 = (_QWORD *)(v17[7] + 16 * v11);
      result = (id)swift_release();
      *v18 = a1;
      v18[1] = a2;
      return result;
    }
LABEL_11:
    v17[(v11 >> 6) + 8] |= 1 << v11;
    *(_QWORD *)(v17[6] + 8 * v11) = a3;
    v22 = (_QWORD *)(v17[7] + 16 * v11);
    *v22 = a1;
    v22[1] = a2;
    v23 = v17[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v17[2] = v25;
      return a3;
    }
    goto LABEL_14;
  }
  sub_21A7CD3E4(v14, a4 & 1);
  v20 = sub_21A7CCB5C((uint64_t)a3);
  if ((v15 & 1) == (v21 & 1))
  {
    v11 = v20;
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for CFString(0);
  result = (id)sub_21A7D0254();
  __break(1u);
  return result;
}

uint64_t sub_21A7CE0DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_21A7CCC94(a2, a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        result = swift_unknownObjectRelease();
        *(_QWORD *)(v21 + 8 * v14) = a1;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_21A7CE594();
      goto LABEL_7;
    }
    sub_21A7CD704(v17, a5 & 1);
    v23 = sub_21A7CCC94(a2, a3, a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21A7CE384(v14, a2, a3, a4, a1, v20);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_21A7D0254();
  __break(1u);
  return result;
}

void sub_21A7CE224(uint64_t a1, void *a2, char a3)
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
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_21A7CCC64((uint64_t)a2);
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
    sub_21A7CE754();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_21A7CDA64(v12, a3 & 1);
  v17 = sub_21A7CCC64((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_21A79E2D4(0, (unint64_t *)&qword_2550F6840);
  sub_21A7D0254();
  __break(1u);
}

unint64_t sub_21A7CE384(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 24 * result);
  *v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  *(_QWORD *)(a6[7] + 8 * result) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

void *sub_21A7CE3D8()
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
  __int128 v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550F6780);
  v2 = *v0;
  v3 = sub_21A7D01D0();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    v20 = v17;
    result = (void *)swift_retain();
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21A7CE594()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F6778);
  v2 = *v0;
  v3 = sub_21A7D01D0();
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
    v16 = 24 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 24 * v15);
    v19 = v17[1];
    v18 = v17[2];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = *v17;
    v22[1] = v19;
    v22[2] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_unknownObjectRetain();
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

id sub_21A7CE754()
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
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F7650);
  v2 = *v0;
  v3 = sub_21A7D01D0();
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
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
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

uint64_t sub_21A7CE8F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 == a4)
  {
    if (a3)
    {
      if (a6)
      {
        if (a2 == a5 && a3 == a6)
          return 1;
        if ((sub_21A7D023C() & 1) != 0)
          return 1;
      }
    }
    else if (!a6)
    {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_21A7CE964(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v18 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    while (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      if (a2)
        goto LABEL_22;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v18)
      goto LABEL_24;
    v12 = *(_QWORD *)(v17 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v18)
        goto LABEL_24;
      v12 = *(_QWORD *)(v17 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v18)
          goto LABEL_24;
        v12 = *(_QWORD *)(v17 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v18)
            goto LABEL_24;
          v12 = *(_QWORD *)(v17 + 8 * v8);
          if (!v12)
          {
            v13 = v11 + 4;
            if (v13 >= v18)
            {
LABEL_24:
              swift_release();
              return 0;
            }
            v12 = *(_QWORD *)(v17 + 8 * v13);
            v8 = v13;
            if (!v12)
              break;
          }
        }
      }
    }
LABEL_21:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
    if (a2)
    {
LABEL_22:
      v14 = (unsigned int *)(*(_QWORD *)(a1 + 48) + 24 * v10);
      v15 = *v14;
      v16 = v14[1];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      if ((_DWORD)v15 == objc_msgSend(a2, sel_contextId))
      {
        swift_release();
        return v15 | (v16 << 32);
      }
      swift_unknownObjectRelease();
      result = swift_bridgeObjectRelease();
    }
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v18)
      goto LABEL_24;
    v12 = *(_QWORD *)(v17 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_21;
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_21A7CEB74(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  unsigned int v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  void (*v43)();
  uint64_t v44;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_keyInfo);
  if (!v4)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v5 = v4;
  objc_msgSend(v4, sel_translateKeycode);

  sub_21A7CC2EC();
  v7 = v6;
  objc_msgSend(v6, sel_cancel);

  v8 = objc_msgSend(a1, sel_keyInfo);
  if (!v8)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, sel_modifierState);

  v11 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey;
  v12 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey);
  if (v12 == 1)
    v13 = 2;
  else
    v13 = 4;
  if (v12 == 2)
    v14 = 1;
  else
    v14 = v13;
  if ((v14 & v10) != 0
    && (*(_DWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState) & v14) == 0)
  {
    v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount);
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) = v26;
      sub_21A7CC2EC();
      v28 = v27;
      v29 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v43 = sub_21A7CF24C;
      v44 = v29;
      v39 = MEMORY[0x24BDAC760];
      v40 = 1107296256;
      v30 = &block_descriptor_42;
      goto LABEL_26;
    }
    __break(1u);
    goto LABEL_34;
  }
  v15 = objc_msgSend(a1, sel_keyInfo);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, sel_modifierState);

    v18 = *(_QWORD *)(v2 + v11);
    if (v18 == 1)
      v19 = 2;
    else
      v19 = 4;
    if (v18 == 2)
      v20 = 1;
    else
      v20 = v19;
    if ((v20 & v17) != 0
      || (*(_DWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState) & v20) == 0)
    {
      goto LABEL_27;
    }
    v21 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive;
    if (*(_BYTE *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive) == 1)
    {
      v22 = *(void (**)(uint64_t))(v2
                                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
      if (v22)
      {
        v23 = swift_retain();
        v22(v23);
        sub_21A7B9364((uint64_t)v22);
      }
      *(_BYTE *)(v2 + v21) = 0;
      *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) = 0;
      goto LABEL_27;
    }
    if (*(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) == 3)
    {
      *(_QWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) = 0;
      v35 = *(void (**)(uint64_t))(v2
                                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
      if (v35)
      {
        v36 = swift_retain();
        v35(v36);
        sub_21A7B9364((uint64_t)v35);
      }
LABEL_27:
      v32 = objc_msgSend(a1, sel_keyInfo);
      if (v32)
      {
        v33 = v32;
        v34 = objc_msgSend(v32, sel_modifierState);

        *(_DWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState) = v34;
        return;
      }
      goto LABEL_36;
    }
    sub_21A7CC2EC();
    v28 = v37;
    v38 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v43 = sub_21A7CF244;
    v44 = v38;
    v39 = MEMORY[0x24BDAC760];
    v40 = 1107296256;
    v30 = &block_descriptor_38;
LABEL_26:
    v41 = sub_21A7A6A18;
    v42 = v30;
    v31 = _Block_copy(&v39);
    swift_release();
    objc_msgSend(v28, sel_afterDelay_processBlock_, v31, 0.5, v39, v40);
    _Block_release(v31);

    goto LABEL_27;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_21A7CEED8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v18 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v6)
    goto LABEL_6;
LABEL_4:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v8 << 6);
  if (a2)
  {
    while (1)
    {
      v14 = (unsigned int *)(*(_QWORD *)(a1 + 48) + 24 * v10);
      v15 = *v14;
      v16 = v14[1];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      if ((_DWORD)v15 == objc_msgSend(a2, sel_contextId))
      {
        swift_release();
        return v15 | (v16 << 32);
      }
      swift_unknownObjectRelease();
      result = swift_bridgeObjectRelease();
      if (v6)
        goto LABEL_4;
LABEL_6:
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      if (v11 >= v18)
        goto LABEL_25;
      v12 = *(_QWORD *)(v17 + 8 * v11);
      ++v8;
      if (!v12)
      {
        v8 = v11 + 1;
        if (v11 + 1 >= v18)
          goto LABEL_25;
        v12 = *(_QWORD *)(v17 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 2;
          if (v11 + 2 >= v18)
            goto LABEL_25;
          v12 = *(_QWORD *)(v17 + 8 * v8);
          if (!v12)
          {
            v8 = v11 + 3;
            if (v11 + 3 >= v18)
              goto LABEL_25;
            v12 = *(_QWORD *)(v17 + 8 * v8);
            if (!v12)
            {
              v13 = v11 + 4;
              if (v13 >= v18)
              {
LABEL_25:
                swift_release();
                return 0;
              }
              v12 = *(_QWORD *)(v17 + 8 * v13);
              v8 = v13;
              if (!v12)
                break;
            }
          }
        }
      }
LABEL_20:
      v6 = (v12 - 1) & v12;
      v10 = __clz(__rbit64(v12)) + (v8 << 6);
      if (!a2)
        goto LABEL_28;
    }
    while (1)
    {
      v8 = v13 + 1;
      if (__OFADD__(v13, 1))
        break;
      if (v8 >= v18)
        goto LABEL_25;
      v12 = *(_QWORD *)(v17 + 8 * v8);
      ++v13;
      if (v12)
        goto LABEL_20;
    }
LABEL_27:
    __break(1u);
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21A7CF0F0()
{
  return swift_deallocObject();
}

uint64_t sub_21A7CF100()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

id sub_21A7CF13C()
{
  uint64_t v0;

  return sub_21A7CB254(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_DWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_21A7CF168()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_21A7CF19C()
{
  uint64_t v0;

  sub_21A7CBCA0(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id, _QWORD))(v0 + 32));
}

void sub_21A7CF1A8(id a1)
{
  if (a1 != (id)1)

}

id sub_21A7CF1B8(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_21A7CF1C8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21A7CF1EC(void *a1)
{
  uint64_t v1;

  return sub_21A7C9A10(a1, v1);
}

void sub_21A7CF1F8()
{
  uint64_t v0;

  sub_21A7C9F50(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_21A7CF204()
{
  uint64_t v0;

  sub_21A7C9EE8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t objectdestroy_18Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_21A7CF23C()
{
  uint64_t v0;

  sub_21A7C9E90(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_21A7CF244()
{
  uint64_t v0;

  sub_21A7CC494(v0);
}

void sub_21A7CF24C()
{
  uint64_t v0;

  sub_21A7CC3AC(v0);
}

uint64_t sub_21A7CF254(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x220749464](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A7CF294(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

void _axEventHandler_cold_1(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_21A787000, a2, OS_LOG_TYPE_ERROR, "info unexpectedly nil inside AXObserver callback! AXNotification: %ld", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_21A7CF450()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_21A7CF45C()
{
  return MEMORY[0x24BDCB6A0]();
}

uint64_t sub_21A7CF468()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_21A7CF474()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21A7CF480()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21A7CF48C()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21A7CF498()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21A7CF4A4()
{
  return MEMORY[0x24BDEAD40]();
}

uint64_t sub_21A7CF4B0()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_21A7CF4BC()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_21A7CF4C8()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_21A7CF4D4()
{
  return MEMORY[0x24BDCC270]();
}

uint64_t sub_21A7CF4E0()
{
  return MEMORY[0x24BDCC278]();
}

uint64_t sub_21A7CF4EC()
{
  return MEMORY[0x24BDCC280]();
}

uint64_t sub_21A7CF4F8()
{
  return MEMORY[0x24BDCC288]();
}

uint64_t sub_21A7CF504()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_21A7CF510()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_21A7CF51C()
{
  return MEMORY[0x24BDCC300]();
}

uint64_t sub_21A7CF528()
{
  return MEMORY[0x24BDCC310]();
}

uint64_t sub_21A7CF534()
{
  return MEMORY[0x24BDCC390]();
}

uint64_t sub_21A7CF540()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_21A7CF54C()
{
  return MEMORY[0x24BDCC518]();
}

uint64_t sub_21A7CF558()
{
  return MEMORY[0x24BDCC528]();
}

uint64_t sub_21A7CF564()
{
  return MEMORY[0x24BDCC548]();
}

uint64_t sub_21A7CF570()
{
  return MEMORY[0x24BDCC5A0]();
}

uint64_t sub_21A7CF57C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_21A7CF588()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_21A7CF594()
{
  return MEMORY[0x24BDCC5E0]();
}

uint64_t sub_21A7CF5A0()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_21A7CF5AC()
{
  return MEMORY[0x24BDCC610]();
}

uint64_t sub_21A7CF5B8()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_21A7CF5C4()
{
  return MEMORY[0x24BDCC620]();
}

uint64_t sub_21A7CF5D0()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_21A7CF5DC()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_21A7CF5E8()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_21A7CF5F4()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_21A7CF600()
{
  return MEMORY[0x24BDCC9A8]();
}

uint64_t sub_21A7CF60C()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_21A7CF618()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21A7CF624()
{
  return MEMORY[0x24BDCD3F0]();
}

uint64_t sub_21A7CF630()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21A7CF63C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21A7CF648()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21A7CF654()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21A7CF660()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21A7CF66C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21A7CF678()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_21A7CF684()
{
  return MEMORY[0x24BDCEE00]();
}

uint64_t sub_21A7CF690()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_21A7CF69C()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_21A7CF6A8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21A7CF6B4()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_21A7CF6C0()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_21A7CF6CC()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_21A7CF6D8()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_21A7CF6E4()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_21A7CF6F0()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_21A7CF6FC()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_21A7CF708()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_21A7CF714()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_21A7CF720()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_21A7CF72C()
{
  return MEMORY[0x24BE4F860]();
}

uint64_t sub_21A7CF738()
{
  return MEMORY[0x24BE4F868]();
}

uint64_t sub_21A7CF744()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21A7CF750()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21A7CF75C()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_21A7CF768()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_21A7CF774()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_21A7CF780()
{
  return MEMORY[0x24BDBA0A0]();
}

uint64_t sub_21A7CF78C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_21A7CF798()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_21A7CF7A4()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_21A7CF7B0()
{
  return MEMORY[0x24BDEAED0]();
}

uint64_t sub_21A7CF7BC()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_21A7CF7C8()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_21A7CF7D4()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_21A7CF7E0()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_21A7CF7EC()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_21A7CF7F8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_21A7CF804()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_21A7CF810()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_21A7CF81C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_21A7CF828()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_21A7CF834()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_21A7CF840()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_21A7CF84C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_21A7CF858()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_21A7CF864()
{
  return MEMORY[0x24BDEC158]();
}

uint64_t sub_21A7CF870()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_21A7CF87C()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_21A7CF888()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_21A7CF894()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_21A7CF8A0()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_21A7CF8AC()
{
  return MEMORY[0x24BDEC590]();
}

uint64_t sub_21A7CF8B8()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_21A7CF8C4()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_21A7CF8D0()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_21A7CF8DC()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_21A7CF8E8()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_21A7CF8F4()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_21A7CF900()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_21A7CF90C()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_21A7CF918()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_21A7CF924()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_21A7CF930()
{
  return MEMORY[0x24BDEDFC0]();
}

uint64_t sub_21A7CF93C()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_21A7CF948()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_21A7CF954()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_21A7CF960()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_21A7CF96C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_21A7CF978()
{
  return MEMORY[0x24BDEE8A0]();
}

uint64_t sub_21A7CF984()
{
  return MEMORY[0x24BDEE8A8]();
}

uint64_t sub_21A7CF990()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_21A7CF99C()
{
  return MEMORY[0x24BDEEF58]();
}

uint64_t sub_21A7CF9A8()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_21A7CF9B4()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_21A7CF9C0()
{
  return MEMORY[0x24BDEF178]();
}

uint64_t sub_21A7CF9CC()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_21A7CF9D8()
{
  return MEMORY[0x24BDEF1E8]();
}

uint64_t sub_21A7CF9E4()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_21A7CF9F0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21A7CF9FC()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_21A7CFA08()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_21A7CFA14()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_21A7CFA20()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_21A7CFA2C()
{
  return MEMORY[0x24BDF0BD8]();
}

uint64_t sub_21A7CFA38()
{
  return MEMORY[0x24BDF0BF8]();
}

uint64_t sub_21A7CFA44()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_21A7CFA50()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_21A7CFA5C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_21A7CFA68()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_21A7CFA74()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_21A7CFA80()
{
  return MEMORY[0x24BDF1F30]();
}

uint64_t sub_21A7CFA8C()
{
  return MEMORY[0x24BDF1F38]();
}

uint64_t sub_21A7CFA98()
{
  return MEMORY[0x24BDF1F40]();
}

uint64_t sub_21A7CFAA4()
{
  return MEMORY[0x24BDF1F48]();
}

uint64_t sub_21A7CFAB0()
{
  return MEMORY[0x24BDF1F50]();
}

uint64_t sub_21A7CFABC()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_21A7CFAC8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21A7CFAD4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21A7CFAE0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21A7CFAEC()
{
  return MEMORY[0x24BDF2530]();
}

uint64_t sub_21A7CFAF8()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_21A7CFB04()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21A7CFB10()
{
  return MEMORY[0x24BDF27E0]();
}

uint64_t sub_21A7CFB1C()
{
  return MEMORY[0x24BDF2930]();
}

uint64_t sub_21A7CFB28()
{
  return MEMORY[0x24BDF2CD8]();
}

uint64_t sub_21A7CFB34()
{
  return MEMORY[0x24BDF33C8]();
}

uint64_t sub_21A7CFB40()
{
  return MEMORY[0x24BDF34C0]();
}

uint64_t sub_21A7CFB4C()
{
  return MEMORY[0x24BDF3690]();
}

uint64_t sub_21A7CFB58()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_21A7CFB64()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_21A7CFB70()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_21A7CFB7C()
{
  return MEMORY[0x24BDF39B8]();
}

uint64_t sub_21A7CFB88()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_21A7CFB94()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_21A7CFBA0()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_21A7CFBAC()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_21A7CFBB8()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_21A7CFBC4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_21A7CFBD0()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_21A7CFBDC()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_21A7CFBE8()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_21A7CFBF4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_21A7CFC00()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_21A7CFC0C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_21A7CFC18()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_21A7CFC24()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_21A7CFC30()
{
  return MEMORY[0x24BDF44B0]();
}

uint64_t sub_21A7CFC3C()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_21A7CFC48()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_21A7CFC54()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_21A7CFC60()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_21A7CFC6C()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_21A7CFC78()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_21A7CFC84()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_21A7CFC90()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_21A7CFC9C()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_21A7CFCA8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21A7CFCB4()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_21A7CFCC0()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_21A7CFCCC()
{
  return MEMORY[0x24BDF4F70]();
}

uint64_t sub_21A7CFCD8()
{
  return MEMORY[0x24BDF4FA0]();
}

uint64_t sub_21A7CFCE4()
{
  return MEMORY[0x24BDF4FB8]();
}

uint64_t sub_21A7CFCF0()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_21A7CFCFC()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_21A7CFD08()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_21A7CFD14()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_21A7CFD20()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_21A7CFD2C()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_21A7CFD38()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_21A7CFD44()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_21A7CFD50()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21A7CFD5C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21A7CFD68()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_21A7CFD74()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21A7CFD80()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21A7CFD8C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21A7CFD98()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_21A7CFDA4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21A7CFDB0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21A7CFDBC()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_21A7CFDC8()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_21A7CFDD4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21A7CFDE0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21A7CFDEC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21A7CFDF8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21A7CFE04()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21A7CFE10()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21A7CFE1C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21A7CFE28()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21A7CFE34()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_21A7CFE40()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21A7CFE4C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21A7CFE58()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_21A7CFE64()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_21A7CFE70()
{
  return MEMORY[0x24BEE0CD8]();
}

uint64_t sub_21A7CFE7C()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_21A7CFE88()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21A7CFE94()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21A7CFEA0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21A7CFEAC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21A7CFEB8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21A7CFEC4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21A7CFED0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21A7CFEDC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21A7CFEE8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21A7CFEF4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21A7CFF00()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21A7CFF0C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21A7CFF18()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21A7CFF24()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_21A7CFF30()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21A7CFF3C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_21A7CFF48()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21A7CFF54()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_21A7CFF60()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21A7CFF6C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21A7CFF78()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21A7CFF84()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21A7CFF90()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21A7CFF9C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21A7CFFA8()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_21A7CFFB4()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_21A7CFFC0()
{
  return MEMORY[0x24BEE5708]();
}

uint64_t sub_21A7CFFCC()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_21A7CFFD8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21A7CFFE4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21A7CFFF0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21A7CFFFC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21A7D0008()
{
  return MEMORY[0x24BDCFFF8]();
}

uint64_t sub_21A7D0014()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21A7D0020()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21A7D002C()
{
  return MEMORY[0x24BDD0260]();
}

uint64_t sub_21A7D0038()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21A7D0044()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_21A7D0050()
{
  return MEMORY[0x24BEE1DB0]();
}

uint64_t sub_21A7D005C()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_21A7D0068()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_21A7D0074()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21A7D0080()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21A7D008C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21A7D0098()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21A7D00A4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21A7D00B0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21A7D00BC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21A7D00C8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21A7D00D4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21A7D00E0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21A7D00EC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21A7D00F8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21A7D0104()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21A7D0110()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21A7D011C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21A7D0128()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21A7D0134()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21A7D0140()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21A7D014C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21A7D0158()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21A7D0164()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21A7D0170()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21A7D017C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_21A7D0188()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_21A7D0194()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_21A7D01A0()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_21A7D01AC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21A7D01B8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21A7D01C4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21A7D01D0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21A7D01DC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21A7D01E8()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_21A7D01F4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21A7D0200()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21A7D020C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21A7D0218()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21A7D0224()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21A7D0230()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21A7D023C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21A7D0248()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_21A7D0254()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21A7D0260()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21A7D026C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21A7D0278()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21A7D0284()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21A7D0290()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21A7D029C()
{
  return MEMORY[0x24BDD0730]();
}

uint64_t sub_21A7D02A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A7D02B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A7D02C0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21A7D02CC()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_21A7D02D8()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_21A7D02E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21A7D02F0()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t AXDeviceSupportsHoverTextTyping()
{
  return MEMORY[0x24BE00000]();
}

uint64_t AXDeviceSupportsPencilHover()
{
  return MEMORY[0x24BE00020]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x24BDFE900](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x24BDFE908](*(_QWORD *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDFE910](observer);
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  return MEMORY[0x24BDFE918](observer, element, notification);
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x24BDFE9E8]();
}

uint64_t AXUIElementRegisterSystemWideServerDeathCallback()
{
  return MEMORY[0x24BDFEA00]();
}

uint64_t AXUIElementSharedSystemApp()
{
  return MEMORY[0x24BDFEA10]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x24BDFEA28](*(_QWORD *)&theType, valuePtr);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BEBD238](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48B8](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48E0](font);
  return result;
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4900](font);
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x24BE3D5A8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x24BED2048]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x24BED2110]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return MEMORY[0x24BDFED10]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return MEMORY[0x24BDFED18]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _UIAXElementForAXUIElementRef()
{
  return MEMORY[0x24BDFED98]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

