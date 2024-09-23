@implementation TappableTableViewFooter

- (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter)initWithReuseIdentifier:(id)a3
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
  return (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter *)sub_231B28134(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_footerTextView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBDA88]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_highlightedText);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_tapCompletion);
  *v9 = nullsub_1;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter *)sub_231CA2A48();
  __break(1u);
  return result;
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
  _TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter *v15;
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
  LOBYTE(length) = sub_231B28D64((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_footerTextView));
  swift_bridgeObjectRelease();
  swift_release();
}

@end
