@implementation PreviewPaletteView

- (_TtC18HealthExperienceUI18PreviewPaletteView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC18HealthExperienceUI18PreviewPaletteView *v9;
  _TtC18HealthExperienceUI18PreviewPaletteView *v10;
  void *v11;
  _TtC18HealthExperienceUI18PreviewPaletteView *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)sub_1A97F679C();

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for PreviewPaletteView();
  v10 = -[PreviewPaletteView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = *(Class *)((char *)&v10->super.super.super.isa
                 + OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton);
  v12 = v10;
  -[PreviewPaletteView addSubview:](v12, sel_addSubview_, v11);
  v13 = v11;
  objc_msgSend(v13, sel_hk_alignConstraintsWithView_, v12);

  return v12;
}

- (_TtC18HealthExperienceUI18PreviewPaletteView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC18HealthExperienceUI18PreviewPaletteView *result;

  v4 = OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1A97F679C();

  result = (_TtC18HealthExperienceUI18PreviewPaletteView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton));
}

@end
