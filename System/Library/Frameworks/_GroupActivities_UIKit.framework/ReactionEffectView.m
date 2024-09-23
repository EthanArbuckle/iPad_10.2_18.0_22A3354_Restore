@implementation ReactionEffectView

- (_TtC22_GroupActivities_UIKit18ReactionEffectView)initWithFrame:(CGRect)a3
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
           + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionEffectView_reactions) = (Class)MEMORY[0x24BEE4B08];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReactionEffectView();
  return -[ReactionEffectView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC22_GroupActivities_UIKit18ReactionEffectView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionEffectView_reactions) = (Class)MEMORY[0x24BEE4B08];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ReactionEffectView();
  return -[ReactionEffectView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
