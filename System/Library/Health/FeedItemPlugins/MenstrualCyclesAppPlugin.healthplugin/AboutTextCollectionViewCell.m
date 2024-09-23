@implementation AboutTextCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_item;
  v9 = (objc_class *)type metadata accessor for AboutTextCollectionViewCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[AboutTextCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_231C220E4();

  return v10;
}

- (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  void *v6;
  uint64_t v7;
  id v8;
  _TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell *v9;
  id v10;
  id v11;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel);
  if (v3)
  {
    v6 = (void *)objc_opt_self();
    v7 = *MEMORY[0x24BEBE1D0];
    v8 = a3;
    v9 = self;
    v10 = v3;
    v11 = objc_msgSend(v6, sel_preferredFontForTextStyle_, v7);
    objc_msgSend(v10, sel_setFont_, v11);

  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel));
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_item);
}

@end
