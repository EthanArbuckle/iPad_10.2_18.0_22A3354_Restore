@implementation ATQuestion

- (NSString)id
{
  return (NSString *)sub_236B0B01C();
}

- (ATQuestionTopic)topic
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  return (ATQuestionTopic *)*v2;
}

- (void)setTopic:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)title
{
  return (NSString *)sub_236B0B298();
}

- (void)setTitle:(id)a3
{
  sub_236B0B364((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_title);
}

- (NSString)summary
{
  return (NSString *)sub_236B0B298();
}

- (void)setSummary:(id)a3
{
  sub_236B0B364((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
}

- (NSString)notificationText
{
  return (NSString *)sub_236B0B80C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

- (void)setNotificationText:(id)a3
{
  sub_236B0B898((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

- (NSArray)answerChoices
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for ATAnswerChoice();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_236B16600();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAnswerChoices:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for ATAnswerChoice();
  v4 = sub_236B1660C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)associatedContentDisplayName
{
  return (NSString *)sub_236B0B80C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

- (void)setAssociatedContentDisplayName:(id)a3
{
  sub_236B0B898((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

- (NSString)associatedContentIdentifier
{
  return (NSString *)sub_236B0B80C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

- (void)setAssociatedContentIdentifier:(id)a3
{
  sub_236B0B898((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

- (NSString)associatedContentBundleIdentifier
{
  return (NSString *)sub_236B0B80C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

- (void)setAssociatedContentBundleIdentifier:(id)a3
{
  sub_236B0B898((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

- (NSString)associatedContentAdamIdentifier
{
  return (NSString *)sub_236B0B80C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

- (void)setAssociatedContentAdamIdentifier:(id)a3
{
  sub_236B0B898((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

- (NSDate)expirationDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  sub_236AFD788((uint64_t)v6, (uint64_t)v5, &qword_25643B5E0);
  v7 = sub_236B16474();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_236B1645C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC5AskTo10ATQuestion *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_236B16468();
    v8 = sub_236B16474();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_236B16474();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  v11 = self;
  sub_236B0BBF0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (_TtC5AskTo10ATQuestion)initWithTopic:(id)a3 title:(id)a4 summary:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC5AskTo10ATQuestion *v14;
  uint64_t v16;
  uint64_t v17;

  v17 = sub_236B164BC();
  v7 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236B1654C();
  sub_236B1654C();
  v10 = a3;
  sub_236B164B0();
  sub_236B16480();
  v11 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v14 = -[ATQuestion initWithId:topic:title:summary:](self, sel_initWithId_topic_title_summary_, v11, v10, v12, v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  return v14;
}

- (_TtC5AskTo10ATQuestion)initWithId:(id)a3 topic:(id)a4 title:(id)a5 summary:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5AskTo10ATQuestion *v11;

  v7 = sub_236B1654C();
  v9 = v8;
  sub_236B1654C();
  sub_236B1654C();
  v10 = a4;
  v11 = (_TtC5AskTo10ATQuestion *)sub_236B0F690(v7, v9, (uint64_t)v10);

  return v11;
}

- (_TtC5AskTo10ATQuestion)initWithSystemId:(id)a3 version:(double)a4 id:(id)a5 topic:(id)a6 title:(id)a7 summary:(id)a8 notificationText:(id)a9 answerChoices:(id)a10
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _TtC5AskTo10ATQuestion *v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _TtC5AskTo10ATQuestion *v32;

  v31 = a6;
  v32 = self;
  v12 = sub_236B164BC();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236B164A4();
  v30 = sub_236B1654C();
  v16 = v15;
  v17 = sub_236B1654C();
  v19 = v18;
  v20 = sub_236B1654C();
  v22 = v21;
  if (a9)
  {
    a9 = (id)sub_236B1654C();
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  type metadata accessor for ATAnswerChoice();
  v25 = sub_236B1660C();
  v26 = v31;
  v27 = (_TtC5AskTo10ATQuestion *)sub_236B0F7FC((uint64_t)v14, v30, v16, v26, v17, v19, v20, v22, a4, (uint64_t)a9, v24, v25);

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  return sub_236B0DE4C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))ATQuestion.isEqual(_:));
}

- (int64_t)hash
{
  _TtC5AskTo10ATQuestion *v2;
  int64_t v3;

  v2 = self;
  v3 = ATQuestion.hash.getter();

  return v3;
}

- (NSString)description
{
  _TtC5AskTo10ATQuestion *v2;
  void *v3;

  v2 = self;
  ATQuestion.description.getter();

  v3 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5AskTo10ATQuestion)init
{
  _TtC5AskTo10ATQuestion *result;

  result = (_TtC5AskTo10ATQuestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_systemId;
  v4 = sub_236B164BC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_236AFD12C((uint64_t)self + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate, &qword_25643B5E0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC5AskTo10ATQuestion)initWithCoder:(id)a3
{
  return (_TtC5AskTo10ATQuestion *)ATQuestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC5AskTo10ATQuestion *v5;

  v4 = a3;
  v5 = self;
  ATQuestion.encode(with:)((NSCoder)v4);

}

@end
