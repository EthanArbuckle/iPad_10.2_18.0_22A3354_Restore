@implementation FootnoteFooterView

- (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView *)sub_2319F1B70(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2319F2B3C();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length;
  void *location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC24MenstrualCyclesAppPlugin18FootnoteFooterView *v15;
  uint64_t v17;

  length = a5.length;
  location = (void *)a5.location;
  v10 = sub_231C9CF4C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9CF28();
  v14 = a3;
  v15 = self;
  LOBYTE(length) = sub_2319F2C1C((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FootnoteFooterView_footerTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FootnoteFooterView_headerSeparator));
  swift_bridgeObjectRelease();
  swift_release();
}

@end
