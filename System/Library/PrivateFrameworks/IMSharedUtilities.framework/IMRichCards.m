@implementation IMRichCards

- (NSArray)cards
{
  void *v2;

  type metadata accessor for IMRichCard(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (IMRichCards)initWithCards:(id)a3
{
  objc_super v5;

  type metadata accessor for IMRichCard(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCards_cards) = (Class)sub_19E36F960();
  v5.receiver = self;
  v5.super_class = (Class)IMRichCards;
  return -[IMRichCards init](&v5, sel_init);
}

- (IMRichCards)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMRichCards *)IMRichCards.init(dictionary:)(v3);
}

- (IMRichCards)initWithCardArray:(id)a3
{
  uint64_t v3;

  sub_19E247E74(&qword_1EE503490);
  v3 = sub_19E36F960();
  return (IMRichCards *)sub_19E3694BC(v3);
}

- (id)dictionaryRepresentation
{
  IMRichCards *v2;
  void *v3;

  v2 = self;
  sub_19E3696FC();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)suggestedRepliesList
{
  return sub_19E369E08(self, (uint64_t)a2, (void (*)(void))sub_19E3699AC, &qword_1EE5037D0);
}

- (id)suggestedActionsList
{
  return sub_19E369E08(self, (uint64_t)a2, (void (*)(void))sub_19E369BA8, &qword_1EE5037C0);
}

- (void)updateUrlToTransferMap:(id)a3
{
  id v4;
  IMRichCards *v5;

  v4 = a3;
  v5 = self;
  sub_19E369E68((uint64_t)v4);

}

- (id)previewText
{
  IMRichCards *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_19E369FC8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  IMRichCards *v4;
  IMRichCards *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IMRichCards.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCards)init
{
  IMRichCards *result;

  result = (IMRichCards *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
