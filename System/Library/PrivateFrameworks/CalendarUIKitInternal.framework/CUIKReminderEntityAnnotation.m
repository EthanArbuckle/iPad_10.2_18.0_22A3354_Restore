@implementation CUIKReminderEntityAnnotation

+ (id)annotationWithReminderIntegrationEvent:(id)a3
{
  id v4;
  void *v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = (void *)sub_2376E1428(v4);

  return v5;
}

+ (id)entityIdentifierForReminderIntegrationEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v13;
  uint64_t v14;

  swift_getObjCClassMetadata();
  v4 = sub_2376F2B5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D58);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  sub_2376E163C(v11, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_2376E081C((uint64_t)v10, &qword_256808D58);

    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_2376F2B50();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    v13 = (void *)sub_2376F2BD4();
    swift_bridgeObjectRelease();
    return v13;
  }
}

- (CUIKReminderEntityAnnotation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ReminderEntityAnnotation();
  return -[CUIKReminderEntityAnnotation init](&v3, sel_init);
}

@end
