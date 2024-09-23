@implementation _ASActivitySharingClient

- (_ASActivitySharingClient)init
{
  char v2;
  id v3;
  _ASActivitySharingClient *v4;
  _ASActivitySharingClient *v5;

  v2 = ASActivitySharingDaemonEnabled();
  v3 = objc_allocWithZone((Class)type metadata accessor for ActivitySharingClient());
  ActivitySharingClient.init(activitySharingDaemonEnabled:)(v2);
  v5 = v4;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)isCloudKitAccountActiveWithCompletion:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _ASActivitySharingClient *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_25638C2D8;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C2E0;
  v11[5] = v10;
  v12 = self;
  sub_235EC4FE4((uint64_t)v6, (uint64_t)&unk_25638C2E8, (uint64_t)v11);
  swift_release();
}

- (void)appBadgeCountWithCompletion:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _ASActivitySharingClient *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_25638C1D8;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C1E0;
  v11[5] = v10;
  v12 = self;
  sub_235EC4FE4((uint64_t)v6, (uint64_t)&unk_25638C1E8, (uint64_t)v11);
  swift_release();
}

- (void)activateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _ASActivitySharingClient *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_25638C4D8;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C4E0;
  v11[5] = v10;
  v12 = self;
  sub_235EC4FE4((uint64_t)v6, (uint64_t)&unk_25638C4E8, (uint64_t)v11);
  swift_release();
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C4B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C4C0;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C4C8, (uint64_t)v12);
  swift_release();
}

- (void)sendFriendInviteToDestination:(NSString *)a3 callerID:(NSString *)a4 serviceIdentifier:(NSString *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  _ASActivitySharingClient *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25638C498;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_25638C4A0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_235EC4FE4((uint64_t)v13, (uint64_t)&unk_25638C4A8, (uint64_t)v18);
  swift_release();
}

- (void)acceptFriendInviteFromFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C478;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C480;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C488, (uint64_t)v14);
  swift_release();
}

- (void)withdrawFriendInviteToFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C458;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C460;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C468, (uint64_t)v14);
  swift_release();
}

- (void)ignoreFriendInviteFromFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C438;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C440;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C448, (uint64_t)v14);
  swift_release();
}

- (void)setMuteEnabled:(BOOL)a3 friendUUID:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _ASActivitySharingClient *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_BYTE *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25638C418;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25638C420;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_235EC4FE4((uint64_t)v11, (uint64_t)&unk_25638C428, (uint64_t)v16);
  swift_release();
}

- (void)setActivityDataVisible:(BOOL)a3 friendUUID:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _ASActivitySharingClient *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_BYTE *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25638C3F8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25638C400;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_235EC4FE4((uint64_t)v11, (uint64_t)&unk_25638C408, (uint64_t)v16);
  swift_release();
}

- (void)sendCompetitionInviteToFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C3D8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C3E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C3E8, (uint64_t)v14);
  swift_release();
}

- (void)acceptCompetitionInviteFromFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C3B8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C3C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C3C8, (uint64_t)v14);
  swift_release();
}

- (void)ignoreCompetitionInviteFromFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C398;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C3A0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C3A8, (uint64_t)v14);
  swift_release();
}

- (void)completeCompetitionWithFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C378;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C380;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C388, (uint64_t)v14);
  swift_release();
}

- (void)rollCompetitionWithFriendUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C358;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C360;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C368, (uint64_t)v14);
  swift_release();
}

- (void)pushActivityDataWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C338;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C340;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C348, (uint64_t)v12);
  swift_release();
}

- (void)immediateFetchActivityDataWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C318;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C320;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C328, (uint64_t)v12);
  swift_release();
}

- (void)fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _ASActivitySharingClient *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C2F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C300;
  v14[5] = v13;
  v15 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C308, (uint64_t)v14);
  swift_release();
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C2B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C2C0;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C2C8, (uint64_t)v12);
  swift_release();
}

- (void)areMultipleDevicesSharingDataForSnapshotIndex:(int64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _ASActivitySharingClient *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C298;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C2A0;
  v14[5] = v13;
  v15 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C2A8, (uint64_t)v14);
  swift_release();
}

- (void)allFriendsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C278;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C280;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C288, (uint64_t)v12);
  swift_release();
}

- (void)friendWithRemoteRelationshipUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C258;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C260;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C268, (uint64_t)v14);
  swift_release();
}

- (void)removeFriendWithUUID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C238;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C240;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C248, (uint64_t)v14);
  swift_release();
}

- (void)removeAllFriendsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C218;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C220;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C228, (uint64_t)v12);
  swift_release();
}

- (void)handleNotificationResponse:(ASUserNotificationResponse *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ASUserNotificationResponse *v15;
  _ASActivitySharingClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C1F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C200;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C208, (uint64_t)v14);
  swift_release();
}

- (void)pushFakeActivityDataWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _ASActivitySharingClient *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25638C1B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C1C0;
  v12[5] = v11;
  v13 = self;
  sub_235EC4FE4((uint64_t)v7, (uint64_t)&unk_25638C1C8, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____ASActivitySharingClient_transportClient);
  sub_235E8EC2C((uint64_t)self + OBJC_IVAR____ASActivitySharingClient_asListener, &qword_25429CCD8);
  sub_235E8EC2C((uint64_t)self + OBJC_IVAR____ASActivitySharingClient_secureCloudClient, (uint64_t *)&unk_25429C908);
}

@end
