@implementation ModernLocalizer

- (id)string:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC19AppStoreKitInternal15ModernLocalizer *v10;
  void *v11;
  _QWORD v13[2];

  v6 = sub_1D892A394();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = sub_1D892ADB4();
  if (a4)
    sub_1D892AC88();
  __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0D40958], v6);
  v10 = self;
  sub_1D892AB74();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v11;
}

- (NSString)identifier
{
  _TtC19AppStoreKitInternal15ModernLocalizer *v2;
  void *v3;

  v2 = self;
  sub_1D89278C8();

  v3 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
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
  _TtC19AppStoreKitInternal15ModernLocalizer *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v18 = self;
  sub_1D8381998(v10, v12, v13, v15, (uint64_t)v9);
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

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _TtC19AppStoreKitInternal15ModernLocalizer *v17;
  _TtC19AppStoreKitInternal15ModernLocalizer *v19;
  void *v20;
  uint64_t v21;

  v6 = sub_1D8927868();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v21 - v14;
  sub_1D892ADB4();
  if (a4)
  {
    sub_1D8927844();
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v15, v16, 1, v6);
  sub_1D838E16C((uint64_t)v15, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
    v17 = self;
    sub_1D83371E4((uint64_t)v12, &qword_1EDA3B670);

    swift_bridgeObjectRelease();
    sub_1D83371E4((uint64_t)v15, &qword_1EDA3B670);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    v19 = self;
    sub_1D892ABBC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    swift_bridgeObjectRelease();
    sub_1D83371E4((uint64_t)v15, &qword_1EDA3B670);
    v20 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
    return v20;
  }
}

- (id)formattedCount:(id)a3
{
  void *v3;
  _TtC19AppStoreKitInternal15ModernLocalizer *v4;
  id v5;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    objc_msgSend(v5, sel_integerValue);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&v4->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    sub_1D892AB68();

    v3 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC19AppStoreKitInternal15ModernLocalizer *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1D8929CEC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
    return 0;
  __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0D3FFC8], v6);
  v10 = self;
  v11 = a3;
  sub_1D892AB8C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  v12 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC19AppStoreKitInternal15ModernLocalizer *v9;
  void *v10;

  v6 = sub_1D892ADB4();
  v8 = v7;
  v9 = self;
  sub_1D83BC720(v6, v8, a4);

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)string:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19AppStoreKitInternal15ModernLocalizer *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_1D892A394();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D892ADB4();
  __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0D40958], v4);
  v8 = self;
  sub_1D892AB74();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)fileSize:(id)a3
{
  void *v3;
  _TtC19AppStoreKitInternal15ModernLocalizer *v4;
  id v5;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    objc_msgSend(v5, sel_doubleValue);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&v4->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    sub_1D892AB98();

    v3 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  return v3;
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
  _TtC19AppStoreKitInternal15ModernLocalizer *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v16 = self;
  sub_1D86CFF0C(v10, v12, (uint64_t)v9, v15);
  v18 = v17;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v9, &qword_1EDA3B670);
  if (!v18)
    return 0;
  v19 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v19;
}

- (id)relativeDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _TtC19AppStoreKitInternal15ModernLocalizer *v17;
  void *v18;
  uint64_t v19;

  v5 = sub_1D8927868();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v19 - v13;
  if (a3)
  {
    sub_1D8927844();
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, v15, 1, v5);
  sub_1D838E16C((uint64_t)v14, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
  {
    sub_1D83371E4((uint64_t)v11, &qword_1EDA3B670);
    sub_1D83371E4((uint64_t)v14, &qword_1EDA3B670);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(_QWORD *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    v17 = self;
    sub_1D892ABB0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    sub_1D83371E4((uint64_t)v14, &qword_1EDA3B670);
    v18 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
    return v18;
  }
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
  _TtC19AppStoreKitInternal15ModernLocalizer *v12;
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

- (id)stringForPreferredLocale:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _TtC19AppStoreKitInternal15ModernLocalizer *v11;
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

- (id)formattedCountForPreferredLocale:(id)a3 :(id)a4
{
  _TtC19AppStoreKitInternal15ModernLocalizer *v6;
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
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC19AppStoreKitInternal15ModernLocalizer *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1D8927844();
    v8 = sub_1D8927868();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1D8927868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1D86D07A4((uint64_t)v7);
  v12 = v11;

  sub_1D83371E4((uint64_t)v7, &qword_1EDA3B670);
  if (!v12)
    return 0;
  v13 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)timeAgoWithContext:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC19AppStoreKitInternal15ModernLocalizer *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v12 = self;
  sub_1D86D093C((uint64_t)v8, v11);
  v14 = v13;

  swift_bridgeObjectRelease();
  sub_1D83371E4((uint64_t)v8, &qword_1EDA3B670);
  if (!v14)
    return 0;
  v15 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)formatDuration:(int64_t)a3 :(id)a4
{
  _TtC19AppStoreKitInternal15ModernLocalizer *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  sub_1D892ADB4();
  v5 = self;
  sub_1D86D0F84();
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

- (_TtC19AppStoreKitInternal15ModernLocalizer)init
{
  _TtC19AppStoreKitInternal15ModernLocalizer *result;

  result = (_TtC19AppStoreKitInternal15ModernLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer);

}

@end
