@implementation SharingOptionsViewFactory

+ (id)createCollaborationShareOptionsView:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 userDidChangeOption:(id)a5 contentSizeDidChange:(id)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v8 = _Block_copy(a5);
  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = a3;
  v13 = (void *)_s14CloudSharingUI0B18OptionsViewFactoryC024createCollaborationSharedE0_13layoutMargins19userDidChangeOption011contentSizemN0AA32HostingControllerAndModelUpdatesCSo016_SWCollaborationiD0CSg_So23NSDirectionalEdgeInsetsVySS_SSSbALtcySo6CGSizeVctFZ_0(a3, (uint64_t)sub_20D632A10, v10, (uint64_t)sub_20D632A18, v11);

  swift_release();
  swift_release();
  return v13;
}

+ (id)createSharingOptionsView:(id)a3 userDidChangeOption:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = _Block_copy(a4);
  sub_20D6329CC();
  v5 = sub_20D6351CC();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  v7 = _s14CloudSharingUI0B18OptionsViewFactoryC06createbdE0_19userDidChangeOptionAA32HostingControllerAndModelUpdatesCSaySo016_SWCollaborationD5GroupCG_ySS_SSSbAJtctFZ_0(v5, (uint64_t)sub_20D632A08, v6);
  swift_bridgeObjectRelease();
  swift_release();
  return v7;
}

- (_TtC14CloudSharingUI25SharingOptionsViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharingOptionsViewFactory();
  return -[SharingOptionsViewFactory init](&v3, sel_init);
}

@end
