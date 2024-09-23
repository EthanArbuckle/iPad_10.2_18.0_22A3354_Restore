@implementation FindMyLocateSession

- (id)friendshipUpdateCallback
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_friendshipUpdateCallback);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18ACE332C;
  aBlock[3] = &block_descriptor_4;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setFriendshipUpdateCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_18ACEA984;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_friendshipUpdateCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18ACCDD44(v7);
}

- (_TtC10ContactsUI19FindMyLocateSession)init
{
  return (_TtC10ContactsUI19FindMyLocateSession *)FindMyLocateSession.init()();
}

- (void)getAllFriendIdsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC10ContactsUI19FindMyLocateSession *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_18ACE4158((uint64_t)sub_18ACEA97C, v5);
  swift_release();

}

- (int64_t)friendshipState:(id)a3
{
  _TtC10ContactsUI19FindMyLocateSession *v4;
  int64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_18AF4FF44();

  swift_unknownObjectRelease();
  return v6;
}

- (void)stopSharingLocationWith:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC10ContactsUI19FindMyLocateSession *v17;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = sub_18AF4FD34();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  v15 = sub_18AF4FDE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 32) = v13;
  *(_QWORD *)(v16 + 40) = sub_18ACEAB88;
  *(_QWORD *)(v16 + 48) = v14;
  *(_QWORD *)(v16 + 56) = self;
  *(_BYTE *)(v16 + 64) = a4;
  v17 = self;
  sub_18AF4E9A8();
  swift_retain();
  sub_18ACE4A48((uint64_t)v11, (uint64_t)&unk_1EDF99308, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)sendFriendshipOfferTo:(id)a3 end:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _TtC10ContactsUI19FindMyLocateSession *v19;
  uint64_t v20;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = sub_18AF4FD34();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = sub_18AF4FDE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  *(_QWORD *)(v18 + 32) = v15;
  *(_QWORD *)(v18 + 40) = sub_18ACEA91C;
  *(_QWORD *)(v18 + 48) = v16;
  *(_QWORD *)(v18 + 56) = self;
  *(_QWORD *)(v18 + 64) = a4;
  *(_BYTE *)(v18 + 72) = a5;
  v19 = self;
  sub_18AF4E9A8();
  swift_retain();
  sub_18ACE4A48((uint64_t)v13, (uint64_t)&unk_1EDF99300, v18);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _TtC10ContactsUI19FindMyLocateSession *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = v11;
  *(_QWORD *)(v12 + 32) = self;
  v13 = sub_18AF4FDE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EDF992E8;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EDF992F0;
  v15[5] = v14;
  v16 = self;
  sub_18ACEA60C((uint64_t)v10, (uint64_t)&unk_1EDF992F8, (uint64_t)v15);
  swift_release();
}

- (void)stopUpdatingFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC10ContactsUI19FindMyLocateSession *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_18AF4FDE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EDF992A8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EDF992B8;
  v13[5] = v12;
  v14 = self;
  sub_18ACEA60C((uint64_t)v8, (uint64_t)&unk_1EDF992C8, (uint64_t)v13);
  swift_release();
}

+ (BOOL)hasCorrectPermissionsForLocationSharing
{
  sub_18AF4E7A4();
  return sub_18AF4E798() & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_18ACCDD44(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_friendshipUpdateCallback));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_logger;
  v4 = sub_18AF4E900();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
