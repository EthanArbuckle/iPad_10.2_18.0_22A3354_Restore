@implementation ClimatePassthroughButton

- (_TtC7Climate24ClimatePassthroughButton)init
{
  _TtC7Climate24ClimatePassthroughButton *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClimatePassthroughButton();
  v2 = -[ClimateButton init](&v4, "init");
  -[ClimatePassthroughButton removeTarget:action:forControlEvents:](v2, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  return v2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
