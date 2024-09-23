@implementation NUPaywallEventData

- (NUPaywallEventData)initWithPaywallViewData:(id)a3 headline:(id)a4 channel:(id)a5 feed:(id)a6 paywallGroupData:(id)a7 referral:(id)a8 qToken:(id)a9
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NUPaywallEventData *v22;

  if (a9)
  {
    v15 = sub_1D6E26978();
    v17 = v16;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  v18 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = (NUPaywallEventData *)sub_1D6899E70((uint64_t)v18, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, v21, v15, v17);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v22;
}

- (NUPaywallEventData)init
{
  NUPaywallEventData *result;

  result = (NUPaywallEventData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___NUPaywallEventData_viewData;
  v4 = sub_1D6E1994C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D5E82E34((uint64_t)self + OBJC_IVAR___NUPaywallEventData_articleData, (unint64_t *)&unk_1ED5E0660, (void (*)(uint64_t))MEMORY[0x1E0D53C48]);
  swift_unknownObjectRelease();
  sub_1D5E82E34((uint64_t)self + OBJC_IVAR___NUPaywallEventData_feedData, (unint64_t *)&unk_1ED5E0810, (void (*)(uint64_t))MEMORY[0x1E0D56348]);
  sub_1D5E82E34((uint64_t)self + OBJC_IVAR___NUPaywallEventData_groupData, (unint64_t *)&unk_1ED5E0840, (void (*)(uint64_t))MEMORY[0x1E0D56758]);

  swift_bridgeObjectRelease();
}

@end
