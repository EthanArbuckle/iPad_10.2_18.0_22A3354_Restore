@implementation MapsSuggestionsFakeFindMyConnector

- (NSString)uniqueName
{
  return (NSString *)sub_1A428E0CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_uniqueName);
}

- (void)setUniqueName:(id)a3
{
  sub_1A428E1A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_uniqueName);
}

- (NSArray)friends
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A43AB68C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setFriends:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_1A43AB698();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_friends);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (CLLocation)cachedLocation
{
  return (CLLocation *)sub_1A428E530((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
}

- (void)setCachedLocation:(id)a3
{
  sub_1A428E5CC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
}

- (CLLocation)refreshedLocation
{
  return (CLLocation *)sub_1A428E530((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_refreshedLocation);
}

- (void)setRefreshedLocation:(id)a3
{
  sub_1A428E5CC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_refreshedLocation);
}

- (_TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector)init
{
  return (_TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *)MapsSuggestionsFakeFindMyConnector.init()();
}

- (void)nilCachedLocation
{
  void **v2;
  void *v3;

  v2 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
  swift_beginAccess();
  v3 = *v2;
  *v2 = 0;

}

- (void)setCachedLocation:(double)a3 :(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *v11;
  id v12;
  void *v13;
  id v14;
  void **v15;
  void *v16;
  uint64_t v17;

  v7 = sub_1A43AB44C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  sub_1A43AB434();
  v12 = objc_allocWithZone(MEMORY[0x1E0C9E3B8]);
  v13 = (void *)sub_1A43AB3E0();
  v14 = objc_msgSend(v12, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, v13, a3, a4, 0.0, 0.0, 0.0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v15 = (void **)((char *)&v11->super.isa
                + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
  swift_beginAccess();
  v16 = *v15;
  *v15 = v14;

}

- (void)expireCachedLocation
{
  _TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *v2;

  v2 = self;
  MapsSuggestionsFakeFindMyConnector.expireCachedLocation()();

}

- (void)setTestFriends
{
  _TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *v2;

  v2 = self;
  MapsSuggestionsFakeFindMyConnector.setTestFriends()();

}

- (void)listOfFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE714BF0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE714BF8;
  v12[5] = v11;
  v13 = self;
  sub_1A428F574((uint64_t)v7, (uint64_t)&unk_1EE714C00, (uint64_t)v12);
  swift_release();
}

- (void)locationFor:(NSString *)a3 completionHandler:(id)a4
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
  _TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE714BD0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE714BD8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A428F574((uint64_t)v9, (uint64_t)&unk_1EE714BE0, (uint64_t)v14);
  swift_release();
}

- (void)latestLocationFor:(NSString *)a3 completionHandler:(id)a4
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
  _TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED22EAE0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A43AB704();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE714BA0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE714690;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A428F574((uint64_t)v9, (uint64_t)&unk_1EE714698, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_refreshedLocation));
}

@end
