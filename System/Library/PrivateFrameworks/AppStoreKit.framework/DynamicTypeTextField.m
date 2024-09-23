@implementation DynamicTypeTextField

- (UIFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return -[DynamicTypeTextField font](&v3, sel_font);
}

- (void)setFont:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  _TtC11AppStoreKit20DynamicTypeTextField *v10;
  uint64_t v11;
  objc_super v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for DynamicTypeTextField();
  v12.receiver = self;
  v12.super_class = v8;
  v9 = a3;
  v10 = self;
  -[DynamicTypeTextField setFont:](&v12, sel_setFont_, v9);
  v11 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_1D8210AB4((uint64_t)v7);

}

- (int64_t)textAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return -[DynamicTypeTextField textAlignment](&v3, sel_textAlignment);
}

- (void)setTextAlignment:(int64_t)a3
{
  unsigned __int8 *v5;
  unsigned __int8 v6;
  _TtC11AppStoreKit20DynamicTypeTextField *v7;
  objc_super v8;
  unsigned __int8 v9;

  v5 = (unsigned __int8 *)self + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment;
  swift_beginAccess();
  v6 = *v5;
  *v5 = 0;
  v9 = v6;
  v7 = self;
  sub_1D8211210(&v9);
  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  -[DynamicTypeTextField setTextAlignment:](&v8, sel_setTextAlignment_, a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC11AppStoreKit20DynamicTypeTextField *v6;

  v5 = a3;
  v6 = self;
  sub_1D821157C(a3);

}

- (_TtC11AppStoreKit20DynamicTypeTextField)initWithFrame:(CGRect)a3
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
  v8 = (char *)self + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase;
  v9 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return -[DynamicTypeTextField initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11AppStoreKit20DynamicTypeTextField)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase;
  v6 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return -[DynamicTypeTextField initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1D8211368((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase);
}

@end
