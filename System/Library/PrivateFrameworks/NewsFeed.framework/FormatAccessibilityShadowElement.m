@implementation FormatAccessibilityShadowElement

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1BB1FA340(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1BB6C6B84);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1BB1FA340(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1BB6C6D54);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1BB1FA340(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1BB6C6F24);
}

- (NSString)ts_accessibilityElementHelp
{
  return (NSString *)sub_1BB1FA340(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1BB6C70F4);
}

- (NSString)accessibilityLanguage
{
  _TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1BB1FA5A0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  _TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1BB1F9D34();

  return v3;
}

- (NSArray)accessibilityCustomActions
{
  _TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1BB1FA050();

  if (v3)
  {
    sub_1BA49A224(0, &qword_1ED39DAC0);
    v4 = (void *)sub_1BB872D9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3;
  void *v4;
  _TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = MEMORY[0x1BCCE5D40](*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement_accessibilityRenderer)+ 72, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    objc_msgSend(v4, sel_accessibilityFrame);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = 0.0;
    v13 = 0.0;
    v7 = 0.0;
    v9 = 0.0;
  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement)initWithAccessibilityContainer:(id)a3
{
  _TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *result;

  swift_unknownObjectRetain();
  sub_1BB873B64();
  swift_unknownObjectRelease();
  result = (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement)init
{
  _TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *result;

  result = (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
