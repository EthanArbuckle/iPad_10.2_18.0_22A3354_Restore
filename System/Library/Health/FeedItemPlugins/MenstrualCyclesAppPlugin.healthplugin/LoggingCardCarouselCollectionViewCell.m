@implementation LoggingCardCarouselCollectionViewCell

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *v2;
  void *v3;

  v2 = self;
  sub_2319EADC8();

  v3 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_2319EB668(a3);

}

- (void)applyLayoutAttributes:(id)a3
{
  void (*v4)(uint8_t *, uint64_t);
  _TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *v5;

  v4 = (void (*)(uint8_t *, uint64_t))a3;
  v5 = self;
  sub_2319EB798(v4);

}

- (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *)sub_2319EC118(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *)sub_2319EC238(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell_loggingCardViewController));
}

@end
