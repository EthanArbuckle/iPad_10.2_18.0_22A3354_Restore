@implementation DownloadingDataCell

- (_TtC18HealthExperienceUI19DownloadingDataCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC18HealthExperienceUI19DownloadingDataCell *v10;
  void *v11;
  _TtC18HealthExperienceUI19DownloadingDataCell *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI19DownloadingDataCell_item;
  v9 = (objc_class *)type metadata accessor for DownloadingDataCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v15.receiver = self;
  v15.super_class = v9;
  v10 = -[DownloadingDataCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = (void *)objc_opt_self();
  v12 = v10;
  v13 = objc_msgSend(v11, sel_secondarySystemGroupedBackgroundColor);
  -[DownloadingDataCell setBackgroundColor:](v12, sel_setBackgroundColor_, v13);

  sub_1A99B3C68();
  return v12;
}

- (_TtC18HealthExperienceUI19DownloadingDataCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI19DownloadingDataCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI19DownloadingDataCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI19DownloadingDataCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI19DownloadingDataCell_item);
}

@end
