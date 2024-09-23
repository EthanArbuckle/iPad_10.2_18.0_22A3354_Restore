@implementation CNMonogramPosterConfigurationReader

+ (BOOL)canReadConfiguration
{
  return 1;
}

- (UIColor)backgroundColor
{
  _TtC10ContactsUI35CNMonogramPosterConfigurationReader *v3;
  void *v4;

  sub_18ACB9378();
  v3 = self;
  sub_18AF4E7C8();
  v4 = (void *)sub_18AF4FFEC();

  return (UIColor *)v4;
}

- (NSString)initials
{
  _TtC10ContactsUI35CNMonogramPosterConfigurationReader *v2;
  void *v3;

  v2 = self;
  sub_18AF4E7D4();
  v3 = (void *)sub_18AF4FC38();

  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC10ContactsUI35CNMonogramPosterConfigurationReader)initWithPosterConfigurationUserInfo:(id)a3
{
  uint64_t v3;

  v3 = sub_18AF4FBA8();
  return (_TtC10ContactsUI35CNMonogramPosterConfigurationReader *)CNMonogramPosterConfigurationReader.init(posterConfigurationUserInfo:)(v3);
}

+ (id)monogramPosterConfigurationDataFromUserInfo:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = sub_18AF4FBA8();
  v4 = sub_18ACB9B88(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  if (v6 >> 60 == 15)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)sub_18AF4E474();
    sub_18ACB9CC8(v4, v6);
  }
  return v7;
}

- (_TtC10ContactsUI35CNMonogramPosterConfigurationReader)init
{
  _TtC10ContactsUI35CNMonogramPosterConfigurationReader *result;

  result = (_TtC10ContactsUI35CNMonogramPosterConfigurationReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC10ContactsUI35CNMonogramPosterConfigurationReader_monogramPosterConfiguration;
  v3 = sub_18AF4E7E0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
