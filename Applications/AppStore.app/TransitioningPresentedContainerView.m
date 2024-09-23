@implementation TransitioningPresentedContainerView

- (void)didAddSubview:(id)a3
{
  id v4;
  _BYTE *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  v4 = a3;
  v5 = v6.receiver;
  -[TransitioningPresentedContainerView didAddSubview:](&v6, "didAddSubview:", v4);
  if (v5[OBJC_IVAR____TtC8AppStore35TransitioningPresentedContainerView_hidesInsertedSubviews] == 1)
    objc_msgSend(v4, "setHidden:", 1, v6.receiver, v6.super_class);

}

- (_TtC8AppStore35TransitioningPresentedContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStore35TransitioningPresentedContainerView_hidesInsertedSubviews) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[TransitioningPresentedContainerView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStore35TransitioningPresentedContainerView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStore35TransitioningPresentedContainerView_hidesInsertedSubviews) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TransitioningPresentedContainerView initWithCoder:](&v7, "initWithCoder:", a3);
}

@end
