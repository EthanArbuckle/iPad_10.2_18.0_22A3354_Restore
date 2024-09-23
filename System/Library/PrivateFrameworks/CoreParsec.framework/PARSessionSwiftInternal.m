@implementation PARSessionSwiftInternal

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id v6;
  PARSessionSwiftInternal *v7;

  v6 = a3;
  v7 = self;
  PARSessionSwiftInternal.report(_:queryId:)(v6, a4);

}

- (PARBag)bag
{
  PARSessionSwiftInternal *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19A827678();
  v4 = v3;

  return (PARBag *)v4;
}

- (PARSessionSwiftInternal)initWithSession:(id)a3 configuration:(id)a4 connection:(id)a5 delegate:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  swift_unknownObjectRetain();
  return (PARSessionSwiftInternal *)PARSessionSwiftInternal.init(session:configuration:connection:delegate:)(v9, v10, a5, (uint64_t)a6);
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  void *v5;
  PARSessionSwiftInternal *v6;

  v5 = _Block_copy(a4);
  sub_19A8C4944();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_19A832B10();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)start
{
  PARSessionSwiftInternal *v2;

  v2 = self;
  sub_19A8373D4();

}

- (void)setDelegate:(id)a3
{
  PARSessionSwiftInternal *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_19A841FC4();

}

- (unint64_t)enabledStatus
{
  PARSessionSwiftInternal *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_19A842044();
  v4 = v3;

  return v4;
}

- (_TtC10CoreParsec15PARSearchClient)client
{
  return (_TtC10CoreParsec15PARSearchClient *)PARSessionSwiftInternal.client.getter();
}

- (PARSessionDelegate)delegate
{
  PARSessionSwiftInternal *v2;

  v2 = self;
  sub_19A853E1C();
}

- (PARSessionConfiguration)configuration
{
  PARSessionSwiftInternal *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19A837418();
  v4 = v3;

  return (PARSessionConfiguration *)v4;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  PARSessionSwiftInternal *v5;

  v4 = a3;
  v5 = self;
  sub_19A853F60(v4);

}

- (void)setBag:(id)a3
{
  id v5;

  v5 = a3;
  self;
  sub_19A8324D0(a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)sub_19A854148();
}

- (void)dealloc
{
  PARSessionSwiftInternal *v2;

  v2 = self;
  PARSessionSwiftInternal.__deallocating_deinit();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_61_0(OBJC_IVAR___PARSessionSwiftInternal_client);
  OUTLINED_FUNCTION_61_0(OBJC_IVAR___PARSessionSwiftInternal__configuration);
  OUTLINED_FUNCTION_61_0(OBJC_IVAR___PARSessionSwiftInternal__mapsListener);
  OUTLINED_FUNCTION_61_0(OBJC_IVAR___PARSessionSwiftInternal__bag);
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_19A85CB3C((uint64_t)self + OBJC_IVAR___PARSessionSwiftInternal__delegate);
  swift_unknownObjectWeakDestroy();
}

- (id)taskWith:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  PARSessionSwiftInternal *v8;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  sub_19A8542DC();
}

- (void)loadWithTask:(id)a3
{
  id v4;
  PARSessionSwiftInternal *v5;

  v4 = a3;
  v5 = self;
  sub_19A85479C(v4);

}

- (unint64_t)safariAssistantEnabledStatusForPageLanguage:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PARSessionSwiftInternal *v7;
  unint64_t v8;

  v4 = sub_19A8C4944();
  v6 = v5;
  v7 = self;
  v8 = sub_19A854A10(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (unint64_t)safariAssistantEnabledStatus
{
  PARSessionSwiftInternal *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_19A854A74();

  return v3;
}

- (void)sendCBAEngagementFeedback:(id)a3 query:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  PARSessionSwiftInternal *v14;
  uint64_t v15;

  v6 = sub_19A8C3DF8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8, v9, v10, v11);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A8C3DD4();
  v14 = self;
  sub_19A854D68((uint64_t)v13, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (PARSessionSwiftInternal)init
{
  PARSessionSwiftInternal.init()();
}

- (BOOL)canLoadImage:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  PARSessionSwiftInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = PARSessionSwiftInternal.canLoad(_:context:)(v6, a4);

  return a4 & 1;
}

- (void)loadImage:(SFImage *)a3 context:(SFImageContext *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  SFImage *v10;
  SFImageContext *v11;
  PARSessionSwiftInternal *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_19A8564DC((uint64_t)&unk_1EE3B0BA8, (uint64_t)v9);
}

- (BOOL)canLoadCard:(id)a3
{
  SFCard *v4;
  PARSessionSwiftInternal *v5;
  Swift::Bool v6;

  v4 = (SFCard *)a3;
  v5 = self;
  v6 = PARSessionSwiftInternal.canLoad(_:)(v4);

  return v6;
}

- (void)loadCard:(id)a3 completionHandler:(id)a4
{
  sub_19A858AD4(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19A856650);
}

- (BOOL)canLoadMoreResults:(id)a3
{
  return PARSessionSwiftInternal.canLoad(_:)(*(SFMoreResults *)(&a2 - 1));
}

- (void)loadMoreResults:(id)a3 completionHandler:(id)a4
{
  sub_19A858AD4(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19A85845C);
}

- (void)send:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PARSessionSwiftInternal *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_19A85C898;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  PARSessionSwiftInternal.send(_:completion:)(v8, (uint64_t)v6, v7);
  sub_19A85C888((uint64_t)v6);

}

- (void)sendCustomFeedback:(id)a3
{
  id v4;
  PARSessionSwiftInternal *v5;

  v4 = a3;
  v5 = self;
  PARSessionSwiftInternal.send(_:)((uint64_t)v4);

}

- (void)didEndSearch:(id)a3
{
  id v4;
  PARSessionSwiftInternal *v5;

  v4 = a3;
  v5 = self;
  PARSessionSwiftInternal.didEndSearch(_:)(v4);

}

- (void)didSkipSearch:(int)a3 input:(id)a4 queryId:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PARSessionSwiftInternal *v11;

  v6 = *(_QWORD *)&a3;
  if (a4)
  {
    v8 = sub_19A8C4944();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = self;
  PARSessionSwiftInternal.didSkipSearch(_:input:queryId:)(v6, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (void)addCompletion:(id)a3 forInput:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PARSessionSwiftInternal *v11;
  Swift::String v12;
  Swift::String v13;

  v5 = sub_19A8C4944();
  v7 = v6;
  v8 = sub_19A8C4944();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  PARSessionSwiftInternal.addCompletion(_:forInput:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)clearEngagementsFrom:(id)a3 to:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  PARSessionSwiftInternal *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;

  v5 = sub_19A8C3EA0();
  v6 = *(_QWORD *)(v5 - 8);
  v11 = MEMORY[0x1E0C80A78](v5, v7, v8, v9, v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14, v15, v16, v17);
  v19 = (char *)&v22 - v18;
  sub_19A8C3E88();
  sub_19A8C3E88();
  v20 = self;
  PARSessionSwiftInternal.clearEngagements(from:to:)();

  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v13, v5);
  v21(v19, v5);
}

- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  PARSessionSwiftInternal *v10;
  Swift::String v11;
  NSNumber_optional v12;

  v6 = sub_19A8C4944();
  v8 = v7;
  v9 = a4;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  v12.value.super.super.isa = (Class)a4;
  PARSessionSwiftInternal.clearEngagements(withTitle:type:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  PARSmartSearchV1Parameters *v6;
  PARSmartSearchV2Parameters *v7;
  PARSessionSwiftInternal *v8;

  v6 = (PARSmartSearchV1Parameters *)a3;
  v7 = (PARSmartSearchV2Parameters *)a4;
  v8 = self;
  PARSessionSwiftInternal.updateParameters(forSmartSearchV1:smartSearchV2:)(v6, v7);

}

- (void)addEngagedResults:(id)a3
{
  uint64_t v4;
  PARSessionSwiftInternal *v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFFDF50);
  v4 = sub_19A8C4A1C();
  v5 = self;
  PARSessionSwiftInternal.addEngagedResults(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)addEngagedResults:(id)a3 completion:(id)a4
{
  uint64_t (*v5)();
  PARSessionSwiftInternal *v6;

  v5 = (uint64_t (*)())_Block_copy(a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFFDF50);
  sub_19A8C4A1C();
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v5 = sub_19A85CCE4;
  }
  v6 = self;
  PARSessionSwiftInternal.addEngagedResults(_:completion:)();
  sub_19A85C888((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)topEngagedResultsFor:(id)a3 maxCount:(int64_t)a4 completion:(id)a5
{
  sub_19A85A874(self, (int)a2, (int)a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, void *))sub_19A862A20);
}

- (void)allEngagedResultsFor:(id)a3 maxCount:(int64_t)a4 completion:(id)a5
{
  sub_19A85A874(self, (int)a2, (int)a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, void *))sub_19A863080);
}

- (void)clearEngagedResults:(id)a3 completion:(id)a4
{
  void *v5;
  PARSessionSwiftInternal *v6;

  v5 = _Block_copy(a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFFDF50);
  sub_19A8C4A1C();
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v5 = sub_19A85C880;
  }
  v6 = self;
  PARSessionSwiftInternal.clearEngagedResults(_:completion:)();
  sub_19A85C888((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)subscribeToChannel:(id)a3 reply:(id)a4
{
  sub_19A85AC34(self, (int)a2, a3, a4, (uint64_t)&unk_1E3920B58, (uint64_t)sub_19A85CCE0, (void (*)(id, uint64_t, uint64_t))&PARSessionSwiftInternal.subscribe(toChannel:reply:));
}

- (void)unsubscribeFromChannel:(id)a3 reply:(id)a4
{
  sub_19A85AC34(self, (int)a2, a3, a4, (uint64_t)&unk_1E3920B30, (uint64_t)sub_19A85CCE0, (void (*)(id, uint64_t, uint64_t))&PARSessionSwiftInternal.unsubscribe(fromChannel:reply:));
}

- (void)subscriptionStatusForChannel:(id)a3 reply:(id)a4
{
  sub_19A85AC34(self, (int)a2, a3, a4, (uint64_t)&unk_1E3920B08, (uint64_t)sub_19A85C868, (void (*)(id, uint64_t, uint64_t))&PARSessionSwiftInternal.subscriptionStatus(forChannel:reply:));
}

@end
