@implementation CAAUGraphView

- (_TtC12CoreAudioKit13CAAUGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit13CAAUGraphView *)sub_2131D034C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit13CAAUGraphView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit13CAAUGraphView *)sub_2131D05E8(a3);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id v5;
  _TtC12CoreAudioKit13CAAUGraphView *v6;

  v4 = a3;
  v6 = self;
  v5 = -[CAAUGraphView layer](v6, sel_layer);

  if (v5 == v4)
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)v6->super.super.super.isa) + 0x380))();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_2131D0BA0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_2131D12D0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_2131D0BA0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_2131D13D8);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2131D0BA0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_2131D1450);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13CAAUGraphView_gridPointSelected));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13CAAUGraphView_gridPointHighlighted));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13CAAUGraphView_guideHighlight));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
