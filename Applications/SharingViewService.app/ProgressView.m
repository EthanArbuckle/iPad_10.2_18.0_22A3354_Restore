@implementation ProgressView

- (_TtC18SharingViewService12ProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC18SharingViewService12ProgressView *)sub_10000E9DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18SharingViewService12ProgressView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18SharingViewService12ProgressView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18SharingViewService12ProgressView_statusLabelText);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC18SharingViewService12ProgressView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100136660, "SharingViewService/ProgressView.swift", 37, 2, 62, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->progress[OBJC_IVAR____TtC18SharingViewService12ProgressView_statusLabelText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService12ProgressView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService12ProgressView_statusLabel));
}

@end
