@implementation CAAUSettingsView

- (_TtC12CoreAudioKit16CAAUSettingsView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16CAAUSettingsView *)sub_2131CBA68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16CAAUSettingsView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit16CAAUSettingsView *)sub_2131CBBC8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16CAAUSettingsView_bandSelector));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16CAAUSettingsView_genericView));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12CoreAudioKit16CAAUSettingsView *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_2131E198C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E1944();
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_2131CC324(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12CoreAudioKit16CAAUSettingsView *v12;
  uint64_t v13;

  v6 = sub_2131E198C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E1944();
  v11 = a3;
  v12 = self;
  sub_2131CC43C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end
