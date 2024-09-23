@implementation ViewSnapshotsButton

- (_TtC16MagnifierSupport19ViewSnapshotsButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport19ViewSnapshotsButton *)sub_227499DF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport19ViewSnapshotsButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22749B364();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[ViewSnapshotsButton layoutSubviews](&v6, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_containerView];
  v4 = objc_msgSend(v3, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, v5 * 0.5);

}

- (NSString)largeContentTitle
{
  _TtC16MagnifierSupport19ViewSnapshotsButton *v2;
  void *v3;

  v2 = self;
  sub_227499AD4();

  v3 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UIImage)largeContentImage
{
  return (UIImage *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_icon), sel_image);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_icon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_enabledColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_disabledColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_dimmedColor));
  swift_release();
  swift_release();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_class *ObjectType;
  id v7;
  _TtC16MagnifierSupport19ViewSnapshotsButton *v8;
  void *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_22730BA80(0, &qword_2558D92E8);
  sub_2273FF2F0();
  sub_22758E5B0();
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_22758E5A4();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  -[ViewSnapshotsButton touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v9, v7);

  *((_BYTE *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_isDimmed) = 1;
  sub_2274999B8();

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_22749B110(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_22749B110(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)dragExited:(id)a3
{
  _TtC16MagnifierSupport19ViewSnapshotsButton *v4;
  _TtC16MagnifierSupport19ViewSnapshotsButton *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_isDimmed) = 0;
  sub_2274999B8();

  sub_227365B54((uint64_t)v6);
}

- (void)dragReturned:(id)a3
{
  _TtC16MagnifierSupport19ViewSnapshotsButton *v4;
  _TtC16MagnifierSupport19ViewSnapshotsButton *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_isDimmed) = 1;
  sub_2274999B8();

  sub_227365B54((uint64_t)v6);
}

@end
