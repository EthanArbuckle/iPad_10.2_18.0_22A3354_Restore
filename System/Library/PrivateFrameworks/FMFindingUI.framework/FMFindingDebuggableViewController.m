@implementation FMFindingDebuggableViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC11FMFindingUI33FMFindingDebuggableViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11FMFindingUI33FMFindingDebuggableViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewController) = 0;
  v5 = OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer;
  v6 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11FMFindingUI33FMFindingDebuggableViewController *)sub_23AA335A8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMFindingDebuggableViewController();
  v2 = v3.receiver;
  -[FMFindingViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_23AA31F54();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMFindingDebuggableViewController();
  v4 = (char *)v5.receiver;
  -[FMFindingViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer], sel_setHidden_, 0, v5.receiver, v5.super_class);

}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (a3 == 1)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer), sel_setHidden_, 0, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer));
}

@end
