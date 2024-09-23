@implementation AXVoiceOverVoiceRotorItem

- (NSString)identifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18C711E80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_18C711EA4();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_identifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)userDefinedName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_userDefinedName;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_18C711E80();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setUserDefinedName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_18C711EA4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_userDefinedName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)voiceId
{
  AXVoiceOverVoiceRotorItem *v2;
  AXCVoiceSelection *v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = -[AXVoiceOverVoiceRotorItem selection](v2, sel_selection);
  v4 = -[AXCVoiceSelection voiceId](v3, sel_voiceId);

  if (v4)
  {
    sub_18C711EA4();

  }
  else
  {

  }
  v5 = (void *)sub_18C711E80();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setVoiceId:(id)a3
{
  AXVoiceOverVoiceRotorItem *v4;
  AXCVoiceSelection *v5;
  id v6;

  sub_18C711EA4();
  v4 = self;
  v5 = -[AXVoiceOverVoiceRotorItem selection](v4, sel_selection);
  v6 = (id)sub_18C711E80();
  swift_bridgeObjectRelease();
  -[AXCVoiceSelection setVoiceId:](v5, sel_setVoiceId_, v6);

}

- (AXCVoiceSelection)selection
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection);
  swift_beginAccess();
  return (AXCVoiceSelection *)*v2;
}

- (void)setSelection:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (AXVoiceOverVoiceRotorItem)initWithIdentifier:(id)a3 selection:(id)a4 userDefinedName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id *v13;
  uint64_t *v14;
  id v15;
  AXVoiceOverVoiceRotorItem *v16;
  objc_super v18;

  v8 = sub_18C711EA4();
  v10 = v9;
  if (a5)
  {
    a5 = (id)sub_18C711EA4();
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  v13 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_userDefinedName);
  *v13 = 0;
  v13[1] = 0;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___AXVoiceOverVoiceRotorItem_identifier);
  *v14 = v8;
  v14[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXVoiceOverVoiceRotorItem_selection) = (Class)a4;
  swift_beginAccess();
  *v13 = a5;
  v13[1] = v12;
  v15 = a4;
  swift_bridgeObjectRelease();
  v18.receiver = self;
  v18.super_class = (Class)AXVoiceOverVoiceRotorItem;
  v16 = -[AXVoiceOverVoiceRotorItem init](&v18, sel_init);

  return v16;
}

- (AXVoiceOverVoiceRotorItem)init
{
  AXVoiceOverVoiceRotorItem *result;

  result = (AXVoiceOverVoiceRotorItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
