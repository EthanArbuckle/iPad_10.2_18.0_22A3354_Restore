@implementation CKTextEffectsMenuFactory

+ (id)textStylePaletteMenuWithHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  _s7ChatKit22TextEffectsMenuFactoryC016textStylePaletteE07handler06activeC6StylesSo6UIMenuCySo06IMTextH0V_So8UIActionCtc_AJtFZ_0((uint64_t)sub_18E642BFC, v4, 0);
  v6 = v5;
  swift_release();
  return v6;
}

+ (id)textStylePaletteMenuWithHandler:(id)a3 activeTextStyles:(unint64_t)a4
{
  return sub_18E64100C((int)a1, (int)a2, a3, a4, (uint64_t)&unk_1E2766FC8, (uint64_t)sub_18E642B7C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s7ChatKit22TextEffectsMenuFactoryC016textStylePaletteE07handler06activeC6StylesSo6UIMenuCySo06IMTextH0V_So8UIActionCtc_AJtFZ_0);
}

+ (id)textStyleKeyCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5
{
  unint64_t v5;
  void *v6;

  v5 = _s7ChatKit22TextEffectsMenuFactoryC20textStyleKeyCommands6action15configureImages0L16AttributedTitles06activeC6StylesSaySo12UIKeyCommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VtFZ_0((uint64_t)a3, a4, a5, 0);
  sub_18E556AD0(v5);
  swift_bridgeObjectRelease();
  sub_18E00F31C(0, &qword_1EE109A88);
  v6 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)textStyleKeyCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 activeTextStyles:(unint64_t)a6
{
  return sub_18E640F18((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))_s7ChatKit22TextEffectsMenuFactoryC20textStyleKeyCommands6action15configureImages0L16AttributedTitles06activeC6StylesSaySo12UIKeyCommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VtFZ_0, (unint64_t *)&qword_1EE0F4730);
}

+ (id)textStyleCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5
{
  void *v5;

  _s7ChatKit22TextEffectsMenuFactoryC17textStyleCommands6action15configureImages0K16AttributedTitles06activeC6StylesSaySo9UICommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VtFZ_0((uint64_t)a3, a4, a5, 0);
  sub_18E00F31C(0, &qword_1EE109A88);
  v5 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)textStyleCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 activeTextStyles:(unint64_t)a6
{
  return sub_18E640F18((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))_s7ChatKit22TextEffectsMenuFactoryC17textStyleCommands6action15configureImages0K16AttributedTitles06activeC6StylesSaySo9UICommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VtFZ_0, &qword_1EE109A88);
}

+ (id)inlineEffectMenuWithHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE07handlerSo6UIMenuCySo06IMTextH4TypeV_So8UIActionCtc_tFZ_0((uint64_t)sub_18E642BFC, v4);
  v6 = v5;
  swift_release();
  return v6;
}

+ (id)inlineEffectMenuWithHandler:(id)a3 activeTextEffectType:(int64_t)a4
{
  return sub_18E64100C((int)a1, (int)a2, a3, a4, (uint64_t)&unk_1E2766F78, (uint64_t)sub_18E642BFC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE07handler06activecH4TypeSo6UIMenuCySo06IMTexthK0V_So8UIActionCtc_AJtFZ_0);
}

+ (id)inlineEffectMenuActionsWithHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE7Actions7handler06activecH4TypeSaySo8UIActionCGySo06IMTexthL0V_AHtc_AKtFZ_0((uint64_t)sub_18E642BFC, v4, 0);
  swift_release();
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA7F0);
  v5 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)inlineEffectMenuActionsWithHandler:(id)a3 activeTextEffectType:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE7Actions7handler06activecH4TypeSaySo8UIActionCGySo06IMTexthL0V_AHtc_AKtFZ_0((uint64_t)sub_18E642BFC, v6, a4);
  swift_release();
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA7F0);
  v7 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)effectMenuCommandsWithAction:(SEL)a3
{
  return sub_18E641204((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, _s7ChatKit22TextEffectsMenuFactoryC06effectE8Commands6actionSaySo9UICommandCG10ObjectiveC8SelectorVSg_tFZ_0, &qword_1EE109A88);
}

+ (id)effectKeyCommandsWithAction:(SEL)a3
{
  return sub_18E641204((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))_s7ChatKit22TextEffectsMenuFactoryC17effectKeyCommands6actionSaySo12UIKeyCommandCG10ObjectiveC8SelectorVSg_tFZ_0, (unint64_t *)&qword_1EE0F4730);
}

- (CKTextEffectsMenuFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextEffectsMenuFactory();
  return -[CKTextEffectsMenuFactory init](&v3, sel_init);
}

@end
