@implementation UberContentContainer

- (_TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_contents) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_parallaxY) = 0;
  v7 = (char *)self
     + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_prominentPlayButtonCenterYOverride;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UberContentContainer();
  v8 = -[UberContentContainer initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  -[UberContentContainer setClipsToBounds:](v8, "setClipsToBounds:", 1);
  return v8;
}

- (_TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_contents) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_parallaxY) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_prominentPlayButtonCenterYOverride;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/MediaView.swift", 24, 2, 203, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer *v2;

  v2 = self;
  sub_1003C6414();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_contents));
}

@end
