@implementation CloudSyncCollectionViewCell

- (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC18HealthExperienceUI27CloudSyncCollectionViewCell *v10;
  id v11;
  char *v12;
  _TtC18HealthExperienceUI27CloudSyncCollectionViewCell *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_cloudSyncDetailView;
  v9 = objc_allocWithZone((Class)type metadata accessor for ActivityIndicatorDetailView(0));
  v10 = self;
  v11 = objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)v11;
  v12 = (char *)v10 + OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_item;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_QWORD *)v12 + 4) = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for CloudSyncCollectionViewCell();
  v13 = -[CloudSyncCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_1A96AE828();

  return v13;
}

- (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell *)sub_1A96AE6E4(a3);
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CloudSyncCollectionViewCell();
  -[CloudSyncCollectionViewCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_cloudSyncDetailView));
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
