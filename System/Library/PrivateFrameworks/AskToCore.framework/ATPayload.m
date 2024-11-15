@implementation ATPayload

+ (signed)currentVersion
{
  return 3;
}

- (signed)version
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_version);
}

- (NSString)clientBundleIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->version[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_236B16540();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)messageGUID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (signed)rawRecipientGroup
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup);
}

- (BOOL)isForFamily
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily);
}

- (_TtC5AskTo10ATQuestion)question
{
  return (_TtC5AskTo10ATQuestion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC9AskToCore9ATPayload_question));
}

- (_TtC9AskToCore10ATResponse)response
{
  return (_TtC9AskToCore10ATResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC9AskToCore9ATPayload_response));
}

- (NSArray)allResponses
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses))
  {
    type metadata accessor for ATResponse();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_236B16600();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSDictionary)dictionaryRepresentation
{
  _TtC9AskToCore9ATPayload *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = ATPayload.dictionaryRepresentation.getter();

  if (v3)
  {
    v4 = (void *)sub_236B16504();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (_TtC9AskToCore9ATPayload)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v4;
  _TtC9AskToCore9ATPayload *v5;

  v4 = sub_236B16510();
  swift_getObjectType();
  v5 = (_TtC9AskToCore9ATPayload *)sub_236B01E9C(v4);
  swift_deallocPartialClassInstance();
  return v5;
}

- (_TtC9AskToCore9ATPayload)initWithOriginalPayload:(id)a3 newResponse:(id)a4
{
  return (_TtC9AskToCore9ATPayload *)ATPayload.init(originalPayload:newResponse:)(a3, a4);
}

- (_TtC9AskToCore9ATPayload)initWithCopying:(id)a3
{
  return (_TtC9AskToCore9ATPayload *)sub_236B02B10(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9AskToCore9ATPayload)initWithCoder:(id)a3
{
  return (_TtC9AskToCore9ATPayload *)ATPayload.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9AskToCore9ATPayload *v5;

  v4 = a3;
  v5 = self;
  ATPayload.encode(with:)((NSCoder)v4);

}

- (id)copyWithZone:(void *)a3
{
  id v4;
  void *v5;
  id v7;

  v4 = objc_allocWithZone((Class)swift_getObjectType());
  v7 = sub_236B02B10(self);
  v5 = (void *)sub_236B168A0();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC9AskToCore9ATPayload *v4;
  _TtC9AskToCore9ATPayload *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_236B16714();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ATPayload.isEqual(_:)((uint64_t)v8);

  sub_236B04E2C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC9AskToCore9ATPayload *v2;
  int64_t v3;

  v2 = self;
  v3 = ATPayload.hash.getter();

  return v3;
}

- (NSString)description
{
  _TtC9AskToCore9ATPayload *v2;
  void *v3;

  v2 = self;
  ATPayload.description.getter();

  v3 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9AskToCore9ATPayload)init
{
  _TtC9AskToCore9ATPayload *result;

  result = (_TtC9AskToCore9ATPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
