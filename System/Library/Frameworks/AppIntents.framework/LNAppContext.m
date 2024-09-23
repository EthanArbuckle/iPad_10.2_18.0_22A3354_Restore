@implementation LNAppContext

- (LNAppContext)init
{
  return (LNAppContext *)AppContext.init()();
}

- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  LNAppContext *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_227EDA224((uint64_t)&unk_255942730, v5);
}

- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  LNAppContext *v10;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = self;
  sub_227EDA224((uint64_t)&unk_2559393A8, (uint64_t)v9);
}

- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNAppContext *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_227EDA224((uint64_t)&unk_255939D78, (uint64_t)v7);
}

- (void)fetchViewActionsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  LNAppContext *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_227EDA224((uint64_t)&unk_255939D68, v5);
}

- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  LNAppContext *v10;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  v10 = self;
  sub_227EDA224((uint64_t)&unk_255939D58, (uint64_t)v9);
}

- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  LNAppContext *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_227EDA224((uint64_t)&unk_25593A1C8, v5);
}

- (void)updateContextForConnection:(NSXPCConnection *)a3 context:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSXPCConnection *v10;
  LNAppContext *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  sub_227EDA224((uint64_t)&unk_25593A9B8, (uint64_t)v9);
}

- (void)removeContextForConnection:(id)a3
{
  id v4;
  LNAppContext *v5;

  v4 = a3;
  v5 = self;
  AppContext.removeContext(connection:)((NSXPCConnection)v4);

}

- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  LNAppContext *v7;

  v5 = _Block_copy(a4);
  v6 = sub_2281A7030();
  _Block_copy(v5);
  v7 = self;
  sub_227F51640(v6, (uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  LNAppContext *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_227EDA224((uint64_t)&unk_25593C268, v5);
}

- (void)fetchSuggestedActionsWithSiriLanguageCode:(NSString *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  LNAppContext *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_227EDA224((uint64_t)&unk_25593C258, (uint64_t)v7);
}

- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNAppContext *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_227EDA224((uint64_t)&unk_25593C248, (uint64_t)v7);
}

- (void)fetchActionForAutoShortcutPhrase:(NSString *)a3 completionHandler:(id)a4
{
  sub_227F6861C(self, (int)a2, a3, a4, (uint64_t)&unk_24F0C3728, (uint64_t)&unk_25593C3C0);
}

- (void)fetchActionForAppShortcutIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  sub_227F6861C(self, (int)a2, a3, a4, (uint64_t)&unk_24F0C3700, (uint64_t)&unk_25593C3B0);
}

- (void)performAction:(id)a3 options:(id)a4 reportingProgress:(NSProgress *)a5 delegate:(LNPerformActionExecutorDelegate *)a6 auditToken:(id *)a7 completionHandler:(id)a8
{
  void *v13;
  uint64_t v14;
  NSProgress *v15;
  LNAppContext *v16;
  __int128 v17;
  __int128 v18;

  v17 = *(_OWORD *)&a7->var0[4];
  v18 = *(_OWORD *)a7->var0;
  v13 = _Block_copy(a8);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = a5;
  *(_QWORD *)(v14 + 40) = a6;
  *(_OWORD *)(v14 + 48) = v18;
  *(_OWORD *)(v14 + 64) = v17;
  *(_QWORD *)(v14 + 80) = v13;
  *(_QWORD *)(v14 + 88) = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = a5;
  swift_unknownObjectRetain();
  v16 = self;
  sub_227EDA224((uint64_t)&unk_25593D030, v14);
}

- (void)performQuery:(id)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  LNAppContext *v11;
  __int128 v12;
  __int128 v13;

  v12 = *(_OWORD *)&a4->var0[4];
  v13 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v13;
  *(_OWORD *)(v10 + 40) = v12;
  *(_QWORD *)(v10 + 56) = a5;
  *(_QWORD *)(v10 + 64) = v9;
  *(_QWORD *)(v10 + 72) = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;
  sub_227EDA224((uint64_t)&unk_25593D210, v10);
}

- (void)performSuggestedResultsQueryWithEntityType:(id)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  LNAppContext *v11;
  __int128 v12;
  __int128 v13;

  v12 = *(_OWORD *)&a4->var0[4];
  v13 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v13;
  *(_OWORD *)(v10 + 40) = v12;
  *(_QWORD *)(v10 + 56) = a5;
  *(_QWORD *)(v10 + 64) = v9;
  *(_QWORD *)(v10 + 72) = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;
  sub_227EDA224((uint64_t)&unk_25593D200, v10);
}

- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(NSString *)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  sub_227FA4F08(self, (int)a2, a3, (__int128 *)a4, (uint64_t)a5, a6);
}

- (void)performAllEntitiesQueryWithEntityMangledTypeName:(NSString *)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  sub_227FA4F08(self, (int)a2, a3, (__int128 *)a4, (uint64_t)a5, a6);
}

- (void)performConfigurableQuery:(LNConfigurableQueryRequest *)a3 auditToken:(id *)a4 connectionIdentifier:(NSNumber *)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  LNConfigurableQueryRequest *v11;
  NSNumber *v12;
  LNAppContext *v13;
  __int128 v14;
  __int128 v15;

  v14 = *(_OWORD *)&a4->var0[4];
  v15 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v15;
  *(_OWORD *)(v10 + 40) = v14;
  *(_QWORD *)(v10 + 56) = a5;
  *(_QWORD *)(v10 + 64) = v9;
  *(_QWORD *)(v10 + 72) = self;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_227EDA224((uint64_t)&unk_25593D1D0, v10);
}

- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  LNAppContext *v10;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = self;
  sub_227EDA224((uint64_t)&unk_25593D988, (uint64_t)v9);
}

- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNAppContext *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_227EDA224((uint64_t)&unk_25593FD78, (uint64_t)v7);
}

- (void)fetchActionListenerEndpoint:(LNAction *)a3 auditToken:(id *)a4 connectionIdentifier:(int64_t)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  LNAction *v11;
  LNAppContext *v12;
  __int128 v13;
  __int128 v14;

  v13 = *(_OWORD *)&a4->var0[4];
  v14 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v14;
  *(_OWORD *)(v10 + 40) = v13;
  *(_QWORD *)(v10 + 56) = a5;
  *(_QWORD *)(v10 + 64) = v9;
  *(_QWORD *)(v10 + 72) = self;
  v11 = a3;
  v12 = self;
  sub_227EDA224((uint64_t)&unk_255940560, v10);
}

- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNAppContext *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_227EDA224((uint64_t)&unk_2559408B0, (uint64_t)v7);
}

- (void)fetchURLForEnumWithIdentifier:(NSString *)a3 caseIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  NSString *v11;
  LNAppContext *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_227EDA224((uint64_t)&unk_255940B08, (uint64_t)v9);
}

- (void)fetchDisplayRepresentationForActions:(NSArray *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSArray *v8;
  LNAppContext *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_227EDA224((uint64_t)&unk_255940B48, (uint64_t)v7);
}

- (void)fetchActionAppContextForAction:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNAppContext *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_227EDA224((uint64_t)&unk_255941058, (uint64_t)v7);
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)static AppContext.currentAuditToken()();
}

+ (void)cancelTimeout
{
  static AppContext.cancelTimeout()();
}

+ (void)extendTimeout
{
  static AppContext.extendTimeout()();
}

- (void)fetchActionOutputValueForConnection:(NSXPCConnection *)a3 withIdentifier:(NSUUID *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSXPCConnection *v10;
  NSUUID *v11;
  LNAppContext *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_227EDA224((uint64_t)&unk_2559414A8, (uint64_t)v9);
}

- (void)removeAllDeferredOutputsFor:(id)a3
{
  id v4;
  LNAppContext *v5;

  v4 = a3;
  v5 = self;
  AppContext.removeAllDeferredOutputs(for:)((NSXPCConnection)v4);

}

- (void)fetchValueForPropertyWithIdentifier:(NSString *)a3 entity:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  LNAppContext *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  sub_227EDA224((uint64_t)&unk_255942748, (uint64_t)v9);
}

- (void)exportTransientEntities:(NSArray *)a3 withConfiguration:(LNExportedContentConfiguration *)a4 connectionIdentifier:(NSNumber *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSArray *v12;
  LNExportedContentConfiguration *v13;
  NSNumber *v14;
  LNAppContext *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_227EDA224((uint64_t)&unk_255942778, (uint64_t)v11);
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 connectionIdentifier:(id)a9 completionHandler:(id)a10
{
  void *v17;
  _QWORD *v18;
  LNAppContext *v19;

  v17 = _Block_copy(a10);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a8;
  v18[8] = a9;
  v18[9] = v17;
  v18[10] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v19 = self;
  sub_227EDA224((uint64_t)&unk_2559430F0, (uint64_t)v18);
}

- (void)fetchOptionsDefaultValuesForAction:(id)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  LNAppContext *v10;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = self;
  sub_227EDA224((uint64_t)&unk_2559430E0, (uint64_t)v9);
}

- (void)fetchParameterOptionDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(NSString *)a5 connectionIdentifier:(id)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  NSString *v14;
  LNAppContext *v15;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v14 = a5;
  swift_unknownObjectRetain();
  v15 = self;
  sub_227EDA224((uint64_t)&unk_2559430A0, (uint64_t)v13);
}

@end
