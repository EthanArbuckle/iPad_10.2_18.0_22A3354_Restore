@implementation B389HSA2ViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService22B389HSA2ViewController *v4;

  v4 = self;
  sub_10004FCD8(a3);

}

- (void)updateSettingsPressed
{
  uint64_t v2;
  _TtC18SharingViewService22B389HSA2ViewController *v3;

  v3 = self;
  sub_1000507B0((uint64_t)v3, v2);

}

- (void)dismissPressed
{
  uint64_t v2;
  _TtC18SharingViewService22B389HSA2ViewController *v3;

  v3 = self;
  sub_100050AC8((uint64_t)v3, v2);

}

- (_TtC18SharingViewService22B389HSA2ViewController)initWithMainController:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC18SharingViewService22B389HSA2ViewController *v8;
  uint64_t v9;
  _TtC18SharingViewService22B389HSA2ViewController *v10;
  objc_super v12;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_btn) = 0;
  v5 = OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_msgLbl;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v9 = OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_lockImageView;
  *(Class *)((char *)&v8->super.super.super.super.isa + v9) = (Class)objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for B389HSA2ViewController();
  v10 = -[SVSBaseViewController initWithMainController:](&v12, "initWithMainController:", v7);

  return v10;
}

- (_TtC18SharingViewService22B389HSA2ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService22B389HSA2ViewController *)sub_100054B84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100050D14);
}

- (_TtC18SharingViewService22B389HSA2ViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService22B389HSA2ViewController *)sub_100050E1C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_btn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_msgLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_lockImageView));
}

@end
