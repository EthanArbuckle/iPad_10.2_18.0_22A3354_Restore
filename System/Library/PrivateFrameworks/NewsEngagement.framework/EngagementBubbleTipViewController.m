@implementation EngagementBubbleTipViewController

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[AMSUIBaseMessageViewController viewDidLoad](&v6, sel_viewDidLoad);
  sub_1BA1DC8B0();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BA203760;
  v4 = sub_1BA202460();
  v5 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  sub_1BA202688();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14NewsEngagement33EngagementBubbleTipViewController *v4;

  v4 = self;
  sub_1BA1DC024(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[EngagementBubbleTipViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, v3);
  sub_1BA1DBDA0();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC14NewsEngagement33EngagementBubbleTipViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1BA1DC244(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithRequest:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[AMSUIBubbleTipViewController initWithRequest:](&v8, sel_initWithRequest_, a3);
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  objc_class *ObjectType;
  char *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[AMSUIBubbleTipViewController initWithRequest:bag:account:](&v12, sel_initWithRequest_bag_account_, a3, a4, a5);
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  char *v8;
  id v9;
  char *v10;
  id v11;
  _TtC14NewsEngagement33EngagementBubbleTipViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1BA202508();
    v8 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
    *(_QWORD *)v8 = 0;
    v8[8] = 1;
    v9 = a4;
    a3 = (id)sub_1BA2024FC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
    *(_QWORD *)v10 = 0;
    v10[8] = 1;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[EngagementBubbleTipViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);

  return v12;
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[EngagementBubbleTipViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

@end
