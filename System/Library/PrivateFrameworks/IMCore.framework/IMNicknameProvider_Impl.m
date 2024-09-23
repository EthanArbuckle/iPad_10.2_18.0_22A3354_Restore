@implementation IMNicknameProvider_Impl

- (IMNicknameProvider_Impl)init
{
  return (IMNicknameProvider_Impl *)NicknameProvider.init()();
}

- (BOOL)haveNicknamesLoaded
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController), sel_isInitialLoadComplete);
}

- (void)connectionStartedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  IMNicknameProvider_Impl *v8;
  uint64_t v9;

  v4 = sub_1A2199554();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2199548();
  v8 = self;
  sub_1A218F6BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dealloc
{
  IMNicknameProvider_Impl *v2;

  v2 = self;
  NicknameProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1A218D06C((uint64_t)self + OBJC_IVAR___IMNicknameProvider_Impl_listener);
  swift_unknownObjectRelease();

}

- (void)nicknameForCurrentUserWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  IMNicknameProvider_Impl *v13;
  uint64_t v14;

  v5 = sub_1A1FFD920((uint64_t *)&unk_1ECF12130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A219983C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE65E9D0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE65E8E0;
  v12[5] = v11;
  v13 = self;
  sub_1A219339C((uint64_t)v7, (uint64_t)&unk_1EE65DF50, (uint64_t)v12);
  swift_release();
}

- (id)nicknameForHandleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  IMNicknameProvider_Impl *v7;
  id v8;

  v4 = sub_1A2199764();
  v6 = v5;
  v7 = self;
  v8 = sub_1A218FF84(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)nicknameForContact:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A2190140((uint64_t)v4);

  return v6;
}

- (id)currentNicknameForContact:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A21901A0((uint64_t)v4);

  return v6;
}

- (id)pendingNicknameForContact:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A2190200((uint64_t)v4);

  return v6;
}

- (BOOL)hasObservedTransitionForHandleID:(id)a3
{
  void *v4;
  void *v5;
  IMNicknameProvider_Impl *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  sub_1A2199764();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v10[4] = nullsub_31;
  v10[5] = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1A200EB00;
  v10[3] = &unk_1E4724D78;
  v5 = _Block_copy(v10);
  v6 = self;
  objc_msgSend(v4, sel_connectWithCompletion_, v5);
  _Block_release(v5);
  v7 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  v8 = (void *)sub_1A2199758();
  LOBYTE(v7) = objc_msgSend(v7, sel_hasObservedTransitionForHandleID_, v8);

  swift_bridgeObjectRelease();
  return (char)v7;
}

- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  IMNicknameProvider_Impl *v9;

  v6 = sub_1A2199764();
  v8 = v7;
  v9 = self;
  sub_1A21905D0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (id)allNicknamesForContact:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1A2190AA4((uint64_t)v4);

  sub_1A219457C();
  v6 = (void *)sub_1A2199740();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)updatePendingNicknameWith:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_1A2190F14(v4);

}

- (void)setPersonalNicknameWith:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_1A21913A0(v4);

}

- (void)nicknamesDidChangeWithNotification:(id)a3
{
  id v4;
  IMNicknameProvider_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_1A2191638(v4);

}

- (void)setNicknameListener:(id)a3
{
  void *v4;
  void *v5;
  IMNicknameProvider_Impl *v6;
  _QWORD v7[6];

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v7[4] = nullsub_31;
  v7[5] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1A200EB00;
  v7[3] = &unk_1E471BC60;
  v5 = _Block_copy(v7);
  swift_unknownObjectRetain();
  v6 = self;
  objc_msgSend(v4, sel_connectWithCompletion_, v5);
  _Block_release(v5);
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();

}

- (void)sendPersonalNicknameTo:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  IMNicknameProvider_Impl *v7;

  v4 = sub_1A2199764();
  v6 = v5;
  v7 = self;
  sub_1A2191914(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)sendPersonalNicknameTo:(id)a3 from:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  IMNicknameProvider_Impl *v11;

  v5 = sub_1A2199764();
  v7 = v6;
  v8 = sub_1A2199764();
  v10 = v9;
  v11 = self;
  sub_1A2191BB0(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)sendNameOnlyTo:(id)a3 from:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  IMNicknameProvider_Impl *v9;

  v5 = sub_1A21997D0();
  v6 = sub_1A2199764();
  v8 = v7;
  v9 = self;
  sub_1A2191F00(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)bannerActionTappedFrom:(id)a3 on:(unint64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  IMNicknameProvider_Impl *v9;

  v6 = sub_1A2199764();
  v8 = v7;
  v9 = self;
  sub_1A21921DC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

@end
