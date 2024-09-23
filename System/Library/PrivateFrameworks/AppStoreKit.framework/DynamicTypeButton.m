@implementation DynamicTypeButton

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC11AppStoreKit17DynamicTypeButton *v6;

  v5 = a3;
  v6 = self;
  sub_1D81D5CE8((uint64_t)a3);

}

- (_TtC11AppStoreKit17DynamicTypeButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  v9 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DynamicTypeButton();
  return -[Button initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for DynamicTypeButton();
  v5 = v16.receiver;
  -[DynamicTypeButton sizeThatFits:](&v16, sel_sizeThatFits_, width, height);
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(v5, sel_titleLabel, v16.receiver, v16.super_class);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_measurementsWithFitting_in_, v5, width, height);
    v13 = v12;

    if (v9 <= v13)
      v9 = v13;
  }
  else
  {

  }
  v14 = v7;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory));
  sub_1D81D8B6C((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase, &qword_1EDA1C180);
}

- (_TtC11AppStoreKit17DynamicTypeButton)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC11AppStoreKit17DynamicTypeButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  v6 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC11AppStoreKit17DynamicTypeButton *)sub_1D82159B8();
  __break(1u);
  return result;
}

@end
