@implementation HPSSpatialProfileFeedback

+ (id)getDraftViewController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v9;

  v2 = sub_1DB3BC2B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone((Class)sub_1DB3BC2C8());
  sub_1DB3BC2A4();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0D20FA0], v2);
  sub_1DB3BC2BC();
  v7 = objc_allocWithZone((Class)sub_1DB3BC2E0());
  return (id)sub_1DB3BC2D4();
}

- (_TtC16HeadphoneConfigs25HPSSpatialProfileFeedback)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HPSSpatialProfileFeedback();
  return -[HPSSpatialProfileFeedback init](&v3, sel_init);
}

@end
