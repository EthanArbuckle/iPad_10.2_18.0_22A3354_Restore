@implementation LegacyLocalizer

- (NSString)identifier
{
  _TtC19AppStoreKitInternal15LegacyLocalizer *v2;
  void *v3;

  v2 = self;
  sub_1D89278C8();

  v3 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  _TtC19AppStoreKitInternal15LegacyLocalizer *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = self;
  v7 = a3;
  sub_1D845BD40(a3, a4);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)string:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v7;
  void *v8;

  v4 = sub_1D892ADB4();
  v6 = v5;
  v7 = self;
  sub_1D845BF3C(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)string:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v9;
  void *v10;

  v6 = sub_1D892ADB4();
  v8 = v7;
  if (a4)
    sub_1D892AC88();
  v9 = self;
  sub_1D845BF3C(v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)stringForPreferredLocale:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v11;
  void *v12;

  v6 = sub_1D892ADB4();
  v8 = v7;
  if (a4)
  {
    v9 = sub_1D892ADB4();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  sub_1D845C1A4(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B678);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D892ADB4();
  v11 = v10;
  v12 = self;
  sub_1D845BF3C(v9, v11);
  Locale.normalizedLocale.getter((uint64_t)v8);
  v13 = sub_1D8927934();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 0, 1, v13);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA45BD0);
  v14 = swift_allocObject();
  v15 = MEMORY[0x1E0DEB418];
  *(_OWORD *)(v14 + 16) = xmmword_1D8931D70;
  v16 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v14 + 56) = v15;
  *(_QWORD *)(v14 + 64) = v16;
  *(_QWORD *)(v14 + 32) = a4;
  sub_1D892ADD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v8, &qword_1EDA3B678);

  swift_bridgeObjectRelease();
  v17 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B678);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D892ADB4();
  v10 = v9;
  v11 = sub_1D892B060();
  v12 = self;
  sub_1D845BF3C(v8, v10);
  Locale.normalizedLocale.getter((uint64_t)v7);
  v13 = sub_1D8927934();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 0, 1, v13);
  sub_1D84F45F4(v11);
  sub_1D892ADD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v7, &qword_1EDA3B678);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)fileSize:(id)a3
{
  _TtC19AppStoreKitInternal15LegacyLocalizer *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = self;
  v5 = a3;
  sub_1D845C86C(a3);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)formattedCount:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = sub_1D8927934();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  v10 = a3;
  Locale.normalizedLocale.getter((uint64_t)v8);
  sub_1D89278C8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1D845CED4(a3);
  v12 = v11;

  swift_bridgeObjectRelease();
  if (!v12)
    return 0;
  v13 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)formattedCountForPreferredLocale:(id)a3 :(id)a4
{
  _TtC19AppStoreKitInternal15LegacyLocalizer *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  sub_1D892ADB4();
  v6 = self;
  v7 = a3;
  sub_1D845CED4(a3);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)timeAgo:(id)a3
{
  return sub_1D845ECA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D845D184);
}

- (id)timeAgoWithContext:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1D8927844();
    v9 = sub_1D8927868();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_1D8927868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = sub_1D892ADB4();
  v13 = v12;
  v14 = self;
  sub_1D845D358((uint64_t)v8, v11, v13);
  v16 = v15;

  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v8, &qword_1EDA3B670);
  if (!v16)
    return 0;
  v17 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D892ADB4();
  v12 = v11;
  v13 = sub_1D892ADB4();
  v15 = v14;
  if (a5)
  {
    sub_1D8927844();
    v16 = sub_1D8927868();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 0, 1, v16);
  }
  else
  {
    v17 = sub_1D8927868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  }
  v18 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer_extendedLocale;
  v19 = self;
  sub_1D845DABC(v10, v12, v13, v15, (uint64_t)v9, (uint64_t)v18);
  v21 = v20;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v9, &qword_1EDA3B670);
  if (!v21)
    return 0;
  v22 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v22;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D892ADB4();
  v11 = v10;
  if (a4)
  {
    sub_1D8927844();
    v12 = sub_1D8927868();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    v13 = sub_1D8927868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  v14 = self;
  sub_1D845E034(v9, v11, (uint64_t)v8, 0xD000000000000013, 0x80000001D8973DF0);
  v16 = v15;

  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v8, &qword_1EDA3B670);
  if (!v16)
    return 0;
  v17 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)formatDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC19AppStoreKitInternal15LegacyLocalizer *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D892ADB4();
  v12 = v11;
  if (a4)
  {
    sub_1D8927844();
    v13 = sub_1D8927868();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    v14 = sub_1D8927868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  v15 = sub_1D892ADB4();
  v17 = v16;
  v18 = self;
  sub_1D845E034(v10, v12, (uint64_t)v9, v15, v17);
  v20 = v19;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v9, &qword_1EDA3B670);
  if (!v20)
    return 0;
  v21 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v21;
}

- (id)relativeDate:(id)a3
{
  return sub_1D845ECA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D845E610);
}

- (id)formatDuration:(int64_t)a3 :(id)a4
{
  _TtC19AppStoreKitInternal15LegacyLocalizer *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  sub_1D892ADB4();
  v5 = self;
  sub_1D845EDB8();
  v7 = v6;

  swift_bridgeObjectRelease();
  if (v7)
  {
    v8 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_TtC19AppStoreKitInternal15LegacyLocalizer)init
{
  _TtC19AppStoreKitInternal15LegacyLocalizer *result;

  result = (_TtC19AppStoreKitInternal15LegacyLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer_locale;
  v4 = sub_1D8927934();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer_extendedLocale, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer____lazy_storage___relativeDateFormatter));
}

@end
