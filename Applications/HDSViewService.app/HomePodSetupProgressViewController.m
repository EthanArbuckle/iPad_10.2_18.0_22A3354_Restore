@implementation HomePodSetupProgressViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService34HomePodSetupProgressViewController *v2;

  v2 = self;
  sub_1000820DC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14HDSViewService34HomePodSetupProgressViewController *v4;

  v4 = self;
  sub_1000826A0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupProgressViewController(0);
  v4 = (char *)v5.receiver;
  -[HomePodSetupProgressViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_timer], "invalidate", v5.receiver, v5.super_class);

}

- (void)handleTimer:(id)a3
{
  id v4;
  _TtC14HDSViewService34HomePodSetupProgressViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100083DB4();

}

- (_TtC14HDSViewService34HomePodSetupProgressViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  objc_super v8;

  *(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_timer] = 0;
  v5 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_startDate];
  v6 = type metadata accessor for Date(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupProgressViewController(0);
  return -[HomePodSetupStereoViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

  sub_10000DC40((uint64_t)self + OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_startDate, &qword_1000D8068);
}

@end
