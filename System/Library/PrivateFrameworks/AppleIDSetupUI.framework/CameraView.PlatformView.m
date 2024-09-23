@implementation CameraView.PlatformView

+ (Class)layerClass
{
  sub_2366CCE80(0, &qword_2564273F0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView____lazy_storage___videoPreviewLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CameraView.PlatformView();
  return -[CameraView.PlatformView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView____lazy_storage___videoPreviewLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CameraView.PlatformView();
  return -[CameraView.PlatformView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView____lazy_storage___videoPreviewLayer));
}

@end
