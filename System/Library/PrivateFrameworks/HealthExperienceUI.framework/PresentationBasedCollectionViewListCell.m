@implementation PresentationBasedCollectionViewListCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  objc_super v15;

  sub_1A9778DD8();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1A9A93DB4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v11 = self;
  v12 = (void *)sub_1A9A93D90();
  v13 = (objc_class *)type metadata accessor for PresentationBasedCollectionViewListCell();
  v15.receiver = v11;
  v15.super_class = v13;
  -[PresentationBasedCollectionViewListCell _bridgedUpdateConfigurationUsingState:](&v15, sel__bridgedUpdateConfigurationUsingState_, v12);

  (*(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v11->super.super.super.super.super.super.isa) + 0x58))(v10);
  v14 = sub_1A9A93E38();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 0, 1, v14);
  MEMORY[0x1AF41AF08](v6);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PresentationBasedCollectionViewListCell();
  return -[PresentationBasedCollectionViewListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PresentationBasedCollectionViewListCell();
  return -[PresentationBasedCollectionViewListCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
