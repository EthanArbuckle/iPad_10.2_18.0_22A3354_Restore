@implementation MatterAccessoryLikeItem

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  _TtC4Home23MatterAccessoryLikeItem *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable);
  v3 = self;
  v4 = objc_msgSend(v2, sel_hf_homeKitObject);

  return (HFHomeKitObject *)v4;
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  return (HFAccessoryRepresentable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable));
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  void *v5;

  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = (void *)_s4Home23MatterAccessoryLikeItemC04withC19RepresentableObject_11valueSourceACXDSgSo011HFAccessoryG0_p_So021HFCharacteristicValueJ0_ptFZ_0((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5;
}

- (id)copyWithZone:(void *)a3
{
  _TtC4Home23MatterAccessoryLikeItem *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1DD3F8704(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1DD63E848();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_TtC4Home23MatterAccessoryLikeItem)init
{
  _TtC4Home23MatterAccessoryLikeItem *result;

  result = (_TtC4Home23MatterAccessoryLikeItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_tilePath;
  v4 = sub_1DD63D984();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_actionSetBuilder));
}

- (BOOL)hf_showInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_showInHomeDashboard);
}

- (BOOL)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_hasSetShowInHomeDashboard);
}

- (BOOL)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_effectiveShowInHomeDashboard);
}

- (id)hf_updateShowInHomeDashboard:(BOOL)a3
{
  return sub_1DD3F8D6C((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_hf_updateShowInHomeDashboard_);
}

- (BOOL)hf_isFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_isFavorite);
}

- (BOOL)hf_hasSetFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_hasSetFavorite);
}

- (BOOL)hf_shouldShowInFavorites
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_shouldShowInFavorites);
}

- (BOOL)hf_effectiveIsFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_effectiveIsFavorite);
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  return sub_1DD3F8D6C((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_hf_updateIsFavorite_);
}

- (BOOL)hf_supportsHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_supportsHomeStatus);
}

- (BOOL)hf_isVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_isVisibleInHomeStatus);
}

- (BOOL)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_hasSetVisibleInHomeStatus);
}

- (BOOL)hf_isForcedVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_isForcedVisibleInHomeStatus);
}

- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3
{
  return sub_1DD3F8D6C((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_hf_updateIsVisibleInHomeStatus_);
}

- (HFCharacteristicValueSource)valueSource
{
  return (HFCharacteristicValueSource *)0;
}

- (id)copyWithValueSource:(id)a3
{
  _TtC4Home23MatterAccessoryLikeItem *v4;
  void *v6;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  -[MatterAccessoryLikeItem copy](v4, sel_copy);
  sub_1DD63E56C();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  swift_unknownObjectRelease();

  return v6;
}

- (HMHome)home
{
  return (HMHome *)0;
}

- (NSSet)services
{
  _TtC4Home23MatterAccessoryLikeItem *v2;
  void *v3;

  v2 = self;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1DD63E7B8())
    sub_1DD3EE1B4(MEMORY[0x1E0DEE9D8]);

  sub_1DD352AB0(0, (unint64_t *)&qword_1F03E41C0);
  sub_1DD352A70((unint64_t *)&qword_1F03E4AF0, (unint64_t *)&qword_1F03E41C0);
  v3 = (void *)sub_1DD63E380();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (id)accessories
{
  void *v2;
  _TtC4Home23MatterAccessoryLikeItem *v3;
  id v4;
  id v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable);
  v3 = self;
  v4 = v2;
  v5 = objc_msgSend(v4, sel_hf_associatedAccessories);
  sub_1DD352AB0(0, &qword_1F03E46E0);
  sub_1DD352A70((unint64_t *)&unk_1F03E55B0, &qword_1F03E46E0);
  sub_1DD63E398();

  v6 = (void *)sub_1DD63E380();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)namingComponentForHomeKitObject
{
  return objc_msgSend(objc_allocWithZone((Class)HFNamingComponents), sel_initWithHomeKitObject_, 0);
}

@end
