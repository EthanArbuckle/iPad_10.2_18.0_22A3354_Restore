@implementation TopHeaderCustomFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC13FTMInternal_425TopHeaderCustomFlowLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_10018E290(x, y, width, height);

  if (v8)
  {
    sub_10018E6BC();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (_TtC13FTMInternal_425TopHeaderCustomFlowLayout)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TopHeaderCustomFlowLayout();
  return -[TopHeaderCustomFlowLayout init](&v3, "init");
}

- (_TtC13FTMInternal_425TopHeaderCustomFlowLayout)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TopHeaderCustomFlowLayout();
  return -[TopHeaderCustomFlowLayout initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
