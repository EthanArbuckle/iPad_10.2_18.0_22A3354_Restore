@implementation CardioFitnessRetroComputeTipTileViewController

- (void)viewDidLoad
{
  _TtC5Heart46CardioFitnessRetroComputeTipTileViewController *v2;

  v2 = self;
  sub_2313907D0();

}

- (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_2314146BC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController *)sub_231393350(v5, v7, a4);
}

- (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController)initWithCoder:(id)a3
{
  return (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController *)sub_2313934F8(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  sub_231393B88((uint64_t)self + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController____lazy_storage___tileView));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController_detail;
  v4 = sub_231412718();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController_deselectionBehavior;
  v6 = sub_231412970();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
