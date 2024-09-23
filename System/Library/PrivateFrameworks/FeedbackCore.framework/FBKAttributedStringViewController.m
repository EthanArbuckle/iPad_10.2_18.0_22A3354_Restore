@implementation FBKAttributedStringViewController

+ (id)viewWithAttributedText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id result;
  uint64_t v13;

  v4 = sub_21DAC3D9C();
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  sub_21DAC3DA8();
  v9 = objc_allocWithZone((Class)type metadata accessor for FBKAttributedString(0));
  v10 = sub_21DA65F8C((uint64_t)v7);
  v11 = objc_msgSend(v10, sel_view);

  if (v11)
  {

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12FeedbackCore33FBKAttributedStringViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC12FeedbackCore33FBKAttributedStringViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_21DAC481C();
    v6 = a4;
    v7 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKAttributedStringViewController();
  v9 = -[FBKAttributedStringViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC12FeedbackCore33FBKAttributedStringViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKAttributedStringViewController();
  return -[FBKAttributedStringViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
