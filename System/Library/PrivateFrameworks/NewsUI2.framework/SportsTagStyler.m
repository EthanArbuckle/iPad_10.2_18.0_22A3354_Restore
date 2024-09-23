@implementation SportsTagStyler

- (double)padding
{
  double result;

  objc_msgSend(*(id *)self->feedNavImageStyler, sel_padding);
  return result;
}

- (double)cornerRadius
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  double v7;
  uint64_t v9;

  v2 = sub_1D6E16784();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E23BB8();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DB6098], v2);
  swift_retain();
  sub_1D6E23BAC();
  v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_release();
  return v7 * 0.5;
}

- (UIFont)tagTitleFont
{
  return (UIFont *)objc_msgSend(*(id *)self->feedNavImageStyler, sel_tagTitleFont);
}

- (id)tagColorFor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_1D6E26978();
  v4 = *(void **)self->feedNavImageStyler;
  swift_retain();
  v5 = (void *)sub_1D6E26948();
  v6 = objc_msgSend(v4, sel_tagColorFor_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end
