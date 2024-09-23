@implementation AutoPlayVideoSettingsManager

- (_TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager)init
{
  return (_TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager *)sub_1D8367264();
}

- (void)updateAutoPlayVideoSettings
{
  _TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager *v2;

  v2 = self;
  sub_1D8385430();

}

- (void)dealloc
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager *v7;
  _TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager *v8;
  objc_class *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_networkObservation;
  swift_beginAccess();
  if (*((_QWORD *)v3 + 3))
  {
    sub_1D832D54C((uint64_t)v3, (uint64_t)v10);
    v4 = v11;
    v5 = v12;
    __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v7 = self;
    v6(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v8 = self;
  }
  v9 = (objc_class *)type metadata accessor for AutoPlayVideoSettingsManager();
  v13.receiver = self;
  v13.super_class = v9;
  -[AutoPlayVideoSettingsManager dealloc](&v13, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_autoPlayUserSetting));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_networkInquiry);
  sub_1D83371E4((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_networkObservation, &qword_1EDA282D0);
}

- (BOOL)isAutoPlayAllowed
{
  _TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1D83805B0();

  return v3 & 1;
}

- (BOOL)isVideoAudioEnabled
{
  return 0;
}

- (void)restoreFullScreenAudioSettings
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  char v15;
  void (*v16)(char *, uint64_t);
  void *v17;
  uint64_t v18;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D8927868();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v18 - v8;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v18 - v11;
  v13 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  sub_1D8425AE8((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1D83371E4((uint64_t)v2, &qword_1EDA3B670);
    v14 = (void *)sub_1D892AD90();
    objc_msgSend(v13, sel_setBool_forKey_, 0, v14);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v12, v2, v3);
    sub_1D89277D8();
    sub_1D892785C();
    sub_1D832F170((unint64_t *)&qword_1EDA2CE60, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
    v15 = sub_1D892AD60();
    v16 = *(void (**)(char *, uint64_t))(v4 + 8);
    v16(v6, v3);
    v17 = (void *)sub_1D892AD90();
    objc_msgSend(v13, sel_setBool_forKey_, (v15 & 1) == 0, v17);

    v16(v9, v3);
    v16(v12, v3);
  }
}

- (void)saveFullScreenAudioSettings
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B670);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if ((sub_1D8425DD8() & 1) != 0)
  {
    sub_1D892785C();
    v4 = sub_1D8927868();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    v5 = sub_1D8927868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  sub_1D8425C30((uint64_t)v2);

}

@end
