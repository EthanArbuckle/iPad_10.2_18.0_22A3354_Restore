@implementation CAAUEQGraphView

- (_TtC12CoreAudioKit15CAAUEQGraphView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit15CAAUEQGraphView *)sub_2131B8FB0(a3);
}

- (_TtC12CoreAudioKit15CAAUEQGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit15CAAUEQGraphView *)sub_2131B90DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)removeFromSuperview
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAAUEQGraphView();
  v2 = v4.receiver;
  -[CAAUEQGraphView removeFromSuperview](&v4, sel_removeFromSuperview);
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_removeObserver_, v2);

}

- (void)tintColorDidChange
{
  _TtC12CoreAudioKit15CAAUEQGraphView *v2;

  v2 = self;
  sub_2131B929C();

}

- (NSArray)accessibilityElements
{
  _TtC12CoreAudioKit15CAAUEQGraphView *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_2131B98B8();

  if (v3)
  {
    v4 = (void *)sub_2131E1B00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131B9DB0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131BAA38);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC12CoreAudioKit15CAAUEQGraphView *v7;
  void *v8;
  void *v9;
  objc_super v10;

  sub_21316A930(0, &qword_254B88030);
  sub_21316A7C0();
  sub_2131E1B9C();
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_2131E1B90();
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for CAAUEQGraphView();
  -[CAAUEQGraphView touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, v8, v6);

  v9 = (void *)sub_2131E1B90();
  -[CAAUEQGraphView touchesEnded:withEvent:](v7, sel_touchesEnded_withEvent_, v9, v6);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131BB1C4);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC12CoreAudioKit15CAAUEQGraphView *v5;

  v4 = a3;
  v5 = self;
  sub_2131BB524((uint64_t)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit15CAAUEQGraphView_dataSource, &qword_254B87F10);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit15CAAUEQGraphView_gradientLayer));
  swift_bridgeObjectRelease();
}

@end
