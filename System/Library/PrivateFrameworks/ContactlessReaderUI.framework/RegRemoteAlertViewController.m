@implementation RegRemoteAlertViewController

- (void)dealloc
{
  _TtC19ContactlessReaderUI28RegRemoteAlertViewController *v2;

  v2 = self;
  sub_22F8CDCCC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI28RegRemoteAlertViewController_regViewController));
  sub_22F8847A8((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI28RegRemoteAlertViewController_viewDisappearListener);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI28RegRemoteAlertViewController_suppressible);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RegRemoteAlertViewController();
  -[RegRemoteAlertViewController viewWillAppear:](&v4, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC19ContactlessReaderUI28RegRemoteAlertViewController *v4;

  v4 = self;
  sub_22F8CDF08(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC19ContactlessReaderUI28RegRemoteAlertViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_22F8CFF48;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_22F8CE158(a3, v6, v7);
  sub_22F87A9B8((uint64_t)v6);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  uint64_t (*v6)();
  _TtC19ContactlessReaderUI28RegRemoteAlertViewController *v7;

  v5 = _Block_copy(a4);
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v6 = sub_22F8CFEDC;
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  sub_22F8CFC54();
  sub_22F87A9B8((uint64_t)v6);

}

- (_TtC19ContactlessReaderUI28RegRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22F98EDB8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC19ContactlessReaderUI28RegRemoteAlertViewController *)sub_22F8CF974(v5, v7, a4);
}

- (_TtC19ContactlessReaderUI28RegRemoteAlertViewController)initWithCoder:(id)a3
{
  return (_TtC19ContactlessReaderUI28RegRemoteAlertViewController *)sub_22F8CFABC(a3);
}

@end
