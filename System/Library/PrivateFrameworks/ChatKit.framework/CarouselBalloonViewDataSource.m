@implementation CarouselBalloonViewDataSource

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  unint64_t v3;
  _TtC7ChatKit29CarouselBalloonViewDataSource *v5;
  int64_t v6;

  v3 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC7ChatKit29CarouselBalloonViewDataSource_items);
  if (!v3)
    return 0;
  if (!(v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = self;
  sub_18E7669BC();
  v6 = sub_18E769338();

  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  _TtC7ChatKit29CarouselBalloonViewDataSource *v4;
  uint64_t v5;
  id v6;

  item = a3->item;
  v4 = self;
  v6 = sub_18E72E760((uint64_t)v4, v5, item);

  return v6;
}

- (_TtC7ChatKit29CarouselBalloonViewDataSource)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit29CarouselBalloonViewDataSource_items) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CarouselBalloonViewDataSource();
  return -[CarouselBalloonViewDataSource init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
