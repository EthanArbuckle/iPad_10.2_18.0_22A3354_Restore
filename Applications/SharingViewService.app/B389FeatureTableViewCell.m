@implementation B389FeatureTableViewCell

- (_TtC18SharingViewService24B389FeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC18SharingViewService24B389FeatureTableViewCell *)sub_100017C38(v4, v5);
}

- (void)prepareForReuse
{
  _TtC18SharingViewService24B389FeatureTableViewCell *v2;

  v2 = self;
  sub_100017990();

}

- (_TtC18SharingViewService24B389FeatureTableViewCell)initWithCoder:(id)a3
{
  sub_100017A40(a3);
  return 0;
}

- (void).cxx_destruct
{
  sub_100017C08(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration), *(_QWORD *)&self->glyphConfiguration[OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration], *(_QWORD *)&self->glyphConfiguration[OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration+ 8], *(void **)&self->glyphConfiguration[OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__detailTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__glyphImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__textLabel));
}

@end
