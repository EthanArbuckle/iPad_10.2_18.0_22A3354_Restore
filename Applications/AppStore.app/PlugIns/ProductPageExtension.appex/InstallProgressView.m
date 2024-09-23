@implementation InstallProgressView

- (_TtC20ProductPageExtension19InstallProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19InstallProgressView *)sub_1004CE0F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension19InstallProgressView)initWithCoder:(id)a3
{
  char *v4;
  _QWORD *v5;
  id v6;
  _TtC20ProductPageExtension19InstallProgressView *result;

  v4 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_state;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_progressLayer) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_completionHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_progress) = 0;
  v6 = a3;

  result = (_TtC20ProductPageExtension19InstallProgressView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/InstallProgressView.swift", 46, 2, 89, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for InstallProgressView();
  v2 = (char *)v14.receiver;
  -[InstallProgressView layoutSubviews](&v14, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_progressLayer];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "layer", v14.receiver, v14.super_class);
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    v2 = v4;
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_progressLayer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_completionHandler), *(_QWORD *)&self->state[OBJC_IVAR____TtC20ProductPageExtension19InstallProgressView_completionHandler]);
}

@end
