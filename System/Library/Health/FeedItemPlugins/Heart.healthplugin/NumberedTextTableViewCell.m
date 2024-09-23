@implementation NumberedTextTableViewCell

- (_TtC5Heart25NumberedTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_2314146BC();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC5Heart25NumberedTextTableViewCell *)sub_23140C788(v4, v5);
}

- (_TtC5Heart25NumberedTextTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5Heart25NumberedTextTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell____lazy_storage___numberedTextView) = 0;
  v5 = a3;

  result = (_TtC5Heart25NumberedTextTableViewCell *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231347BDC((uint64_t)self + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell_item, (unint64_t *)&qword_255ECB1A8, (unint64_t *)&qword_255ECF1F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell____lazy_storage___numberedTextView));
}

@end
