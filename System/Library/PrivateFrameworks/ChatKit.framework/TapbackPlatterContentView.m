@implementation TapbackPlatterContentView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC7ChatKit25TapbackPlatterContentView *v7;
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
  v8 = sub_18E6C9368(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC7ChatKit25TapbackPlatterContentView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit25TapbackPlatterContentView *)sub_18E5B5ED8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TapbackPlatterContentView);
}

@end
