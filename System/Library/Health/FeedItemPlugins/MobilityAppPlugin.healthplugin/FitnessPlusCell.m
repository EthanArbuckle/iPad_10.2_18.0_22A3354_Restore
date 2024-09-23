@implementation FitnessPlusCell

- (_TtC17MobilityAppPlugin15FitnessPlusCell)initWithFrame:(CGRect)a3
{
  return (_TtC17MobilityAppPlugin15FitnessPlusCell *)sub_231D7B124(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17MobilityAppPlugin15FitnessPlusCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231D7D2F0();
}

- (void)linkButtonPressed
{
  _TtC17MobilityAppPlugin15FitnessPlusCell *v2;

  v2 = self;
  sub_231D7C250();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay));
  swift_bridgeObjectRelease();
  sub_231D7D1B0((uint64_t)self + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton));
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessPlusCell();
  return -[FitnessPlusCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FitnessPlusCell();
  v4 = v6.receiver;
  -[FitnessPlusCell setHighlighted:](&v6, sel_setHighlighted_, v3);
  objc_msgSend(v4, sel_isHighlighted);
  objc_msgSend(v4, sel_isHighlighted);
  sub_231D565BC(&qword_255F733B0, v5, (uint64_t (*)(uint64_t))type metadata accessor for FitnessPlusCell, (uint64_t)&unk_231D8204C);
  sub_231D7DDE8();

}

@end
