@implementation RGBLivenessCameraPreview

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview *v4;
  _TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview_flashAnimationTask))
  {
    v4 = self;
    swift_retain();
    sub_213A14480();
    swift_release();
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[RGBLivenessCameraPreview dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview_sessionManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___previewLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___objectLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___debugLayer));
  sub_2139B96AC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___rotationCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___regionOfInterestLayer));
  swift_release();
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[RGBLivenessCameraPreview didMoveToWindow](&v3, sel_didMoveToWindow);
  sub_2139B721C();
  sub_2139B7680();

}

- (void)layoutSubviews
{
  id v2;
  uint64_t v3;
  char v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[RGBLivenessCameraPreview layoutSubviews](&v6, sel_layoutSubviews);
  sub_2139B721C();
  sub_2139B7680();
  sub_2139906B8(0, (unint64_t *)&qword_254D11280);
  v3 = sub_213A13E20();
  v4 = MEMORY[0x2199B9F3C](v3);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
    v5 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
    objc_msgSend(v5, sel_setDisableUpdateMask_, 18);

    v2 = v5;
  }

}

+ (Class)layerClass
{
  sub_2139906B8(0, &qword_254D0F850);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview)initWithFrame:(CGRect)a3
{
  return (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview *)sub_2139B8AE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview)initWithCoder:(id)a3
{
  return (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview *)sub_2139B8C18(a3);
}

@end
