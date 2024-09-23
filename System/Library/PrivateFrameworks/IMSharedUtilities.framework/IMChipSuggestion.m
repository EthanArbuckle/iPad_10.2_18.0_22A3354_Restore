@implementation IMChipSuggestion

- (NSString)displayText
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setDisplayText:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_19E36F888();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___IMChipSuggestion_displayText);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)postback
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMChipSuggestion_postback);
}

- (void)setPostback:(id)a3
{
  sub_19E32B7B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___IMChipSuggestion_postback);
}

- (NSString)inReplyToID
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMChipSuggestion_inReplyToID);
}

- (void)setInReplyToID:(id)a3
{
  sub_19E32B7B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___IMChipSuggestion_inReplyToID);
}

- (IMChipSuggestion)initWithDisplayText:(id)a3 postback:(id)a4 inReplyToID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_19E36F888();
  v9 = v8;
  if (!a4)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v14 = 0;
    return (IMChipSuggestion *)sub_19E32B7FC(v7, v9, (uint64_t)a4, v11, v12, v14);
  }
  a4 = (id)sub_19E36F888();
  v11 = v10;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v12 = sub_19E36F888();
  v14 = v13;
  return (IMChipSuggestion *)sub_19E32B7FC(v7, v9, (uint64_t)a4, v11, v12, v14);
}

- (IMChipSuggestion)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMChipSuggestion *)IMChipSuggestion.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMChipSuggestion *v2;
  void *v3;

  v2 = self;
  sub_19E32BC30();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMChipSuggestion)init
{
  IMChipSuggestion *result;

  result = (IMChipSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
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
