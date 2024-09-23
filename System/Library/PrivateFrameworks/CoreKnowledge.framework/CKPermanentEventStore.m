@implementation CKPermanentEventStore

- (CKPermanentEventStore)initWithKnowledgeStore:(id)a3
{
  return (CKPermanentEventStore *)CKPermanentEventStore.init(knowledgeStore:)((uint64_t)a3);
}

+ (id)defaultStore
{
  id v2;

  static CKPermanentEventStore.defaultStore()();
  return v2;
}

- (CKPermanentEventStore)init
{
  CKPermanentEventStore.init()();
}

- (void).cxx_destruct
{

}

+ (id)createEventWithIdentifier:(id)a3 dateInterval:(id)a4 metadata:(id)a5 fromEvent:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE77D070);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A4920D3C();
  v14 = v13;
  if (a4)
  {
    sub_1A4920A48();
    v15 = sub_1A4920A84();
    v16 = 0;
  }
  else
  {
    v15 = sub_1A4920A84();
    v16 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v11, v16, 1, v15);
  v17 = sub_1A4920CF4();
  v18 = a6;
  v19 = (void *)static CKPermanentEventStore.createEvent(withIdentifier:dateInterval:metadata:from:)(v12, v14, (uint64_t)v11, v17, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A48D2CD0((uint64_t)v11, &qword_1EE77D070);
  return v19;
}

- (void)recordEvent:(id)a3 completionHandler:(id)a4
{
  sub_1A48D47BC(self, (int)a2, a3, a4, (uint64_t)&unk_1E4D269E0, (uint64_t)sub_1A48BEAA8, CKPermanentEventStore.record(_:completionHandler:));
}

- (BOOL)recordEvent:(id)a3 error:(id *)a4
{
  return sub_1A48D462C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKPermanentEventStore.record(_:));
}

- (BOOL)recordInteraction:(id)a3 error:(id *)a4
{
  return sub_1A48D462C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKPermanentEventStore.record(_:));
}

- (void)recordInteraction:(id)a3 completionHandler:(id)a4
{
  sub_1A48D47BC(self, (int)a2, a3, a4, (uint64_t)&unk_1E4D269B8, (uint64_t)sub_1A48BEAA8, (void (*)(id, uint64_t, uint64_t))CKPermanentEventStore.record(_:completionHandler:));
}

- (BOOL)recordInteraction:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  CKPermanentEventStore *v12;
  Swift::String_optional v13;
  void *v14;
  void *v15;
  id v16;

  if (a4)
  {
    v8 = sub_1A4920D3C();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = a3;
  v12 = self;
  v13.value._countAndFlagsBits = v8;
  v13.value._object = v10;
  CKPermanentEventStore.record(_:withBundleId:)((INInteraction)v11, v13);

  swift_bridgeObjectRelease();
  if (v14)
  {
    if (a5)
    {
      v15 = (void *)sub_1A4920AB4();

      v16 = v15;
      *a5 = v15;
    }
    else
    {

    }
  }
  return v14 == 0;
}

- (void)recordInteraction:(id)a3 bundleId:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  CKPermanentEventStore *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_1A4920D3C();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_1A48D4B64(v11, v9, (uint64_t)a4, v12, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (BOOL)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CKPermanentEventStore *v9;
  Swift::String v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_1A4920D3C();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CKPermanentEventStore.deleteInteractions(withBundleId:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_1A4920AB4();

      v13 = v12;
      *a4 = v12;
    }
    else
    {

    }
  }
  return v11 == 0;
}

- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKPermanentEventStore *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1A4920D3C();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  CKPermanentEventStore.deleteInteractions(withBundleId:completionHandler:)(v6, v8, (uint64_t)sub_1A48BEA9C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)historicEventWithIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKPermanentEventStore *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1A4920D3C();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  CKPermanentEventStore.historicEvent(withIdentifier:completionHandler:)(v6, v8, (uint64_t)sub_1A48DB460, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)historicEventsWithSourceBundleIdentifier:(id)a3 andIntent:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  CKPermanentEventStore *v12;

  v8 = _Block_copy(a5);
  if (a3)
  {
    v9 = sub_1A4920D3C();
    a3 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a4;
  v12 = self;
  sub_1A48DA9D4(v9, (uint64_t)a3, a4, v12, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (CKKnowledgeStore)backingStore
{
  return (CKKnowledgeStore *)CKPermanentEventStore.backingStore.getter();
}

- (id)historicEventsAndReturnError:(id *)a3
{
  CKPermanentEventStore *v3;
  void *v4;

  v3 = self;
  CKPermanentEventStore.historicEvents()();

  type metadata accessor for CKHistoricEvent();
  v4 = (void *)sub_1A4920CE8();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)historicEventsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  CKPermanentEventStore *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  CKPermanentEventStore.historicEvents(completionHandler:)((uint64_t)sub_1A48DB428, v5);

  swift_release();
}

- (void)setFirstSeen:(id)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
  sub_1A48F3EC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)&unk_1E4D27B18, (uint64_t)sub_1A48BEAA8, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))CKPermanentEventStore.setFirstSeen(_:forEventWithIdentifier:completionHandler:));
}

- (void)setLastSeen:(id)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
  sub_1A48F3EC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)&unk_1E4D27AF0, (uint64_t)sub_1A48BEAA8, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))CKPermanentEventStore.setLastSeen(_:forEventWithIdentifier:completionHandler:));
}

- (void)setFrequency:(int64_t)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKPermanentEventStore *v12;

  v7 = _Block_copy(a5);
  v8 = sub_1A4920D3C();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  CKPermanentEventStore.setFrequency(_:forEventWithIdentifier:completionHandler:)(a3, v8, v10, (uint64_t)sub_1A48BEAA8, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setLastDuration:(double)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
  sub_1A48F4660(self, (int)a2, (int)a4, a5, a3, (uint64_t)&unk_1E4D27AA0, (uint64_t)sub_1A48BEAA8, CKPermanentEventStore.setLastDuration(_:forEventWithIdentifier:completionHandler:));
}

- (void)setTotalDuration:(double)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
  sub_1A48F4660(self, (int)a2, (int)a4, a5, a3, (uint64_t)&unk_1E4D27A78, (uint64_t)sub_1A48BEAA8, CKPermanentEventStore.setTotalDuration(_:forEventWithIdentifier:completionHandler:));
}

- (BOOL)deleteEventWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CKPermanentEventStore *v9;
  Swift::String v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_1A4920D3C();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CKPermanentEventStore.deleteEvent(withIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_1A4920AB4();

      v13 = v12;
      *a4 = v12;
    }
    else
    {

    }
  }
  return v11 == 0;
}

- (void)deleteEventWithIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  CKPermanentEventStore *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1A4920D3C();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  CKPermanentEventStore.deleteEvent(withIdentifier:completionHandler:)(v6, v8, sub_1A48BEA9C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

@end
