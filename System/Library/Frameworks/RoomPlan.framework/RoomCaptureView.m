@implementation RoomCaptureView

- (id)ibDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_delegate;
  swift_beginAccess();
  return (id)MEMORY[0x22769A944](v2);
}

- (void)setIbDelegate:(id)a3
{
  _TtC8RoomPlan15RoomCaptureView *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8RoomPlan15RoomCaptureView *v9;
  char *v10;

  if (!a3)
  {
    v9 = self;
    goto LABEL_11;
  }
  swift_unknownObjectRetain_n();
  v5 = self;
  swift_getObjectType();
  v6 = swift_conformsToProtocol2();
  if (v6)
    v7 = v6;
  else
    v7 = 0;
  if (v6)
    v8 = a3;
  else
    v8 = 0;
  if (!v8)
  {
    swift_unknownObjectRelease();
LABEL_11:
    v7 = 0;
  }
  v10 = (char *)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_delegate;
  swift_beginAccess();
  *((_QWORD *)v10 + 1) = v7;
  swift_unknownObjectWeakAssign();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (NSArray)subviews
{
  int v3;
  objc_class *v4;
  _TtC8RoomPlan15RoomCaptureView *v5;
  NSArray *v6;
  unint64_t v7;
  _TtC8RoomPlan15RoomCaptureView *v8;
  NSArray *v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v3 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_isEncoding);
  v4 = (objc_class *)type metadata accessor for RoomCaptureView();
  if (v3 == 1)
  {
    v12.receiver = self;
    v12.super_class = v4;
    v5 = self;
    v6 = -[RoomCaptureView subviews](&v12, sel_subviews);
    sub_22643F548(0, &qword_2558485D8);
    v7 = sub_22655CECC();

    sub_226502114(v7, (uint64_t)v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = v4;
    v8 = self;
    v9 = -[RoomCaptureView subviews](&v13, sel_subviews);
    sub_22643F548(0, &qword_2558485D8);
    sub_22655CECC();

  }
  sub_22643F548(0, &qword_2558485D8);
  v10 = (void *)sub_22655CEC0();
  swift_bridgeObjectRelease();
  return (NSArray *)v10;
}

- (_TtC8RoomPlan15RoomCaptureView)initWithFrame:(CGRect)a3
{
  return (_TtC8RoomPlan15RoomCaptureView *)RoomCaptureView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8RoomPlan15RoomCaptureView)initWithCoder:(id)a3
{
  return (_TtC8RoomPlan15RoomCaptureView *)RoomCaptureView.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  _TtC8RoomPlan15RoomCaptureView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2264FBEE8(v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  _TtC8RoomPlan15RoomCaptureView *v7;

  v4 = a3;
  v7 = self;
  v5 = -[RoomCaptureView traitCollection](v7, sel_traitCollection);
  v6 = objc_msgSend(v5, sel_hasDifferentColorAppearanceComparedToTraitCollection_, v4);

  if (v6)
    sub_2264FC7F0();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoomCaptureView();
  v2 = (char *)v5.receiver;
  -[RoomCaptureView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_gradientLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (void)dealloc
{
  _TtC8RoomPlan15RoomCaptureView *v2;
  objc_super v3;

  v2 = self;
  *((_QWORD *)sub_2264FA9A8() + 3) = 0;
  swift_unknownObjectWeakAssign();
  swift_release();
  sub_2264FC488();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for RoomCaptureView();
  -[RoomCaptureView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  sub_22644F0C0((uint64_t)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_roomCaptureARView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_worldSpaceManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_coachingOverlayView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22643D7E4((uint64_t)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_sceneObserver, &qword_255847158);
  swift_release();

  swift_release();
  swift_release();
  sub_226503C8C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView____lazy_storage___frameProcessor));
}

@end
