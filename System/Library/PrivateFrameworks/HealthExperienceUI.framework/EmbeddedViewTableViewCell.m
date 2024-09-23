@implementation EmbeddedViewTableViewCell

- (void)prepareForReuse
{
  _TtC18HealthExperienceUI25EmbeddedViewTableViewCell *v2;

  v2 = self;
  sub_1A97ACB0C();

}

- (_TtC18HealthExperienceUI25EmbeddedViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC18HealthExperienceUI25EmbeddedViewTableViewCell *v10;
  objc_super v12;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedViewController) = 0;
  if (v7)
  {
    v9 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EmbeddedViewTableViewCell();
  v10 = -[EmbeddedViewTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, v9);

  return v10;
}

- (_TtC18HealthExperienceUI25EmbeddedViewTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedViewController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EmbeddedViewTableViewCell();
  return -[EmbeddedViewTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedViewController));
}

@end
