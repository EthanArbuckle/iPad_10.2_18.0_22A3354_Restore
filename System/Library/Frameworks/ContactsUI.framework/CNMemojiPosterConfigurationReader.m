@implementation CNMemojiPosterConfigurationReader

+ (BOOL)canReadConfiguration
{
  return 1;
}

- (UIColor)backgroundColor
{
  uint64_t v2;

  sub_18ACB9378();
  v2 = sub_18AF4E9A8();
  return (UIColor *)UIColor.init(avatarColorDescription:)((Swift::OpaquePointer)v2).super.isa;
}

- (NSData)avatarImageData
{
  void *v2;
  _TtC10ContactsUI33CNMemojiPosterConfigurationReader *v3;

  if (*(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 48] >> 60 == 15)
  {
    v2 = 0;
  }
  else
  {
    v3 = self;
    v2 = (void *)sub_18AF4E474();

  }
  return (NSData *)v2;
}

- (NSData)avatarRecordData
{
  void *v2;
  _TtC10ContactsUI33CNMemojiPosterConfigurationReader *v3;

  if (*(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 8] >> 60 == 15)
  {
    v2 = 0;
  }
  else
  {
    v3 = self;
    v2 = (void *)sub_18AF4E474();

  }
  return (NSData *)v2;
}

- (NSData)avatarPoseData
{
  void *v2;
  _TtC10ContactsUI33CNMemojiPosterConfigurationReader *v3;

  if (*(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 24] >> 60 == 15)
  {
    v2 = 0;
  }
  else
  {
    v3 = self;
    v2 = (void *)sub_18AF4E474();

  }
  return (NSData *)v2;
}

- (_TtC10ContactsUI33CNMemojiPosterConfigurationReader)initWithPosterConfigurationUserInfo:(id)a3
{
  uint64_t v3;

  v3 = sub_18AF4FBA8();
  return (_TtC10ContactsUI33CNMemojiPosterConfigurationReader *)CNMemojiPosterConfigurationReader.init(posterConfigurationUserInfo:)(v3);
}

+ (id)memojiPosterConfigurationDataFromUserInfo:(id)a3
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

- (_TtC10ContactsUI33CNMemojiPosterConfigurationReader)init
{
  _TtC10ContactsUI33CNMemojiPosterConfigurationReader *result;

  result = (_TtC10ContactsUI33CNMemojiPosterConfigurationReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = *(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration];
  v3 = *(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 8];
  v4 = *(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 16];
  v5 = *(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 24];
  v6 = *(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 40];
  v7 = *(_QWORD *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 48];
  swift_bridgeObjectRelease();
  sub_18ACB9CC8(v2, v3);
  sub_18ACB9CC8(v4, v5);
  sub_18ACB9CC8(v6, v7);
}

@end
