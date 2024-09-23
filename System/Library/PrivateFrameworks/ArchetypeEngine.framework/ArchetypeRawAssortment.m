@implementation ArchetypeRawAssortment

- (int64_t)returnNumber
{
  return 42;
}

- (void)spotlightItemTitlesWithNTitles:(int64_t)a3 completionHandler:(id)a4
{
  sub_236A66448(self, (int)a2, a3, a4, (uint64_t)&unk_25080CD18, (uint64_t)sub_236A6968C, _s15ArchetypeEngine0A13RawAssortmentC19spotlightItemTitles01nG017completionHandlerySi_ySaySSGctF_0);
}

- (void)spotlightEmailAttributesWithNEmails:(int64_t)a3 completionHandler:(id)a4
{
  sub_236A66448(self, (int)a2, a3, a4, (uint64_t)&unk_25080CCF0, (uint64_t)sub_236A6968C, _s15ArchetypeEngine0A13RawAssortmentC24spotlightEmailAttributes7nEmails17completionHandlerySi_ySaySSGctF_0);
}

- (id)textOnScreen
{
  void *v2;

  _s15ArchetypeEngine0A13RawAssortmentC12textOnScreenSSyF_0();
  v2 = (void *)sub_236A6DE2C();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)spotlightItemsWithContentType:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC15ArchetypeEngine22ArchetypeRawAssortment *v10;

  v5 = _Block_copy(a4);
  v6 = sub_236A6DE38();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  _s15ArchetypeEngine0A13RawAssortmentC14spotlightItems11contentType17completionHandlerySS_ySaySSGctF_0(v6, v8, (uint64_t)sub_236A6968C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC15ArchetypeEngine22ArchetypeRawAssortment)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArchetypeRawAssortment();
  return -[ArchetypeRawAssortment init](&v3, sel_init);
}

@end
