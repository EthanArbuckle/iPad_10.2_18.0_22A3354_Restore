@implementation ISComponentIdentifier

- (ISComponentIdentifier)initWithName:(int)a3 uuid:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  ISComponentIdentifier *v15;
  objc_class *v16;
  ISComponentIdentifier *v17;
  objc_super v19;

  v5 = sub_21DC715F4();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (char *)&v19 - v12;
  sub_21DC715DC();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v13, v5);
  v14 = objc_allocWithZone((Class)sub_21DC71804());
  v15 = self;
  *(Class *)((char *)&v15->super.isa + OBJC_IVAR___ISComponentIdentifier_componentIdentifier) = (Class)sub_21DC717EC();

  v16 = (objc_class *)type metadata accessor for ComponentIdentifierBridge();
  v19.receiver = v15;
  v19.super_class = v16;
  v17 = -[ISComponentIdentifier init](&v19, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
  return v17;
}

- (int)componentName
{
  ISComponentIdentifier *v2;
  int v3;

  v2 = self;
  v3 = sub_21DC717D4();

  return v3;
}

- (NSUUID)uuid
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ISComponentIdentifier *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_21DC715F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_21DC717F8();

  v9 = (void *)sub_21DC715B8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSUUID *)v9;
}

- (ISComponentIdentifier)init
{
  ISComponentIdentifier *result;

  result = (ISComponentIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
