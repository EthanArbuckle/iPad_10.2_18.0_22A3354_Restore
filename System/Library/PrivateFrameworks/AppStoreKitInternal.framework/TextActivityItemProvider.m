@implementation TextActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC19AppStoreKitInternal24TextActivityItemProvider *v9;
  id v10;
  id v12;
  _TtC19AppStoreKitInternal24TextActivityItemProvider *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  char *v21;
  void *v22;
  _QWORD v23[4];

  if (a4)
  {
    v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC19AppStoreKitInternal24TextActivityItemProvider_excludedActivityTypes);
    v8 = a3;
    v9 = self;
    v10 = a4;
    if ((sub_1D84D7710((uint64_t)v10, v7) & 1) != 0)
    {

      return 0;
    }
  }
  else
  {
    v12 = a3;
    v13 = self;
  }
  v15 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC19AppStoreKitInternal24TextActivityItemProvider_text);
  v14 = *(uint64_t *)((char *)&self->super.super._iop.__prevOp
                   + OBJC_IVAR____TtC19AppStoreKitInternal24TextActivityItemProvider_text);
  v16 = MEMORY[0x1E0DEA968];
  v23[3] = MEMORY[0x1E0DEA968];
  v23[0] = v15;
  v23[1] = v14;
  swift_bridgeObjectRetain();

  v17 = __swift_project_boxed_opaque_existential_1Tm(v23, v16);
  v18 = *(_QWORD *)(v16 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v18 + 16))(v21, v19);
  v22 = (void *)sub_1D892BD8C();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return v22;
}

- (id)item
{
  swift_bridgeObjectRetain();
  return (id)sub_1D892BE04();
}

- (_TtC19AppStoreKitInternal24TextActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC19AppStoreKitInternal24TextActivityItemProvider *result;

  swift_unknownObjectRetain();
  sub_1D892B954();
  swift_unknownObjectRelease();
  result = (_TtC19AppStoreKitInternal24TextActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
