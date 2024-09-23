@implementation URLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC19AppStoreKitInternal23URLActivityItemProvider *v9;
  id v10;
  id v11;
  _TtC19AppStoreKitInternal23URLActivityItemProvider *v12;
  char *v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  char *v21;
  void *v22;
  __int128 v24;
  __int128 v25;

  if (a4)
  {
    v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC19AppStoreKitInternal23URLActivityItemProvider_excludedActivityTypes);
    v8 = a3;
    v9 = self;
    v10 = a4;
    if ((sub_1D84D7710((uint64_t)v10, v7) & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;

      goto LABEL_6;
    }
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
  v13 = *(char **)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC19AppStoreKitInternal23URLActivityItemProvider_shareSheetData)
      + OBJC_IVAR____TtC19AppStoreKitInternal14ShareSheetData_url;
  v14 = sub_1D892773C();
  *((_QWORD *)&v25 + 1) = v14;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v24);
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(boxed_opaque_existential_0, v13, v14);

LABEL_6:
  v16 = *((_QWORD *)&v25 + 1);
  if (!*((_QWORD *)&v25 + 1))
    return 0;
  v17 = __swift_project_boxed_opaque_existential_1Tm(&v24, *((uint64_t *)&v25 + 1));
  v18 = *(_QWORD *)(v16 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v18 + 16))(v21, v19);
  v22 = (void *)sub_1D892BD8C();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
  return v22;
}

- (id)item
{
  _TtC19AppStoreKitInternal23URLActivityItemProvider *v2;
  void *v3;
  uint64_t v5[4];

  v2 = self;
  sub_1D8690EA0(v5);

  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  v3 = (void *)sub_1D892BD8C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (_TtC19AppStoreKitInternal23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC19AppStoreKitInternal23URLActivityItemProvider *result;

  swift_unknownObjectRetain();
  sub_1D892B954();
  swift_unknownObjectRelease();
  result = (_TtC19AppStoreKitInternal23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal23URLActivityItemProvider *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1D8691554();
  v7 = v6;

  return v7;
}

- (id)activityViewControllerSubject:(id)a3
{
  uint64_t v3;
  void *v4;

  sub_1D869242C();
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
