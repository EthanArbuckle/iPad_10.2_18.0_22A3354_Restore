@implementation AFUISiriCarPlayLatencyView

- (_TtC11AssistantUI26AFUISiriCarPlayLatencyView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC11AssistantUI26AFUISiriCarPlayLatencyView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AFUISiriCarPlayLatencyView();
  v7 = -[AFUISiriCarPlayLatencyView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_217559B34();

  return v7;
}

- (_TtC11AssistantUI26AFUISiriCarPlayLatencyView)initWithCoder:(id)a3
{
  id v4;
  _TtC11AssistantUI26AFUISiriCarPlayLatencyView *v5;
  _TtC11AssistantUI26AFUISiriCarPlayLatencyView *v6;
  _TtC11AssistantUI26AFUISiriCarPlayLatencyView *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AFUISiriCarPlayLatencyView();
  v4 = a3;
  v5 = -[AFUISiriCarPlayLatencyView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_217559B34();

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView));
}

@end
