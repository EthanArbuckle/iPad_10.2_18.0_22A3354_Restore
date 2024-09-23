@implementation WordmarkView

- (_TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB7763D0();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AB776484();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView *v2;

  v2 = self;
  sub_1AB776698();

}

- (_TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView)initWithFrame:(CGRect)a3
{
  sub_1AB776940();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView_referenceLineHeight;
  v4 = sub_1AB7D87E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView_imageView));
}

@end
