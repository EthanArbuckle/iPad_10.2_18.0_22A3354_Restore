@implementation MPLegacyVoicemail

- (NSUUID)accountID
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (MPLegacyVoicemail)initWithAccountID:(id)a3 label:(id)a4 hasUnreadMessages:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  objc_class *v17;
  MPLegacyVoicemail *v18;
  objc_super v20;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)self + OBJC_IVAR___MPLegacyVoicemail_accountID, v12, v9);
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___MPLegacyVoicemail_label);
  *v16 = v13;
  v16[1] = v15;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___MPLegacyVoicemail_hasUnreadMessages) = a5;
  v17 = (objc_class *)type metadata accessor for LegacyVoicemail(0);
  v20.receiver = self;
  v20.super_class = v17;
  v18 = -[MPLegacyVoicemail init](&v20, "init");
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

+ (MPLegacyVoicemail)mock
{
  if (qword_100091068 != -1)
    swift_once(&qword_100091068, sub_1000502F8);
  return (MPLegacyVoicemail *)(id)qword_100092E70;
}

- (MPLegacyVoicemail)init
{
  MPLegacyVoicemail *result;

  result = (MPLegacyVoicemail *)_swift_stdlib_reportUnimplementedInitializer("IntentsUI.LegacyVoicemail", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___MPLegacyVoicemail_accountID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->label[OBJC_IVAR___MPLegacyVoicemail_label]);
}

@end
