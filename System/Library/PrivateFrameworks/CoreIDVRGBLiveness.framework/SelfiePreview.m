@implementation SelfiePreview

- (_TtC18CoreIDVRGBLiveness13SelfiePreview)init
{
  return (_TtC18CoreIDVRGBLiveness13SelfiePreview *)sub_2139C41A0();
}

- (_TtC18CoreIDVRGBLiveness13SelfiePreview)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC18CoreIDVRGBLiveness13SelfiePreview *)sub_2139C4CD4();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC18CoreIDVRGBLiveness13SelfiePreview *v6;

  v5 = a4;
  v6 = self;
  sub_2139C4EBC();

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC18CoreIDVRGBLiveness13SelfiePreview *v6;

  v5 = a4;
  v6 = self;
  sub_2139C4FA8();

}

- (_TtC18CoreIDVRGBLiveness13SelfiePreview)initWithFrame:(CGRect)a3
{
  _TtC18CoreIDVRGBLiveness13SelfiePreview *result;

  result = (_TtC18CoreIDVRGBLiveness13SelfiePreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_playerViewController));
  sub_2139AFB18((uint64_t)self + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_selfieView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoIconContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoSymbol));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoText));
}

@end
