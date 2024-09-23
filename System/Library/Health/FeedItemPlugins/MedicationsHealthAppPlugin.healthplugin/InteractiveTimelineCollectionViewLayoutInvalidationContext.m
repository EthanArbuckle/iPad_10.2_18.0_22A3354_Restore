@implementation InteractiveTimelineCollectionViewLayoutInvalidationContext

- (NSString)description
{
  _TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext *v2;
  void *v3;

  v2 = self;
  sub_231806034();

  v3 = (void *)sub_2318D558C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext)init
{
  char *v3;
  uint64_t v4;
  id v5;
  _TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext *v6;
  id v7;
  objc_super v9;

  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_invalidateItemHeight) = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_invalidateSizeClass) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_updatedHorizontalWidth) = (Class)0x4075E00000000000;
  v3 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_nextConfig;
  v4 = *MEMORY[0x24BEBE1E0];
  v5 = objc_allocWithZone(MEMORY[0x24BEBD5F0]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_initForTextStyle_, v4);
  *(_OWORD *)v3 = xmmword_2318D8DC0;
  *((_OWORD *)v3 + 1) = xmmword_2318D8DB0;
  *((int64x2_t *)v3 + 2) = vdupq_n_s64(0x4041000000000000uLL);
  *((_QWORD *)v3 + 6) = 0;
  *((_QWORD *)v3 + 7) = v7;
  *((_OWORD *)v3 + 4) = xmmword_2318D8DA0;
  *((_QWORD *)v3 + 10) = 0;
  *((_QWORD *)v3 + 11) = 27;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for InteractiveTimelineCollectionViewLayoutInvalidationContext();
  return -[InteractiveTimelineCollectionViewLayoutInvalidationContext init](&v9, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._reorderingTarget.x
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_nextConfig));
}

@end
