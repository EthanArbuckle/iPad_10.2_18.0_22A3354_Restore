@implementation ObjCBootstrap

- (void)sendFriendshipOfferTo:(NSArray *)a3 from:(FMLHandle *)a4 end:(int64_t)a5 isFromGroup:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSArray *v21;
  FMLHandle *v22;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v23;
  uint64_t v24;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 40) = a6;
  *(_QWORD *)(v17 + 48) = v16;
  *(_QWORD *)(v17 + 56) = self;
  v18 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256A54DE0;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256A54DE8;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = self;
  sub_23B904A0C((uint64_t)v15, (uint64_t)&unk_256A54DF0, (uint64_t)v20);
  swift_release();
}

- (void)sendFriendshipInviteTo:(FMLHandle *)a3 from:(FMLHandle *)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  FMLHandle *v19;
  FMLHandle *v20;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_BYTE *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256A54DC0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256A54DC8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_23B904A0C((uint64_t)v13, (uint64_t)&unk_256A54DD0, (uint64_t)v18);
  swift_release();
}

- (void)stopSharingLocationWith:(NSArray *)a3 from:(FMLHandle *)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSArray *v19;
  FMLHandle *v20;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_BYTE *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256A54DA0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256A54DA8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_23B904A0C((uint64_t)v13, (uint64_t)&unk_256A54DB0, (uint64_t)v18);
  swift_release();
}

- (void)startRefreshingLocationFor:(NSArray *)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 reverseGeocode:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSArray *v21;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v22;
  uint64_t v23;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_BYTE *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 33) = a6;
  *(_QWORD *)(v17 + 40) = v16;
  *(_QWORD *)(v17 + 48) = self;
  v18 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256A54D80;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256A54D88;
  v20[5] = v19;
  v21 = a3;
  v22 = self;
  sub_23B904A0C((uint64_t)v15, (uint64_t)&unk_256A54D90, (uint64_t)v20);
  swift_release();
}

- (void)stopRefreshingLocationFor:(NSArray *)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSArray *v19;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v20;
  uint64_t v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_BYTE *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256A54D60;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256A54D68;
  v18[5] = v17;
  v19 = a3;
  v20 = self;
  sub_23B904A0C((uint64_t)v13, (uint64_t)&unk_256A54D70, (uint64_t)v18);
  swift_release();
}

- (void)stopRefreshingLocationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256A54D40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256A54D48;
  v12[5] = v11;
  v13 = self;
  sub_23B904A0C((uint64_t)v7, (uint64_t)&unk_256A54D50, (uint64_t)v12);
  swift_release();
}

- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256A54D20;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256A54D28;
  v14[5] = v13;
  v15 = self;
  sub_23B904A0C((uint64_t)v9, (uint64_t)&unk_256A54D30, (uint64_t)v14);
  swift_release();
}

- (void)stopUpdatingFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256A54D00;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256A54D08;
  v12[5] = v11;
  v13 = self;
  sub_23B904A0C((uint64_t)v7, (uint64_t)&unk_256A54D10, (uint64_t)v12);
  swift_release();
}

- (void)startMonitoringActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256A54CE0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256A54CE8;
  v12[5] = v11;
  v13 = self;
  sub_23B904A0C((uint64_t)v7, (uint64_t)&unk_256A54CF0, (uint64_t)v12);
  swift_release();
}

- (void)setActiveLocationSharingDevice:(NSString *)a3 completionHandler:(id)a4
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
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256A54CC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256A54CC8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23B904A0C((uint64_t)v9, (uint64_t)&unk_256A54CD0, (uint64_t)v14);
  swift_release();
}

- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256A54CA0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256A54CA8;
  v12[5] = v11;
  v13 = self;
  sub_23B904A0C((uint64_t)v7, (uint64_t)&unk_256A54CB0, (uint64_t)v12);
  swift_release();
}

- (void)getFriendsWith:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256A54C80;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256A54C88;
  v14[5] = v13;
  v15 = self;
  sub_23B904A0C((uint64_t)v9, (uint64_t)&unk_256A54C90, (uint64_t)v14);
  swift_release();
}

- (void)canShareLocationWithHandle:(FMLHandle *)a3 isFromGroup:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  FMLHandle *v17;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256A54C60;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256A54C68;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23B904A0C((uint64_t)v11, (uint64_t)&unk_256A54C70, (uint64_t)v16);
  swift_release();
}

- (void)friendshipStateWithHandle:(FMLHandle *)a3 isFromGroup:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  FMLHandle *v17;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256A54C40;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256A54C48;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23B904A0C((uint64_t)v11, (uint64_t)&unk_256A54C50, (uint64_t)v16);
  swift_release();
}

- (void)getOfferExpirationForHandle:(FMLHandle *)a3 groupId:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  FMLHandle *v17;
  NSString *v18;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256A54C20;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256A54C28;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23B904A0C((uint64_t)v11, (uint64_t)&unk_256A54C30, (uint64_t)v16);
  swift_release();
}

- (id)cachedLocationFor:(id)a3 includeAddress:(BOOL)a4
{
  id v4;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v5;
  void *v9;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095A8);
  sub_23B90DE20();

  return v9;
}

- (id)cachedFriendsSharingLocationWithMe
{
  return sub_23B9012C0(self);
}

- (id)cachedFriendsFollowingMyLocation
{
  return sub_23B9012C0(self);
}

- (id)cachedFriendsWithPendingOffers
{
  return sub_23B9012C0(self);
}

- (id)cachedOfferExpirationFor:(id)a3 groupId:(id)a4
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BYTE v19[16];

  ObjectType = swift_getObjectType();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A40);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a4)
  {
    v11 = sub_23B90DCF4();
    a4 = v12;
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)&v19[-48] = MEMORY[0x24BDAC7A8](v11);
  *(_QWORD *)&v19[-40] = a4;
  *(_QWORD *)&v19[-32] = self;
  *(_QWORD *)&v19[-24] = a3;
  *(_QWORD *)&v19[-16] = ObjectType;
  v13 = a3;
  v14 = self;
  sub_23B90DE20();

  swift_bridgeObjectRelease();
  v15 = sub_23B90D874();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15) != 1)
  {
    v17 = (void *)sub_23B90D850();
    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v10, v15);
  }
  return v17;
}

- (int64_t)cachedCanShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4
{
  id v4;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v5;
  int64_t v9;

  swift_getObjectType();
  type metadata accessor for FMLLocationShareState(0);
  v4 = a3;
  v5 = self;
  sub_23B90DE20();

  return v9;
}

- (void)processLocationPayloadWithPayload:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSData *v15;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256A54C00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256A54C08;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23B904A0C((uint64_t)v9, (uint64_t)&unk_256A54C10, (uint64_t)v14);
  swift_release();
}

- (void)processLocationCommandPayloadWithPayload:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSData *v15;
  _TtC23FindMyLocateObjCWrapper13ObjCBootstrap *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23B90DDA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256A54BC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256A54BD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23B904A0C((uint64_t)v9, (uint64_t)&unk_256A54BE0, (uint64_t)v14);
  swift_release();
}

- (id)locationUpdateCallback
{
  return sub_23B90B290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback, (uint64_t)sub_23B90AD08, (uint64_t)&block_descriptor_31);
}

- (void)setLocationUpdateCallback:(id)a3
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
    v4 = sub_23B90D2F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23B90A254(v7);
}

- (id)friendshipUpdateCallback
{
  return sub_23B90B290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback, (uint64_t)sub_23B90AFE0, (uint64_t)&block_descriptor_25);
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
    v4 = sub_23B90D2F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23B90A254(v7);
}

- (id)meDeviceUpdateCallback
{
  return sub_23B90B290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback, (uint64_t)sub_23B90B3A8, (uint64_t)&block_descriptor_19);
}

- (void)setMeDeviceUpdateCallback:(id)a3
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
    v4 = sub_23B90D2E8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23B90A254(v7);
}

- (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap)init
{
  return (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap *)ObjCBootstrap.init()();
}

- (void).cxx_destruct
{
  sub_23B90A254(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback));
  sub_23B90A254(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback));
  sub_23B90A254(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
