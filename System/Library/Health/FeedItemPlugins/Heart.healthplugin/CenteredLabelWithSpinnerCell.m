@implementation CenteredLabelWithSpinnerCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC5Heart28CenteredLabelWithSpinnerCell *v14;
  void *v15;
  objc_class *v16;
  id v17;
  objc_super v18;

  sub_2312D1E78(0, &qword_255ECB1C0, (void (*)(uint64_t))MEMORY[0x24BEBC408]);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v18 - v4;
  v6 = sub_23141384C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23141381C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231413810();
  v14 = self;
  v15 = (void *)sub_231413804();
  v16 = (objc_class *)type metadata accessor for CenteredLabelWithSpinnerCell();
  v18.receiver = v14;
  v18.super_class = v16;
  -[CenteredLabelWithSpinnerCell _bridgedUpdateConfigurationUsingState:](&v18, sel__bridgedUpdateConfigurationUsingState_, v15);

  sub_231413840();
  v17 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  sub_231413828();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  MEMORY[0x2348DD51C](v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CenteredLabelWithSpinnerCell();
  v2 = v6.receiver;
  -[CenteredLabelWithSpinnerCell prepareForReuse](&v6, sel_prepareForReuse);
  v3 = objc_msgSend(v2, sel_contentView, v6.receiver, v6.super_class);
  type metadata accessor for CenteredLabelWithSpinnerContentView();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = *(id *)(v4 + OBJC_IVAR____TtC5Heart35CenteredLabelWithSpinnerContentView_spinner);

    objc_msgSend(v5, sel_startAnimating);
    v3 = v5;
  }

}

- (_TtC5Heart28CenteredLabelWithSpinnerCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC5Heart28CenteredLabelWithSpinnerCell_item;
  v9 = (objc_class *)type metadata accessor for CenteredLabelWithSpinnerCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CenteredLabelWithSpinnerCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5Heart28CenteredLabelWithSpinnerCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC5Heart28CenteredLabelWithSpinnerCell_item;
  v6 = (objc_class *)type metadata accessor for CenteredLabelWithSpinnerCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[CenteredLabelWithSpinnerCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2312D1D70((uint64_t)self + OBJC_IVAR____TtC5Heart28CenteredLabelWithSpinnerCell_item);
}

@end
