@implementation CNWallpaperConfigurationGenerator

+ (_TtC10ContactsUI33CNWallpaperConfigurationGenerator)shared
{
  if (qword_1EDF949F0 != -1)
    swift_once();
  return (_TtC10ContactsUI33CNWallpaperConfigurationGenerator *)(id)qword_1EDF949E8;
}

- (id)cleanStatePosterArchiveDataFor:(id)a3
{
  id v4;
  _TtC10ContactsUI33CNWallpaperConfigurationGenerator *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  v5 = self;
  v6 = sub_18AD5B200((uint64_t)v4);
  v8 = v7;

  v9 = (void *)sub_18AF4E474();
  sub_18ACB9CDC(v6, v8);
  return v9;
}

- (BOOL)isCleanStatePosterData:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  _TtC10ContactsUI33CNWallpaperConfigurationGenerator *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_18AF4E48C();
  v11 = v10;

  v12 = sub_18AD5B380(v9, v11, (uint64_t)v7);
  sub_18ACB9CDC(v9, v11);

  return v12 & 1;
}

- (_TtC10ContactsUI33CNWallpaperConfigurationGenerator)init
{
  uint64_t v3;
  void *v4;
  _TtC10ContactsUI33CNWallpaperConfigurationGenerator *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC10ContactsUI33CNWallpaperConfigurationGenerator_cleanStatePosterBackgroundColor;
  v4 = (void *)objc_opt_self();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_systemDarkGrayColor);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CNWallpaperConfigurationGenerator();
  return -[CNWallpaperConfigurationGenerator init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI33CNWallpaperConfigurationGenerator_cleanStatePosterBackgroundColor));
}

@end
