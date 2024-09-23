@implementation HostViewCell

- (_TtC18HealthExperienceUI12HostViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI12HostViewCell *)HostViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  _TtC18HealthExperienceUI12HostViewCell *v2;

  v2 = self;
  sub_1A96288C0();

}

- (void)didLongPress:(id)a3
{
  _TtC18HealthExperienceUI12HostViewCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9628AAC();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI12HostViewCell)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtC18HealthExperienceUI12HostViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_hostView) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_recreateViewControllerOnHostedFeedItemChange) = 1;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_sectionContext;
  v7 = type metadata accessor for SectionContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = a3;

  result = (_TtC18HealthExperienceUI12HostViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC18HealthExperienceUI12HostViewCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  sub_1A962BB54(&OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_hostView, type metadata accessor for HostViewCell, width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_1A96292B8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_1A9629304(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_1A96292B8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_1A9629304(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (void).cxx_destruct
{
  sub_1A962BFD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_hostView, &OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_item, &OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_sectionContext);
}

@end
