@implementation DebugFormatCreatePackageTableViewCell

- (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BB8729A0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *)sub_1BAA64BBC(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  _TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *result;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_onChange);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_textField;
  v7 = objc_allocWithZone(MEMORY[0x1E0DC3DB8]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v9 = (char *)self + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_disallowedCharacterSet;
  v10 = sub_1BB86BE54();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *v2;

  v2 = self;
  sub_1BAA65218();

}

- (void)onTextChange
{
  _TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *v2;

  v2 = self;
  sub_1BAA65354();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *v11;

  v7 = sub_1BB8729A0();
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1BAA6573C(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void).cxx_destruct
{
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_onChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_textField));
  sub_1BAA65904((uint64_t)self + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_disallowedCharacterSet);
}

@end
