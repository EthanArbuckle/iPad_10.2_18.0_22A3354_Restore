@implementation BrowsingAssistant.ReaderOptionsCardCell

- (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18BA769F4();
}

- (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *)sub_18BA7362C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateTheme
{
  _TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *v2;

  v2 = self;
  sub_18BA74774();

}

- (void)userDidChangeTheme:(id)a3
{
  id v4;
  _TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *v5;

  v4 = a3;
  v5 = self;
  sub_18BA7484C((uint64_t)v4);

}

- (void)reloadFonts
{
  _TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *v2;

  v2 = self;
  sub_18BA74EAC();

}

- (void)fontDownloadDidUpdate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *v8;
  uint64_t v9;

  v4 = sub_18BABFE3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BABFE18();
  v8 = self;
  sub_18BA74EAC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fontDownloadDidFail:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *v8;
  uint64_t v9;

  v4 = sub_18BABFE3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BABFE18();
  v8 = self;
  sub_18BA75E24();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)listenToPage:(id)a3
{
  sub_18B8FE36C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_listenToPageAction);
}

- (void)hideReader:(id)a3
{
  sub_18B8FE36C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_hideReaderAction);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_themePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_fontPicker));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_listenToPageButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_hideReaderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_listenToPageAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_hideReaderAction));
}

@end
