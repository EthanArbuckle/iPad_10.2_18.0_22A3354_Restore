@implementation PopoverTip.AnchorUIView

- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView *)sub_2354200D4(x, y, width, height);
  swift_release();
  return v7;
}

- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView)initWithCoder:(id)a3
{
  _TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView *)sub_23542021C(a3);
  swift_release();
  return v4;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView___observationRegistrar;
  v3 = sub_235423B20();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
