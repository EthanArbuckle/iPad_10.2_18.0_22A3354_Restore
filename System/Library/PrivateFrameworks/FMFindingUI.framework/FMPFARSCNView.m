@implementation FMPFARSCNView

- (BOOL)drawsCameraImage
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC11FMFindingUI13FMPFARSCNView *v7;
  void *v8;
  objc_super v9;

  sub_23A968488(0, (unint64_t *)&qword_2569D6488);
  sub_23A9A052C();
  sub_23AA3317C();
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_23AA33170();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for FMPFARSCNView();
  -[FMPFARSCNView touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v8, v6);

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC11FMFindingUI13FMPFARSCNView *v2;
  void *v3;

  v2 = self;
  sub_23A99FE90();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)_drawAtTime:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFARSCNView();
  -[FMPFARSCNView _drawAtTime:](&v4, sel__drawAtTime_, a3);
}

- (_TtC11FMFindingUI13FMPFARSCNView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
    v8 = sub_23AA32F84();
  else
    v8 = 0;
  return (_TtC11FMFindingUI13FMPFARSCNView *)sub_23A9A002C(v8, x, y, width, height);
}

- (_TtC11FMFindingUI13FMPFARSCNView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _TtC11FMFindingUI13FMPFARSCNView *v13;
  objc_class *v14;
  objc_class *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = sub_23AA32EDC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_innerIsolationQueue;
  sub_23A968488(0, (unint64_t *)&qword_2569D5B10);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5490], v8);
  v13 = self;
  v14 = (objc_class *)sub_23AA332C0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v12) = v14;
  *(Class *)((char *)&v13->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_internalIsolationQueue) = 0;

  v15 = (objc_class *)type metadata accessor for FMPFARSCNView();
  v17.receiver = v13;
  v17.super_class = v15;
  return -[ARSCNView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11FMFindingUI13FMPFARSCNView)initWithCoder:(id)a3
{
  return (_TtC11FMFindingUI13FMPFARSCNView *)sub_23A9A0368(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_innerIsolationQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_internalIsolationQueue));
}

@end
