@implementation _MPCQueueControllerBehaviorPodcasts

+ (id)makeExtensionWithInvalidatable:(id)a3
{
  id v3;

  swift_unknownObjectRetain();
  v3 = static QueueControllerBehaviorPodcasts.makeExtension(with:)();
  swift_unknownObjectRelease();
  return v3;
}

- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 extension:(id)a5 reason:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _MPCQueueControllerBehaviorPodcasts *v13;
  uint64_t v14;
  char v15;

  v9 = sub_210E92BA8();
  v11 = v10;
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  QueueControllerBehaviorPodcasts.isExportableSessionType(_:forContentItemID:extension:reason:)((uint64_t)v12, v9, v11, v14, a6);
  LOBYTE(a6) = v15;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return a6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static QueueControllerBehaviorPodcasts.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static QueueControllerBehaviorPodcasts.supportsSecureCoding.setter(a3);
}

- (BOOL)hasUserMutations
{
  char v2;

  sub_210D118A8();
  return v2 & 1;
}

- (void)setHasUserMutations:(BOOL)a3
{
  sub_210D11904(a3);
}

- (BOOL)allowsQueueModifications
{
  char v2;

  sub_210D119A0();
  return v2 & 1;
}

- (void)setAllowsQueueModifications:(BOOL)a3
{
  sub_210D119FC(a3);
}

- (NSString)sessionID
{
  void *v2;

  sub_210D11AAC();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setSessionID:(id)a3
{
  _MPCQueueControllerBehaviorPodcasts *v4;

  sub_210E92BA8();
  v4 = self;
  sub_210D11B54();

}

- (MPCQueueControllerBehaviorHost)host
{
  return (MPCQueueControllerBehaviorHost *)(id)sub_210D11C34();
}

- (void)setHost:(id)a3
{
  _MPCQueueControllerBehaviorPodcasts *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210D11C90((uint64_t)a3);

}

- (_MPCQueueControllerBehaviorPodcasts)initWithCoder:(id)a3
{
  id v3;
  _MPCQueueControllerBehaviorPodcasts *result;

  v3 = a3;
  QueueControllerBehaviorPodcasts.init(coder:)();
  return result;
}

- (_MPCQueueControllerBehaviorPodcasts)initWithSessionID:(id)a3
{
  _MPCQueueControllerBehaviorPodcasts *result;

  if (a3)
    sub_210E92BA8();
  QueueControllerBehaviorPodcasts.init(sessionID:)();
  return result;
}

- (void)connectToHost:(id)a3
{
  sub_210D12EBC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_210D12AEC);
}

- (void)disconnectFromHost:(id)a3
{
  sub_210D12EBC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_210D12CE4);
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 0;
}

- (NSArray)queueTrackIdentifiers
{
  _MPCQueueControllerBehaviorPodcasts *v2;
  void *v3;

  v2 = self;
  sub_210D12F70();

  v3 = (void *)sub_210E92CBC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)canReuseQueue:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _MPCQueueControllerBehaviorPodcasts *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_210D187B4(v7, (char *)v8, v6);
  _Block_release(v6);

}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _MPCQueueControllerBehaviorPodcasts *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_210D18C30(v7, (char *)v8, v6);
  v10 = v9;
  _Block_release(v6);

  if (v10)
  {
    v11 = (void *)sub_210E92B84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)componentsForContentItemID:(id)a3
{
  return sub_210D1A234((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_210D19540);
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  _MPCQueueControllerBehaviorPodcasts *v4;
  BOOL v5;

  sub_210E92BA8();
  v4 = self;
  v5 = sub_210D19684();

  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  return sub_210D1D73C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_210D19740);
}

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  sub_210E92BA8();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  _MPCQueueControllerBehaviorPodcasts *v5;
  char v6;

  sub_210E92BA8();
  v5 = self;
  v6 = sub_210D19774();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)isEmpty
{
  return sub_210D19A34();
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  char v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _MPCQueueControllerBehaviorPodcasts *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a5;
  if (a3)
  {
    v7 = sub_210E92BA8();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = self;
  sub_210D19A60(v7, v9, v11, v5);
  v13 = v12;

  swift_bridgeObjectRelease();
  return v13;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  _MPCQueueControllerBehaviorPodcasts *v3;
  void *v4;

  v3 = self;
  sub_210D19BD0(0);

  v4 = (void *)sub_210E92B00();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)currentItemDidChangeFromContentItemID:(id)a3 toContentItemID:(id)a4
{
  _MPCQueueControllerBehaviorPodcasts *v5;

  sub_210E92BA8();
  sub_210E92BA8();
  v5 = self;
  sub_210D19E00();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)_itemForContentItemID:(id)a3
{
  return sub_210D1A234((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_210D19FD8);
}

- (_MPCQueueControllerBehaviorPodcasts)init
{
  QueueControllerBehaviorPodcasts.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_210C3322C((uint64_t)self + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest, (uint64_t)&qword_253D7F108, (uint64_t)MEMORY[0x24BE73288], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210D2175C);
  OUTLINED_FUNCTION_176();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_176();
  sub_210C3322C((uint64_t)self + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_activePlaybackContext, (uint64_t)&unk_253D7EEC0, (uint64_t)MEMORY[0x24BE73230], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210D2175C);
  OUTLINED_FUNCTION_176();
  swift_bridgeObjectRelease();
}

- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3
{
  Swift::String_optional v4;
  void *countAndFlagsBits;
  void *object;
  void *v7;

  if (a3)
    sub_210E92BA8();
  v4.value._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v4.value._countAndFlagsBits;
  object = QueueControllerBehaviorPodcasts.tailInsertionContentItemID(forTargetContentItemID:)(v4).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v7 = (void *)sub_210E92B84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5
{
  _MPCQueueControllerBehaviorPodcasts *v7;

  sub_210E92BA8();
  v7 = self;
  LOBYTE(a3) = QueueControllerBehaviorPodcasts.isSupportedInsertionPosition(_:fromContentItemID:reason:)(a3);

  swift_bridgeObjectRelease();
  return a3 & 1;
}

- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _MPCQueueControllerBehaviorPodcasts *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_210E92BA8();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_210D1ADA4(v11, v9, (uint64_t)a4, (uint64_t)v12, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5
{
  sub_210D1D518((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)"􀄬 Perform move of before target: %{public}s", 0xD000000000000023, 0x8000000210EB3B70, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_210D2F3C0);
}

- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5
{
  sub_210D1D518((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)"􀄬 Perform move of after target: %{public}s", 0xD000000000000022, 0x8000000210EB3BD0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_210D2F5D0);
}

- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4
{
  return sub_210D1D73C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))QueueControllerBehaviorPodcasts.canRemoveContentItemID(_:reason:));
}

- (void)removeContentItemID:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _MPCQueueControllerBehaviorPodcasts *v9;

  v5 = _Block_copy(a4);
  v6 = sub_210E92BA8();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_210D1D780(v6, v8, (uint64_t)v9, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)clearAllItemsAfterContentItemID:(id)a3
{
  sub_210D20520((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))QueueControllerBehaviorPodcasts.clearAllItems(afterContentItemID:));
}

- (int64_t)displayItemCount
{
  _MPCQueueControllerBehaviorPodcasts *v2;
  Swift::Int v3;

  v2 = self;
  v3 = QueueControllerBehaviorPodcasts.displayItemCount()();

  return v3;
}

- (int64_t)preferredUpcomingItemCount
{
  _MPCQueueControllerBehaviorPodcasts *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  QueueControllerBehaviorPodcasts.preferredUpcomingItemCount.getter();
  v4 = v3;

  return v4;
}

- (void)loadAdditionalUpcomingItems:(int64_t)a3 completion:(id)a4
{
  void *v6;
  _MPCQueueControllerBehaviorPodcasts *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_210D1DFE8(a3, (char *)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  sub_210D20520((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))QueueControllerBehaviorPodcasts.didReachEndOfQueue(withReason:));
}

- (BOOL)containsRestorableContent
{
  return 1;
}

- (id)finalizeStateRestorationWithTargetContentItemID:(id)a3 completion:(id)a4
{
  void *v6;
  _MPCQueueControllerBehaviorPodcasts *v7;

  v6 = _Block_copy(a4);
  if (a3)
    sub_210E92BA8();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = self;
  QueueControllerBehaviorPodcasts.finalizeStateRestoration(withTargetContentItemID:completion:)();

  swift_release();
  swift_bridgeObjectRelease();
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _MPCQueueControllerBehaviorPodcasts *v5;

  v4 = a3;
  v5 = self;
  QueueControllerBehaviorPodcasts.encode(with:)((NSCoder)v4);

}

@end
