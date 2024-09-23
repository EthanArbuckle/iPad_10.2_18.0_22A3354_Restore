@implementation VisionPrescriptionImagePreviewView

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisionPrescriptionImagePreviewView();
  return -[VisionPrescriptionImagePreviewView image](&v3, sel_image);
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VisionPrescriptionImagePreviewView();
  v4 = a3;
  v5 = v6.receiver;
  -[VisionPrescriptionImagePreviewView setImage:](&v6, sel_setImage_, v4);
  sub_232260DD4();

}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)init
{
  return -[VisionPrescriptionImagePreviewView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_imageHeightAnchorConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_item) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VisionPrescriptionImagePreviewView();
  v7 = -[VisionPrescriptionImagePreviewView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[VisionPrescriptionImagePreviewView setContentMode:](v7, sel_setContentMode_, 1);
  return v7;
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithCoder:(id)a3
{
  id v4;
  _TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_imageHeightAnchorConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_item) = 0;
  v4 = a3;

  result = (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *)sub_2322B9350();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithImage:(id)a3
{
  id v3;
  _TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *result;

  v3 = a3;
  result = (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_imageHeightAnchorConstraint));
  swift_release();
}

@end
