@implementation IDScanViewController

- (_TtC9CoreIDVUI20IDScanViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F51FB4();
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI20IDScanViewController *v2;

  v2 = self;
  sub_213F4DD4C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9CoreIDVUI20IDScanViewController *v4;

  v4 = self;
  sub_213F4DF30(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IDScanViewController(0);
  v4 = v7.receiver;
  -[IDScanViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = sub_213FF8618();
  sub_213F4E050(v5, v6, 0, 0, v4[OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_scanSide]);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_213F4CF1C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_docInfo, &qword_254D5C8E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_cameraReader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_docScanConfig));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController____lazy_storage___guidanceContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController____lazy_storage___guidancePrompt));
}

@end
