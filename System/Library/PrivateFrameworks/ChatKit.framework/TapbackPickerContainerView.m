@implementation TapbackPickerContainerView

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerContainerView();
  return -[TapbackPickerContainerView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  _TtC7ChatKit26TapbackPickerContainerView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18E6F4868((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_displayConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_presentationTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_backingBalloon));
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC7ChatKit26TapbackPickerContainerView *v7;
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
  v8 = sub_18E6F4700(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

@end
