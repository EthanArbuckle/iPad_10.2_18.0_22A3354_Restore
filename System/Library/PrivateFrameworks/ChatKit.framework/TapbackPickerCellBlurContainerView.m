@implementation TapbackPickerCellBlurContainerView

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_hasActiveBlurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView____lazy_storage___blurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_activeAnimationCount) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerCellBlurContainerView();
  return -[TapbackPickerCellBlurContainerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_hasActiveBlurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView____lazy_storage___blurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_activeAnimationCount) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerCellBlurContainerView();
  return -[TapbackPickerCellBlurContainerView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView *v7;
  char v8;

  if (a3)
  {
    v4 = sub_18E768984();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_18E6A7A4C(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView____lazy_storage___blurFilter));
}

@end
