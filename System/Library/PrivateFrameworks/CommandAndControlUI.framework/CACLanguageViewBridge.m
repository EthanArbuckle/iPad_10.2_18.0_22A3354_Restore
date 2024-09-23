@implementation CACLanguageViewBridge

- (_TtP19CommandAndControlUI23CACLanguageViewDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP19CommandAndControlUI23CACLanguageViewDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC19CommandAndControlUI21CACLanguageViewBridge)init
{
  return (_TtC19CommandAndControlUI21CACLanguageViewBridge *)CACLanguageViewBridge.init()();
}

- (id)makeLanguageUI
{
  _TtC19CommandAndControlUI21CACLanguageViewBridge *v2;
  id v3;
  void *v4;
  _BYTE v6[104];

  v2 = self;
  swift_retain();
  sub_22BD32FC8(0, (uint64_t)v6);
  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255BFA938));
  v4 = (void *)sub_22BD3AEC8();

  return v4;
}

- (id)makeLanguageUIWithLocales:(id)a3
{
  uint64_t v4;
  _TtC19CommandAndControlUI21CACLanguageViewBridge *v5;
  void *v6;

  if (a3)
    v4 = sub_22BD3B198();
  else
    v4 = 0;
  v5 = self;
  v6 = (void *)sub_22BD34744(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)setSelectedWithLanguageIdentifier:(id)a3
{
  sub_22BD34F88(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22BD349A4);
}

- (void)updateInstallationStatusWith:(id)a3
{
  id v4;
  _TtC19CommandAndControlUI21CACLanguageViewBridge *v5;

  v4 = a3;
  v5 = self;
  sub_22BD34A7C(v4);

}

- (void)updateDownloadStatusWith:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t inited;
  _TtC19CommandAndControlUI21CACLanguageViewBridge *v14;

  v4 = a3;
  v14 = self;
  v5 = sub_22BD360A8(v4);
  if (v6)
  {
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA940);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22BD3B830;
    *(_QWORD *)(inited + 32) = v9;
    *(_QWORD *)(inited + 40) = v10;
    *(_QWORD *)(inited + 48) = v11;
    *(_BYTE *)(inited + 56) = v12 & 1;
    swift_retain();
    sub_22BD3981C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();

    swift_release();
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

- (void)downloadLanguageWithIdentifier:(id)a3
{
  sub_22BD34F88(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))CACLanguageViewBridge.downloadLanguage(withIdentifier:));
}

- (void)cancelDownloadWithIdentifier:(id)a3
{
  sub_22BD34F88(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))CACLanguageViewBridge.cancelDownload(withIdentifier:));
}

- (void)selectedLanguageWithIdentifier:(id)a3
{
  sub_22BD34F88(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))CACLanguageViewBridge.selectedLanguage(withIdentifier:));
}

@end
