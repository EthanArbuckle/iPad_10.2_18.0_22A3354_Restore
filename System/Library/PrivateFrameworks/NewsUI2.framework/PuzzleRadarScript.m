@implementation PuzzleRadarScript

- (_TtC7NewsUI217PuzzleRadarScript)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PuzzleRadarScript init](&v3, sel_init);
}

- (NSString)identifier
{
  return (NSString *)(id)sub_1D6E26948();
}

- (WKUserScript)userScript
{
  return (WKUserScript *)sub_1D663A1FC();
}

- (NSString)executableScript
{
  _TtC7NewsUI217PuzzleRadarScript *v2;
  void *v3;

  v2 = self;
  sub_1D6E27EA8();
  sub_1D6E26A98();
  sub_1D6E26A98();
  sub_1D6E26A98();

  v3 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)queueable
{
  return 0;
}

@end
