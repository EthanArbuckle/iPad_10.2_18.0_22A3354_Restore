@implementation HUPopUpMenuIconCollectionListCell

- (id)_buildAccessories
{
  HUPopUpMenuIconCollectionListCell *v2;
  void *v3;

  v2 = self;
  sub_1B8F115F8();

  sub_1B8E23A60(0, &qword_1EF20BDB8);
  v3 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)prepareForReuse
{
  char *v2;
  void **v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PopUpMenuIconCollectionListCell();
  v2 = (char *)v5.receiver;
  -[HUPopUpMenuIconCollectionListCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = (void **)&v2[OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu];
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;

}

- (HUPopUpMenuIconCollectionListCell)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PopUpMenuIconCollectionListCell();
  return -[HUIconCollectionListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUPopUpMenuIconCollectionListCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PopUpMenuIconCollectionListCell();
  return -[HUPopUpMenuIconCollectionListCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu));
}

@end
